//
// Created by os on 4/15/24.
//

#ifndef RISCV_KERNEL_RISCV_H
#define RISCV_KERNEL_RISCV_H

#include "../lib/hw.h"

class Riscv{
public:
    //register operations
    //read ops
    static inline uint64 readStvec(){
        uint64 value;
        asm("csrr stvec, %0;": "=r"(value));
        return value;
    }

    static inline uint64 readScause(){
        uint64 value;
        asm("csrr %0, scause;": "=r"(value));
        return value;
    }

    static inline uint64 readA0(){
        uint64 value;
        asm("mv %0, a0;": "=r"(value));
        return value;
    }

    static inline uint64 readA1(){
        uint64 value;
        asm("mv %0, a1;": "=r"(value));
        return value;
    }

    static inline uint64 readA2(){
        uint64 value;
        asm("mv %0, a2;": "=r"(value));
        return value;
    }

    static inline uint64 readA3(){
        uint64 value;
        asm("mv %0, a3;": "=r"(value));
        return value;
    }

    static inline uint64 readA4(){
        uint64 value;
        asm("mv %0, a4;": "=r"(value));
        return value;
    }

    static inline uint64 readA5(){
        uint64 value;
        asm("mv %0, a5;": "=r"(value));
        return value;
    }

    static inline uint64 readA6(){
        uint64 value;
        asm("mv %0, a6;": "=r"(value));
        return value;
    }

    static inline uint64 readA7(){
        uint64 value;
        asm("mv %0, a7;": "=r"(value));
        return value;
    }

    static inline uint64 readSepc(){
        uint64 value;
        asm("csrr %0, sepc;": "=r"(value));
        return value;
    }

    static inline uint64 readSstatus(){
        uint64 value;
        asm("csrr %0, sstatus;": "=r"(value));
        return value;
    }

    static inline char readConsoleStatus(){
        char value;
        asm("mv t0, %1;"
            "lb %0, 0(t0);": "=r"(value):"r"(CONSOLE_STATUS));
        return value;
    }

    static inline void writeConsole(char value){
        asm("mv t0, %1;"
            "sb %0, 0(t0);": :"r"(value),"r"(CONSOLE_RX_DATA));
    }

    static inline char readConsole(){
        char value;
        asm("mv t0, %1;"
            "lb %0, 0(t0);": "=r"(value):"r"(CONSOLE_TX_DATA));
        return value;
    }

//write ops
    static inline void writeStvec(uint64 value){
        asm("csrw stvec, %0;": :"r"(value));
    }

    static inline void writeA0(uint64 value){
        asm("mv a0, %0;": : "r"(value));
    }

    static inline void writeA1(uint64 value){
        asm("mv a1, %0;": : "r"(value));
    }

    static inline void writeSepc(uint64 value){
        asm("csrw sepc, %0;": : "r"(value));
    }

    static inline void writeSstatus(uint64 value){
        asm("csrw sstatus, %0;": "=r"(value));
    }

    static inline void writeScause(uint64 value){
        asm("csrw scause, %0;": "=r"(value));
    }


    static void switchToUserMode();
    static void switchToUserModeH();
    static void waitForNextTimer();
    static void waitForHardwareInterrupt();
    static void stopEmulator();
    static void initializeSystem();
    static void shutdownSystem();
};

//system initialization and infrastructure functions
extern void ecallWrapper();
void ecallHandler();
void printSystemState(bool = false, bool = false, bool = false);
void sysCallExcepiton(const char* msg);

#endif //RISCV_KERNEL_RISCV_H