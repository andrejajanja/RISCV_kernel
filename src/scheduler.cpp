//
// Created by os on 4/24/24.
//

#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"
#include "../h/sem.hpp"

SysList<ThreadState*>* Scheduler::pool = nullptr;
SysList<ThreadState*>* Scheduler::sleeping = nullptr;
SysList<ThreadState*>* Scheduler::blocked = nullptr;
SysList<ThreadState*>* Scheduler::waitingHardware = nullptr;
bool Scheduler::wokedUp = false;
ThreadState* Scheduler::waiter = nullptr;
bool Scheduler::waiting = false;

void waitingProcedure(void*){
    size_t val = 0;
    while(true){
        val++;
        val--;
    }
}

void Scheduler::initialize() {
    pool = new SysList<ThreadState*>();
    sleeping = new SysList<ThreadState*>();
    blocked = new SysList<ThreadState*>();
    waitingHardware = new SysList<ThreadState*>();
    waiter =  PCB::createState((void*)&waitingProcedure, nullptr);
}

void Scheduler::cleanUp() {
    PCB::freeState(waiter);
    delete pool;
    delete sleeping;
    delete blocked;
    delete waitingHardware;
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

bool Scheduler::hasAnyThreads(){
    return (pool->getCount() != 0 || blocked->getCount() != 0 || waitingHardware->getCount() != 0 );
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

//TODO this can be optimized to take more time to insert into a list, but less time to decrement sleeping timer
void Scheduler::putRunningToSleep(time_t howLong) {
    ThreadState* tsTemp = pool->removeLast();
    tsTemp->waitingFor = howLong;
    sleeping->appendFront(tsTemp);
}

//TODO sleeping list can be optimized as mentioned in project proposal
void Scheduler::decrementSleeping() {
    if(sleeping->getCount() == 0) return;
    for (SysIterator<ThreadState*> iter = sleeping->getIterator(); iter.hasElements(); iter.operator++()) {
        ThreadState* temp = *iter;
        temp->waitingFor--;
        if(temp->waitingFor == 0){
            sleeping->remove(temp);

            if(temp->semaphore != nullptr){
                blocked->remove(temp);
                temp->semaphore = nullptr;
            }

            temp->timeLeft = DEFAULT_TIME_SLICE;
            if(waiting){
                wokedUp = true;
            }
            pool->insertBeforeLast(temp);
        }
    }
}

bool Scheduler::hasOnlySleepingThreads() {
    return (sleeping->getCount() != 0 && pool->getCount() == 0 && waitingHardware->getCount() == 0);
}

bool Scheduler::hasBlockedThreads() {
    return blocked->getCount() != 0;
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
    if(blocked->getCount() == 0) return;
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
    if(blocked->getCount() == 0) return;
    for(auto iter = blocked->getIterator(false); iter.hasElements(); ++iter){
        if ((*iter)->semaphore == semSt) {
            ThreadState *tempState = *iter;
            tempState->semaphore = nullptr;
            blocked->remove(tempState);
        }
    }
}

void Scheduler::blockAndSleepRunning(time_t timeout) {
    ThreadState* tempTs = pool->removeLast();
    tempTs->waitingFor = timeout;
    blocked->appendBack(tempTs);
    sleeping->appendFront(tempTs);
    PCB::dispatch_sync();
}

void Scheduler::runningHArdwareWait() {
    ThreadState* ts = pool->removeLast();
    waitingHardware->appendFront(ts);
}

ThreadState* Scheduler::removeOneHardwareWait() {
    ThreadState* ts = waitingHardware->removeBack();
    pool->insertBeforeLast(ts);
    pool->previous(); //Za cije babe zdravlje je ovo falilo
    return ts;
}

bool Scheduler::hasOnlyWaitingHArdware() {
    return (waitingHardware->getCount() != 0 && pool->getCount() == 0 && blocked->getCount() == 0);
}

bool Scheduler::hasWaitingHArdware() {
    return waitingHardware->getCount() != 0;
}

bool Scheduler::hasJustOneActive() {
    return (pool->getCount() == 1 && blocked->getCount() == 0 && waitingHardware->getCount() == 0);
}

bool Scheduler::hasSleepingThreads() {
    return sleeping->getCount() != 0;
}

bool Scheduler::hasActiveThreads() {
    return pool->getCount() != 0;
}

bool Scheduler::waitingHardwareAndWakeup() {
    return (sleeping->getCount() != 0 && waitingHardware->getCount() != 0 && pool->getCount() == 0);
}

void Scheduler::prepairWait(uint8 mode) {
    Riscv::interruptStatus = mode;
    Riscv::setMode(mode);
    waiting = true;
    pool->insertBeforeLast(waiter);
}

void Scheduler::endWait(uint8 mode) {
    waiter->isStarted = false;
    waiting = false;
    pool->remove(waiter);
    Riscv::interruptStatus = mode;
    Riscv::setMode(mode);
}