//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/standardio.hpp"
#include "../h/scheduler.hpp"
#include "../h/console.hpp"
#include "../h/syscall_cpp.hpp"
asm(".global endOfProgramLabel;");

using namespace C_API;

void calculateSum(void*){
    printf("\t--- Function started ---\n");
    size_t sum = 0;
    for (int i = 0; i < 1000000000; ++i) {
        size_t a = 10;
        size_t b = 5;
        sum += a/b + a + b;
    }
    thread_sleep(100);
    printf("--- Function ended %u ---\n", sum);
//    printf("Sleeping...\n");
//    thread_sleep(100);
//    printf("Wokeup\n");
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
    sem_signal((sem_t)sem);
    printf("-- Critical Function ended %u. ---\n", sum);
}

void userMain(void*){
    printf("\t\tMain begin\n");

    Thread* t = new Thread(&calculateSum, nullptr);
    t->start();
    while(true){
        char c = getc();
        if(c == '\r') {
            putc('\n');
            break;
        }
        putc(c);
    }
    printf("Input ended\n");
    delete t;

    printf("\t\tMain ended\n");
}

//note: there is a bug when typing input before main starts
int main(){
    //system initialize
    Riscv::writeStvec((uint64)&ecallWrapper);
    MemoryAllocator::initialize();
    Scheduler::initialize();
    // - create thread context for main function and start it
    thread_create(&PCB::running, &userMain, nullptr);
    SysConsole::initialize();
    PCB::threadBegin(PCB::running);
    asm("endOfProgramLabel:");
    //system cleanup
    Scheduler::cleanUp();
    Riscv::stopEmulator();
    return 0;
}