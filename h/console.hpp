//
// Created by os on 5/11/24.
//

#ifndef RISCV_KERNEL_CONSOLE_H
#define RISCV_KERNEL_CONSOLE_H
#include "../lib/hw.h"

const int EOF = -1;

class SysConsole {
public:
    static size_t vrednost;
    static char status;
    static char arr[];

    static void initialize();
    static void putc(char chr);
    static char getc();
};


#endif //RISCV_KERNEL_CONSOLE_H
