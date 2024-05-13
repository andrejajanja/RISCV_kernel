//
// Created by os on 5/11/24.
//

#ifndef RISCV_KERNEL_CONSOLE_H
#define RISCV_KERNEL_CONSOLE_H

const int EOF = -1;

class SysConsole {
public:
    static bool initialized;
    static char status;
    static bool readSent;
    static char arr[];

    static void initialize();
    static void putc(char chr);
    static char getc();
};


#endif //RISCV_KERNEL_CONSOLE_H
