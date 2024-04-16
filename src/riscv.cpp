//
// Created by os on 4/15/24.
//

#include "../h/riscv.hpp"

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

void ecallHandler(){
    uint64 scause = readScause();
    uint64 sepc = readSepc()+4;
    uint64 sstatus = readSstatus();
    //handle for timer interrupt
    if(scause == 0x8000000000000001UL){
        //trigger context switch or something
        printString("TIMER SIGNAL");
        writeSepc(sepc);
        writeSstatus(sstatus);
        return;
    }else if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL){
        //handle for ecall as a software interrupt
        uint64 opCode = readA0();
        switch (opCode) {
            case 0x01: //mem_alloc
                printString("MEM_ALLOC SYS CALL");
                break;
            case 0x02: //mem_free
                printString("MEM_FREE SYS CALL");
                break;

            default: //some random code, that should be handler as error
                printString("ERROR: Random opCode for scause value for ecall , shuting down...");
                stopEmulator();
                break;
        };

        writeSepc(sepc);
        writeSstatus(sstatus);
        return;
    }

    //this is error case, because no other case should go here, print something
    printString("ERROR: Unknown scause value, shutting down...");
    stopEmulator();
}