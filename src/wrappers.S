.global _Z12ecallWrapperv

.align 4
.type _Z12ecallWrapperv, @function
_Z12ecallWrapperv:
#Finnish loading interruptStatus here, to have a legitemate value
    lb t0, _ZN5Riscv15interruptStatusE
    li t1, 1 #check if system is just waiting for timer interrupt
    beq t0, t1, justWaitingSoftware
    li t1, 2 #check if system is just waiting for hardware interrupt
    beq t0, t1, justWaitingHardware

    #save user context to stack
    addi sp, sp, -256
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _Z12ecallHandlerv

    # pop all registers from stack
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret
justWaitingSoftware:
    call _Z12timerHandlerv
    sret
justWaitingHardware:
    call _Z15hadrwareHandlerv
    sret