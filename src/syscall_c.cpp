//
// Created by os on 4/15/24.
//
#include "../h/syscall_c.h"
#include "../h/riscv.hpp"
#include "../h/exception.hpp"

//memory
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

//threads
int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    if(handle == nullptr){
        new Exception("thread_create: handle argument can't be null");
    }

    if(handle == nullptr){
        new Exception("thread_create: start_routine argument can't be null");
    }

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
    return (int)Riscv::readA0();
}

int thread_dispatch(){
    asm("mv a1, ra;"
        "li a0, 0x13;");
    asm("ecall;");
    return (int)Riscv::readA0();
}

int time_sleep(time_t duration){
    if(duration == 0){ //za cije babe zdravlje je ovo izazivalo da nit ceka ~10^15 timera?
        return 0;
    }
    asm("mv a1, %0;"
        "li a0, 0x31;"
        "ecall;" : : "r"(duration));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int getCurrentThreadId() {
    asm("li a0, 0x32;"
        "ecall");
    int retValue = Riscv::readA0();
    return retValue;
}

//semaphores
int sem_open(sem_t* handle, unsigned init){
    if(handle == nullptr){
        new Exception("sem_open: handle argument can't be null");
    }

    asm("mv a2, %1;"
        "mv a1, %0;"
        "li a0, 0x21;"
        "ecall;" : : "r"(handle), "r"(init));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int sem_close(sem_t handle){
    if(handle == nullptr){
        new Exception("sem_close: handle argument can't be null");
    }
    asm("mv a1, %0;"
        "li a0, 0x22;"
        "ecall;" : : "r"(handle));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int sem_wait(sem_t id){
    if(id == nullptr){
        new Exception("sem_wait: id can't be null");
    }
    asm("mv a1, %0;"
        "li a0, 0x23;"
        "ecall;" : : "r"(id));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int sem_signal(sem_t id){
    if(id == nullptr){
        new Exception("sem_signal: id can't be null");
    }
    asm("mv a1, %0;"
        "li a0, 0x24;"
        "ecall;" : : "r"(id));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int sem_timedwait(sem_t id, time_t timeout){
    if(id == nullptr){
        new Exception("sem_timedwait: id can't be null");
        return 0;
    }

    if(timeout < 1){
        new Exception("sem_timedwait: timeout can't be less then 1");
        return 0;
    }

    asm("mv a2, %1;"
        "mv a1, %0;"
        "li a0, 0x25;"
        "ecall;" : : "r"(id), "r"(timeout));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int sem_trywait(sem_t id){
    asm("mv a1, %0;"
        "li a0, 0x26;"
        "ecall;" : : "r"(id));
    uint64 value = Riscv::readA0();
    return (int)value;
}

//console
char getc(){
    asm("li a0, 0x41;"
        "ecall;");
    char value = (char)Riscv::readA0();
    return value;
}

void putc(char c){
    asm("mv a1, %0;"
        "li a0, 0x42;"
        "ecall;" : : "r"(c));
}

int construct_ts(thread_t *handle, void (*start_routine)(void *), void *arg) {
    if(handle == nullptr){
        new Exception("Construct thread state: handle argument can't be null");
    }

    if(handle == nullptr){
        new Exception("Construct thread state: start_routine argument can't be null");
    }

    asm("mv a3, %2;"
        "mv a2, %1;"
        "mv a1, %0;"
        "li a0, 0x14;"
        "ecall": : "r"(handle), "r"(start_routine), "r"(arg));
    uint64 value = Riscv::readA0();
    return (int)value;
}

void destruct_ts(thread_t handle) {
    if(handle == nullptr){
        new Exception("destruct thread state: handle argument can't be null");
    }
    asm("mv a1, %0;"
        "li a0, 0x15;"
        "ecall": : "r"(handle));
}

int start_thread(thread_t handle) {
    if(handle == nullptr){
        new Exception("start thread: handle argument can't be null");
    }

    asm("mv a1, %0;"
        "li a0, 0x16;"
        "ecall": : "r"(handle));
    uint64 value = Riscv::readA0();
    return (int)value;
}
