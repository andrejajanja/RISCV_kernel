//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_PCB_H
#define RISCV_KERNEL_PCB_H

#include "../lib/hw.h"

// register name macros, for more ergonomic access
#define SP 27
#define RA 28
#define PC 29

struct ThreadState;
typedef ThreadState* thread_t;

struct ThreadState{
    void* stackEnd; //pointer to the end thread stack
    void* stackBegin; //pointer to the end of allocated space for thread stack
    //Order of registers in array:
    //a0 - a7, s0 - s11, t0 - t6, sp, ra, pc
    //0 - 7, 8 - 19, 20 - 25, 26, 27, 28, 29
    size_t registers[30];
    size_t timeLeft;
    void* funcArgs;
};

class PCB {
public:
    static ThreadState* createState(void* start_routine, void* arg);
    static void yield(ThreadState* t1, ThreadState* t2);

    static thread_t running;

    static bool setJmp(thread_t state);
    static void longJmp(thread_t state);
};

#endif //RISCV_KERNEL_PCB_H
