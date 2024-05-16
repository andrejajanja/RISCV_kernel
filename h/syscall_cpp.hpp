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

//Threads
class Thread{
public:
    Thread(void (*body)(void*), void*);
    virtual ~Thread();
    int start();

    static void dispatch();
    static int sleep(time_t time);
protected:
    Thread();
    virtual void run(){}
private:
    thread_t myHandle;
    void (*body)(void*);
    void* arg;

    //needed to add runWrapper for Thread() constructor
    static void runWrapper(void* thread){
        if(thread){
            ((Thread*)thread)->run();
        }
    }
};

class PeriodicThread : public Thread {
public:
    void terminate ();
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation (){}
private:
    time_t period;
    bool active;

    //same idea as in thread class
    static void periodicRunWrapper(void* periThread){
        if(periThread){
            while(((PeriodicThread*)periThread)->active){
                ((PeriodicThread*)periThread)->periodicActivation();
                ((PeriodicThread*)periThread)->sleep(((PeriodicThread*)periThread)->period);
            }
        }
    }
};

//Semaphores
class Semaphore {
public:
    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();
    int wait ();
    int signal ();
    int timedWait (time_t);
    int tryWait();
private:
    sem_t myHandle;
};

//Console
class Console {
public:
    static char getc ();
    static void putc (char);
};

#endif //RISCV_KERNEL_SYSCALL_CPP_H
