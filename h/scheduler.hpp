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
    static void put(ThreadState* ts);
    static ThreadState* get();
    static void remove(ThreadState* ts);
    static void printThreads();
    static void removeRunning();
    inline static uint16 threadCount(){
        return pool->getCount();
    }
    inline static void cleanUp(){
        delete pool;
    }
private:
    static SysList<ThreadState*>* pool;
};


#endif //RISCV_KERNEL_SCHEDULER_H
