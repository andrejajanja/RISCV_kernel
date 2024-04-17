//
// Created by os on 4/15/24.
//
#include "../h/syscall_c.hpp"

void* mem_alloc(uint64 size){
    //recalculating size to be number of memory blocks, instead of bytes.
    if(size < MEM_BLOCK_SIZE){
        size = 1;
    }else{
        size = size/MEM_BLOCK_SIZE+1;
    }

    asm("mv a1, %0;"
        "li a0, 0x01;" : : "r"(size));
    asm("ecall;");

    uint64 value = readA0();
    return (void*)value;
}

int mem_free(void* pointer){
    asm("mv a1, %0;"
        "li a0, 0x02;"
        "ecall;": : "r"(pointer));
    uint64 value = readA0();
    return (int)value;
}