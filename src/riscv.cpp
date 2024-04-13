//
// Created by os on 4/13/24.
//

#include "../h/riscv.hpp"

void Riscv::handleSupervisorTrap() {
    uint64 scause = read_scause();

    if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL){
        uint64 volatile opCode = read_a0();
        uint64 volatile newSepc = read_sepc() + 4;
        uint64 volatile sstatus = read_sstatus();

        switch (opCode) {
            case 0x01:
                print("MEM ALLOC");
                break;
            case 0x02:
                print("MEM FREE");
                break;
            default:
                print("SOME DEFAULT CASE");
                break;
        }

        write_sepc(newSepc);
        write_sstatus(sstatus);
    }else{
        print("SOME SSTATUS ERROR HAPPENED");
    }
}

void Riscv::handleConsoleInterrupt() {
    console_handler();
}

void Riscv::handleTimerInterrupt() {
    Riscv::set_sip(SSIP);
    //don't forget to add other procedures for context switch
}