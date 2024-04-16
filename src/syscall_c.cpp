//
// Created by os on 4/15/24.
//
#include "../h/syscall_c.hpp"

void* mem_alloc(uint64 size){
    asm("mv a1, %0;"
        "li a0, 0x01;": : "r"(size));
    asm("ecall;");
    uint64 value = readA0();
    return (void*)value;
}

int mem_free(void* pointer){
    asm("li a0, 0x02;"
                 "mv a1, %0;"
                 "ecall;": "=r"(pointer));
    return (int)readA0();
}