//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/printing.hpp"
#include "../h/sys_list.hpp"
#include "../h/scheduler.hpp"
asm(".global endOfProgramLabel;");

void calculateSum(void*){
    printf("--- FUNCTION STARTED\n");
    size_t sum = 0;
    for (int i = 0; i < 100000000; ++i) {
        size_t a = 10;
        size_t b = 5;
        sum += a/b + a + b;
    }
    printf("-- FUNCTION ENDED %u. ---\n", sum);
}

void criticalCalculate(void* sem){
    sem_wait((sem_t)sem);
    printf("--- Critical calculate started\n");
    size_t sum = 0;
    for (int i = 0; i < 100000000; ++i) {
        size_t a = 10;
        size_t b = 5;
        sum += a/b + a + b;
    }

    printf("-- Critical Function ended %u. ---\n", sum);
    sem_close((sem_t)sem);
}

void userMain(void*){
    printf("\t\tMain begin\n");
    sem_t semaphore1;
    thread_t ts[3];
    sem_open(&semaphore1, 1);
    for (int i = 0; i < 2; ++i) {
        thread_create(&ts[i], &criticalCalculate, semaphore1);
    }

    calculateSum(nullptr);

    sem_wait(semaphore1);
    printf("Critical print\n");
    sem_signal(semaphore1);

    printf("Sem close status: %d\n",sem_close(semaphore1));
    printf("\t\tMain ended\n");
}

//Test main
int main(){
    printf("'%d'\n", -1);
    Riscv::stopEmulator();
    asm("endOfProgramLabel:");
    return 0;
}

//int main(){
//    //system initialize
//    Riscv::writeStvec((uint64)&ecallWrapper);
//    MemoryAllocator::initialize();
//    Scheduler::initialize();
//
//    // - create thread context for main function and start it
//    thread_create(&PCB::running, &userMain, nullptr);
//    PCB::threadBegin(PCB::running);
//    asm("endOfProgramLabel:");
//
//    //system cleanup
//    Scheduler::cleanUp();
//    //TODO memory allocator cleanup
//    Riscv::stopEmulator();
//    return 0;
//}