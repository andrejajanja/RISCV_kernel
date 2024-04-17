//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/mem.hpp"
#include "../h/syscall_c.hpp"

int main(){
    //initialize system data structures and register values
    initializeSystemRegisters();
    MemoryAllocator::initialize();

    //start user main
    int* ptr1 = (int*)mem_alloc(10);
    ptr1++;

    mem_free(ptr1);
    //end user main

    stopEmulator();
    return 0;
}