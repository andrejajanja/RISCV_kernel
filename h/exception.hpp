//
// Created by os on 4/24/24.
//

#ifndef RISCV_KERNEL_EXCEPTION_H
#define RISCV_KERNEL_EXCEPTION_H


class Exception {
public:
    Exception(const char* message): msg(message) {
        asm("mv a1, %0;"
            "li a0, 0x50;"
            "ecall;": : "r"(this->msg));
    }
private:
    const char* msg;
};


#endif //RISCV_KERNEL_EXCEPTION_H
