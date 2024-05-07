//
// Created by os on 4/24/24.
//

#include "../h/scheduler.hpp"

SysList<ThreadState*>* Scheduler::pool;

void Scheduler::initialize() {
    pool = new SysList<ThreadState*>();
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

void Scheduler::printThreads(){
    printf("%d threads:\n", pool->getCount());
    for(Iterator<ThreadState*> iter = pool->getIterator(); iter.hasElements(); ++iter){
        printf("Fun_addr: %u\n", (*iter)->registers[29]);
    }
}

void Scheduler::removeRunning(){
    ThreadState* tsTemp = pool->removeLast();
    PCB::freeState(tsTemp);
}