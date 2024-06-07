//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_PCB_H
#define RISCV_KERNEL_PCB_H

#include "../lib/hw.h"

struct ThreadState;
struct SemState;

class PCB {
public:
    static ThreadState* createState(void* start_routine, void* arg, SemState* sem);
    static int freeState(ThreadState* state);

    static bool setJmp(ThreadState* state);
    static void longJmp(ThreadState* state);

    static void dispatch_sync();
    static void yield(ThreadState* oldT, ThreadState* newT);

    static void threadBegin(ThreadState* state);
    //actually starts a thread
    static void threadStart(ThreadState* state);
    static void threadCompleteSysCall();
    static void threadComplete();

    static ThreadState* running;
    static int CurrentId;
};

#endif //RISCV_KERNEL_PCB_H
