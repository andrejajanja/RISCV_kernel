//
// Created by os on 4/15/24.
//
#include "../h/syscall_c.hpp"

void* mem_alloc(uint64 size){
    if(size == 0) return nullptr; //allocating memory chunks of 0 bytes isn't allowed
    size += sizeof(size_t); //this is to account for metadata for size of allocated segment

    if(size < MEM_BLOCK_SIZE){ //recalculating size to be number of memory blocks, instead of bytes
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
    if(pointer == nullptr) return -1;
    //if((uint64) pointer > )
    asm("mv a1, %0;"
        "li a0, 0x02;"
        "ecall;": : "r"(pointer));
    uint64 value = readA0();
    return (int)value;
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    void* stack_ptr = mem_alloc(DEFAULT_STACK_SIZE);
    asm("mv a1, %2;"
        "mv a2, %1;"
        "mv a3, %0;"
        "mv a4, %3;"
        "li a0, 0x11;": : "r"(arg), "r"(start_routine), "r"(handle), "r"(stack_ptr) );
    asm("ecall;");
    uint64 value = readA0();
    return (int)value;
}