#ifndef SYSCALL_C_HPP
#define SYSCALL_C_HPP
#include "../lib/hw.h"

struct ThreadState;
typedef ThreadState* thread_t;
struct SemState;
typedef SemState* sem_t;

 //memory allocator
    void* mem_alloc(uint64 size);
    int mem_free(void* pointer);

//threading
    int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg);
    int thread_exit();
    int thread_dispatch();
    int time_sleep(time_t duration);
    int getCurrentThreadId();

//semaphores
    int sem_open(sem_t* handle, unsigned init);
    int sem_close(sem_t handle);
    int sem_wait(sem_t id);
    int sem_signal(sem_t id);
    int sem_timedwait(sem_t id, time_t timeout);
    int sem_trywait(sem_t id);

//console
    char getc();
    void putc(char);

//-- aux sys calls --
//Threads
    int construct_ts(thread_t* handle, void(*start_routine)(void*), void* arg);
    void destruct_ts(thread_t handle);
    int start_thread(thread_t handle);

#endif