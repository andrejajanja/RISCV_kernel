//
// Created by os on 4/15/24.
//
#include "../h/syscall_c.hpp"
#include "../h/riscv.hpp"

//TODO optimize readA0 function everywhere, is it even needed?

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

int thread_sleep(time_t duration){
    asm("mv a1, %0;"
        "li a0, 0x31;"
        "ecall;" : : "r"(duration));
    uint64 value = Riscv::readA0();
    return (int)value;
}

//semaphores
int sem_open(sem_t* handle, unsigned init){
    asm("mv a2, %1;"
        "mv a1, %0;"
        "li a0, 0x21;"
        "ecall;" : : "r"(handle), "r"(init));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int sem_close(sem_t handle){
    asm("mv a1, %0;"
        "li a0, 0x22;"
        "ecall;" : : "r"(handle));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int sem_wait(sem_t id){
    asm("mv a1, %0;"
        "li a0, 0x23;"
        "ecall;" : : "r"(id));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int sem_signal(sem_t id){
    asm("mv a1, %0;"
        "li a0, 0x24;"
        "ecall;" : : "r"(id));
    uint64 value = Riscv::readA0();
    return (int)value;
}

int sem_timedwait(sem_t id, time_t timeout){
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
    uint64 value = Riscv::readA0();
    return (char)value;
}

void putc(char c){
    asm("mv a1, %0;"
        "li a0, 0x42;"
        "ecall;" : : "r"(c));
}