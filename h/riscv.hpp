//
// Created by os on 4/15/24.
//

#ifndef RISCV_KERNEL_RISCV_H
#define RISCV_KERNEL_RISCV_H

#include "../lib/hw.h"
#include "../lib/console.h"

//register operations

//read ops
inline uint64 readStvec(){
    uint64 value;
    asm("csrr stvec, %0;": "=r"(value));
    return value;
}

inline uint64 readScause(){
    uint64 value;
    asm("csrr %0, scause;": "=r"(value));
    return value;
}

inline uint64 readA0(){
    uint64 value;
    asm("mv %0, a0;": "=r"(value));
    return value;
}

inline uint64 readSepc(){
    uint64 value;
    asm("csrr %0, sepc;": "=r"(value));
    return value;
}

inline uint64 readSstatus(){
    uint64 value;
    asm("csrr %0, sstatus;": "=r"(value));
    return value;
}

//write ops
inline void writeStvec(uint64 value){
    asm("csrw stvec, %0;": :"r"(value));
}

inline void writeA0(uint64 value){
    asm("mv a0, %0;": : "r"(value));
}

inline void writeSepc(uint64 value){
    asm("csrw sepc, %0;": : "r"(value));
}

inline void writeSstatus(uint64 value){
    asm("csrw sstatus, %0;": "=r"(value));
}

//system initialization and infrastructure functions
void initializeSystemRegisters();
extern void ecallWrapper();
void ecallHandler();
void stopEmulator();

//some ubiquidous functions
inline void printString(const char* str){
    while (*str != '\0'){
        __putc(*str);
        str++;
    }
    __putc('\n');
    return;
}

#endif //RISCV_KERNEL_RISCV_H
