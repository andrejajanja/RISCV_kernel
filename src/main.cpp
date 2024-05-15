//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/standardio.hpp"
#include "../h/scheduler.hpp"
#include "../h/console.hpp"
asm(".global endOfProgramLabel;");

void calculateSum(void*){
    printf("\t--- Function started ---\n");
    size_t sum = 0;
    for (int i = 0; i < 100000000; ++i) {
        size_t a = 10;
        size_t b = 5;
        sum += a/b + a + b;
    }
    printf("--- Function ended %u ---\n", sum);
    printf("Sleeping...\n");
    thread_sleep(10);
    printf("Wokeup\n");
}

void criticalCalculate(void* sem){
    //FIXME this case doesn't work
    sem_wait((sem_t)sem);
    printf("--- Critical calculate started\n");
    size_t sum = 0;
    for (int i = 0; i < 1000000000; ++i) {
        size_t a = 10;
        size_t b = 5;
        sum += a/b + a + b;
    }
    sem_signal((sem_t)sem);
    printf("-- Critical Function ended %u. ---\n", sum);
}

void userMain(void*){
    printf("\t\tMain begin\n");
    sem_t sem1;
    sem_open(&sem1, 2);
    sem_wait(sem1);
    thread_t ts[3];
    for (int i = 0; i < 3; ++i) {
        thread_create(&ts[i], &criticalCalculate, sem1);
    }
    while(true){
        char c = getc();
        if(c == '\r') {
            putc('\n');
            break;
        }
        putc(c);
    }
    sem_signal(sem1);
    sem_close(sem1);
    printf("\t\tMain ended\n");
}


//Test main
//int main(){
//    Riscv::writeStvec((uint64)&ecallWrapper);
//    SysConsole::initialize();
//    putc('V');
//    Riscv::stopEmulator();
//    asm("endOfProgramLabel:");
//    return 0;
//}

//FIXME there is a bug when typing input before main starts
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
    //printf("Number of keys pressd: %u\nTimer signals: %u\n", Riscv::hardwareNum, Riscv::timerNum);
    Riscv::stopEmulator();
    return 0;
}