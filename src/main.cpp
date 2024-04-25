//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/mem.hpp"
#include "../h/syscall_c.hpp"
#include "../h/printing.hpp"
#include "../h/exception.hpp"


class Tacka{
public:
    Tacka(int x, int y){
        this->x = x;
        this->y = y;
    }
    void pt(){}

private:
    int x,y;
};

void userMain(){
    printSystemState(true);
    Tacka* t1 = new Tacka(5,6);
    Tacka* t2 = new Tacka(5,6);
    Tacka* t3 = new Tacka(5,6);
    delete t2;
    delete t3;
    delete t1;
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