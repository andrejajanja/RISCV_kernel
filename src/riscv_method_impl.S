.global _ZN5Riscv16waitForNextTimerEv
.global _ZN5Riscv16switchToUserModeEv
.global _ZN5Riscv17switchToUserModeHEv
.global _ZN5Riscv24waitForHardwareInterruptEm
.global doneWaitingForHardware
.global _ZN5Riscv12stopEmulatorEv
.global _ZN5Riscv7setModeEh

.type _ZN5Riscv7setModeEh, @function
_ZN5Riscv7setModeEh:
    li t0, 1
    beq a0, t0, case1SetMode
    li t0, 2
    beq a0, t0, case2SetMode
    li t0, 3
    beq a0, t0, case3SetMode
    ret
case1SetMode:
    li t0, 2
    j endSetMode
case2SetMode:
    li t0, 512
    j endSetMode
case3SetMode:
    li t0, 514
    j endSetMode
endSetMode:
    csrw sie, t0
    ret

.type _ZN5Riscv12stopEmulatorEv, @function
_ZN5Riscv12stopEmulatorEv:
    la t0, 0x100000
    la t1, 0x5555
    sw t1, 0(t0)

.type _ZN5Riscv16waitForNextTimerEv, @function
_ZN5Riscv16waitForNextTimerEv:
    li a7, 77
    call _ZN5Riscv15waitingSoftwareEv
    j _ZN5Riscv16waitForNextTimerEv+8

.type _ZN5Riscv16switchToUserModeEv, @function
_ZN5Riscv16switchToUserModeEv:
    li t0, 0
    csrw sstatus, t0
    csrw sip, t0 #SIP = 0 for marking software interrupt resolved
    li t0, 514
    csrw sie, t0 #SIE = 1000000010 for allowing software and hardware interrupts
    mv t0, ra
    csrw sepc, t0
    sret

.type _ZN5Riscv17switchToUserModeHEv, @function
_ZN5Riscv15waitingHardwareEv:
    li t0, 0
    csrw sstatus, t0
    csrw sip, t0 #SIP = 0 for marking software interrupt resolved
    li t0, 512
    csrw sie, t0 #SIE = 512 for allowing only hardware interrupts
    mv t0, ra
    csrw sepc, t0
    sret

_ZN5Riscv15waitingSoftwareEv:
    li t0, 0
    csrw sstatus, t0
    csrw sip, t0 #SIP = 0 for marking software interrupt resolved
    li t0, 2
    csrw sie, t0 #SIE = 2 for allowing only software interrupts
    mv t0, ra
    csrw sepc, t0
    sret

.type _ZN5Riscv24waitForHardwareInterruptEm, @function
_ZN5Riscv24waitForHardwareInterruptEm:
    #put all registers on stack
    addi sp, sp, -256
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr

    li a7, 76

    call _ZN5Riscv15waitingHardwareEv
L:  j L
doneWaitingForHardware:
    addi sp, sp, 48 #return stack to pre-hardwareHandler state
    # pop all registers from stack
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    li t0, 20
    bne a0,t0, skipSieChange
    li t0, 514
    csrw sie, t0
skipSieChange:    ret