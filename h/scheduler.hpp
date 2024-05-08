//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_SCHEDULER_H
#define RISCV_KERNEL_SCHEDULER_H

#include "pcb.hpp"
#include "sys_list.hpp"

class Scheduler {
public:
    static void initialize();
    static void cleanUp();
    static void printThreads();
    static uint16 threadCount();

    static void put(ThreadState* ts);
    static ThreadState* get();

    static void remove(ThreadState* ts);
    static void removeRunning();

    static void putRunningToSleep(uint16);
    static void decrementSleeping();
    static bool hasOnlySleepingThreads();
    static bool wokedUp;
private:
    static SysList<ThreadState*>* pool;
    static SysList<ThreadState*>* sleeping;
};


#endif //RISCV_KERNEL_SCHEDULER_H
