//
// Created by os on 4/24/24.
//

#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/sys_structs.hpp"

//memory ops
void* operator new(size_t size) {
    void* ptr = C_API::mem_alloc(size);
    if(ptr) return ptr;
    Exception("Error in mem_alloc, operator new");
    return (void*)(1);
}

void operator delete (void* ptr){
    int status = C_API::mem_free(ptr);
    if(!status) return;
    Exception("Error in mem_free, operator delete.");
}

//Threads
Thread::Thread(void (*body)(void *), void* arg): myHandle(nullptr), body(body), arg(arg) {
    C_API::construct_ts(&myHandle, body, arg);
}

//TODO TEST IMPLEMENTATION
Thread::Thread(): myHandle(nullptr), body(runWrapper), arg(this) {
    C_API::construct_ts(&myHandle, runWrapper, arg);
}


Thread::~Thread() noexcept {
    C_API::sem_wait(this->myHandle->cppSem);
    C_API::destruct_ts(this->myHandle);
}

int Thread::start() {
    return C_API::start_thread(this->myHandle);
}

void Thread::dispatch() {
    C_API::thread_dispatch();
}

int Thread::sleep(time_t time) {
    return C_API::thread_sleep(time);
}

//TODO TEST IMPLEMENTATION
PeriodicThread::PeriodicThread(time_t period): Thread(&periodicRunWrapper, this), period(period), active(true){}

void PeriodicThread::terminate() {
    active = false;
}

//Semaphores
Semaphore::Semaphore(unsigned int init): myHandle(nullptr) {
    C_API::sem_open(&myHandle, init);
}

int Semaphore::wait() {
    return C_API::sem_wait(myHandle);
}

int Semaphore::signal() {
    return C_API::sem_signal(myHandle);
}

int Semaphore::timedWait(time_t timeout) {
    return C_API::sem_timedwait(myHandle, timeout);
}

int Semaphore::tryWait() {
    return C_API::sem_trywait(myHandle);
}

Semaphore::~Semaphore() {
    C_API::sem_close(myHandle);
}

//Console
char Console::getc() {
    return C_API::getc();
}

void Console::putc(char c) {
    C_API::putc(c);
}
