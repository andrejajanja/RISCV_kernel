//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_SYSCALL_CPP_H
#define RISCV_KERNEL_SYSCALL_CPP_H

#include "../h/syscall_c.hpp"
#include "../h/exception.hpp"

//global memory operators
void* operator new (size_t);
void operator delete (void*);

//thread
class Thread{
public:
    Thread(void (*body)(void*), void*);
    virtual ~Thread();
    int start();

    static void dispatch();
    static int sleep(time_t time);
protected:
    Thread();
    virtual void run();
private:
    thread_t myHandle;
    void (*body)(void*);
    void* arg;
};

#endif //RISCV_KERNEL_SYSCALL_CPP_H
