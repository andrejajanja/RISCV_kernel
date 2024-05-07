//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_SCHEDULER_H
#define RISCV_KERNEL_SCHEDULER_H

#include "pcb.hpp"
#include "sys_list.hpp"

//TODO add async functionality
class Scheduler {
public:
    static void initialize();
    inline static void cleanUp(){
        delete pool;
    }

    static void put(ThreadState* ts);
    static ThreadState* get();

    static void remove(ThreadState* ts);
    static void printThreads();
    static void removeRunning();
    //TODO move inline definitions to cpp file
    inline static uint16 threadCount(){
        return pool->getCount();
    }

private:
    static SysList<ThreadState*>* pool;
    static SysList<ThreadState*>* blocked;
};


#endif //RISCV_KERNEL_SCHEDULER_H
