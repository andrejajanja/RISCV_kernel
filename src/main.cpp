//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/printing.hpp"

void userMain(void*){
    printf("-- 1 --\n");
    thread_dispatch();
    thread_exit();
    printf("-- 2 --\n");
    thread_dispatch();
    printf("-- 3 --\n");
}

int main(){
    Riscv::initializeSystem();
    // - create thread context for main function
    thread_create(&PCB::running, &userMain, nullptr);
    PCB::threadStart(PCB::running);

    asm(".global endOfProgramLabel;"
        "endOfProgramLabel:");
    //TODO do memory cleanup here
    printf("This is the end of main function");
    Riscv::stopEmulator();
    return 0;
}

//mainThread->registers[RA] =