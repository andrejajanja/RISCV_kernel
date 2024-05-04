.global _Z12ecallWrapperv
.global _ZN3PCB7longJmpEP11ThreadState

.align 4
.type _Z12ecallWrapperv, @function
_Z12ecallWrapperv:
    #save context to stack
    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    call _Z12ecallHandlerv

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    sret

.type _ZN3PCB7longJmpEP11ThreadState, @function
_ZN3PCB7longJmpEP11ThreadState:
    ld a1,24(a0)
    ld a2,32(a0)
    ld a3,40(a0)
    ld a4,48(a0)
    ld a5,56(a0)
    ld a6,64(a0)
    ld a7,72(a0)
    ld s0,80(a0)
    ld s1,88(a0)
    ld s2,96(a0)
    ld s3,104(a0)
    ld s4,112(a0)
    ld s5,120(a0)
    ld s6,128(a0)
    ld s7,136(a0)
    ld s8,144(a0)
    ld s9,152(a0)
    ld s10,160(a0)
    ld s11,168(a0)
    ld t0,176(a0)
    ld t1,184(a0)
    ld t2,192(a0)
    ld t3,200(a0)
    ld t4,208(a0)
    ld t5,216(a0)
    ld t6,224(a0)
    ld sp,232(a0)
    ld ra,240(a0)
    ld t0,248(a0)
    ld a0,16(a0)
    jalr x0, t0, 0