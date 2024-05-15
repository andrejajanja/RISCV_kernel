//
// Created by os on 4/24/24.
//

#include "../h/sem.hpp"
#include "../h/mem.hpp"
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"

SemState* SEM::constructSem(int init) {
    auto semPtr = (SemState*)MemoryAllocator::mem_allocate(1);
    if(semPtr == nullptr){
        sysCallExcepiton("Failed to allocate space for SemState* structure.");
        return nullptr;
    }

    semPtr->state = init;
    return semPtr;
}

int SEM::destructSem(SemState* sem) {
    return MemoryAllocator::mem_free(sem);
}

void SEM::semSignal(SemState* handle) {
    handle->state++;
    if(handle->state > 0){
        return;
    }
    Scheduler::unblockOneForSem(handle);
}

void SEM::semWait(SemState* handle) {
    if(handle->state > 0){
        handle->state--;
        return;
    }
    handle->state--;
    PCB::running->semaphore = handle;
    Scheduler::blockRunning();
}

void SEM::semTimedWait(sem_t handle, time_t timeout) {
    if(handle->state > 0){
        handle->state--;
        return;
    }
    handle->state--;
    PCB::running->semaphore = handle;
    Scheduler::blockAndSleepRunning(timeout);
}