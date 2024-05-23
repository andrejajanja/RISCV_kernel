//
// Created by os on 4/24/24.
//

#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.h"
#include "../h/sys_structs.hpp"

//memory ops
void* operator new(size_t size) {
    void* ptr = mem_alloc(size);
    if(ptr) return ptr;
    Exception("Error in mem_alloc, operator new");
    return (void*)(1);
}

void operator delete (void* ptr){
    int status = mem_free(ptr);
    if(!status) return;
    Exception("Error in mem_free, operator delete.");
}

//Threads
Thread::Thread(void (*body)(void *), void* arg): myHandle(nullptr), body(body), arg(arg) {
    construct_ts(&myHandle, body, arg);
}

Thread::Thread(): myHandle(nullptr), body(runWrapper), arg(this) {
    construct_ts(&myHandle, runWrapper, this);
}


Thread::~Thread() noexcept {
    sem_wait(this->myHandle->cppSem);
    destruct_ts(this->myHandle);
}

int Thread::start() {
    return start_thread(this->myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    return time_sleep(time);
}

PeriodicThread::PeriodicThread(time_t period): Thread(&periodicRunWrapper, this), period(period), active(true){
    this->start();
}

void PeriodicThread::terminate() {
    active = false;
}

//Semaphores
Semaphore::Semaphore(unsigned int init): myHandle(nullptr) {
    sem_open(&myHandle, init);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

int Semaphore::timedWait(time_t timeout) {
    return sem_timedwait(myHandle, timeout);
}

int Semaphore::tryWait() {
    return sem_trywait(myHandle);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

//Console
char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
