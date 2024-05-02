#ifndef MEM_H
#define MEM_H

#include "../lib/hw.h"
#include "../h/printing.hpp"

template<typename T>
size_t calculateSize();

struct MemSegment{
    MemSegment* left;
    MemSegment* right;
    size_t size;
};

class MemoryAllocator{
public:
    static void initialize();
    static void* mem_allocate(uint64 size);
    static int mem_free(void* ptr);
    static void print_segments();

private:
    static MemSegment* segmentsHead;
    static uint32 segmentsNumber;
    static uint32 totalSize; //in number of segments
};

#endif