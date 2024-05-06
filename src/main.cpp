//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/printing.hpp"
asm(".global endOfProgramLabel;");

void addNumber(void* num){
    auto nump = (size_t*)num;
    nump[0]++;
    size_t sec = nump[2];
    nump[2] += nump[1];
    nump[1] = sec;
    printf("Thread %u, Sum: %u\n", nump[0], nump[2]);
}

void userMain(void*){
    auto number = (size_t*)mem_alloc(4*sizeof(size_t));
    number[0] = 0;
    number[1] = 1;
    number[2] = 1;
    printf("Thread %u, Sum: %u\n", number[0], number[2]);
    thread_t ths[3];
    for (int i = 0; i < 3; i++) {
        thread_create(&ths[i], &addNumber, number);
    }
    thread_dispatch();
    printf("Main ended.\n");
}

int main(){
    Riscv::initializeSystem();
    // - create thread context for main function
    thread_create(&PCB::running, &userMain, nullptr);
    PCB::threadStart(PCB::running);

    asm("endOfProgramLabel:");
    Riscv::shotdownSystem();
    return 0;
}

//mainThread->registers[RA] =