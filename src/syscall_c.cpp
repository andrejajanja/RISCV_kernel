//
// Created by os on 4/15/24.
//
#include "../h/syscall_c.hpp"

void* mem_alloc(uint64 size){
    __asm__ volatile("la a0, 0x01;"
                     "mv a1, %0;"
                     "ecall;": "=r"(size));

    void* returnValue;
    __asm__ volatile("mv %0, a0;": "=r"(returnValue));
    return returnValue;
}

int mem_free(){
    __asm__ volatile("la a0, 0x01;"
                     "ecall;");

    int returnValue;
    __asm__ volatile("mv %0, a0;": "=r"(returnValue));
    return returnValue;
}