#ifndef MEM_H
#define MEM_H

#include "../lib/hw.h"

struct FreeBlock{
    FreeBlock* left;
    FreeBlock* right;
    size_t sz;
};

class MemoryAllocator{
public:
    static void* mem_allocate(uint64 size);
    static int mem_free();
};

#endif