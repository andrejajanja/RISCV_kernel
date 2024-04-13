//
// Created by os on 4/13/24.
//

#ifndef RISCV_KERNEL_RISCV_H
#define RISCV_KERNEL_RISCV_H

#include "../lib/hw.h"
#include "../lib/console.h"

void print(const char* txt){
    while(*txt != '\0'){
        __putc(*txt);
        txt++;
    }
    return;
}

class Riscv {
public:
    //-- a0 register operations --
    static void write_a0(uint64 val);
    static uint64 read_a0();

    //-- stvec register operations --
    static void write_stvec(uint64 stvec);
    static uint64 read_stvec();

    //-- sepc register operations --
    static void write_sepc(uint64 stvec);
    static uint64 read_sepc();

    //-- scause register operations --
    static void write_scause(uint64 scause);
    static uint64 read_scause();

    //-- sstatus register operations and structures --
    static void set_sstatus(uint64 mask);
    static void clear_sstatus(uint64 mask);
    static void write_sstatus(uint64 sstatus);
    static uint64 read_sstatus();

    enum SstatusMasks{
        SIE = (1<<1),
        SPIE = (1<<5),
        SPP = (1<<8)
    };

    //-- sip register operations and structures --
    static void set_sip(uint64 mask);
    static void clear_sip(uint64 mask);
    static void write_sip(uint64 sstatus);
    static uint64 read_sip();

    enum SipMasks{
        SSIP = (1<<1),
        STIP = (1<<5),
        SEIP = (1<<9)
    };

    static void supervisorTrap();
    static void stvecVectorTable();

private:
    static void handleSupervisorTrap();
    static void handleTimerInterrupt();
    static void handleConsoleInterrupt();
};

inline uint64 read_a0(){
    uint64 volatile reg;
    __asm__ volatile("mv %0, a0;": "=r" (reg));
    return reg;
}

inline void write_a0(uint64 val){
    __asm__ volatile ("mv a0, %0;": "r"(stvec));
}

inline uint64 Riscv::read_stvec() {
    uint64 volatile reg;
    __asm__ volatile("csrr %0, stvec;": "=r" (reg));
    return reg;
}

inline void Riscv::write_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %0;": "r"(stvec));
}

inline uint64 read_sepc(){
    uint64 volatile reg;
    __asm__ volatile("csrr %0, sepc;": "=r" (reg));
    return reg;
}

inline void write_sepc(uint64 sepc){
    __asm__ volatile ("csrw sepc, %0;": "r"(stvec));
}

inline uint64 Riscv::read_scause(){
    uint64 volatile reg;
    __asm__ volatile ("csrr scause, %0;", "=r"(reg));
    return reg
}

inline void Riscv::write_scause(uint64 scause){
    __asm__ volatile ("csrw %0, scause;", "r"(scause));
}

inline void set_sstatus(uint64 mask){
    __asm__ volatile("csrs sstatus, %0;", "r"(mask));
}

inline void clear_sstatus(uint64 mask){
    __asm__ volatile("csrc sstatus, %0;", "r"(mask));
}

inline uint64 Riscv::read_sstatus() {
    uint64 volatile reg;
    __asm__ volatile("csrr %0, sstatus;": "=r" (reg));
    return reg;
}

inline void Riscv::write_sstatus(uint64 stvec) {
    __asm__ volatile ("csrw sstatus, %0;": "r"(stvec));
}

inline void set_sip(uint64 mask){
    __asm__ volatile("csrs sip, %0;", "r"(mask));
}

inline void clear_sip(uint64 mask){
    __asm__ volatile("csrc sip, %0;", "r"(mask));
}

inline uint64 Riscv::read_sip() {
    uint64 volatile reg;
    __asm__ volatile("csrr %0, sip;": "=r" (reg));
    return reg;
}

inline void Riscv::write_sip(uint64 stvec) {
    __asm__ volatile ("csrw sip, %0;": "r"(stvec));
}

#endif //RISCV_KERNEL_RISCV_H
