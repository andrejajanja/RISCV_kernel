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
    Iterator(Element<T>* beginning, short size);

    bool hasElements() const {
        return elemIndex != size;
    }
    inline void operator++() {
        temp = temp->right;
        elemIndex++;
    }

    inline T operator*() const {
        return temp->data;
    }
private:
    Element<T>* temp;
    short elemIndex;
    short size;
};

template<typename T>
class SysList{
public:
    SysList(): listHead(nullptr), listBack(nullptr), lastElem(nullptr), lastIndex(0), count(0) {}

    ~SysList(){
        Element<T>* prev;
        Element<T>* temp = listHead;
        prev = temp;
        temp = temp->right;
        for (int i = 0; i < count; i++) {
            destructElement(prev);
            prev = temp;
            temp = temp->right;
        }
    }

    inline void appendFront(T data) {
        Element<T>* temp = constructElement(data);
        if(count == 0){
            listHead = temp;
            listBack = temp;
        }

        temp->left = listBack;
        temp->right = listHead;
        if(listHead) listHead->left = temp;
        listHead = temp;
        count++;
    }

    inline void appendBack(T data) {
        Element<T>* temp = constructElement(data);
        if(count == 0){
            listHead = temp;
            listBack = temp;
        }

        temp->left = listBack;
        temp->right = listHead;
        if(listBack) listBack->right = temp;
        listBack = temp;
        count++;
    }

    inline void insert(T data, short index){
        //optimizations
        if(index == 0 || count == 0){
            appendFront(data);
            return;
        }
        if(index == count - 1){
            appendBack(data);
            return;
        }

        checkIndex(index);

        Element<T>* temp = this->listHead;
        for (int i = 0; i < index; i++) {
            temp = temp->right;
        }

        Element<T>* newElement = constructElement(data);

        newElement->left = temp;
        if(temp->right == listBack){
            listBack = newElement;
            listHead->left = newElement;
        }
        newElement->right = temp->right;
        count++;
    }

    inline void insertBeforeLast(T data){
        if( count < 2){
            appendFront(data);
        }else{
            Element<T>* temp = constructElement(data);
            temp->left = lastElem->left;
            temp->right = lastElem;
            lastElem->left->right = temp;
            lastElem->left = temp;
            if(lastIndex == 0){
                lastIndex++;
                listHead = temp;
            }
        }
    }

    inline void removeFront(){
        if(count == 0) return;

        if(count == 1){
            delete listHead;
            listHead = nullptr;
            listBack = nullptr;
        }else{
            Element<T>* temp = listHead;
            temp->right->left = listBack;
            listHead = temp->right;
            destructElement(temp);
        }
        count--;
    }

    inline void removeBack(){
        if(count == 0) return;

        if(count == 1){
            delete listHead;
            listHead = nullptr;
            listBack = nullptr;
        }else{
            Element<T>* temp = listBack;
            temp->left->right = listHead;
            listBack = temp->left;
            destructElement(temp);
        }
        count--;
    }

    inline T next() {
        if(count == 0){
            Exception("Empty SysList has no next element");
        }
        if(count == 1){
            return listHead->data;
        }else{
            lastElem = lastElem->right;
            (lastIndex == count-1)? lastIndex=0: lastIndex++;
            T data = lastElem->data;
            return data;
        }
    }

    inline T removeLast(){
        if(count == 0) Exception("Empty SysList, can't remove last element");
        T tempData = lastElem->data;
        if(count == 1){
            lastIndex = 0;
            listHead = nullptr;
            listBack = nullptr;
            count = 0;
            destructElement(lastElem);
            lastElem = nullptr;
        }else{
            Element<T>* temp = lastElem;
            lastElem->left->right = lastElem->right;
            lastElem->right->left = lastElem->left;
            lastElem = lastElem->left;
            count--;
            (lastIndex == 0)? lastIndex=count - 1: lastIndex--;
            destructElement(temp);
        }
        return tempData;
    }

    inline T previous(){
        if(count == 1){
            return listHead->data;
        }else{
            T data = lastElem->data;
            (lastIndex == 0)? lastIndex=count-1: lastIndex--;
            lastElem = lastElem->left;
            return data;
        }
    }

    inline T indexof(short index){
        if(count == 0) Exception("SysList has 0 elements, can't get data of indexed element");
        if(index == 0) return listHead->data;
        if(index == count - 1) return listBack->data;

        checkIndex(index);

        Element<T>* temp = this->listHead;
        for (int i = 0; i < index; i++) {
            temp = temp->right;
        }

        lastIndex = index;
        lastElem = temp;
        return temp->data;
    }

    inline Iterator<T> getIterator() const{
        return Iterator<T>(this->listHead, this->count);
    }

    inline void remove(T data){
        int index = -1;
        Element<T>* temp = listHead;
        for (int i = 0; i < count; i++) {
            if(temp->data == data){
                index = i;
                break;
            }
        }

        //FIXME fix this shit in remove
        if(index == -1){
            return;
        }

        if(index == 0){
            removeFront();
            return;
        }
        if(index == count - 1){
            removeBack();
            return;
        }

        if(count > 1){
            temp->left->right = temp->right;
            temp->right->left = temp->left;
            destructElement(temp);
            count--;
        }
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