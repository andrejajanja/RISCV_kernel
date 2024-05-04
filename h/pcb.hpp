//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_PCB_H
#define RISCV_KERNEL_PCB_H

#include "../lib/hw.h"

struct ThreadState;
typedef ThreadState* thread_t;
typedef size_t* jmpbuf;

struct ThreadState{
    void* arg_ptr;
    void* st_p; //pointer to the beginning of allocated space for thread stack

    //Order of registers in array:
    //a0 - a7, s0 - s11, t0 - t6, sp, ra, gp, tp
    size_t registers[32];
    size_t timeLeft;
};

class PCB {
public:
    static ThreadState* createState(void* start_routine, void* arg, void* stack_ptr);
    static void yield(PCB* t1, PCB* t2);

    static thread_t* running;

    static void setJmp(jmpbuf buffer);
    static void longJmp(jmpbuf buffer, int st);
};

#endif //RISCV_KERNEL_PCB_H
