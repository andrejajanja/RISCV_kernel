//
// Created by os on 4/15/24.
//

#include "../h/riscv.hpp"
#include "../h/mem.hpp"
#include "../h/scheduler.hpp"
#include "../h/console.hpp"
#include "../h/sys_structs.hpp"
asm(".global doneWaitingForHardware;");

size_t Riscv::hardwareNum = 0;
size_t Riscv::timerNum = 0;
uint8 Riscv::interruptStatus = 3;

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

//Mangled name: _Z15hadrwareHandlerv
void hadrwareHandler(){
    size_t a0 = Riscv::readA0();

    //if some other device caused hardware interrupt, shutdown
    if(plic_claim() != CONSOLE_IRQ){
        Riscv::stopEmulator();
    }

    SysConsole::status = Riscv::readConsoleStatus();
    plic_complete(CONSOLE_IRQ);

    if(SysConsole::status & CONSOLE_RX_STATUS_BIT){
        if(Scheduler::hasWaitingHArdware()){
            SysConsole::arr[0] = Riscv::readConsole();
            if(Scheduler::isWaiting()){ //in both cases, thread that was waiting for keyboard press gets control
                Scheduler::endWait(Riscv::USER_MODE);
                PCB::running = Scheduler::removeOneHardwareWait();
                PCB::longJmp(PCB::running);
            }else{
                ThreadState* oldTs = PCB::running;
                PCB::running = Scheduler::removeOneHardwareWait();
                PCB::yield(oldTs, PCB::running);
            }
        }else {
            //unexpected keyboard press, reading just to clean the buffer, for expected key-press
            SysConsole::arr[1] = Riscv::readConsole();
            //Riscv::hardwareNum++; //optional counter of unexpected keyboard presses
        }
    }
    Riscv::writeA0(a0);
    return;
}

//system calls handlers
void timerHandler(){
    Riscv::timerNum++;

    Scheduler::decrementSleeping();

    if(Scheduler::wokedUp){
        Scheduler::wokedUp = false;
        Scheduler::endWait(Riscv::USER_MODE);
        PCB::running = Scheduler::get();
        //I can just longjmp here because I'm 'beggining' waiting tread every time I wait
        PCB::longJmp(PCB::running);
    }

    if(!Scheduler::hasActiveThreads()){ //case when just waiting for Scheduler to wake up
        return;
    }

    //async dispatch
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
            ts = PCB::createState((void*)arg2, (void*)arg3, nullptr);
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

        //CPP-API additional calls for thead class
        case 0x14: //construct_ts
            retValue = arg1;
            semSt = SEM::constructSem(1);
            ts = PCB::createState((void*)arg2, (void*)arg3, semSt);
            *((uint64*)retValue) = (uint64)ts;
            Riscv::writeA0(0);
            break;
        case 0x15: //destruct ts

            SEM::destructSem(((ThreadState*)arg1)->cppSem);
            PCB::freeState((ThreadState*)arg1);
            break;
        case 0x16: //start_thread
            semSt = ((ThreadState*)arg1)->cppSem;
            semSt->state--;
            Scheduler::put((ThreadState*)arg1);
            Riscv::writeA0(0);
            break;

        case 0x21: //sem_create
            retValue = arg1;
            semSt = SEM::constructSem((int)arg2);
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
            semSt = (SemState*)arg1;
            if(semSt->state < 1){
                Riscv::writeA0((uint64)0);
            }else{
                Riscv::writeA0((uint64)1);
            }
            break;
        case 0x41: //getc
            if(Scheduler::hasJustOneActive()){
                if(Scheduler::hasSleepingThreads()){
                    Scheduler::prepairWait(Riscv::USER_MODE);
                }else{
                    Scheduler::prepairWait(Riscv::WAIT_HARDWARE);
                }
            }
            Scheduler::runningHArdwareWait();
            PCB::dispatch_sync();

            retValue = SysConsole::arr[0];
            Riscv::writeA0(retValue);
            break;
        case 0x42: //putc
            SysConsole::putc((char)arg1);
            break;

        case 0x50: //exception handler
            printf("Exception => %s\n\n", (const char*)(a1));
            Riscv::stopEmulator();
            break;
        default: //some random code, that should be handler as error
            printf("OS DETECTED ERROR: Unhandled opCode value for system call: '%u'\n", opCode);
            Riscv::stopEmulator();
            break;
    }
}

void ecallHandler(){
    uint64 a0 = Riscv::readA0();
    uint64 a1 = Riscv::readA1();
    uint64 a2 = Riscv::readA2();
    uint64 a3 = Riscv::readA3();
    uint64 scause = Riscv::readScause();
    uint64 sepc = Riscv::readSepc();
    uint64 sstatus = Riscv::readSstatus();

    switch (scause) {
        case 0x8000000000000001UL: //timer as software interrupt
            timerHandler();
            asm("csrr t0, sip;"
                "andi t0, t0, 0xFFFFFFFFFFFFFFFD;"
                "csrw sip, t0;"); //marking software interrupt resolved
            break;
        case 0x0000000000000008UL: //ecall invoked software interrupt handle
        case 0x0000000000000009UL:
            systemCallHandler(a0, a1, a2, a3);
            sepc+=4; //need to move to next instruction only if explicitly called with ecall
            asm("csrr t0, sip;"
                "andi t0, t0, 0xFFFFFFFFFFFFFFFD;"
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