.global _Z12ecallWrapperv
.global _ZN3PCB6setJmpEP11ThreadState
.global _ZN3PCB7longJmpEP11ThreadState
.global _ZN3PCB11threadStartEP11ThreadState

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

.type _ZN3PCB6setJmpEP11ThreadState, @function
_ZN3PCB6setJmpEP11ThreadState:
    sd a1,8(a0)
    sd a2,16(a0)
    sd a3,24(a0)
    sd a4,32(a0)
    sd a5,40(a0)
    sd a6,48(a0)
    sd a7,56(a0)
    sd s0,64(a0)
    sd s1,72(a0)
    sd s2,80(a0)
    sd s3,88(a0)
    sd s4,96(a0)
    sd s5,104(a0)
    sd s6,112(a0)
    sd s7,120(a0)
    sd s8,128(a0)
    sd s9,136(a0)
    sd s10,144(a0)
    sd s11,152(a0)
    sd sp,160(a0)
    sd ra,168(a0)
    sd t0,176(a0)
    li a0, 0
    ret

.type _ZN3PCB7longJmpEP11ThreadState, @function
_ZN3PCB7longJmpEP11ThreadState:
    ld a1,8(a0)
    ld a2,16(a0)
    ld a3,24(a0)
    ld a4,32(a0)
    ld a5,40(a0)
    ld a6,48(a0)
    ld a7,56(a0)
    ld s0,64(a0)
    ld s1,72(a0)
    ld s2,80(a0)
    ld s3,88(a0)
    ld s4,96(a0)
    ld s5,104(a0)
    ld s6,112(a0)
    ld s7,120(a0)
    ld s8,128(a0)
    ld s9,136(a0)
    ld s10,144(a0)
    ld s11,152(a0)
    ld sp,160(a0)
    ld ra,168(a0)
    li a0, 1
    jalr zero, ra

.type _ZN3PCB11threadStartEP11ThreadState, @function
_ZN3PCB11threadStartEP11ThreadState:
    ld a1,8(a0)
    ld a2,16(a0)
    ld a3,24(a0)
    ld a4,32(a0)
    ld a5,40(a0)
    ld a6,48(a0)
    ld a7,56(a0)
    ld s0,64(a0)
    ld s1,72(a0)
    ld s2,80(a0)
    ld s3,88(a0)
    ld s4,96(a0)
    ld s5,104(a0)
    ld s6,112(a0)
    ld s7,120(a0)
    ld s8,128(a0)
    ld s9,136(a0)
    ld s10,144(a0)
    ld s11,152(a0)
    ld sp,160(a0)
    ld ra,168(a0)
    ld t0,176(a0)
    ld a0,0(a0)
    jalr zero, t0