//
// Created by os on 5/2/24.
//

#ifndef RISCV_KERNEL_SYS_LIST_H
#define RISCV_KERNEL_SYS_LIST_H

#include "mem.hpp"
#include "exception.hpp"

template<typename T>
struct SysListElement{
    T data;
    SysListElement* left;
    SysListElement* right;
};

template <typename T>
class SysIterator{
public:
    SysIterator(SysListElement<T>* beginning, short size, bool inverse);

    bool hasElements() const;
    void operator++();
    T operator*() const;
private:
    SysListElement<T>* temp;
    SysListElement<T>* next;
    uint16 size;
    uint16 elemIndex;
    bool inverse;
};

template<typename T>
class SysList{
public:
    SysList(): listHead(nullptr), listBack(nullptr), lastElem(nullptr), lastIndex(0), count(0) {}

    ~SysList();

    //SysListElement static methods
    static SysListElement<T> * constructElement();
    static  SysListElement<T>* constructElement(T data);
    static void destructElement(SysListElement<T>* ptr);

    void appendFront(T data);
    void appendBack(T data);

    void insert(T data, short index);
    void insertBeforeLast(T data);

    void remove(T data);
    T removeFront();
    T removeBack();
    T removeLast();

    T next();
    T previous();

    T indexof(short index);

    inline SysIterator<T> getIterator(bool inverse = false) const{
        if(inverse){
            return SysIterator<T>(this->listBack, this->count, inverse);
        }else{
            return SysIterator<T>(this->listHead, this->count, inverse);
        }
    }

    inline short getCount() const{
        return count;
    }

//private:
    inline void checkIndex(short  index) const{
        if(count == 0) Exception("List is empty, thus no element can be accessed");
        if(index < 0 || index > this->count) Exception("List index out of range");
    }

    SysListElement<T>* listHead;
    SysListElement<T>* listBack;
    SysListElement<T>* lastElem;

    short lastIndex; //index between 0 and 65634
    short count; //maximum of 65536 elements
};

#endif //RISCV_KERNEL_SYS_LIST_H