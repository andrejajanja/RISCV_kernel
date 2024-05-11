//
// Created by os on 4/15/24.
//

#include "../h/riscv.hpp"
#include "../h/mem.hpp"
#include "../h/scheduler.hpp"
#include "../h/console.hpp"

void Riscv::stopEmulator(){
//    printf("\n\t-- Shutting down --\n");
    //defined in project file
    asm("la t0, 0x100000;" //adress
        "la t1, 0x5555;" //value
        "sw t1, 0(t0);");
}

//TODO finnish wait for hardware interrupt
void Riscv::waitForHardwareInterrupt() {
    switchToUserModeH();
    while(true){}
    asm("doneWaitingForHardware:");
}

void printSystemState(bool memmory, bool threads, bool semaphores){
    printf("\n-- System state (data structures) --\n");
    if(memmory){
        MemoryAllocator::print_segments();
    }

    if(threads){
        Scheduler::printThreads();
    }
}

void sysCallExcepiton(const char* msg){
    printf("OS called exception,\nMessage: %s\n", msg);
    Riscv::stopEmulator();
}

void hadrwareHandler(){
    //if some other device caused hardware interrupt, shutdown
    if(plic_claim() != CONSOLE_IRQ){
        Riscv::stopEmulator();
    }
    char st = Riscv::readConsoleStatus();
    //TODO add thread change here, to first thread that was waiting for console
    plic_complete(10);
    Riscv::writeA0((size_t)st);
}

//system calls handlers

size_t timerNum = 0;
void timerHandler(){
    asm volatile("li a7, 0;");
    //printf("TS %u\n", timerNum++); //optional print

    //async dispatch
    Scheduler::decrementSleeping();
    if(Scheduler::hasOnlySleepingThreads()){
        Riscv::waitForNextTimer();
    }

    if(Scheduler::wokedUp){
        Scheduler::wokedUp = false;
        PCB::running = Scheduler::get();
        if(PCB::running->isStarted){
            PCB::longJmp(PCB::running);
        }else{
            PCB::threadBegin(PCB::running);
        }
    }

    PCB::running->timeLeft--;
    if(PCB::running->timeLeft == 0){
        ThreadState* oldT = PCB::running;
        PCB::running = Scheduler::get();
        PCB::running->timeLeft = DEFAULT_TIME_SLICE;
        if(oldT == PCB::running) return;
        PCB::yield(oldT, PCB::running);
    }
}

void systemCallHandler(uint64 opCode, uint64 a1, uint64 a2, uint64 a3){
    uint64 arg1 = a1; uint64 arg2 = a2;
    uint64 arg3 = a3; uint64 retValue;
    ThreadState* ts; SemState* semSt;

    switch (opCode) {
        case 0x01: //mem_alloc
            retValue = (uint64)MemoryAllocator::mem_allocate(arg1);
            Riscv::writeA0(retValue);
            break;
        case 0x02: //mem_free
            retValue = (uint64)MemoryAllocator::mem_free((void*)arg1);
            Riscv::writeA0(retValue);
            break;

        case 0x11: //thread_create
            retValue = arg1;
            ts = PCB::createState((void*)arg2, (void*)arg3);
            *((uint64*)retValue) = (uint64)ts;
            Scheduler::put(ts);
            Riscv::writeA0(0);
            break;
        case 0x12: //thread_exit
            PCB::threadComplete();
            break;
        case 0x13: //thread_dispatch
            PCB::dispatch_sync();
            break;
        case 0x31: //thread_sleep
            Scheduler::putRunningToSleep(arg1);
            PCB::dispatch_sync();
            Riscv::writeA0(0);
            break;

        case 0x21: //sem_create
            retValue = arg1;
            semSt = SEM::constructSem(arg2);
            *((uint64*)retValue) = (uint64)semSt;
            Riscv::writeA0(0);
            break;
        case 0x22: //sem_close
            semSt = (SemState*)arg1;
            retValue = 0;
            if(semSt->state < 1){
                retValue = -1;
                Scheduler::deleteBlockedForSem(semSt);
            }
            SEM::destructSem(semSt);
            Riscv::writeA0((uint64)retValue);
            break;
        case 0x23: //sem_wait
            SEM::semWait((SemState*)arg1);
            break;
        case 0x24: //sem_signal
            SEM::semSignal((SemState*)arg1);
            break;
        case 0x25: //sem_timedwait
            SEM::semTimedWait((SemState*)arg1, (time_t)arg2);
            break;
        case 0x26: //sem_trywait
            //TODO Check if trywait should do this
            semSt = (SemState*)arg1;
            if(semSt->state < 1){
                Riscv::writeA0((uint64)0);
            }else{
                Riscv::writeA0((uint64)1);
            }
            break;

        case 0x41: //getc
            retValue = Console::getc();
            Riscv::writeA0(retValue);
            break;
        case 0x42: //putc
            Console::putc((char)arg1);
            break;

        case 0x50: //exception handler
            printf("Exception => %s\n\n", (const char*)(a1));
            Riscv::stopEmulator();
            break;
        default: //some random code, that should be handler as error
            printf("OS DETECTED ERROR: Unhandled opCode value for system call: '%u'\n", opCode);
            Riscv::stopEmulator();
            break;
    };
}

void ecallHandler(){
    uint64 a0 = Riscv::readA0();
    uint64 a1 = Riscv::readA1();
    uint64 a2 = Riscv::readA2();
    uint64 a3 = Riscv::readA3();
    uint64 scause = Riscv::readScause();
    uint64 sepc = Riscv::readSepc()+4;
    uint64 sstatus = Riscv::readSstatus();

    switch (scause) {
        case 0x8000000000000001UL: //timer as software interrupt
            timerHandler();
            asm("csrr t0, sip;"
                "add t0, t0, -1;"
                "csrw sip, t0;"); //marking software interrupt resolved
            break;
        case 0x0000000000000008UL: //software interrupt handle
        case 0x0000000000000009UL:
            systemCallHandler(a0, a1, a2, a3);
            asm("csrr t0, sip;"
                "add t0, t0, -1;"
                "csrw sip, t0;"); //marking software interrupt resolved
            break;
        case 0x0000000000000002UL:
            printType("OS DETECTED ERROR: Illegal instruction\n");
            Riscv::stopEmulator();
            break;
        case 0x0000000000000005UL:
            printType("OS DETECTED ERROR: reading from forbidden address\n");
            Riscv::stopEmulator();
            break;
        case 0x0000000000000007UL:
            printType("OS DETECTED ERROR: writing to forbidden address\n");
            Riscv::stopEmulator();
            break;
        case 0x8000000000000009UL: //hardware interrupt handle
            hadrwareHandler();
            break;
        default:
            //this is error case, because no other case should go here, print something
            printf("OS DETECTED ERROR: Unhandled scause value: '%u'\n", scause);
            Riscv::stopEmulator();
            break;
    }

    Riscv::writeSepc(sepc);
    Riscv::writeSstatus(sstatus);
}