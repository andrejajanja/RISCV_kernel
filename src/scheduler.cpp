//
// Created by os on 4/24/24.
//

#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"

SysList<ThreadState*>* Scheduler::pool = nullptr;
SysList<ThreadState*>* Scheduler::sleeping = nullptr;
bool Scheduler::wokedUp = false;

void Scheduler::initialize() {
    pool = new SysList<ThreadState*>();
    sleeping = new SysList<ThreadState*>();
}

void Scheduler::cleanUp() {
    delete pool;
    delete sleeping;
}

uint32 tcnt = 0;
void Scheduler::printThreads(){
    tcnt++;
    printf("--- (%u) Thread state ---\n", tcnt);

    if(pool->getCount() != 0){
        printf("- Pool -> %d ---\n", pool->getCount());
        for(Iterator<ThreadState*> iter = pool->getIterator(); iter.hasElements(); ++iter){
            printf(" Addr: %u\n", (*iter)->registers[PC]);
        }
    }

    if(sleeping->getCount() != 0){
        printf("- Sleeping -> %d ---\n", sleeping->getCount());
        for(Iterator<ThreadState*> iter = sleeping->getIterator(); iter.hasElements(); ++iter){
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
    for (Iterator<ThreadState*> iter = sleeping->getIterator(); iter.hasElements(); iter.operator++()) {
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