//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_SEMAPHORE_H
#define RISCV_KERNEL_SEMAPHORE_H
#include "../lib/hw.h"

struct SemState;
typedef SemState* sem_t;

struct BlockedPCB{
    struct ThreadState* pcbPtr;
    BlockedPCB* next;
};

class SEM {
public:
    static BlockedPCB* constructBlocked(ThreadState*);
    static int destructBlocked(BlockedPCB*);
    static void popBlocked(SemState*);

    static SemState* constructSem(int);
    static int destructSem(SemState*);
    static void semSignal(sem_t);
    static void semWait(sem_t);
    static void semTimedWait(sem_t, time_t);
};


#endif //RISCV_KERNEL_SEMAPHORE_H
