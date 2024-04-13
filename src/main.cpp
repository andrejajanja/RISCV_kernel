//
// Created by os on 4/13/24.
//
#include "../lib/hw.h"
#include "../h/riscv.hpp"

int main(){
    //initialize system data structures and register values
    Riscv::write_stvec((uint64) &Riscv::stvecVectorTable | 0b01);
    Riscv::set_sstatus(Riscv::SIE);

    return 0;
}