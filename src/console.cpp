//
// Created by os on 5/11/24.
//

#include "../h/console.hpp"
#include "../h/riscv.hpp"

bool Console::initialized = false;
char Console::status = 0;

void Console::initialize() {
    Riscv::waitForHardwareInterrupt();
    if(status & CONSOLE_TX_STATUS_BIT){
        initialized = true;
    }else{
        //failed to initialize console, shut down;
        Riscv::stopEmulator();
    }
}


//FIXME this doesn't work as a system call
char Console::getc() {
    while(true){
        if(status & CONSOLE_RX_STATUS_BIT){
            return Riscv::readConsole();
        }
        Riscv::waitForHardwareInterrupt();
    }
}

//TODO can I always print to console? - I assumed yes
void Console::putc(char chr) {
    Riscv::writeConsole(chr);
}
