//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_SCHEDULER_H
#define RISCV_KERNEL_SCHEDULER_H

#include "pcb.hpp"
#include "sem.hpp"
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

    //timer handling
    static void putRunningToSleep(uint16);
    static void decrementSleeping();
    static bool hasOnlySleepingThreads();

    //semaphores
    static bool hasBlockedThreads();
    static void blockRunning();
    static void unblockThread(ThreadState*);
    static void unblockOneForSem(SemState* sem);
    static void deleteBlockedForSem(SemState* sem);

    //hardware interrupts
    static void runningHArdwareWait();
    static void removeHardwareWait();
    static bool hasWaitingHArdware();

    static bool wokedUp;
private:
    static SysList<ThreadState*>* pool;
    static SysList<ThreadState*>* sleeping;
    static SysList<ThreadState*>* blocked;
    static SysList<ThreadState*>* waitingHardware;
};


#endif //RISCV_KERNEL_SCHEDULER_H
