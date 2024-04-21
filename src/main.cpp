//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/mem.hpp"
#include "../h/syscall_c.hpp"
#include "../h/printing.hpp"

void userMain(){

    printf("Tvoja %s ima %d godina\n", "keva", 16);

    return;
}

int main(){
    //initialize system data structures and register values
    initializeSystemRegisters();
    MemoryAllocator::initialize();

    userMain();

    stopEmulator();
    return 0;
}