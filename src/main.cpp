//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/printing.hpp"
#include "../h/sys_list.hpp"
asm(".global endOfProgramLabel;");

void calculateSum(void*){
    size_t sum = 0;
    for (int i = 0; i < 100000000; ++i) {
        size_t a = 10;
        size_t b = 5;
        sum += a/b + a + b;
    }
    printf("--- Function ended %u. ---\n", sum);
}

#define tn 5
void userMain(void*){
    printf("Main start\n");
    thread_t handle;
    thread_create(&handle, &calculateSum, nullptr);
    thread_sleep(10);
    printf("Main ended\n");
}

//FIXME MEMORY ALLOCATOR FOR ALLOCATING SEGMENTS OF SAME SIZE
int main(){
    Riscv::initializeSystem();

    // - create thread context for main function and start it
    thread_create(&PCB::running, &userMain, nullptr);
    PCB::threadBegin(PCB::running);
    asm("endOfProgramLabel:");
    printSystemState(true);
    Riscv::shutdownSystem();
    return 0;
}