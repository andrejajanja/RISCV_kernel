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
    static bool hasAnyThreads();
    static bool hasJustOneActive();
    static bool hasActiveThreads();

    static void put(ThreadState* ts);
    static ThreadState* get();

    static void remove(ThreadState* ts);
    static void removeRunning();

    //timer handling
    static void putRunningToSleep(time_t timeout);
    static void decrementSleeping();
    static bool hasOnlySleepingThreads();
    static bool hasSleepingThreads();
    static bool waitingHardwareAndWakeup();

    //semaphores
    static bool hasBlockedThreads();
    static void blockRunning();
    static void unblockThread(ThreadState*);
    static void unblockOneForSem(SemState* sem);
    static void deleteBlockedForSem(SemState* sem);
    static void blockAndSleepRunning(time_t timeout);

    //hardware interrupts
    static void runningHArdwareWait();
    static ThreadState* removeOneHardwareWait();
    static bool hasOnlyWaitingHArdware();
    static bool hasWaitingHArdware();
    inline static bool isWaiting(){
        return waiting;
    }

    //waiting thread
    static void prepairWait(uint8 mode);
    static void endWait(uint8 mode);

    static bool wokedUp;
private:
    static SysList<ThreadState*>* pool;
    static SysList<ThreadState*>* sleeping;
    static SysList<ThreadState*>* blocked;
    static SysList<ThreadState*>* waitingHardware;

    static ThreadState* waiter;
    static bool waiting;
};


#endif //RISCV_KERNEL_SCHEDULER_H
