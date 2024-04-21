//
// Created by os on 4/21/24.
//

#ifndef RISCV_KERNEL_PRINTING_H
#define RISCV_KERNEL_PRINTING_H

#include "../lib/hw.h"
#include "../lib/console.h"

//'printType' - polymorphed funtion that print out base types impemented here
inline void printType(const char* str){
    while (*str != '\0'){
        __putc(*str);
        str++;
    }
    return;
}

inline void printType(int number){
    if(number==0){
        __putc('0');
        return;
    }

    if(number < 0){
        __putc('-');
    }

    int digits[20];
    int digitNum = 0;
    while(number > 0){
        digits[digitNum] = number%10;
        number/=10;
        digitNum++;
    }

    digitNum--;

    while(digitNum>-1){
        __putc((char)(48+digits[digitNum]));
        digitNum--;
    }
    return;
}

inline void printType(uint64 number){
    int digits[20];
    int digitNum = 0;
    while(number > 0){
        digits[digitNum] = number%10;
        number/=10;
        digitNum++;
    }

    digitNum--;

    while(digitNum>-1){
        __putc((char)(48+digits[digitNum]));
        digitNum--;
    }

    return;
}

//printf - implemented to work in the same way as printf from stdio.h

union Argument{
    const char* char_arr_arg;
    int int_arg;
    uint64 uint_arg;
    char char_arg;
};

//TODO handle if invalid number of arguments in a list is provided
inline void printf(const char* str, ...){
    union Argument* arg_ptr = (union Argument*)&str + 1;

    while(*str != '\0'){
        if(*str == '%'){
            str++;
            switch (*str) {
                case 'd': //decimal number - int
                    printType(arg_ptr->int_arg);
                    break;
                case 's': //string - const char*
                    printType(arg_ptr->char_arr_arg);
                    break;
                case 'c': //just char
                    printType(arg_ptr->char_arg);
                    break;
                case 'u': //unsigned number - uint64
                    printType(arg_ptr->uint_arg);
                    break;
                default:
                    //TODO Handle errors that can stem from wrong argument type
                    break;
            }
            arg_ptr++;
        }else{
            __putc(*str);
        }
        str++;
    }
}

#endif //RISCV_KERNEL_PRINTING_H
