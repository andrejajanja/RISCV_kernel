//
// Created by os on 4/15/24.
//

#ifndef RISCV_KERNEL_RISCV_H
#define RISCV_KERNEL_RISCV_H

#include "../lib/hw.h"

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

inline uint64 readA1(){
    uint64 value;
    asm("mv %0, a1;": "=r"(value));
    return value;
}

inline uint64 readA2(){
    uint64 value;
    asm("mv %0, a2;": "=r"(value));
    return value;
}

inline uint64 readA3(){
    uint64 value;
    asm("mv %0, a3;": "=r"(value));
    return value;
}

inline uint64 readA4(){
    uint64 value;
    asm("mv %0, a4;": "=r"(value));
    return value;
}

inline uint64 readA5(){
    uint64 value;
    asm("mv %0, a5;": "=r"(value));
    return value;
}

inline uint64 readA6(){
    uint64 value;
    asm("mv %0, a6;": "=r"(value));
    return value;
}

inline uint64 readA7(){
    uint64 value;
    asm("mv %0, a7;": "=r"(value));
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

inline void writeA1(uint64 value){
    asm("mv a1, %0;": : "r"(value));
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
void printSystemState(bool = false, bool = false, bool = false);

#endif //RISCV_KERNEL_RISCV_H