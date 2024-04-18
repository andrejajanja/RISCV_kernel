//
// Created by os on 4/15/24.
//

#include "../h/riscv.hpp"
#include "../h/mem.hpp"

void initializeSystemRegisters(){
    writeStvec((uint64)&ecallWrapper);
    //asm("la t0, _Z12ecallWrapperv;"
    //"csrw stvec, t0;");
}

void stopEmulator(){
    //defined in project file
    asm("la t0, 0x100000;" //adress
        "la t1, 0x5555;" //value
        "sw t1, 0(t0);");
}

void timerHandler(uint64 sepc, uint64 sstatus){
    //trigger context switch or something
    printString("TIMER SIGNAL");
    writeSepc(sepc);
    writeSstatus(sstatus);
}

void systemCallHandler(){
    uint64 opCode = readA0();
    uint64 arg = readA1();
    void* ptr;
    switch (opCode) {
        case 0x01: //mem_alloc
            ptr = MemoryAllocator::mem_allocate(arg);
            writeA0((uint64)ptr);
            break;
        case 0x02: //mem_free
            printString("MEM_FREE SYS CALL\n");
            break;
        default: //some random code, that should be handler as error
            //this is error case, because no other case should go here, print something
            printString("OS DETECTED ERROR: Unhandled opCode value for system call: '");
            printUint(opCode);
            printString("' ,shutting down...\n");
            stopEmulator();
            break;
    };
}

void ecallHandler(){
    uint64 scause = readScause();
    uint64 sepc = readSepc()+4;
    uint64 sstatus = readSstatus();

    switch (scause) {
        case 0x8000000000000001UL:
            timerHandler(sepc, sstatus);
            break;
        case 0x0000000000000008UL | 0x0000000000000009UL:
            systemCallHandler();
            break;
        case 0x0000000000000002UL:
            printString("OS DETECTED ERROR: Illegal instruction\nShutting down...\n");
            stopEmulator();
            break;
        case 0x0000000000000005UL:
            printString("OS DETECTED ERROR: reading from forbidden address\nShutting down...\n");
            stopEmulator();
            break;
        case 0x0000000000000007UL:
            printString("OS DETECTED ERROR: writing to forbidden address\nShutting down...\n");
            stopEmulator();
            break;
        default:
            //this is error case, because no other case should go here, print something
            printString("OS DETECTED ERROR: Unhandled scause value: '");
            printUint(scause);
            printString("'\nShutting down...\n");
            stopEmulator();
            break;
    }

    writeSepc(sepc);
    writeSstatus(sstatus);
    return;
}