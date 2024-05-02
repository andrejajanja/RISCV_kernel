//
// Created by os on 4/24/24.
//

#include "../h/pcb.hpp"
#include "../h/mem.hpp"
#include "../h/riscv.hpp"

// register name macros, for more ergonomic access
#define A0 0
#define SP 27
#define RA 28
#define GP 29
#define TP 30
#define PC 31

ThreadState* PCB::running = nullptr;

ThreadState* PCB::createState(void* start_routine, void* arg, void* stack_ptr){
    size_t size = calculateSize<ThreadState>();
    ThreadState* ptr = (ThreadState*)MemoryAllocator::mem_allocate(size + DEFAULT_STACK_SIZE);
    if(ptr == nullptr){
        sysCallExcepiton("Failed to allocate space for ThreadState data stucture.");
    }
    ptr->st_p = stack_ptr;
    ptr->arg_ptr = arg;
    for (int i = 1; i < 27; i++) {
        ptr->registers[i] = 0;
    }
    ptr->registers[A0] = (uint64)arg;
    //TODO check if this works as it should (optimization for stack pointer)
    ptr->registers[SP] = (uint64)ptr+size;
    ptr->registers[RA] = (uint64)nullptr;
    ptr->registers[PC] = (uint64)start_routine;
    return ptr;
}

//TODO implement setjump
void PCB::setJmp(jmpbuf buffer) {
    return;
}

//TODO implement longjump
void PCB::longJmp(jmpbuf buffer, int st) {
    return;
}

//TODO implement yield
void PCB::yield(PCB *t1, PCB *t2) {
    return;
}
