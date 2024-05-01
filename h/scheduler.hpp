//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_SCHEDULER_H
#define RISCV_KERNEL_SCHEDULER_H

#include "pcb.hpp"
#include "List.hpp"

class Scheduler {
public:
    static void put(ThreadState* ts);
    static ThreadState* get();
    static void block(ThreadState* ts);
private:
    static List<ThreadState> pool;
    static List<ThreadState> blocked;
};


#endif //RISCV_KERNEL_SCHEDULER_H
