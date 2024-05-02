//
// Created by os on 4/13/24.
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/sys_list.hpp"

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

void userMain(void*){
    printf("Ovo je main fja koja se izvrsila.");

//    thread_t t1;
//    int x = 10;
//    thread_create(&t1, &writeX, &x);
    return;
}

int main(){
    initializeSystem();

    thread_t mainThread;
    printSystemState(true, true, false);
    thread_create(&mainThread, &userMain, nullptr);
    printSystemState(true, true, false);
    thread_exit();
    stopEmulator();
    return 0;
}