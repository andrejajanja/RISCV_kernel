#ifndef SYSCALL_C_HPP
#define SYSCALL_C_HPP
#include "../h/riscv.hpp"
#include "../h/pcb.hpp"
//memory allocator

void* mem_alloc(uint64 size);
int mem_free(void* pointer);

//threading
int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);
int thread_exit();
int thread_dispatch();

#endif