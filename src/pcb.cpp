//
// Created by os on 4/24/24.
//

#include "../h/pcb.hpp"
#include "../h/mem.hpp"
#include "../h/riscv.hpp"
#include "../h/scheduler.hpp"

thread_t PCB::running = nullptr;

ThreadState* PCB::createState(void* start_routine, void* arg){
    //size = number of segments it takes to store ThreadState struct
    size_t size = calculateSize<ThreadState>();

    //ERROR DETECTED HERE:
    // - STACK GROWS TOWARDS LOWER ADDRESSES !!!
    // - mem_allocate argument is size in segments, not BYTES.
    auto spacePointer = MemoryAllocator::mem_allocate(size + DEFAULT_STACK_SIZE / MEM_BLOCK_SIZE);
    if(spacePointer == nullptr){
        sysCallExcepiton("Failed to allocate space for ThreadState data structure.");
        return nullptr;
    }

    auto ptr = (ThreadState*)((size_t)spacePointer + DEFAULT_STACK_SIZE);
    ptr->registers[0] = (size_t)arg;
    ptr->registers[SP] = (uint64)ptr;
    ptr->registers[RA] = (uint64)&threadCompleteSysCall;
    ptr->registers[PC] = (uint64)start_routine;
    ptr->stackEnd = spacePointer;
    ptr->timeLeft = DEFAULT_TIME_SLICE;
    ptr->semaphore = nullptr;
    ptr->isStarted = false;
    ptr->waitingForHardware = false;

    return ptr;
}

int PCB::freeState(ThreadState* state){
    return MemoryAllocator::mem_free(state->stackEnd);
}

void PCB::dispatch_sync() {
    if(PCB::running->waitingForHardware){
        Scheduler::runningHArdwareWait();
    }

    if(Scheduler::hasOnlySleepingThreads()){
        if(setJmp(PCB::running) == 0){
            Riscv::waitForNextTimer();
        }
    }

    ThreadState* oldT = PCB::running;
    PCB::running = Scheduler::get();
    if(oldT == PCB::running) return;
    yield(oldT, PCB::running);
}

void PCB::yield(ThreadState* oldT, ThreadState* newT) {
    if(setJmp(oldT) == 0){
        if(newT->isStarted){
            longJmp(newT);
        }else{
            threadBegin(newT);
        }
    }
}

void PCB::threadBegin(ThreadState *state) {
    state->isStarted = true;
    //before every thread start there is switch to user mode procedure
    Riscv::switchToUserMode();
    PCB::threadStart(state);
}

void PCB::threadComplete() {
    Scheduler::removeRunning();

    if(Scheduler::hasOnlySleepingThreads()){
        Riscv::waitForNextTimer();
    }

    if(Scheduler::threadCount() == 0){
        //jumping to the end of the program
        asm("la t0, endOfProgramLabel;"
            "jalr x0, t0;");
    }

    PCB::running = Scheduler::get();

    if(PCB::running->isStarted){
        longJmp(PCB::running);
    }else{
        threadBegin(PCB::running);
    }
}