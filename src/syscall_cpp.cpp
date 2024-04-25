//
// Created by os on 4/24/24.
//

#include "../h/syscall_cpp.hpp"

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

