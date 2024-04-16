//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"


int main(){
    //initialize system data structures and register values
    initializeSystemRegisters();

    int* ptr1 = (int*)mem_alloc(10);
    ptr1++;

    stopEmulator();
    return 0;
}