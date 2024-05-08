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
    size_t sum = 0;
    for (int i = 0; i < 100000000; ++i) {
        size_t a = 10;
        size_t b = 5;
        sum += a/b + a + b;
    }
    printf("--- Function ended %u. ---\n", sum);
}

void userMain(void*){
    printf("Main start\n");
    thread_t handle[4];
    for (int i = 0; i < 3; i++) {
        thread_create(&handle[i], &calculateSum, nullptr);
    }
    thread_sleep(15);
    printf("Main ended\n");
}

//Test main
//int main(){
//    Riscv::writeStvec((uint64)&ecallWrapper);
//    MemoryAllocator::initialize();
//    uint32 begin = MemoryAllocator::print_segments();
//
//    void* segs[10];
//    segs[0] = MemoryAllocator::mem_allocate(50);
//    segs[1] = MemoryAllocator::mem_allocate(10);
//    segs[2] = MemoryAllocator::mem_allocate(40);
//    segs[3] = MemoryAllocator::mem_allocate(10);
//    MemoryAllocator::mem_free(segs[0]);
//    MemoryAllocator::mem_free(segs[2]);
//    MemoryAllocator::mem_free(segs[1]);
//    MemoryAllocator::mem_free(segs[3]);
//    if(begin != MemoryAllocator::print_segments()){
//        printf("Some error\n");
//    }
//
//    asm("endOfProgramLabel:");
//    Riscv::stopEmulator();
//    return 0;
//}

int main(){
    //system initialize
    Riscv::writeStvec((uint64)&ecallWrapper);
    MemoryAllocator::initialize();
    Scheduler::initialize();

    // - create thread context for main function and start it
    thread_create(&PCB::running, &userMain, nullptr);
    PCB::threadBegin(PCB::running);
    asm("endOfProgramLabel:");

    //system cleanup
    Scheduler::cleanUp();
    //TODO memory allocator cleanup
    Riscv::stopEmulator();
    return 0;
}