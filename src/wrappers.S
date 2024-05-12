.global _Z12ecallWrapperv
.global _ZN3PCB6setJmpEP11ThreadState
.global _ZN3PCB7longJmpEP11ThreadState
.global _ZN3PCB11threadStartEP11ThreadState
.global _ZN3PCB21threadCompleteSysCallEv
.global _ZN5Riscv16waitForNextTimerEv
.global _ZN5Riscv16switchToUserModeEv
.global _ZN5Riscv17switchToUserModeHEv
.global _ZN5Riscv24waitForHardwareInterruptEv
.global doneWaitingForHardware
.global _ZN5Riscv12stopEmulatorEv

.align 4
.type _Z12ecallWrapperv, @function
_Z12ecallWrapperv:
    li t0, 76 #check if system was just waiting for hardware interrupt
    beq a7, t0, just_hardware_interrupt
    li t0, 77 #check if system was just waiting for timer interrupt
    beq a7, t0, just_timer_interrupt

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
just_timer_interrupt:
    call _Z12timerHandlerv
just_hardware_interrupt:
    call _Z15hadrwareHandlerv

.type _ZN5Riscv12stopEmulatorEv, @function
_ZN5Riscv12stopEmulatorEv:
    la t0, 0x100000
    la t1, 0x5555
    sw t1, 0(t0)

.type _ZN3PCB6setJmpEP11ThreadState, @function
_ZN3PCB6setJmpEP11ThreadState:
    #storing user context
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
    #storing system context
    csrr t0, sepc
    sd t0,184(a0)
    csrr t0,sstatus
    ld t0,192(a0)
    csrr t0,scause
    ld t0, 200(a0)
    #setting setjmp return value
    li a0, 0
    ret

.type _ZN3PCB7longJmpEP11ThreadState, @function
_ZN3PCB7longJmpEP11ThreadState:
    #restoring user context
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
    #restoring system context
    ld t1,184(a0)
    csrw sepc,t1
    ld t1,192(a0)
    csrw sstatus,t1
    ld t1, 200(a0)
    csrw scause,t1
    #setting longjmp return value
    li a0, 1
    jalr zero, ra

.type _ZN3PCB11threadStartEP11ThreadState, @function
_ZN3PCB11threadStartEP11ThreadState:
    #initializing context to 0
    li a1,0
    li a2,0
    li a3,0
    li a4,0
    li a5,0
    li a6,0
    li a7,0
    li s0,0
    li s1,0
    li s2,0
    li s3,0
    li s4,0
    li s5,0
    li s6,0
    li s7,0
    li s8,0
    li s9,0
    li s10,0
    li s11,0
    #writing to sp, ra
    ld sp,160(a0)
    ld ra,168(a0)
    ld t0,176(a0) #writing pc for function start
    ld a0,0(a0) #loading thread function argument void* arg
    #jumping to thread function
    jalr zero, t0

.type _ZN3PCB21threadCompleteSysCallEv, @function
_ZN3PCB21threadCompleteSysCallEv:
    li a0, 0x12
    ecall

.type _ZN5Riscv16waitForNextTimerEv, @function
_ZN5Riscv16waitForNextTimerEv:
#TODO make it so the value of a7 is stored on stack somehow, like in hardwareWait
    li a7, 77
    call _ZN5Riscv16switchToUserModeEv
    j _ZN5Riscv16waitForNextTimerEv+8

.type _ZN5Riscv16switchToUserModeEv, @function
_ZN5Riscv16switchToUserModeEv:
    li t0, 0
    csrw sstatus, t0
    csrw sip, t0 #SIP = 0 for marking software interrupt resolved
    li t0, 514
    csrw sie, t0 #SIE = 2 for allowing only software interrupts
    mv t0, ra
    csrw sepc, t0
    sret

.type _ZN5Riscv17switchToUserModeHEv, @function
_ZN5Riscv17switchToUserModeHEv:
    li t0, 0
    csrw sstatus, t0
    csrw sip, t0 #SIP = 0 for marking software interrupt resolved
    li t0, 512
    csrw sie, t0 #SIE = 512 for allowing only hardware interrupts
    mv t0, ra
    csrw sepc, t0
    sret

.type _ZN5Riscv24waitForHardwareInterruptEv, @function
_ZN5Riscv24waitForHardwareInterruptEv:
    #put all registers on stack
    addi sp, sp, -256
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    li a7, 76

    call _ZN5Riscv17switchToUserModeHEv
L:  j L
doneWaitingForHardware:
    addi sp, sp, 32 #return stack to pre-hardwareHandler state

    csrr t0, sie
    addi t0, t0, 2
    csrw sie, t0
    # pop all registers from stack
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    ret