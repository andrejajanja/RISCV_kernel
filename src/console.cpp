//
// Created by os on 5/11/24.
//

#include "../h/console.hpp"
#include "../h/riscv.hpp"

bool SysConsole::initialized = false;
char SysConsole::status = 0;
bool SysConsole::waiting = false;

void SysConsole::initialize() {
    Riscv::waitForHardwareInterrupt();
    if(status & CONSOLE_TX_STATUS_BIT){
        initialized = true;
    }else{
        //failed to initialize console, shut down;
        Riscv::stopEmulator();
    }
}

char SysConsole::getc() {
    while(true){
        if(status & CONSOLE_RX_STATUS_BIT){
            char temp = Riscv::readConsole();
            Riscv::waitForHardwareInterrupt();
            return temp;
        }
        Riscv::waitForHardwareInterrupt();
    }
}

//TODO can I always print to console? - I assumed yes
void SysConsole::putc(char chr) {
    Riscv::writeConsole(chr);
    Riscv::waitForHardwareInterrupt();
//    while(true){
//        if(status & CONSOLE_TX_STATUS_BIT){
//            Riscv::writeConsole(chr);
//            break;
//        }
//        Riscv::waitForHardwareInterrupt();
//    }
}
