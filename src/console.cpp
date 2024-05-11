//
// Created by os on 5/11/24.
//

#include "../h/console.hpp"
#include "../h/riscv.hpp"

bool Console::initialized = false;

void Console::initialize() {

    //TODO rewrite this part, to more efficiently wait for hardware interrupt
    asm("li t0, 512;" //only hardware interrupts are masked
        "csrw sie, t0;"
        "li t0, 0x22;" //this makes system mode responed to masked interrupts
        "csrw sstatus, t0;");
    uint64 temp = 0xFF;
    while(temp >= 0xFF){
        temp = Riscv::readA0();
    }
    asm("li t0, 0;"
        "csrw sie, t0;"); //blocking software and hardware interrupts
        //-- up to this part ------

    if(temp & CONSOLE_TX_STATUS_BIT){
        initialized = true;
    }else{
        //failed to initialize console, shut down;
        Riscv::stopEmulator();
    }
}

char Console::getc() {
    return '0';
}

void Console::putc(char chr) {

}
