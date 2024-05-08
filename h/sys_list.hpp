//
// Created by os on 5/2/24.
//

#ifndef RISCV_KERNEL_SYS_LIST_H
#define RISCV_KERNEL_SYS_LIST_H

#include "mem.hpp"
#include "exception.hpp"

template<typename T>
struct Element{
    T data;
    Element* left;
    Element* right;
};

template<typename T>
Element<T>* constructElement(){
    size_t size = sizeof(Element<T>);
    size += sizeof(size_t); //this is to account for metadata for size of allocated segment
    if(size < MEM_BLOCK_SIZE){ //recalculating size to be number of memory blocks, instead of bytes
        size = 1;
    }else{
        size = size/MEM_BLOCK_SIZE+1;
    }
    auto temp = (Element<T>*)MemoryAllocator::mem_allocate(size);
    return temp;
}

template<typename T>
Element<T>* constructElement(T data){
    Element<T>* temp = constructElement<T>();
    temp->data = data;
    return temp;
}

template<typename T>
void destructElement(Element<T>* ptr){
    MemoryAllocator::mem_free(ptr);
}

template <typename T>
class Iterator{
public:
    Iterator(Element<T>* beginning, short size): temp(beginning), next(beginning->right), size(size), elemIndex(0) {}

    bool hasElements() const {
        return (elemIndex != size && size != 0);
    }

    inline void operator++() {
        //printf("ITERATOR: i = %u, lenght = %u\n")
        temp = next;
        next = temp->right;
        elemIndex++;
    }

    inline T operator*() const {
        return temp->data;
    }
private:
    Element<T>* temp;
    Element<T>* next;
    uint16 size;
    uint16 elemIndex;
};

template<typename T>
class SysList{
public:
    SysList(): listHead(nullptr), listBack(nullptr), lastElem(nullptr), lastIndex(0), count(0) {}

    ~SysList();

    void appendFront(T data);
    void appendBack(T data);

    void insert(T data, short index);
    void insertBeforeLast(T data);

    void remove(T data);
    void removeFront();
    void removeBack();
    T removeLast();

    T next();
    T previous();

    T indexof(short index);

    inline Iterator<T> getIterator() const{
        return Iterator<T>(this->listHead, this->count);
    }

    inline short getCount() const{
        return count;
    }

private:
    inline void checkIndex(short  index) const{
        if(count == 0) Exception("List is empty, thus no element can be accessed");
        if(index < 0 || index > this->count) Exception("List index out of range");
    }

    Element<T>* listHead;
    Element<T>* listBack;
    Element<T>* lastElem;

    short lastIndex; //index between 0 and 65634
    short count; //maximum of 65536 elements
};

#endif //RISCV_KERNEL_SYS_LIST_H