//
// Created by os on 4/24/24.
//

#include "../h/scheduler.hpp"

SysList<ThreadState*>* Scheduler::pool = nullptr;
SysList<ThreadState*>* Scheduler::sleeping = nullptr;

void Scheduler::initialize() {
    pool = new SysList<ThreadState*>();
    sleeping = new SysList<ThreadState*>();
}

void Scheduler::cleanUp() {
    delete pool;
}

void Scheduler::printThreads(){
    printf("%d threads:\n", pool->getCount());
    for(Iterator<ThreadState*> iter = pool->getIterator(); iter.hasElements(); ++iter){
        printf("Fun_addr: %u\n", (*iter)->registers[29]);
    }
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

//FIXME this probably doesn't work
void Scheduler::putToSleep(ThreadState *ts) {
    pool->remove(ts);
    sleeping->appendBack(ts);
}

//FIXME this doesn't work
void Scheduler::decrementSleeping() {
    if(sleeping->getCount() == 0) return;
    for (Iterator<ThreadState*> iter = sleeping->getIterator(); iter.hasElements(); ++iter) {
        (*iter)->waitingFor--;
        if((*iter)->waitingFor == 0){
            ThreadState* tempData = *iter;
            sleeping->remove(*iter);
            pool->insertBeforeLast(tempData);
        }
    }
}

