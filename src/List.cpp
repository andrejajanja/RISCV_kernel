//
// Created by os on 4/26/24.
//

#include "../h/List.hpp"
#include "../h/exception.hpp"
#include "../h/printing.hpp"

//-- Element class definition --
template <typename T>
Element<T>::Element(T data): left(nullptr), right(nullptr), data(data) {}

//-- List class definition --
//private methods
template <typename T>
void List<T>::checkIndex(short index) const {
    if(count == 0) Exception("List is empty, thus no element can be accessed");
    if(index < 0 || index > this->count)
        Exception("List index out of range");
}

//TODO implement empty list creation
template <typename T>
List<T>::List(): listHead(nullptr), listBack(nullptr), lastElem(nullptr), lastIndex(0), count(0) {}

//public methods
template <typename T>
List<T>::List(T data): listHead(nullptr), listBack(nullptr), lastElem(nullptr), lastIndex(0), count(1) {
    Element<T>* temp = new Element<T>(data);
    temp->left = temp;
    temp->right = temp;
    listHead = temp;
    listBack = temp;
}

template <typename T>
List<T>::~List(){
    Element<T>* prev;
    Element<T>* temp = listHead;
    prev = temp;
    temp = temp->right;
    for (int i = 0; i < count; i++) {
        delete prev;
        prev = temp;
        temp = temp->right;
    }
}

template <typename T>
Iterator<T> List<T>::getIterator() const{
    return Iterator<T>(this->listHead, this->count);
}

template <typename T>
void List<T>::appendFront(T data) {
    Element<T>* temp = new Element<T>(data);
    temp->left = listBack;
    temp->right = listHead;
    if(listHead) listHead->left = temp;
    listHead = temp;
    count++;
}

template <typename T>
void List<T>::appendBack(T data) {
    Element<T>* temp = new Element<T>(data);
    temp->left = listBack;
    temp->right = listHead;
    if(listBack) listBack->right = temp;
    listBack = temp;
    count++;
}

//TODO optimize - insert
template <typename T>
void List<T>::insert(T data, short index){
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

    Element<T>* newElement = new Element<T>(data);

    newElement->left = temp;
    if(temp->right == listBack){
        listBack = newElement;
        listHead->left = newElement;
    }
    newElement->right = temp->right;
    count++;
}

//TODO optimize - remove
template <typename T>
void List<T>::remove(short index){
    if(index == 0){
        removeFront();
        return;
    }
    if(index == count - 1){
        removeBack();
        return;
    }

    checkIndex(index);

    if(count > 1){
        Element<T>* temp = this->listHead;
        for (int i = 0; i < index; i++) {
            temp = temp->right;
        }
        temp->left->right = temp->right;
        temp->right->left = temp->left;
        delete temp;
        count--;
    }
}

template <typename T>
void List<T>::removeFront(){
    if(count == 0) Exception("Can't remove element from an empty list.");

    if(count == 1){
        delete listHead;
        listHead = nullptr;
        listBack = nullptr;
    }else{
        Element<T>* temp = listHead;
        temp->right->left = listBack;
        listHead = temp->right;
        delete temp;
    }
    count--;
}

template <typename T>
void List<T>::removeBack(){
    if(count == 0) Exception("Can't remove element from an empty list.");

    if(count == 1){
        delete listHead;
        listHead = nullptr;
        listBack = nullptr;
    }else{
        Element<T>* temp = listBack;
        temp->left->right = listHead;
        listBack = temp->left;
        delete temp;
    }
    count--;
}

template <typename T>
T List<T>::next() {
    if(count == 0) Exception("No next element in empty list");
    if(count == 1){
        return listHead->data;
    }else{
        lastElem = lastElem->right;
        T data = lastElem->data;
        (lastIndex == count-1)? lastIndex=0: lastIndex++;

        return data;
    }
}

template <typename T>
T List<T>::previous(){
    if(count == 0) Exception("No previous element in empty list");
    if(count == 1){
        return listHead->data;
    }else{
        T data = lastElem->data;
        (lastIndex == 0)? lastIndex=count-1: lastIndex--;
        lastElem = lastElem->left;
        return data;
    }
}

//TODO optimize - index
template <typename T>
T List<T>::operator[](short index){
    if(count == 0) Exception("Empty list can't be indexed");

    if(index == 0){
        return listHead->data;
    }
    if(index == count - 1){
        return listBack->data;
    }

    checkIndex(index);

    Element<T>* temp = this->listHead;
    for (int i = 0; i < index; i++) {
        temp = temp->right;
    }

    lastIndex = index;
    lastElem = temp;
    return temp->data;
}

template <typename T>
Iterator<T>::Iterator(Element<T>* beginning, short size): temp(beginning), elemIndex(0), size(size) {}

template <typename T>
bool Iterator<T>::hasElements() const {
    return !(elemIndex == size);
}

template <typename T>
void Iterator<T>::operator++() {
    temp = temp->right;
    elemIndex++;
}

template <typename T>
T Iterator<T>::operator*() const {
    return temp->data;
}

/*Explicitlly telling compiler to generate constructors and function
definitins for these values of T template parameter*/

//List class
template class List<int>;
template class List<size_t>;
template class List<short>;
template class List<char>;
template class List<const char*>;

//SysIterator class
template class Iterator<int>;
template class Iterator<size_t>;
template class Iterator<short>;
template class Iterator<char>;
template class Iterator<const char*>;
