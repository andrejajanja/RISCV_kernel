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
    if(ptr == nullptr){
        sysCallExcepiton("SEM::destructBlocked(BlockedPCB* ptr) - ptr is nullptr");
    }
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
    if(sem == nullptr){
        sysCallExcepiton("SEM::destructSem(SemState* sem) - sem is nullptr");
    }
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
    }

    MemoryAllocator::mem_free(sem);
    return retVal;
}

void SEM::popBlocked(SemState* handle) {
    BlockedPCB* tempPtr = handle->beggining;
    handle->beggining = handle->beggining->next;
    tempPtr->pcbPtr->semaphore = nullptr;
    tempPtr->pcbPtr->timeLeft = DEFAULT_TIME_SLICE;
    if(tempPtr->pcbPtr->waitingFor != 0){
        Scheduler::removeFromSleeping(tempPtr->pcbPtr);
        tempPtr->pcbPtr->waitingFor = 0;
    }
    Scheduler::put(tempPtr->pcbPtr);
    destructBlocked(tempPtr);
}

void SEM::semSignal(SemState* handle) {
    if(handle == nullptr){
        sysCallExcepiton("SEM::semSignal(SemState* handle) - handle is nullptr");
    }
    handle->state++;
    if(handle->state > 0){
        return;
    }

    if(handle->beggining == nullptr){
        sysCallExcepiton("SEM::semSignal(SemState* handle) - handle.beggining is nullptr");
    }
    popBlocked(handle);
}

void SEM::semWait(SemState* handle) {
    if(handle == nullptr){
        sysCallExcepiton("SEM::semWait(SemState* handle) - handle is nullptr");
    }
    if(handle->state > 0){
        handle->state--;
        return;
    }
    handle->state--;
    if(PCB::running == nullptr){
        sysCallExcepiton("SEM::semWait(SemState* handle) - PCB::running is nullptr");
    }
    PCB::running->semaphore = handle;
    //appending PCB::running to sem queue - FIFO algorithm
    BlockedPCB* tempPtr = constructBlocked(PCB::running);
    Scheduler::removeRunning();
    BlockedPCB* iter = handle->beggining;

    if(handle->beggining == nullptr){
        handle->beggining = tempPtr;
    }else{
        while(iter->next != nullptr){
            iter = iter->next;
        }
        iter->next = tempPtr;
    }
    PCB::dispatch_sync();
}

int SEM::semTimedWait(sem_t handle, time_t timeout) {
    if(handle->state > 0){
        handle->state--;
        return 0;
    }
    handle->state--;
    PCB::running->semaphore = handle;

    //appending PCB::running to sem queue - FIFO algorithm
    BlockedPCB* tempPtr = constructBlocked(PCB::running);
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
    if(PCB::running->isExpired){
        PCB::running->isExpired = false;
        return -2;
    }

    return 0;
}