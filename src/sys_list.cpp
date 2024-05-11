//
// Created by os on 5/2/24.
//

#include "../h/sys_list.hpp"
#include "../h/pcb.hpp"
#include "../h/riscv.hpp"


//SysIterator
template <typename T>
SysIterator<T>::SysIterator(SysListElement<T>* beginning, short size, bool inverse): temp(beginning), next(nullptr), size(size), elemIndex(0), inverse(inverse) {
    if(inverse){
        next = beginning->left;
    }else{
        next = beginning->right;
    }
}

template <typename T>
bool SysIterator<T>::hasElements() const {
    return (elemIndex != size && size != 0);
}

template <typename T>
void SysIterator<T>::operator++() {
    temp = next;
    if(inverse){
        next = temp->left;
    }else{
        next = temp->right;
    }
    elemIndex++;
}

template <typename T>
T SysIterator<T>::operator*() const {
    return temp->data;
}



//-- SysList --
template<typename T>
SysList<T>::~SysList(){
    if(count != 0){
        SysListElement<T>* prev;
        SysListElement<T>* temp = listHead;
        prev = temp;
        temp = temp->right;
        for (int i = 0; i < count; i++) {
            destructElement(prev);
            prev = temp;
            temp = temp->right;
        }
    }
}

//- SysList element static methods -
template<typename T>
SysListElement<T>* SysList<T>::constructElement(){
    size_t size = sizeof(SysListElement<T>);
    size += sizeof(size_t); //this is to account for metadata for size of allocated segment
    if(size < MEM_BLOCK_SIZE){ //recalculating size to be number of memory blocks, instead of bytes
        size = 1;
    }else{
        size = size/MEM_BLOCK_SIZE+1;
    }
    auto temp = (SysListElement<T>*)MemoryAllocator::mem_allocate(size);
    return temp;
}

template<typename T>
SysListElement<T>* SysList<T>::constructElement(T data){
    SysListElement<T>* temp = SysList<T>::constructElement();
    temp->data = data;
    return temp;
}

template<typename T>
void SysList<T>::destructElement(SysListElement<T>* ptr){
    MemoryAllocator::mem_free(ptr);
}

template<typename T>
void SysList<T>::appendFront(T data) {
    SysListElement<T>* temp = constructElement(data);
    if(count == 0){
        listHead = temp;
        listBack = temp;
        lastElem = temp;
    }

    temp->left = listBack;
    temp->right = listHead;
    listHead->left = temp;
    listBack->right = temp;
    listHead = temp;
    count++;
}

template<typename T>
void SysList<T>::appendBack(T data) {
    SysListElement<T>* temp = constructElement(data);
    if(count == 0){
        listHead = temp;
        listBack = temp;
        lastElem = temp;
    }
    temp->left = listBack;
    temp->right = listHead;
    listBack->right = temp;
    listHead->left = temp;
    listBack = temp;
    count++;
}

template<typename T>
void SysList<T>::insert(T data, short index){
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

    SysListElement<T>* temp = this->listHead;
    for (int i = 0; i < index; i++) {
        temp = temp->right;
    }

    SysListElement<T>* newElement = constructElement(data);

    newElement->left = temp;
    if(temp->right == listBack){
        listBack = newElement;
        listHead->left = newElement;
    }
    newElement->right = temp->right;
    count++;
}

template<typename T>
void SysList<T>::insertBeforeLast(T data){
    if( count < 2 || lastElem == nullptr){
        appendFront(data);
    }else{
        SysListElement<T>* temp = constructElement(data);
        temp->left = lastElem->left;
        lastElem->left->right = temp;
        temp->right = lastElem;
        lastElem->left = temp;
        count++;
        if(lastIndex == 0){
            lastIndex++;
            listHead = temp;
        }
    }
}

template<typename T>
void SysList<T>::removeFront(){
    if(count == 0) return;
    if(count == 1){
        destructElement(listHead);
        listHead = nullptr;
        listBack = nullptr;
        lastElem = nullptr;
    }else{
        SysListElement<T>* temp = listHead;
        temp->right->left = listBack;
        listHead = temp->right;
        destructElement(temp);
    }
    count--;
}

template<typename T>
void SysList<T>::removeBack(){
    if(count == 0) return;

    if(count == 1){
        destructElement(listHead);
        listHead = nullptr;
        listBack = nullptr;
        lastElem = nullptr;
    }else{
        SysListElement<T>* temp = listBack;
        temp->left->right = listHead;
        listBack = temp->left;
        destructElement(temp);
    }
    count--;
}

template<typename T>
T SysList<T>::removeLast(){
    if(count == 0) Exception("Empty SysList, can't remove last element");
    T tempData = lastElem->data;
    if(count == 1){
        lastIndex = 0;
        listHead = nullptr;
        listBack = nullptr;
        count = 0;
        destructElement(lastElem);
        lastElem = nullptr;
        return tempData;
    }

    if(count == 2) {
        lastIndex = 0;
        count = 1;
        listHead = lastElem->right;
        destructElement(lastElem);
        listBack = listHead;
        lastElem = listHead;
        return tempData;
    }

    SysListElement<T>* temp = lastElem;
    lastElem->left->right = lastElem->right;
    lastElem->right->left = lastElem->left;
    lastElem = lastElem->left;
    count--;
    (lastIndex == 0)? lastIndex=count - 1: lastIndex--;
    destructElement(temp);
    return tempData;
}

template<typename T>
T SysList<T>::previous() {
    if(count == 1){
        return listHead->data;
    }else{
        T data = lastElem->data;
        (lastIndex == 0)? lastIndex=count-1: lastIndex--;
        lastElem = lastElem->left;
        return data;
    }
}

template<typename T>
void SysList<T>::remove(T data) {
    int index = -1;
    SysListElement<T>* temp = listHead;
    for (int i = 0; i < count; i++) {
        if(temp->data == data){
            index = i;
            break;
        }
    }

    if(index == -1) Exception("SysListElement not in the list, can't remove");

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

template<typename T>
T SysList<T>::indexof(short index) {
    if(count == 0) Exception("SysList has 0 elements, can't get data of indexed element");
    if(index == 0) return listHead->data;
    if(index == count - 1) return listBack->data;

    checkIndex(index);

    SysListElement<T>* temp = this->listHead;
    for (int i = 0; i < index; i++) {
        temp = temp->right;
    }

    lastIndex = index;
    lastElem = temp;
    return temp->data;
}

template<typename T>
T SysList<T>::next() {
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

template class SysList<ThreadState*>;
template class SysIterator<ThreadState*>;

//template<typename T>
//SysList<T>::