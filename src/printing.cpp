//
// Created by os on 4/23/24.
//


//
// Created by os on 4/21/24.
//
#include "../h/printing.hpp"
#include "../h/riscv.hpp"

//'printType' - polymorphed funtion that print out base types impemented here
void printType(const char* str){
    while (*str != '\0'){
        __putc(*str);
        str++;
    }
    return;
}

void printType(int number){
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

void printType(uint64 number){
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
void printf(const char* str, ...){
    //... are registers a1 to a7
    uint8 arg_cnt = 0;
    //FIXME find a way to put all these arguments on the stack, insted of like this, it looks ugly.
    uint64 arg_val[7] = {readA1(),readA2(),readA3(),readA4(),readA5(),readA6(),readA7()};
    while(*str != '\0'){
        if(*str == '%'){
            if(arg_cnt == 7){
                printType("PRINTF ERROR: too many formaters provided for printf");
                stopEmulator();
            }
            str++;
            switch (*str) {
                case 'd': //decimal number - int
                    printType((int)arg_val[arg_cnt]);
                    break;
                case 's': //string - const char*
                    printType((const char*)arg_val[arg_cnt]);
                    break;
                case 'c': //just char
                    printType((char)arg_val[arg_cnt]);
                    break;
                case 'u': //unsigned number - uint64
                    printType(arg_val[arg_cnt]);
                    break;
                default:
                    printType("\nPRINTF ERROR: invalid formating letter in printf.\n");
                    stopEmulator();
            }
            arg_cnt++;
        }else{
            __putc(*str);
        }
        str++;
    }
}
