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
    printUint((uint64)ptr1);
    int status = mem_free(ptr1);
    printString("\n\n");
    printInt(status);
    printString("\n\n");
    //end user main

    stopEmulator();
    return 0;
}