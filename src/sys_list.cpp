//
// Created by os on 5/2/24.
//

#include "../h/sys_list.hpp"
#include "../h/pcb.hpp"

template<typename T>
SysList<T>::~SysList(){
    if(count != 0){
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
}

template<typename T>
void SysList<T>::appendFront(T data) {
    Element<T>* temp = constructElement(data);
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
    Element<T>* temp = constructElement(data);
    if(count == 0){
        listHead = temp;
        listHead = temp;
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

template<typename T>
void SysList<T>::insertBeforeLast(T data){
    if( count < 2){
        appendFront(data);
    }else{
        Element<T>* temp = constructElement(data);
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

template<typename T>
void SysList<T>::removeBack(){
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

    Element<T>* temp = lastElem;
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
    Element<T>* temp = listHead;
    for (int i = 0; i < count; i++) {
        if(temp->data == data){
            index = i;
            break;
        }
    }

    if(index == -1) Exception("Element not in the list, can't remove");

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

    Element<T>* temp = this->listHead;
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
template class Iterator<ThreadState*>;

//template<typename T>
//SysList<T>::