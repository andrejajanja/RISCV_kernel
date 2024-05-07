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
#define SEPC 23
#define SSTATUS 24
#define SCAUSE 25

struct ThreadState{
    //Order of registers in array:
    //a0 - a7, s0 - s11, sp, ra, pc, sepc, sstatus, scause,
    //0 - 7,   8 - 19,   20, 21, 22,   23,      24,     25,
    size_t registers[25];
    void* stackEnd; //pointer to the end thread stack
    size_t timeLeft;
    size_t waitingFor;
    bool isStarted;
};
typedef ThreadState* thread_t;

class PCB {
public:
    static ThreadState* createState(void* start_routine, void* arg);
    static void freeState(ThreadState* state);

    static bool setJmp(ThreadState* state);
    static void longJmp(ThreadState* state);

    static void dispatch_sync();
    static void dispatch_async();
    static void yield(ThreadState* oldT, ThreadState* newT);

    //isRunning = true, jump to User mode, threadStart
    static void threadBegin(ThreadState* state);
    //actually starts a thread
    static void threadStart(ThreadState* state);
    static void threadCompleteSysCall();
    static void threadComplete();

    static thread_t running;
};

#endif //RISCV_KERNEL_PCB_H
