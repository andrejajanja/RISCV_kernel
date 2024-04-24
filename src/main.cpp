//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/mem.hpp"
#include "../h/syscall_c.hpp"
#include "../h/printing.hpp"
#include "../h/exception.hpp"

void userMain(){
    Exception("NEKI EXCP");
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