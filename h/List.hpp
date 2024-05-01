//
// Created by os on 4/26/24.
//

#ifndef RISCV_KERNEL_LIST_H
#define RISCV_KERNEL_LIST_H

#include "syscall_c.hpp"
#include "exception.hpp"

template <typename T>
class List;
template <typename T>
class Iterator;

template <typename T>
class Element{
public:
    Element(T data);
    ~Element(){}

    friend class List<T>;
    friend class Iterator<T>;
private:
    Element<T>* left;
    Element<T>* right;
    T data;
};

//TODO Implement linked list that has chunks of chunkSize elements, instead of just one element
template <typename T>
class List {
public:
    List();
    //TODO implement copy and move constructors
    List(List<T> &li) = delete;
    List(List<T> &&li) = delete;
    List(T data);
    ~List();

    Iterator<T> getIterator();

    void appendFront(T data);
    void appendBack(T data);
    void insert(T data, short index = 0);

    //FIXME All remove methods have no effect when count = 0
    void remove(short index);
    void removeFront();
    void removeBack();

    T next();
    T previous();

    T operator[](short index);
    inline T getFirstElement(){
        return listHead->data;
    }
    inline T getLastElement(){
        return listBack->data;
    }

    inline short getSize(){
        return count;
    }
    inline short getLastSelectedIndex(){
        return lastIndex;
    }
    inline T getLastSelectedElement(){
        return lastElem->data;
    }

private:
    void checkIndex(short  index);

    Element<T>* listHead;
    Element<T>* listBack;
    Element<T>* lastElem;

    short lastIndex; //index between 0 and 65634
    short count; //maximum of 65536 elements
};

#endif //RISCV_KERNEL_LIST_H
template <typename T>
class Iterator{
public:
    Iterator(Element<T>* beginning, short size);
    bool isFinnished();
    void operator++();
    T operator*();

private:
    Element<T>* temp;
    short elemIndex;
    short size;
};