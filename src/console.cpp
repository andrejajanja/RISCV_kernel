//
// Created by os on 5/11/24.
//

#include "../h/console.hpp"
#include "../h/riscv.hpp"

bool SysConsole::initialized = false;
char SysConsole::status = 0;
bool SysConsole::readSent = false;
char SysConsole::arr[] = "  ";

void SysConsole::initialize() {
    Riscv::waitForHardwareInterrupt(Riscv::WITHOUT_SIE_CHANGE);
    if(status & CONSOLE_TX_STATUS_BIT){
        initialized = true;
    }else{
        //failed to initialize console, shut down;
        Riscv::stopEmulator();
    }
}

//TODO can I always print to console? - I assumed yes
void SysConsole::putc(char chr) {
    Riscv::writeConsole(chr);
    readSent = false;
    Riscv::waitForHardwareInterrupt(Riscv::WITH_SIE_CHANGE);
}
