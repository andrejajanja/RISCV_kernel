//
// Created by os on 4/24/24.
//

#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"
#include "../h/sem.hpp"
#include "../h/sys_structs.hpp"

SysList<ThreadState*>* Scheduler::pool = nullptr;
SysList<ThreadState*>* Scheduler::sleeping = nullptr;
//SysList<ThreadState*>* Scheduler::blocked = nullptr;
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
//    blocked = new SysList<ThreadState*>();
    waitingHardware = new SysList<ThreadState*>();
    waiter =  PCB::createState((void*)&waitingProcedure, nullptr, nullptr);
}

void Scheduler::cleanUp() {
    PCB::freeState(waiter);
    delete pool;
    delete sleeping;
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
            printf(" Addr: %u , for %u*100ms\n", (*iter)->registers[PC], (*iter)->waitingFor);
        }
    }

//    if(blocked->getCount() != 0){
//        printf("- Blocked -> %d ---\n", blocked->getCount());
//        for(auto iter = blocked->getIterator(); iter.hasElements(); ++iter){
//            printf(" Addr: %u\n", (*iter)->registers[PC]);
//        }
//    }

    printf("--- End thread state ---\n\n");
}

bool Scheduler::hasAnyThreads(){
    return (pool->getCount() != 0 || sleeping->getCount() != 0 || waitingHardware->getCount() != 0 );
}

void Scheduler::put(ThreadState *ts) {
    if(ts == nullptr){
        sysCallExcepiton("Scheduler::put(ThreadState *ts) - ts is nullptr");
    }
    pool->insertBeforeLast(ts);
}

ThreadState* Scheduler::get() {
    return pool->next();
}

void Scheduler::remove(ThreadState *ts) {
    pool->remove(ts);
}

void Scheduler::removeRunning(){
    pool->removeLast();
}

void Scheduler::removeFromSleeping(ThreadState* ts) {
    sleeping->remove(ts);
}

void Scheduler::putRunningToSleep(time_t howLong) {
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
            if(waiting){
                wokedUp = true;
            }
            pool->insertBeforeLast(temp);

            if(temp->semaphore == nullptr) continue;
            //if temp was put to sleep with SEM::timedwait

            SemState* sem = temp->semaphore;
            sem->state++;
            temp->semaphore = nullptr;
            temp->isExpired = true;

            BlockedPCB* tempPCB = sem->beggining;
            if(temp == tempPCB->pcbPtr){
                sem->beggining = sem->beggining->next;
                SEM::destructBlocked(tempPCB);
                continue;
            }

            BlockedPCB* prevTempPCB = nullptr;

            while(tempPCB!= nullptr){
                if(temp == tempPCB->pcbPtr){
                    prevTempPCB->next = tempPCB->next;
                    SEM::destructBlocked(tempPCB);
                    break;
                }

                prevTempPCB = tempPCB;
                tempPCB = tempPCB->next;
            }
        }
    }
}

bool Scheduler::hasOnlySleepingThreads() {
    return (sleeping->getCount() != 0 && pool->getCount() == 0 && waitingHardware->getCount() == 0);
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
    return (waitingHardware->getCount() != 0 && pool->getCount() == 0);
}

bool Scheduler::hasWaitingHArdware() {
    return waitingHardware->getCount() != 0;
}

bool Scheduler::hasJustOneActive() {
    return (pool->getCount() == 1 && waitingHardware->getCount() == 0);
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
