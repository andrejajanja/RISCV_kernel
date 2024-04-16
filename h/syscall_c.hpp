#ifndef SYSCALL_C_HPP
#define SYSCALL_C_HPP
#include "../h/riscv.hpp"

void* mem_alloc(uint64 size);
int mem_free(void* pointer);

#endif