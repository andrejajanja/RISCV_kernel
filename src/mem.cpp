//
// Created by os on 4/13/24.
//

#include "../h/mem.hpp"

void* MemoryAllocator::mem_allocate(uint64 size) {

}

int MemoryAllocator::mem_free() {}

void MemoryAllocator::initialize() {
    segmentsHead = (FreeBlock*)(HEAP_START_ADDR);
    segmentsHead->left = nullptr;
    segmentsHead->right = nullptr;
    //size of every block is in number of memory blocks, not bytes
    segmentsHead->size = size_t(uint64(HEAP_END_ADDR) - uint64(HEAP_START_ADDR))/MEM_BLOCK_SIZE;
    segmentsNumber = 1;
}

