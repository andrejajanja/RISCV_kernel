//
// Created by os on 4/21/24.
//

#ifndef RISCV_KERNEL_PRINTING_H
#define RISCV_KERNEL_PRINTING_H

#include "../lib/hw.h"
#include "../lib/console.h"

//'printType' - polymorphed funtion that print out base types impemented here
void printType(const char* str);

void printType(int number);

void printType(uint64 number);

//printf - implemented to work in the same way as printf from stdio.h

void printf(const char* str, ...);

#endif //RISCV_KERNEL_PRINTING_H
