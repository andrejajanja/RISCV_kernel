//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_PCB_H
#define RISCV_KERNEL_PCB_H

#include "../lib/hw.h"

class PCB {
public:
    PCB();
    static void yield(PCB* t1, PCB* t2);
private:
    static PCB* running;
    uint64 registers[20]; //a0-a7, s0
};

#endif //RISCV_KERNEL_PCB_H
