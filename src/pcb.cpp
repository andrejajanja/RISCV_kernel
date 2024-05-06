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
    }else{
        auto ptr = (ThreadState*)((uint64)spacePointer + DEFAULT_STACK_SIZE);
        //setting all register value to 0
        ptr->registers[0] = (size_t)arg;
        for (int i = 1; i < 20; i++) ptr->registers[i] = 0;
        ptr->registers[SP] = (uint64)ptr;
        ptr->registers[RA] = (uint64) &PCB::threadComplete;
        ptr->registers[PC] = (uint64)start_routine;
        ptr->stackEnd = spacePointer;
        ptr->timeLeft = DEFAULT_TIME_SLICE;
        ptr->isStarted = false;
        return ptr;
    }
}

void PCB::freeThread(ThreadState* state){
    MemoryAllocator::mem_free(state->stackEnd);
}

//FIXME yield doesn't jump back to the appropriate state of the thread
void PCB::yield(ThreadState* oldT, ThreadState* newT, bool newStarted) {
    if(setJmp(oldT) == 0){
        if(newStarted){
            longJmp(newT);
        }else{
            newT->isStarted = true;
            threadStart(newT);
        }
    }
}

void PCB::dispatch_sync() {
    ThreadState* oldT = PCB::running;
    PCB::running = Scheduler::get();
    if(oldT == PCB::running) return;
    yield(oldT, PCB::running, PCB::running->isStarted);
}

void PCB::threadComplete() {
    Scheduler::removeRunning();
    printf("Removed running.\n");

    if(Scheduler::threadCount() == 0){
        asm("la t0, endOfProgramLabel;"
            "jalr x0, t0;");
    }

    PCB::running = Scheduler::get();

    if(PCB::running->isStarted){
        longJmp(PCB::running);
    }else{
        PCB::running->isStarted = true;
        threadStart(PCB::running);
    }

}