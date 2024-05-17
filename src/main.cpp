//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/scheduler.hpp"
#include "../h/console.hpp"
asm(".global endOfProgramLabel;");

using namespace C_API;

extern void userMain();

//note: there is a bug when typing input before main starts
int main(){
    //system initialize
    Riscv::writeStvec((uint64)&ecallWrapper);
    MemoryAllocator::initialize();
    Scheduler::initialize();
    // - create thread context for main function and start it
    thread_create(&PCB::running, reinterpret_cast<void (*)(void *)>(&userMain), nullptr);
    SysConsole::initialize();
    PCB::threadBegin(PCB::running);
    asm("endOfProgramLabel:");
    //system cleanup
    Scheduler::cleanUp();
    Riscv::stopEmulator();
    return 0;
}