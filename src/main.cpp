//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/mem.hpp"
//#include "../h/syscall_c.hpp"
#include "../h/List.hpp"

//class Tacka{
//private:
//    int x, y;
//public:
//    Tacka(int x, int y): x(x), y(y){}
//    void print(){
//        printf("Tacka: (%d, %d)\n", x, y);
//    }
//};
//
//void writeX(void* x){
//    *((int*)(x)) = 10;
//}

void userMain(){
    List<int>* li = new List<int>(10);
    li->appendBack(20);
    li->appendBack(30);
    li->appendBack(40);

    for(auto iter = li->getIterator(); iter.hasElements(); ++iter){
        printf("%d, ", *iter);
    }

    delete li;

//    thread_t t1;
//    int x = 10;
//    thread_create(&t1, &writeX, &x);

    return;
}

int main(){
    //initialize system data structures and register values
    initializeSystemRegisters();
    MemoryAllocator::initialize();

    userMain();

    stopEmulator();
    return 0;
}