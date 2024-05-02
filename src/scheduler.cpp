//
// Created by os on 4/24/24.
//

#include "../h/scheduler.hpp"


SysList<ThreadState*>* Scheduler::pool;

void Scheduler::initialize() {
    pool = new SysList<ThreadState*>();
}

void Scheduler::put(ThreadState *ts) {
    pool->appendBack(ts);
    if(pool->getCount() == 1){
        PCB::running = ts;
    }
}

ThreadState* Scheduler::get() {
    return pool->next();
}

void Scheduler::remove(ThreadState *ts) {
    pool->remove(ts);
}

void Scheduler::printThreads(){
    printf("N-threads: %d", pool->getCount());
}