//
// Created by os on 5/11/24.
//

#include "../h/console.hpp"
#include "../h/riscv.hpp"

char SysConsole::status = 0;
size_t SysConsole::vrednost = 0;
char SysConsole::arr[] = "  ";

void SysConsole::initialize() {
    //wait for initial interrupt
    plic_complete(CONSOLE_IRQ);
    Riscv::interruptStatus = Riscv::USER_MODE;
    Riscv::setMode(Riscv::USER_MODE);
//    if(!(status & CONSOLE_TX_STATUS_BIT)){
//        //failed to initialize console, shut down;
//        Riscv::stopEmulator();
//    }
}

//Can I always print to console? - I assumed yes
void SysConsole::putc(char chr) {
    Riscv::writeConsole(chr);
    //wait for acknowledge interrupt
    plic_complete(CONSOLE_IRQ);
    Riscv::interruptStatus = Riscv::USER_MODE;
    Riscv::setMode(Riscv::USER_MODE);
}
