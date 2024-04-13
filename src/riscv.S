.extern _ZN5Riscv16stvecVectorTableEv

#-- Vector table for all types of interrupts --

.align 4
.global _ZN5Riscv16stvecVectorTableEv
.type _ZN5Riscv16stvecVectorTableEv, @function
_ZN5Riscv16stvecVectorTableEv:
    j _ZN5Riscv14supervisorTrapEV
    j timerInterruptHandler
    .skip 28
    j consoleHandler
    sret

timerInterruptHandler:
    #save execution context on current stack
    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr

    call _ZN5Riscv21timerInterruptHandlerEv

    #restore context from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    addi sp, sp, 256

    sret

consoleHandler:
    #save execution context on current stack
    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr

    call _ZN5Riscv16consoleHandlerEv

    #restore context from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    addi sp, sp, 256

    sret

#-- implementation for supervisorTrap
.align 4
.global _ZN5Riscv14supervisorTrapEV
.type _ZN5Riscv14supervisorTrapEV, @function
_ZN5Riscv14supervisorTrapEV:
    #save execution context on current stack
    addi sp, sp, -256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr

    call _ZN5Riscv20handleSupervisorTrapEv

    #restore context from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    addi sp, sp, 256

    sret
