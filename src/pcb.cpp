//
// Created by os on 4/24/24.
//

#include "../h/pcb.hpp"
#include "../h/mem.hpp"
#include "../h/riscv.hpp"

thread_t PCB::running = nullptr;

ThreadState* PCB::createState(void* start_routine, void* arg){
    //this returns number of segments it takes to store ThreadState structure
    size_t size = calculateSize<ThreadState>();

    //ERROR DETECTED HERE:
    // - STACK GROWS TOWARDS LOWER ADDRESSES !!!
    // - mem_allocate argument is size in segments, not BYTES.
    auto allocatedSpace = MemoryAllocator::mem_allocate(size + DEFAULT_STACK_SIZE / MEM_BLOCK_SIZE);
    if(allocatedSpace == nullptr){
        sysCallExcepiton("Failed to allocate space for ThreadState data structure.");
        return nullptr;
    }else{
        auto ptr = (ThreadState*)((uint64)allocatedSpace + DEFAULT_STACK_SIZE);
        ptr->stackEnd = allocatedSpace;
        ptr->stackBegin = (void*)ptr;
        ptr->funcArgs = arg;

        //setting all register value to 0
        for (int i = 0; i < 27; i++) {
            ptr->registers[i] = 0;
        }

        ptr->registers[SP] = (uint64)ptr;
        ptr->registers[RA] = (uint64) &PCB::threadCompleteProcedure;
        ptr->registers[PC] = (uint64)start_routine;

        return ptr;
    }
}

void PCB::yield(thread_t oldT, thread_t newT) {
    if(setJmp(oldT) == 0){
        longJmp(newT);
    }
}

void PCB::dispatch_sync() {
    yield(PCB::running, PCB::running);
}

void PCB::threadCompleteProcedure() {
    //TODO implement cleanup for the thread memory and update scheduler structure
    printf("\n -- Thread ended --");
    Riscv::stopEmulator();
}