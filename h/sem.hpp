//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_SEMAPHORE_H
#define RISCV_KERNEL_SEMAPHORE_H
#include "../lib/hw.h"

struct SemState{
    int state;
};

typedef SemState* sem_t;

class SEM {
public:
    static SemState* constructSem(int);
    static int destructSem(SemState*);
    static void semSignal(sem_t);
    static void semWait(sem_t);
    static void semTimedWait(sem_t, time_t);
};


#endif //RISCV_KERNEL_SEMAPHORE_H
