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
        "li a0, 0x01;"
        "ecall;" : : "r"(size));

    uint64 value = Riscv::readA0();
    return (void*)value;
}

int mem_free(void* pointer){
    if(pointer == nullptr) return -1;
    //if((uint64) pointer > )
    asm("mv a1, %0;"
        "li a0, 0x02;"
        "ecall;": : "r"(pointer));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    asm("mv a3, %2;"
        "mv a2, %1;"
        "mv a1, %0;"
        "li a0, 0x11;"
        "ecall": : "r"(handle), "r"(start_routine), "r"(arg));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int thread_exit(){
    asm("li a0, 0x12;"
        "ecall;");
    uint64 value = Riscv::readA0();
    return (int)value;
}