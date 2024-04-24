#ifndef SYSCALL_C_HPP
#define SYSCALL_C_HPP
#include "../h/riscv.hpp"

//memory allocator

void* mem_alloc(uint64 size);
int mem_free(void* pointer);

//threading

class _thread;
typedef _thread* thread_t;
int create_thread(
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
        );

int thread_exit();
int thread_dispatch();

#endif