//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_PCB_H
#define RISCV_KERNEL_PCB_H

#include "../lib/hw.h"

//register name macros, for more ergonomic access
#define SP 20
#define RA 21
#define PC 22

struct ThreadState;
typedef ThreadState* thread_t;
//TODO check if it's nessesery to keep t0-t6 registers
struct ThreadState{
    //Order of registers in array:
    //a0 - a7, s0 - s11, sp, ra, pc
    //0 - 7,   8 - 19,   20, 21, 22
    size_t registers[23];
    void* stackEnd; //pointer to the end thread stack
    size_t timeLeft;
    bool isStarted;
};

class PCB {
public:
    static ThreadState* createState(void* start_routine, void* arg);
    static void freeThread(ThreadState* state);

    static bool setJmp(ThreadState* state);
    static void longJmp(ThreadState* state);

    static void dispatch_sync();
    static void yield(ThreadState* oldT, ThreadState* newT, bool newStarted);

    static void threadStart(ThreadState* state);
    static void threadComplete();

    static thread_t running;
};

#endif //RISCV_KERNEL_PCB_H
