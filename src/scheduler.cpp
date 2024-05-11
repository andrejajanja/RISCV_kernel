//
// Created by os on 4/24/24.
//

#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"
#include "../h/sem.hpp"

SysList<ThreadState*>* Scheduler::pool = nullptr;
SysList<ThreadState*>* Scheduler::sleeping = nullptr;
SysList<ThreadState*>* Scheduler::blocked = nullptr;

bool Scheduler::wokedUp = false;

void Scheduler::initialize() {
    pool = new SysList<ThreadState*>();
    sleeping = new SysList<ThreadState*>();
    blocked = new SysList<ThreadState*>();
}

void Scheduler::cleanUp() {
    delete pool;
    delete sleeping;
    delete blocked;
}

uint32 threadPrintCounter = 0;
void Scheduler::printThreads(){
    threadPrintCounter++;
    printf("--- (%u) Thread state ---\n", threadPrintCounter);

    if(pool->getCount() != 0){
        printf("- Pool -> %d ---\n", pool->getCount());
        for(auto iter = pool->getIterator(); iter.hasElements(); ++iter){
            printf(" Addr: %u\n", (*iter)->registers[PC]);
        }
    }

    if(sleeping->getCount() != 0){
        printf("- Sleeping -> %d ---\n", sleeping->getCount());
        for(auto iter = sleeping->getIterator(); iter.hasElements(); ++iter){
            printf(" Addr: %u\n", (*iter)->registers[PC]);
        }
    }

    if(blocked->getCount() != 0){
        printf("- Blocked -> %d ---\n", blocked->getCount());
        for(auto iter = blocked->getIterator(); iter.hasElements(); ++iter){
            printf(" Addr: %u\n", (*iter)->registers[PC]);
        }
    }

    printf("--- End thread state ---\n\n");
}

uint16 Scheduler::threadCount(){
    return pool->getCount();
}

void Scheduler::put(ThreadState *ts) {
    pool->insertBeforeLast(ts);
}

ThreadState* Scheduler::get() {
    return pool->next();
}

void Scheduler::remove(ThreadState *ts) {
    pool->remove(ts);
}

void Scheduler::removeRunning(){
    ThreadState* tsTemp = pool->removeLast();
    PCB::freeState(tsTemp);
}

void Scheduler::putRunningToSleep(uint16 howLong) {
    ThreadState* tsTemp = pool->removeLast();
    tsTemp->waitingFor = howLong;
    sleeping->appendFront(tsTemp);
}

void Scheduler::decrementSleeping() {
    if(sleeping->getCount() == 0) return;
    for (SysIterator<ThreadState*> iter = sleeping->getIterator(); iter.hasElements(); iter.operator++()) {
        ThreadState* temp = *iter;
        temp->waitingFor--;
        if(temp->waitingFor == 0){
            sleeping->remove(temp);
            temp->timeLeft = DEFAULT_TIME_SLICE;
            if(pool->getCount() == 0){
                wokedUp = true;
            }
            pool->insertBeforeLast(temp);
        }
    }
}

bool Scheduler::hasOnlySleepingThreads() {
    return (sleeping->getCount() > 0 && pool->getCount() == 0);
}

bool Scheduler::hasBlockedThreads() {
    return (blocked->getCount() == 0)? false : true;
}

void Scheduler::blockRunning(){
    ThreadState* tsTemp = pool->removeLast();
    blocked->appendBack(tsTemp);
    PCB::dispatch_sync();
}

void Scheduler::unblockThread(ThreadState* ts) {
    blocked->remove(ts);
    pool->insertBeforeLast(ts);
}

void Scheduler::unblockOneForSem(SemState* semSt) {
    for (auto iter = blocked->getIterator(); iter.hasElements(); ++iter) {
        if ((*iter)->semaphore == semSt) {
            ThreadState *tempState = *iter;
            tempState->semaphore = nullptr;
            blocked->remove(tempState);
            pool->insertBeforeLast(tempState);
            break;
        }
    }
}

void Scheduler::deleteBlockedForSem(SemState *semSt) {
    for(auto iter = blocked->getIterator(false); iter.hasElements(); ++iter){
        if ((*iter)->semaphore == semSt) {
            ThreadState *tempState = *iter;
            tempState->semaphore = nullptr;
            blocked->remove(tempState);
        }
    }
}

