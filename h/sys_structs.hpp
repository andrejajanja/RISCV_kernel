//
// Created by os on 5/16/24.
//

#ifndef RISCV_KERNEL_SYS_STRUCTS_H
#define RISCV_KERNEL_SYS_STRUCTS_H

#include "../lib/hw.h"

//register name macros, for more ergonomic access
#define SP 20
#define RA 21
#define PC 22

struct SemState{
    int state;
};

struct ThreadState{
    //Order of registers in array:
    //a0 - a7, s0 - s11, sp, ra, pc, sepc, sstatus, scause,
    //0 - 7,   8 - 19,   20, 21, 22,   23,      24,     25,
    size_t registers[26];
    void* stackEnd; //pointer to the end thread stack
    uint16 timeLeft;
    time_t waitingFor;
    SemState* semaphore;
    SemState* cppSem;
    bool isStarted;
};

typedef ThreadState* thread_t;
typedef SemState* sem_t;

#endif //RISCV_KERNEL_SYS_STRUCTS_H
