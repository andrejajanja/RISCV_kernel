#include "buffer.hpp"
#include "../h/exception.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    sem_open(&itemAvailable, 0);
    sem_open(&spaceAvailable, _cap);
    sem_open(&mutexHead, 1);
    sem_open(&mutexTail, 1);
}

Buffer::~Buffer() {
    putc('\n');
    printString("Buffer deleted!\n");
    while (getCnt() > 0) {
        char ch = buffer[head];
        putc(ch);
        head = (head + 1) % cap;
    }
    putc('!');
    putc('\n');

    mem_free(buffer);
    sem_close(itemAvailable);
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    if(itemAvailable == nullptr){
        new Exception("Buffer::put(int val) - itemAvailable is nullptr");
    }
    if(mutexTail == nullptr){
        new Exception("Buffer::put(int val) - mutexTail is nullptr");
    }

    sem_wait(spaceAvailable);
    sem_wait(mutexTail);
    buffer[tail] = val;
    tail = (tail + 1) % cap;
    if(itemAvailable == nullptr){
        new Exception("Buffer::put(int val) - itemAvailable is nullptr");
    }
    if(mutexTail == nullptr){
        new Exception("Buffer::put(int val) - mutexTail is nullptr");
    }
    sem_signal(mutexTail);

    sem_signal(itemAvailable);
}

int Buffer::get() {
    if(itemAvailable == nullptr){
        new Exception("Buffer::get() - itemAvailable is nullptr");
    }
    if(spaceAvailable == nullptr){
        new Exception("Buffer::get() - itemAvailable is nullptr");
    }

    sem_wait(itemAvailable);
    sem_wait(mutexHead);
    int ret = buffer[head];
    head = (head + 1) % cap;
    if(itemAvailable == nullptr){
        new Exception("Buffer::get() - itemAvailable is nullptr");
    }
    if(spaceAvailable == nullptr){
        new Exception("Buffer::get() - itemAvailable is nullptr");
    }
    sem_signal(mutexHead);
    sem_signal(spaceAvailable);
    return ret;
}

int Buffer::getCnt() {
    int ret;

    sem_wait(mutexHead);
    sem_wait(mutexTail);

    if (tail >= head) {
        ret = tail - head;
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    sem_signal(mutexHead);

    return ret;
}
