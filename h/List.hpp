//
// Created by os on 4/26/24.
//

#ifndef RISCV_KERNEL_LIST_H
#define RISCV_KERNEL_LIST_H

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

    Iterator<T> getIterator() const;

    void appendFront(T data);
    void appendBack(T data);
    void insert(T data, short index = 0);

    void remove(short index);
    void removeFront();
    void removeBack();

    T next();
    T previous();

    T operator[](short index);
    inline T getFirstElement() const{
        return listHead->data;
    }
    inline T getLastElement() const{
        return listBack->data;
    }

    inline short getSize() const{
        return count;
    }
    inline short getLastSelectedIndex() const{
        return lastIndex;
    }
    inline T getLastSelectedElement() const {
        return lastElem->data;
    }

private:
    void checkIndex(short  index) const;

    Element<T>* listHead;
    Element<T>* listBack;
    Element<T>* lastElem;

    short lastIndex; //index between 0 and 65634
    short count; //maximum of 65536 elements
};

template <typename T>
class Iterator{
public:
    Iterator(Element<T>* beginning, short size);
    bool hasElements() const;
    void operator++();
    T operator*() const;

private:
    Element<T>* temp;
    short elemIndex;
    short size;
};

#endif //RISCV_KERNEL_LIST_H