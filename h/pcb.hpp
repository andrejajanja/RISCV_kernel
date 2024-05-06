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

//TODO optimize this to take less memory, not all registers and variables are needed
struct ThreadState{
    void* stackEnd; //pointer to the end thread stack
    void* funcArgs;
    //Order of registers in array:
    //a0 - a7, s0 - s11, t0 - t6, sp, ra, pc
    //0 - 7, 8 - 19, 20 - 25, 26, 27, 28, 29
    size_t registers[30];
    size_t timeLeft;
    bool isStarted;
};

class PCB {
public:
    static ThreadState* createState(void* start_routine, void* arg);
    static void freeThread(ThreadState* state);

    static bool setJmp(thread_t state);
    static void longJmp(thread_t state);
    static void dispatch_sync();
    static void yield(ThreadState* t1, ThreadState* t2);

    static void threadCompleteProcedure();
    static void threadStart(ThreadState* state);

    static thread_t running;
};

#endif //RISCV_KERNEL_PCB_H
