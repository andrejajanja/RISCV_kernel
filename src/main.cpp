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
    for (int i = 0; i < 1000000000; ++i) {
        size_t a = 10;
        size_t b = 5;
        sum += a/b + a + b;
    }
    printf("--- Function ended %u ---\n", sum);
}

//void criticalCalculate(void* sem){
//    sem_wait((sem_t)sem);
//    printf("--- Critical calculate started\n");
//    size_t sum = 0;
//    for (int i = 0; i < 100000000; ++i) {
//        size_t a = 10;
//        size_t b = 5;
//        sum += a/b + a + b;
//    }
//
//    printf("-- Critical Function ended %u. ---\n", sum);
//    printf("AAAA %d\n", sem_close((sem_t)sem));
//}

void userMain(void*){
    printf("\t\tMain begin\n");
    thread_t ts[3];
    for (int i = 0; i < 3; ++i) {
        thread_create(&ts[i], &calculateSum, nullptr);
    }

//    char c = getc();
//    if( c == 'k'){
//        printf("K KEY PRESSED\n");
//    }
    printf("\t\tMain ended\n");
}

//void userMain(void*){
//    while(true){
//        char c = getc();
//        if(c == '\r') {
//            putc('\n');
//            break;
//        }
//        putc(c);
//    }
//}

//Test main
//int main(){
//    Riscv::writeStvec((uint64)&ecallWrapper);
//    SysConsole::initialize();
//    char c = getc();
//    putc(c);
//    Riscv::stopEmulator();
//    asm("endOfProgramLabel:");
//    return 0;
//}

int main(){
    //system initialize
    Riscv::writeStvec((uint64)&ecallWrapper);
    SysConsole::initialize();
    MemoryAllocator::initialize();
    Scheduler::initialize();

    // - create thread context for main function and start it
    thread_create(&PCB::running, &userMain, nullptr);
    PCB::threadBegin(PCB::running);
    asm("endOfProgramLabel:");

    //system cleanup
    Scheduler::cleanUp();
    printf("Number of keys pressd: %u\n", Riscv::hardwareNum);
    //TODO memory allocator cleanup
    Riscv::stopEmulator();
    return 0;
}