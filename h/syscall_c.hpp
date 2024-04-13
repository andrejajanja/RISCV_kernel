#ifndef SYSCALL_C_HPP
#define SYSCALL_C_HPP
#include "../lib/hw.h"

void* mem_alloc(uint64 size);
int mem_free();

#endif