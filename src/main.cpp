//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/printing.hpp"

void userMain(void*){
    printf("Some text here\n");
}

int main(){
    Riscv::initializeSystem();

    //create thread context for main function
    thread_create(&PCB::running, &userMain, nullptr);
    //prepair stack for userMain function
    uint64 temp;
    asm("la %0, endOfMainLabel;": "=r"(temp));
    PCB::running->registers[RA] = temp;
    PCB::longJmp(PCB::running);
    //TODO this is where you need to jump when ALL threads are finnished this is in dispatch function
    asm("endOfMainLabel:");
    printf("This is the end of main function");
    Riscv::stopEmulator();
    return 0;
}

//mainThread->registers[RA] =