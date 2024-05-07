//
// Created by os on 4/15/24.
//

#include "../h/riscv.hpp"
#include "../h/printing.hpp"
#include "../h/mem.hpp"
#include "../h/pcb.hpp"
#include "../h/scheduler.hpp"
#include "../h/syscall_cpp.hpp"

void Riscv::stopEmulator(){
    printf("\n\t-- Shutting down --\n");
    //defined in project file
    asm("la t0, 0x100000;" //adress
        "la t1, 0x5555;" //value
        "sw t1, 0(t0);");
}

uint16 numberOfSystemPrint = 1;
void printSystemState(bool memmory, bool threads, bool semaphores){
    printf("\n-- %u. System state (data structures) --\n", numberOfSystemPrint);
    numberOfSystemPrint++;
    if(memmory){
        MemoryAllocator::print_segments();
    }

    if(threads){
        Scheduler::printThreads();
    }
}

void sysCallExcepiton(const char* msg){
    printf("OS called exception,\nMessage: %s\n\n", msg);
    Riscv::stopEmulator();
}

void Riscv::initializeSystem(){
    writeStvec((uint64)&ecallWrapper);
    MemoryAllocator::initialize();
    Scheduler::initialize();

}
void Riscv::switchToUserMode(){
    asm("li t0, 0;"
        "csrw sstatus, t0;"
        "csrw sip, t0;" //SIP = 0 for marking software interrupt resolved
        "li t0, 2;"
        "csrw sie, t0;" //SIE = 2 for allowing only software interrupts
        "mv t0, ra;"
        "csrw sepc, t0;"
        "sret;");
}

void Riscv::shutdownSystem() {
    Scheduler::cleanUp();
    //TODO memory allocator cleanup
    stopEmulator();
}

size_t timerNum = 0;

//system calls handlers
void timerHandler(){
    //printf("TS %u\n", timerNum++);
    PCB::dispatch_async();
}

void systemCallHandler(uint64 a0, uint64 a1, uint64 a2, uint64 a3){
    uint64 opCode = a0; uint64 arg1 = a1;
    uint64 arg2 = a2; uint64 arg3 = a3;
    uint64 retValue;
    ThreadState* ts;

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

        case 0x21:
            printf("Usao sam u sem_open\n");
            break;
        case 0x22:
            printf("Usao sam u sem_close\n");
            break;
        case 0x23:
            printf("Usao sam u sem_wait\n");
            break;
        case 0x24:
            printf("Usao sam u sem_signal\n");
            break;
        case 0x25:
            printf("Usao sam u sem_timedwait\n");
            break;
        case 0x26:
            printf("Usao sam u sem_trywait\n");
            break;
        case 0x31:
            printf("Usao sam u thread_sleep\n");
            break;
        case 0x41:
            printf("Usao sam u getc\n");
            break;
        case 0x42:
            printf("Usao sam u putc\n");
            break;
        case 0x50:
            printf("User called an Exception,\nMessage: %s\n\n", (const char*)(a1));
            Riscv::stopEmulator();
            break;
        default: //some random code, that should be handler as error
            //this is error case, because no other case should go here, print something
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
        case 0x8000000000000001UL:
            timerHandler();
            break;
        case 0x0000000000000008UL:
        case 0x0000000000000009UL:
            systemCallHandler(a0, a1, a2, a3);
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
        case 0x8000000000000009UL:
            printf("Hardware interrupt");
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