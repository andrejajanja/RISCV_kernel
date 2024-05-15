//
// Created by os on 5/11/24.
//

#include "../h/console.hpp"
#include "../h/riscv.hpp"

char SysConsole::status = 0;
char SysConsole::arr[] = "  ";

void SysConsole::initialize() {
    //wait for initial interrupt
    Riscv::interruptStatus = Riscv::WAIT_HARDWARE;
    Riscv::setMode(Riscv::WAIT_HARDWARE);
    asm("addi sp, sp, -16;"
        "csrr t0, sstatus;"
        "sd t0, 0(sp);"
        "csrr t0, sepc;"
        "sd t0, 8(sp);"
        "li t0, 2;"
        "csrw sstatus, t0;"
        "addi t0,t0,2;"
        "ld t0, 0(sp);"
        "csrw sstatus, t0;"
        "ld t0, 8(sp);"
        "csrw sepc, t0;"
        "addi sp, sp, 16;");
    Riscv::interruptStatus = Riscv::USER_MODE;
    Riscv::setMode(Riscv::USER_MODE);
    if(!(status & CONSOLE_TX_STATUS_BIT)){
        //failed to initialize console, shut down;
        Riscv::stopEmulator();
    }
}

//Can I always print to console? - I assumed yes
void SysConsole::putc(char chr) {
    Riscv::writeConsole(chr);
    //wait for acknowledge interrupt
    Riscv::interruptStatus = Riscv::WAIT_HARDWARE;
    Riscv::setMode(Riscv::WAIT_HARDWARE);
    asm("addi sp, sp, -16;"
        "csrr t0, sstatus;"
        "sd t0, 0(sp);"
        "csrr t0, sepc;"
        "sd t0, 8(sp);"
        "li t0, 2;"
        "csrw sstatus, t0;"
        "addi t0,t0,2;"
        "ld t0, 0(sp);"
        "csrw sstatus, t0;"
        "ld t0, 8(sp);"
        "csrw sepc, t0;"
        "addi sp, sp, 16;");
    Riscv::interruptStatus = Riscv::USER_MODE;
    Riscv::setMode(Riscv::USER_MODE);
}
