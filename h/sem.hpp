//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_SEMAPHORE_H
#define RISCV_KERNEL_SEMAPHORE_H
#include "scheduler.hpp"

struct SemState{
    int state;
};

typedef SemState* sem_t;

class SEM {
    static SemState* constructSem(int init);
    static SemState* destructSem(int init);
    static void semSignal(sem_t handle);
    static void semWait(sem_t handle);
    static void semTimedWait(sem_t handle, time_t timeout);
};


#endif //RISCV_KERNEL_SEMAPHORE_H
