//
// Created by os on 4/24/24.
//

#include "../h/sem.hpp"
#include "../h/mem.hpp"
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"
#include "../h/sys_structs.hpp"

BlockedPCB* SEM::constructBlocked(ThreadState* ts) {

    auto blockedPtr = (BlockedPCB*)MemoryAllocator::mem_allocate(1);
    if(blockedPtr == nullptr){
        sysCallExcepiton("Failed to allocate space for blocked ThreadState.");
        return nullptr;
    }

    blockedPtr->pcbPtr = ts;
    blockedPtr->next = nullptr;
    return blockedPtr;
}

int SEM::destructBlocked(BlockedPCB* ptr) {
    return MemoryAllocator::mem_free(ptr);
}

SemState* SEM::constructSem(int init) {
    auto semPtr = (SemState*)MemoryAllocator::mem_allocate(1);
    if(semPtr == nullptr){
        sysCallExcepiton("Failed to allocate space for SemState* structure.");
        return nullptr;
    }

    semPtr->state = init;
    semPtr->beggining = nullptr;
    return semPtr;
}

int SEM::destructSem(SemState* sem) {
    int retVal = 0;
    if(sem->beggining != nullptr){
        retVal = -1;
        BlockedPCB* tempPtr = nullptr;
        while(sem->beggining != nullptr){
            tempPtr = sem->beggining;
            sem->beggining = sem->beggining->next;
            tempPtr->pcbPtr->semaphore = nullptr;
            tempPtr->pcbPtr->timeLeft = DEFAULT_TIME_SLICE;
            Scheduler::put(tempPtr->pcbPtr);
            destructBlocked(tempPtr);
        }

        //shorter implementation:
//        while(sem->beggining != nullptr){
//            popBlocked(sem);
//        }
    }

    MemoryAllocator::mem_free(sem);
    return retVal;
}

void SEM::popBlocked(SemState* handle) {
    BlockedPCB* tempPtr = handle->beggining;
    handle->beggining = handle->beggining->next;
    tempPtr->pcbPtr->semaphore = nullptr;
    tempPtr->pcbPtr->timeLeft = DEFAULT_TIME_SLICE;
    Scheduler::put(tempPtr->pcbPtr);
    destructBlocked(tempPtr);
}

void SEM::semSignal(SemState* handle) {
    handle->state++;
    if(handle->state > 0){
        return;
    }

    popBlocked(handle);
}

void SEM::semWait(SemState* handle) {
    if(handle->state > 0){
        handle->state--;
        return;
    }
    handle->state--;
    PCB::running->semaphore = handle;
    //appending PCB::running to sem queue - FIFO algorithm
    BlockedPCB* tempPtr = constructBlocked(PCB::running);
    Scheduler::removeRunning();
    BlockedPCB* iter = handle->beggining;

    if(iter == nullptr){
        handle->beggining = tempPtr;
    }else{
        while(iter->next != nullptr){
            iter = iter->next;
        }
        iter->next = tempPtr;
    }

    PCB::dispatch_sync();
}

void SEM::semTimedWait(sem_t handle, time_t timeout) {
    if(handle->state > 0){
        handle->state--;
        return;
    }
    handle->state--;
    PCB::running->semaphore = handle;

    //appending PCB::running to sem queue - FIFO algorithm
    BlockedPCB* tempPtr = constructBlocked(PCB::running);
    Scheduler::removeRunning();
    BlockedPCB* iter = handle->beggining;

    if(iter == nullptr){
        handle->beggining = tempPtr;
    }else{
        while(iter->next != nullptr){
            iter = iter->next;
        }
        iter->next = tempPtr;
    }

    Scheduler::putRunningToSleep(timeout);
    PCB::dispatch_sync();
}