
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	3c813103          	ld	sp,968(sp) # 800043c8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	350010ef          	jal	ra,8000136c <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_Z12ecallWrapperv>:

.align 4
.type _Z12ecallWrapperv, @function
_Z12ecallWrapperv:
    #save context to stack
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04a13823          	sd	a0,80(sp)
    80001030:	04b13c23          	sd	a1,88(sp)
    80001034:	06c13023          	sd	a2,96(sp)
    80001038:	06d13423          	sd	a3,104(sp)
    8000103c:	06e13823          	sd	a4,112(sp)
    80001040:	06f13c23          	sd	a5,120(sp)
    80001044:	09013023          	sd	a6,128(sp)
    80001048:	09113423          	sd	a7,136(sp)
    8000104c:	09213823          	sd	s2,144(sp)
    80001050:	09313c23          	sd	s3,152(sp)
    80001054:	0b413023          	sd	s4,160(sp)
    80001058:	0b513423          	sd	s5,168(sp)
    8000105c:	0b613823          	sd	s6,176(sp)
    80001060:	0b713c23          	sd	s7,184(sp)
    80001064:	0d813023          	sd	s8,192(sp)
    80001068:	0d913423          	sd	s9,200(sp)
    8000106c:	0da13823          	sd	s10,208(sp)
    80001070:	0db13c23          	sd	s11,216(sp)
    80001074:	0fc13023          	sd	t3,224(sp)
    80001078:	0fd13423          	sd	t4,232(sp)
    8000107c:	0fe13823          	sd	t5,240(sp)
    80001080:	0ff13c23          	sd	t6,248(sp)

    call _Z12ecallHandlerv
    80001084:	178000ef          	jal	ra,800011fc <_Z12ecallHandlerv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001088:	00013003          	ld	zero,0(sp)
    8000108c:	00813083          	ld	ra,8(sp)
    80001090:	01013103          	ld	sp,16(sp)
    80001094:	01813183          	ld	gp,24(sp)
    80001098:	02013203          	ld	tp,32(sp)
    8000109c:	02813283          	ld	t0,40(sp)
    800010a0:	03013303          	ld	t1,48(sp)
    800010a4:	03813383          	ld	t2,56(sp)
    800010a8:	04013403          	ld	s0,64(sp)
    800010ac:	04813483          	ld	s1,72(sp)
    800010b0:	05013503          	ld	a0,80(sp)
    800010b4:	05813583          	ld	a1,88(sp)
    800010b8:	06013603          	ld	a2,96(sp)
    800010bc:	06813683          	ld	a3,104(sp)
    800010c0:	07013703          	ld	a4,112(sp)
    800010c4:	07813783          	ld	a5,120(sp)
    800010c8:	08013803          	ld	a6,128(sp)
    800010cc:	08813883          	ld	a7,136(sp)
    800010d0:	09013903          	ld	s2,144(sp)
    800010d4:	09813983          	ld	s3,152(sp)
    800010d8:	0a013a03          	ld	s4,160(sp)
    800010dc:	0a813a83          	ld	s5,168(sp)
    800010e0:	0b013b03          	ld	s6,176(sp)
    800010e4:	0b813b83          	ld	s7,184(sp)
    800010e8:	0c013c03          	ld	s8,192(sp)
    800010ec:	0c813c83          	ld	s9,200(sp)
    800010f0:	0d013d03          	ld	s10,208(sp)
    800010f4:	0d813d83          	ld	s11,216(sp)
    800010f8:	0e013e03          	ld	t3,224(sp)
    800010fc:	0e813e83          	ld	t4,232(sp)
    80001100:	0f013f03          	ld	t5,240(sp)
    80001104:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001108:	10010113          	addi	sp,sp,256
    8000110c:	10200073          	sret

0000000080001110 <_Z9mem_allocm>:
//
// Created by os on 4/15/24.
//
#include "../h/syscall_c.hpp"

void* mem_alloc(uint64 size){
    80001110:	ff010113          	addi	sp,sp,-16
    80001114:	00813423          	sd	s0,8(sp)
    80001118:	01010413          	addi	s0,sp,16
    __asm__ volatile("mv a1, %0;"
        "li a0, 0x01;" : : "r"(size));
    8000111c:	00050593          	mv	a1,a0
    80001120:	00100513          	li	a0,1
    asm("ecall;");
    80001124:	00000073          	ecall
    return value;
}

inline uint64 readA0(){
    uint64 value;
    asm("mv %0, a0;": "=r"(value));
    80001128:	00050513          	mv	a0,a0
    uint64 value = readA0();
    return (void*)value;
}
    8000112c:	00813403          	ld	s0,8(sp)
    80001130:	01010113          	addi	sp,sp,16
    80001134:	00008067          	ret

0000000080001138 <_Z8mem_freePv>:

int mem_free(void* pointer){
    80001138:	ff010113          	addi	sp,sp,-16
    8000113c:	00813423          	sd	s0,8(sp)
    80001140:	01010413          	addi	s0,sp,16
    asm("mv a1, %0;"
        "li a0, 0x02;"
        "ecall;": : "r"(pointer));
    80001144:	00050593          	mv	a1,a0
    80001148:	00200513          	li	a0,2
    8000114c:	00000073          	ecall
    80001150:	00050513          	mv	a0,a0
    uint64 value = readA0();
    return (int)value;
    80001154:	0005051b          	sext.w	a0,a0
    80001158:	00813403          	ld	s0,8(sp)
    8000115c:	01010113          	addi	sp,sp,16
    80001160:	00008067          	ret

0000000080001164 <main>:
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"


int main(){
    80001164:	ff010113          	addi	sp,sp,-16
    80001168:	00113423          	sd	ra,8(sp)
    8000116c:	00813023          	sd	s0,0(sp)
    80001170:	01010413          	addi	s0,sp,16
    //initialize system data structures and register values
    initializeSystemRegisters();
    80001174:	00000097          	auipc	ra,0x0
    80001178:	03c080e7          	jalr	60(ra) # 800011b0 <_Z25initializeSystemRegistersv>

    //start user main
    int* ptr1 = (int*)mem_alloc(10);
    8000117c:	00a00513          	li	a0,10
    80001180:	00000097          	auipc	ra,0x0
    80001184:	f90080e7          	jalr	-112(ra) # 80001110 <_Z9mem_allocm>
    ptr1++;

    mem_free(ptr1);
    80001188:	00450513          	addi	a0,a0,4 # 1004 <_entry-0x7fffeffc>
    8000118c:	00000097          	auipc	ra,0x0
    80001190:	fac080e7          	jalr	-84(ra) # 80001138 <_Z8mem_freePv>
    //end user main

    stopEmulator();
    80001194:	00000097          	auipc	ra,0x0
    80001198:	040080e7          	jalr	64(ra) # 800011d4 <_Z12stopEmulatorv>
    return 0;
    8000119c:	00000513          	li	a0,0
    800011a0:	00813083          	ld	ra,8(sp)
    800011a4:	00013403          	ld	s0,0(sp)
    800011a8:	01010113          	addi	sp,sp,16
    800011ac:	00008067          	ret

00000000800011b0 <_Z25initializeSystemRegistersv>:
// Created by os on 4/15/24.
//

#include "../h/riscv.hpp"

void initializeSystemRegisters(){
    800011b0:	ff010113          	addi	sp,sp,-16
    800011b4:	00813423          	sd	s0,8(sp)
    800011b8:	01010413          	addi	s0,sp,16
    writeStvec((uint64)&ecallWrapper);
    800011bc:	00003797          	auipc	a5,0x3
    800011c0:	2147b783          	ld	a5,532(a5) # 800043d0 <_GLOBAL_OFFSET_TABLE_+0x10>
    return value;
}

//write ops
inline void writeStvec(uint64 value){
    asm("csrw stvec, %0;": :"r"(value));
    800011c4:	10579073          	csrw	stvec,a5
    //asm("la t0, _Z12ecallWrapperv;"
        //"csrw stvec, t0;");
}
    800011c8:	00813403          	ld	s0,8(sp)
    800011cc:	01010113          	addi	sp,sp,16
    800011d0:	00008067          	ret

00000000800011d4 <_Z12stopEmulatorv>:

void stopEmulator(){
    800011d4:	ff010113          	addi	sp,sp,-16
    800011d8:	00813423          	sd	s0,8(sp)
    800011dc:	01010413          	addi	s0,sp,16
    //defined in project file
    asm("la t0, 0x100000;" //adress
         "la t1, 0x5555;" //value
         "sw t1, 0(t0);");
    800011e0:	001002b7          	lui	t0,0x100
    800011e4:	00005337          	lui	t1,0x5
    800011e8:	5553031b          	addiw	t1,t1,1365
    800011ec:	0062a023          	sw	t1,0(t0) # 100000 <_entry-0x7ff00000>
}
    800011f0:	00813403          	ld	s0,8(sp)
    800011f4:	01010113          	addi	sp,sp,16
    800011f8:	00008067          	ret

00000000800011fc <_Z12ecallHandlerv>:

void ecallHandler(){
    800011fc:	fe010113          	addi	sp,sp,-32
    80001200:	00113c23          	sd	ra,24(sp)
    80001204:	00813823          	sd	s0,16(sp)
    80001208:	00913423          	sd	s1,8(sp)
    8000120c:	01213023          	sd	s2,0(sp)
    80001210:	02010413          	addi	s0,sp,32
    asm("csrr %0, scause;": "=r"(value));
    80001214:	14202773          	csrr	a4,scause
    asm("csrr %0, sepc;": "=r"(value));
    80001218:	141024f3          	csrr	s1,sepc
    uint64 scause = readScause();
    uint64 sepc = readSepc()+4;
    8000121c:	00448493          	addi	s1,s1,4
    uint64 sstatus = readSstatus();
    //handle for timer interrupt
    if(scause == 0x8000000000000001UL){
    80001220:	fff00793          	li	a5,-1
    80001224:	03f79793          	slli	a5,a5,0x3f
    80001228:	00178793          	addi	a5,a5,1
    8000122c:	02f70863          	beq	a4,a5,8000125c <_Z12ecallHandlerv+0x60>
        //trigger context switch or something
        printString("TIMER SIGNAL");
        writeSepc(sepc);
        writeSstatus(sstatus);
        return;
    }else if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL){
    80001230:	ff870713          	addi	a4,a4,-8
    80001234:	00100793          	li	a5,1
    80001238:	04e7fc63          	bgeu	a5,a4,80001290 <_Z12ecallHandlerv+0x94>
    8000123c:	00003497          	auipc	s1,0x3
    80001240:	e4c48493          	addi	s1,s1,-436 # 80004088 <console_handler+0xbe8>
void ecallHandler();
void stopEmulator();

//some ubiquidous functions
inline void printString(const char* str){
    while (*str != '\0'){
    80001244:	0004c503          	lbu	a0,0(s1)
    80001248:	0e050c63          	beqz	a0,80001340 <_Z12ecallHandlerv+0x144>
        __putc(*str);
    8000124c:	00002097          	auipc	ra,0x2
    80001250:	1e0080e7          	jalr	480(ra) # 8000342c <__putc>
        str++;
    80001254:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001258:	fedff06f          	j	80001244 <_Z12ecallHandlerv+0x48>
    8000125c:	00003917          	auipc	s2,0x3
    80001260:	da490913          	addi	s2,s2,-604 # 80004000 <console_handler+0xb60>
    80001264:	00094503          	lbu	a0,0(s2)
    80001268:	00050a63          	beqz	a0,8000127c <_Z12ecallHandlerv+0x80>
        __putc(*str);
    8000126c:	00002097          	auipc	ra,0x2
    80001270:	1c0080e7          	jalr	448(ra) # 8000342c <__putc>
        str++;
    80001274:	00190913          	addi	s2,s2,1
    while (*str != '\0'){
    80001278:	fedff06f          	j	80001264 <_Z12ecallHandlerv+0x68>
    }
    __putc('\n');
    8000127c:	00a00513          	li	a0,10
    80001280:	00002097          	auipc	ra,0x2
    80001284:	1ac080e7          	jalr	428(ra) # 8000342c <__putc>
    asm("csrw sepc, %0;": : "r"(value));
    80001288:	14149073          	csrw	sepc,s1
        return;
    8000128c:	0c80006f          	j	80001354 <_Z12ecallHandlerv+0x158>
    asm("mv %0, a0;": "=r"(value));
    80001290:	00050793          	mv	a5,a0
        //handle for ecall as a software interrupt
        uint64 opCode = readA0();
        switch (opCode) {
    80001294:	00100713          	li	a4,1
    80001298:	02e78663          	beq	a5,a4,800012c4 <_Z12ecallHandlerv+0xc8>
    8000129c:	00200713          	li	a4,2
    800012a0:	04e78c63          	beq	a5,a4,800012f8 <_Z12ecallHandlerv+0xfc>
    800012a4:	00003917          	auipc	s2,0x3
    800012a8:	d9c90913          	addi	s2,s2,-612 # 80004040 <console_handler+0xba0>
    while (*str != '\0'){
    800012ac:	00094503          	lbu	a0,0(s2)
    800012b0:	06050c63          	beqz	a0,80001328 <_Z12ecallHandlerv+0x12c>
        __putc(*str);
    800012b4:	00002097          	auipc	ra,0x2
    800012b8:	178080e7          	jalr	376(ra) # 8000342c <__putc>
        str++;
    800012bc:	00190913          	addi	s2,s2,1
    while (*str != '\0'){
    800012c0:	fedff06f          	j	800012ac <_Z12ecallHandlerv+0xb0>
    800012c4:	00003917          	auipc	s2,0x3
    800012c8:	d4c90913          	addi	s2,s2,-692 # 80004010 <console_handler+0xb70>
    800012cc:	00094503          	lbu	a0,0(s2)
    800012d0:	00050a63          	beqz	a0,800012e4 <_Z12ecallHandlerv+0xe8>
        __putc(*str);
    800012d4:	00002097          	auipc	ra,0x2
    800012d8:	158080e7          	jalr	344(ra) # 8000342c <__putc>
        str++;
    800012dc:	00190913          	addi	s2,s2,1
    while (*str != '\0'){
    800012e0:	fedff06f          	j	800012cc <_Z12ecallHandlerv+0xd0>
    __putc('\n');
    800012e4:	00a00513          	li	a0,10
    800012e8:	00002097          	auipc	ra,0x2
    800012ec:	144080e7          	jalr	324(ra) # 8000342c <__putc>
    asm("csrw sepc, %0;": : "r"(value));
    800012f0:	14149073          	csrw	sepc,s1
                break;
        };

        writeSepc(sepc);
        writeSstatus(sstatus);
        return;
    800012f4:	0600006f          	j	80001354 <_Z12ecallHandlerv+0x158>
        switch (opCode) {
    800012f8:	00003917          	auipc	s2,0x3
    800012fc:	d3090913          	addi	s2,s2,-720 # 80004028 <console_handler+0xb88>
    while (*str != '\0'){
    80001300:	00094503          	lbu	a0,0(s2)
    80001304:	00050a63          	beqz	a0,80001318 <_Z12ecallHandlerv+0x11c>
        __putc(*str);
    80001308:	00002097          	auipc	ra,0x2
    8000130c:	124080e7          	jalr	292(ra) # 8000342c <__putc>
        str++;
    80001310:	00190913          	addi	s2,s2,1
    while (*str != '\0'){
    80001314:	fedff06f          	j	80001300 <_Z12ecallHandlerv+0x104>
    __putc('\n');
    80001318:	00a00513          	li	a0,10
    8000131c:	00002097          	auipc	ra,0x2
    80001320:	110080e7          	jalr	272(ra) # 8000342c <__putc>
    return;
    80001324:	fcdff06f          	j	800012f0 <_Z12ecallHandlerv+0xf4>
    __putc('\n');
    80001328:	00a00513          	li	a0,10
    8000132c:	00002097          	auipc	ra,0x2
    80001330:	100080e7          	jalr	256(ra) # 8000342c <__putc>
                stopEmulator();
    80001334:	00000097          	auipc	ra,0x0
    80001338:	ea0080e7          	jalr	-352(ra) # 800011d4 <_Z12stopEmulatorv>
                break;
    8000133c:	fb5ff06f          	j	800012f0 <_Z12ecallHandlerv+0xf4>
    80001340:	00a00513          	li	a0,10
    80001344:	00002097          	auipc	ra,0x2
    80001348:	0e8080e7          	jalr	232(ra) # 8000342c <__putc>
    }

    //this is error case, because no other case should go here, print something
    printString("ERROR: Unknown scause value, shutting down...");
    stopEmulator();
    8000134c:	00000097          	auipc	ra,0x0
    80001350:	e88080e7          	jalr	-376(ra) # 800011d4 <_Z12stopEmulatorv>
    80001354:	01813083          	ld	ra,24(sp)
    80001358:	01013403          	ld	s0,16(sp)
    8000135c:	00813483          	ld	s1,8(sp)
    80001360:	00013903          	ld	s2,0(sp)
    80001364:	02010113          	addi	sp,sp,32
    80001368:	00008067          	ret

000000008000136c <start>:
    8000136c:	ff010113          	addi	sp,sp,-16
    80001370:	00813423          	sd	s0,8(sp)
    80001374:	01010413          	addi	s0,sp,16
    80001378:	300027f3          	csrr	a5,mstatus
    8000137c:	ffffe737          	lui	a4,0xffffe
    80001380:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff918f>
    80001384:	00e7f7b3          	and	a5,a5,a4
    80001388:	00001737          	lui	a4,0x1
    8000138c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001390:	00e7e7b3          	or	a5,a5,a4
    80001394:	30079073          	csrw	mstatus,a5
    80001398:	00000797          	auipc	a5,0x0
    8000139c:	16078793          	addi	a5,a5,352 # 800014f8 <system_main>
    800013a0:	34179073          	csrw	mepc,a5
    800013a4:	00000793          	li	a5,0
    800013a8:	18079073          	csrw	satp,a5
    800013ac:	000107b7          	lui	a5,0x10
    800013b0:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800013b4:	30279073          	csrw	medeleg,a5
    800013b8:	30379073          	csrw	mideleg,a5
    800013bc:	104027f3          	csrr	a5,sie
    800013c0:	2227e793          	ori	a5,a5,546
    800013c4:	10479073          	csrw	sie,a5
    800013c8:	fff00793          	li	a5,-1
    800013cc:	00a7d793          	srli	a5,a5,0xa
    800013d0:	3b079073          	csrw	pmpaddr0,a5
    800013d4:	00f00793          	li	a5,15
    800013d8:	3a079073          	csrw	pmpcfg0,a5
    800013dc:	f14027f3          	csrr	a5,mhartid
    800013e0:	0200c737          	lui	a4,0x200c
    800013e4:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800013e8:	0007869b          	sext.w	a3,a5
    800013ec:	00269713          	slli	a4,a3,0x2
    800013f0:	000f4637          	lui	a2,0xf4
    800013f4:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800013f8:	00d70733          	add	a4,a4,a3
    800013fc:	0037979b          	slliw	a5,a5,0x3
    80001400:	020046b7          	lui	a3,0x2004
    80001404:	00d787b3          	add	a5,a5,a3
    80001408:	00c585b3          	add	a1,a1,a2
    8000140c:	00371693          	slli	a3,a4,0x3
    80001410:	00003717          	auipc	a4,0x3
    80001414:	01070713          	addi	a4,a4,16 # 80004420 <timer_scratch>
    80001418:	00b7b023          	sd	a1,0(a5)
    8000141c:	00d70733          	add	a4,a4,a3
    80001420:	00f73c23          	sd	a5,24(a4)
    80001424:	02c73023          	sd	a2,32(a4)
    80001428:	34071073          	csrw	mscratch,a4
    8000142c:	00000797          	auipc	a5,0x0
    80001430:	6e478793          	addi	a5,a5,1764 # 80001b10 <timervec>
    80001434:	30579073          	csrw	mtvec,a5
    80001438:	300027f3          	csrr	a5,mstatus
    8000143c:	0087e793          	ori	a5,a5,8
    80001440:	30079073          	csrw	mstatus,a5
    80001444:	304027f3          	csrr	a5,mie
    80001448:	0807e793          	ori	a5,a5,128
    8000144c:	30479073          	csrw	mie,a5
    80001450:	f14027f3          	csrr	a5,mhartid
    80001454:	0007879b          	sext.w	a5,a5
    80001458:	00078213          	mv	tp,a5
    8000145c:	30200073          	mret
    80001460:	00813403          	ld	s0,8(sp)
    80001464:	01010113          	addi	sp,sp,16
    80001468:	00008067          	ret

000000008000146c <timerinit>:
    8000146c:	ff010113          	addi	sp,sp,-16
    80001470:	00813423          	sd	s0,8(sp)
    80001474:	01010413          	addi	s0,sp,16
    80001478:	f14027f3          	csrr	a5,mhartid
    8000147c:	0200c737          	lui	a4,0x200c
    80001480:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001484:	0007869b          	sext.w	a3,a5
    80001488:	00269713          	slli	a4,a3,0x2
    8000148c:	000f4637          	lui	a2,0xf4
    80001490:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001494:	00d70733          	add	a4,a4,a3
    80001498:	0037979b          	slliw	a5,a5,0x3
    8000149c:	020046b7          	lui	a3,0x2004
    800014a0:	00d787b3          	add	a5,a5,a3
    800014a4:	00c585b3          	add	a1,a1,a2
    800014a8:	00371693          	slli	a3,a4,0x3
    800014ac:	00003717          	auipc	a4,0x3
    800014b0:	f7470713          	addi	a4,a4,-140 # 80004420 <timer_scratch>
    800014b4:	00b7b023          	sd	a1,0(a5)
    800014b8:	00d70733          	add	a4,a4,a3
    800014bc:	00f73c23          	sd	a5,24(a4)
    800014c0:	02c73023          	sd	a2,32(a4)
    800014c4:	34071073          	csrw	mscratch,a4
    800014c8:	00000797          	auipc	a5,0x0
    800014cc:	64878793          	addi	a5,a5,1608 # 80001b10 <timervec>
    800014d0:	30579073          	csrw	mtvec,a5
    800014d4:	300027f3          	csrr	a5,mstatus
    800014d8:	0087e793          	ori	a5,a5,8
    800014dc:	30079073          	csrw	mstatus,a5
    800014e0:	304027f3          	csrr	a5,mie
    800014e4:	0807e793          	ori	a5,a5,128
    800014e8:	30479073          	csrw	mie,a5
    800014ec:	00813403          	ld	s0,8(sp)
    800014f0:	01010113          	addi	sp,sp,16
    800014f4:	00008067          	ret

00000000800014f8 <system_main>:
    800014f8:	fe010113          	addi	sp,sp,-32
    800014fc:	00813823          	sd	s0,16(sp)
    80001500:	00913423          	sd	s1,8(sp)
    80001504:	00113c23          	sd	ra,24(sp)
    80001508:	02010413          	addi	s0,sp,32
    8000150c:	00000097          	auipc	ra,0x0
    80001510:	0c4080e7          	jalr	196(ra) # 800015d0 <cpuid>
    80001514:	00003497          	auipc	s1,0x3
    80001518:	edc48493          	addi	s1,s1,-292 # 800043f0 <started>
    8000151c:	02050263          	beqz	a0,80001540 <system_main+0x48>
    80001520:	0004a783          	lw	a5,0(s1)
    80001524:	0007879b          	sext.w	a5,a5
    80001528:	fe078ce3          	beqz	a5,80001520 <system_main+0x28>
    8000152c:	0ff0000f          	fence
    80001530:	00003517          	auipc	a0,0x3
    80001534:	bb850513          	addi	a0,a0,-1096 # 800040e8 <console_handler+0xc48>
    80001538:	00001097          	auipc	ra,0x1
    8000153c:	a74080e7          	jalr	-1420(ra) # 80001fac <panic>
    80001540:	00001097          	auipc	ra,0x1
    80001544:	9c8080e7          	jalr	-1592(ra) # 80001f08 <consoleinit>
    80001548:	00001097          	auipc	ra,0x1
    8000154c:	154080e7          	jalr	340(ra) # 8000269c <printfinit>
    80001550:	00003517          	auipc	a0,0x3
    80001554:	c7850513          	addi	a0,a0,-904 # 800041c8 <console_handler+0xd28>
    80001558:	00001097          	auipc	ra,0x1
    8000155c:	ab0080e7          	jalr	-1360(ra) # 80002008 <__printf>
    80001560:	00003517          	auipc	a0,0x3
    80001564:	b5850513          	addi	a0,a0,-1192 # 800040b8 <console_handler+0xc18>
    80001568:	00001097          	auipc	ra,0x1
    8000156c:	aa0080e7          	jalr	-1376(ra) # 80002008 <__printf>
    80001570:	00003517          	auipc	a0,0x3
    80001574:	c5850513          	addi	a0,a0,-936 # 800041c8 <console_handler+0xd28>
    80001578:	00001097          	auipc	ra,0x1
    8000157c:	a90080e7          	jalr	-1392(ra) # 80002008 <__printf>
    80001580:	00001097          	auipc	ra,0x1
    80001584:	4a8080e7          	jalr	1192(ra) # 80002a28 <kinit>
    80001588:	00000097          	auipc	ra,0x0
    8000158c:	148080e7          	jalr	328(ra) # 800016d0 <trapinit>
    80001590:	00000097          	auipc	ra,0x0
    80001594:	16c080e7          	jalr	364(ra) # 800016fc <trapinithart>
    80001598:	00000097          	auipc	ra,0x0
    8000159c:	5b8080e7          	jalr	1464(ra) # 80001b50 <plicinit>
    800015a0:	00000097          	auipc	ra,0x0
    800015a4:	5d8080e7          	jalr	1496(ra) # 80001b78 <plicinithart>
    800015a8:	00000097          	auipc	ra,0x0
    800015ac:	078080e7          	jalr	120(ra) # 80001620 <userinit>
    800015b0:	0ff0000f          	fence
    800015b4:	00100793          	li	a5,1
    800015b8:	00003517          	auipc	a0,0x3
    800015bc:	b1850513          	addi	a0,a0,-1256 # 800040d0 <console_handler+0xc30>
    800015c0:	00f4a023          	sw	a5,0(s1)
    800015c4:	00001097          	auipc	ra,0x1
    800015c8:	a44080e7          	jalr	-1468(ra) # 80002008 <__printf>
    800015cc:	0000006f          	j	800015cc <system_main+0xd4>

00000000800015d0 <cpuid>:
    800015d0:	ff010113          	addi	sp,sp,-16
    800015d4:	00813423          	sd	s0,8(sp)
    800015d8:	01010413          	addi	s0,sp,16
    800015dc:	00020513          	mv	a0,tp
    800015e0:	00813403          	ld	s0,8(sp)
    800015e4:	0005051b          	sext.w	a0,a0
    800015e8:	01010113          	addi	sp,sp,16
    800015ec:	00008067          	ret

00000000800015f0 <mycpu>:
    800015f0:	ff010113          	addi	sp,sp,-16
    800015f4:	00813423          	sd	s0,8(sp)
    800015f8:	01010413          	addi	s0,sp,16
    800015fc:	00020793          	mv	a5,tp
    80001600:	00813403          	ld	s0,8(sp)
    80001604:	0007879b          	sext.w	a5,a5
    80001608:	00779793          	slli	a5,a5,0x7
    8000160c:	00004517          	auipc	a0,0x4
    80001610:	e4450513          	addi	a0,a0,-444 # 80005450 <cpus>
    80001614:	00f50533          	add	a0,a0,a5
    80001618:	01010113          	addi	sp,sp,16
    8000161c:	00008067          	ret

0000000080001620 <userinit>:
    80001620:	ff010113          	addi	sp,sp,-16
    80001624:	00813423          	sd	s0,8(sp)
    80001628:	01010413          	addi	s0,sp,16
    8000162c:	00813403          	ld	s0,8(sp)
    80001630:	01010113          	addi	sp,sp,16
    80001634:	00000317          	auipc	t1,0x0
    80001638:	b3030067          	jr	-1232(t1) # 80001164 <main>

000000008000163c <either_copyout>:
    8000163c:	ff010113          	addi	sp,sp,-16
    80001640:	00813023          	sd	s0,0(sp)
    80001644:	00113423          	sd	ra,8(sp)
    80001648:	01010413          	addi	s0,sp,16
    8000164c:	02051663          	bnez	a0,80001678 <either_copyout+0x3c>
    80001650:	00058513          	mv	a0,a1
    80001654:	00060593          	mv	a1,a2
    80001658:	0006861b          	sext.w	a2,a3
    8000165c:	00002097          	auipc	ra,0x2
    80001660:	c58080e7          	jalr	-936(ra) # 800032b4 <__memmove>
    80001664:	00813083          	ld	ra,8(sp)
    80001668:	00013403          	ld	s0,0(sp)
    8000166c:	00000513          	li	a0,0
    80001670:	01010113          	addi	sp,sp,16
    80001674:	00008067          	ret
    80001678:	00003517          	auipc	a0,0x3
    8000167c:	a9850513          	addi	a0,a0,-1384 # 80004110 <console_handler+0xc70>
    80001680:	00001097          	auipc	ra,0x1
    80001684:	92c080e7          	jalr	-1748(ra) # 80001fac <panic>

0000000080001688 <either_copyin>:
    80001688:	ff010113          	addi	sp,sp,-16
    8000168c:	00813023          	sd	s0,0(sp)
    80001690:	00113423          	sd	ra,8(sp)
    80001694:	01010413          	addi	s0,sp,16
    80001698:	02059463          	bnez	a1,800016c0 <either_copyin+0x38>
    8000169c:	00060593          	mv	a1,a2
    800016a0:	0006861b          	sext.w	a2,a3
    800016a4:	00002097          	auipc	ra,0x2
    800016a8:	c10080e7          	jalr	-1008(ra) # 800032b4 <__memmove>
    800016ac:	00813083          	ld	ra,8(sp)
    800016b0:	00013403          	ld	s0,0(sp)
    800016b4:	00000513          	li	a0,0
    800016b8:	01010113          	addi	sp,sp,16
    800016bc:	00008067          	ret
    800016c0:	00003517          	auipc	a0,0x3
    800016c4:	a7850513          	addi	a0,a0,-1416 # 80004138 <console_handler+0xc98>
    800016c8:	00001097          	auipc	ra,0x1
    800016cc:	8e4080e7          	jalr	-1820(ra) # 80001fac <panic>

00000000800016d0 <trapinit>:
    800016d0:	ff010113          	addi	sp,sp,-16
    800016d4:	00813423          	sd	s0,8(sp)
    800016d8:	01010413          	addi	s0,sp,16
    800016dc:	00813403          	ld	s0,8(sp)
    800016e0:	00003597          	auipc	a1,0x3
    800016e4:	a8058593          	addi	a1,a1,-1408 # 80004160 <console_handler+0xcc0>
    800016e8:	00004517          	auipc	a0,0x4
    800016ec:	de850513          	addi	a0,a0,-536 # 800054d0 <tickslock>
    800016f0:	01010113          	addi	sp,sp,16
    800016f4:	00001317          	auipc	t1,0x1
    800016f8:	5c430067          	jr	1476(t1) # 80002cb8 <initlock>

00000000800016fc <trapinithart>:
    800016fc:	ff010113          	addi	sp,sp,-16
    80001700:	00813423          	sd	s0,8(sp)
    80001704:	01010413          	addi	s0,sp,16
    80001708:	00000797          	auipc	a5,0x0
    8000170c:	2f878793          	addi	a5,a5,760 # 80001a00 <kernelvec>
    80001710:	10579073          	csrw	stvec,a5
    80001714:	00813403          	ld	s0,8(sp)
    80001718:	01010113          	addi	sp,sp,16
    8000171c:	00008067          	ret

0000000080001720 <usertrap>:
    80001720:	ff010113          	addi	sp,sp,-16
    80001724:	00813423          	sd	s0,8(sp)
    80001728:	01010413          	addi	s0,sp,16
    8000172c:	00813403          	ld	s0,8(sp)
    80001730:	01010113          	addi	sp,sp,16
    80001734:	00008067          	ret

0000000080001738 <usertrapret>:
    80001738:	ff010113          	addi	sp,sp,-16
    8000173c:	00813423          	sd	s0,8(sp)
    80001740:	01010413          	addi	s0,sp,16
    80001744:	00813403          	ld	s0,8(sp)
    80001748:	01010113          	addi	sp,sp,16
    8000174c:	00008067          	ret

0000000080001750 <kerneltrap>:
    80001750:	fe010113          	addi	sp,sp,-32
    80001754:	00813823          	sd	s0,16(sp)
    80001758:	00113c23          	sd	ra,24(sp)
    8000175c:	00913423          	sd	s1,8(sp)
    80001760:	02010413          	addi	s0,sp,32
    80001764:	142025f3          	csrr	a1,scause
    80001768:	100027f3          	csrr	a5,sstatus
    8000176c:	0027f793          	andi	a5,a5,2
    80001770:	10079c63          	bnez	a5,80001888 <kerneltrap+0x138>
    80001774:	142027f3          	csrr	a5,scause
    80001778:	0207ce63          	bltz	a5,800017b4 <kerneltrap+0x64>
    8000177c:	00003517          	auipc	a0,0x3
    80001780:	a2c50513          	addi	a0,a0,-1492 # 800041a8 <console_handler+0xd08>
    80001784:	00001097          	auipc	ra,0x1
    80001788:	884080e7          	jalr	-1916(ra) # 80002008 <__printf>
    8000178c:	141025f3          	csrr	a1,sepc
    80001790:	14302673          	csrr	a2,stval
    80001794:	00003517          	auipc	a0,0x3
    80001798:	a2450513          	addi	a0,a0,-1500 # 800041b8 <console_handler+0xd18>
    8000179c:	00001097          	auipc	ra,0x1
    800017a0:	86c080e7          	jalr	-1940(ra) # 80002008 <__printf>
    800017a4:	00003517          	auipc	a0,0x3
    800017a8:	a2c50513          	addi	a0,a0,-1492 # 800041d0 <console_handler+0xd30>
    800017ac:	00001097          	auipc	ra,0x1
    800017b0:	800080e7          	jalr	-2048(ra) # 80001fac <panic>
    800017b4:	0ff7f713          	andi	a4,a5,255
    800017b8:	00900693          	li	a3,9
    800017bc:	04d70063          	beq	a4,a3,800017fc <kerneltrap+0xac>
    800017c0:	fff00713          	li	a4,-1
    800017c4:	03f71713          	slli	a4,a4,0x3f
    800017c8:	00170713          	addi	a4,a4,1
    800017cc:	fae798e3          	bne	a5,a4,8000177c <kerneltrap+0x2c>
    800017d0:	00000097          	auipc	ra,0x0
    800017d4:	e00080e7          	jalr	-512(ra) # 800015d0 <cpuid>
    800017d8:	06050663          	beqz	a0,80001844 <kerneltrap+0xf4>
    800017dc:	144027f3          	csrr	a5,sip
    800017e0:	ffd7f793          	andi	a5,a5,-3
    800017e4:	14479073          	csrw	sip,a5
    800017e8:	01813083          	ld	ra,24(sp)
    800017ec:	01013403          	ld	s0,16(sp)
    800017f0:	00813483          	ld	s1,8(sp)
    800017f4:	02010113          	addi	sp,sp,32
    800017f8:	00008067          	ret
    800017fc:	00000097          	auipc	ra,0x0
    80001800:	3c8080e7          	jalr	968(ra) # 80001bc4 <plic_claim>
    80001804:	00a00793          	li	a5,10
    80001808:	00050493          	mv	s1,a0
    8000180c:	06f50863          	beq	a0,a5,8000187c <kerneltrap+0x12c>
    80001810:	fc050ce3          	beqz	a0,800017e8 <kerneltrap+0x98>
    80001814:	00050593          	mv	a1,a0
    80001818:	00003517          	auipc	a0,0x3
    8000181c:	97050513          	addi	a0,a0,-1680 # 80004188 <console_handler+0xce8>
    80001820:	00000097          	auipc	ra,0x0
    80001824:	7e8080e7          	jalr	2024(ra) # 80002008 <__printf>
    80001828:	01013403          	ld	s0,16(sp)
    8000182c:	01813083          	ld	ra,24(sp)
    80001830:	00048513          	mv	a0,s1
    80001834:	00813483          	ld	s1,8(sp)
    80001838:	02010113          	addi	sp,sp,32
    8000183c:	00000317          	auipc	t1,0x0
    80001840:	3c030067          	jr	960(t1) # 80001bfc <plic_complete>
    80001844:	00004517          	auipc	a0,0x4
    80001848:	c8c50513          	addi	a0,a0,-884 # 800054d0 <tickslock>
    8000184c:	00001097          	auipc	ra,0x1
    80001850:	490080e7          	jalr	1168(ra) # 80002cdc <acquire>
    80001854:	00003717          	auipc	a4,0x3
    80001858:	ba070713          	addi	a4,a4,-1120 # 800043f4 <ticks>
    8000185c:	00072783          	lw	a5,0(a4)
    80001860:	00004517          	auipc	a0,0x4
    80001864:	c7050513          	addi	a0,a0,-912 # 800054d0 <tickslock>
    80001868:	0017879b          	addiw	a5,a5,1
    8000186c:	00f72023          	sw	a5,0(a4)
    80001870:	00001097          	auipc	ra,0x1
    80001874:	538080e7          	jalr	1336(ra) # 80002da8 <release>
    80001878:	f65ff06f          	j	800017dc <kerneltrap+0x8c>
    8000187c:	00001097          	auipc	ra,0x1
    80001880:	094080e7          	jalr	148(ra) # 80002910 <uartintr>
    80001884:	fa5ff06f          	j	80001828 <kerneltrap+0xd8>
    80001888:	00003517          	auipc	a0,0x3
    8000188c:	8e050513          	addi	a0,a0,-1824 # 80004168 <console_handler+0xcc8>
    80001890:	00000097          	auipc	ra,0x0
    80001894:	71c080e7          	jalr	1820(ra) # 80001fac <panic>

0000000080001898 <clockintr>:
    80001898:	fe010113          	addi	sp,sp,-32
    8000189c:	00813823          	sd	s0,16(sp)
    800018a0:	00913423          	sd	s1,8(sp)
    800018a4:	00113c23          	sd	ra,24(sp)
    800018a8:	02010413          	addi	s0,sp,32
    800018ac:	00004497          	auipc	s1,0x4
    800018b0:	c2448493          	addi	s1,s1,-988 # 800054d0 <tickslock>
    800018b4:	00048513          	mv	a0,s1
    800018b8:	00001097          	auipc	ra,0x1
    800018bc:	424080e7          	jalr	1060(ra) # 80002cdc <acquire>
    800018c0:	00003717          	auipc	a4,0x3
    800018c4:	b3470713          	addi	a4,a4,-1228 # 800043f4 <ticks>
    800018c8:	00072783          	lw	a5,0(a4)
    800018cc:	01013403          	ld	s0,16(sp)
    800018d0:	01813083          	ld	ra,24(sp)
    800018d4:	00048513          	mv	a0,s1
    800018d8:	0017879b          	addiw	a5,a5,1
    800018dc:	00813483          	ld	s1,8(sp)
    800018e0:	00f72023          	sw	a5,0(a4)
    800018e4:	02010113          	addi	sp,sp,32
    800018e8:	00001317          	auipc	t1,0x1
    800018ec:	4c030067          	jr	1216(t1) # 80002da8 <release>

00000000800018f0 <devintr>:
    800018f0:	142027f3          	csrr	a5,scause
    800018f4:	00000513          	li	a0,0
    800018f8:	0007c463          	bltz	a5,80001900 <devintr+0x10>
    800018fc:	00008067          	ret
    80001900:	fe010113          	addi	sp,sp,-32
    80001904:	00813823          	sd	s0,16(sp)
    80001908:	00113c23          	sd	ra,24(sp)
    8000190c:	00913423          	sd	s1,8(sp)
    80001910:	02010413          	addi	s0,sp,32
    80001914:	0ff7f713          	andi	a4,a5,255
    80001918:	00900693          	li	a3,9
    8000191c:	04d70c63          	beq	a4,a3,80001974 <devintr+0x84>
    80001920:	fff00713          	li	a4,-1
    80001924:	03f71713          	slli	a4,a4,0x3f
    80001928:	00170713          	addi	a4,a4,1
    8000192c:	00e78c63          	beq	a5,a4,80001944 <devintr+0x54>
    80001930:	01813083          	ld	ra,24(sp)
    80001934:	01013403          	ld	s0,16(sp)
    80001938:	00813483          	ld	s1,8(sp)
    8000193c:	02010113          	addi	sp,sp,32
    80001940:	00008067          	ret
    80001944:	00000097          	auipc	ra,0x0
    80001948:	c8c080e7          	jalr	-884(ra) # 800015d0 <cpuid>
    8000194c:	06050663          	beqz	a0,800019b8 <devintr+0xc8>
    80001950:	144027f3          	csrr	a5,sip
    80001954:	ffd7f793          	andi	a5,a5,-3
    80001958:	14479073          	csrw	sip,a5
    8000195c:	01813083          	ld	ra,24(sp)
    80001960:	01013403          	ld	s0,16(sp)
    80001964:	00813483          	ld	s1,8(sp)
    80001968:	00200513          	li	a0,2
    8000196c:	02010113          	addi	sp,sp,32
    80001970:	00008067          	ret
    80001974:	00000097          	auipc	ra,0x0
    80001978:	250080e7          	jalr	592(ra) # 80001bc4 <plic_claim>
    8000197c:	00a00793          	li	a5,10
    80001980:	00050493          	mv	s1,a0
    80001984:	06f50663          	beq	a0,a5,800019f0 <devintr+0x100>
    80001988:	00100513          	li	a0,1
    8000198c:	fa0482e3          	beqz	s1,80001930 <devintr+0x40>
    80001990:	00048593          	mv	a1,s1
    80001994:	00002517          	auipc	a0,0x2
    80001998:	7f450513          	addi	a0,a0,2036 # 80004188 <console_handler+0xce8>
    8000199c:	00000097          	auipc	ra,0x0
    800019a0:	66c080e7          	jalr	1644(ra) # 80002008 <__printf>
    800019a4:	00048513          	mv	a0,s1
    800019a8:	00000097          	auipc	ra,0x0
    800019ac:	254080e7          	jalr	596(ra) # 80001bfc <plic_complete>
    800019b0:	00100513          	li	a0,1
    800019b4:	f7dff06f          	j	80001930 <devintr+0x40>
    800019b8:	00004517          	auipc	a0,0x4
    800019bc:	b1850513          	addi	a0,a0,-1256 # 800054d0 <tickslock>
    800019c0:	00001097          	auipc	ra,0x1
    800019c4:	31c080e7          	jalr	796(ra) # 80002cdc <acquire>
    800019c8:	00003717          	auipc	a4,0x3
    800019cc:	a2c70713          	addi	a4,a4,-1492 # 800043f4 <ticks>
    800019d0:	00072783          	lw	a5,0(a4)
    800019d4:	00004517          	auipc	a0,0x4
    800019d8:	afc50513          	addi	a0,a0,-1284 # 800054d0 <tickslock>
    800019dc:	0017879b          	addiw	a5,a5,1
    800019e0:	00f72023          	sw	a5,0(a4)
    800019e4:	00001097          	auipc	ra,0x1
    800019e8:	3c4080e7          	jalr	964(ra) # 80002da8 <release>
    800019ec:	f65ff06f          	j	80001950 <devintr+0x60>
    800019f0:	00001097          	auipc	ra,0x1
    800019f4:	f20080e7          	jalr	-224(ra) # 80002910 <uartintr>
    800019f8:	fadff06f          	j	800019a4 <devintr+0xb4>
    800019fc:	0000                	unimp
	...

0000000080001a00 <kernelvec>:
    80001a00:	f0010113          	addi	sp,sp,-256
    80001a04:	00113023          	sd	ra,0(sp)
    80001a08:	00213423          	sd	sp,8(sp)
    80001a0c:	00313823          	sd	gp,16(sp)
    80001a10:	00413c23          	sd	tp,24(sp)
    80001a14:	02513023          	sd	t0,32(sp)
    80001a18:	02613423          	sd	t1,40(sp)
    80001a1c:	02713823          	sd	t2,48(sp)
    80001a20:	02813c23          	sd	s0,56(sp)
    80001a24:	04913023          	sd	s1,64(sp)
    80001a28:	04a13423          	sd	a0,72(sp)
    80001a2c:	04b13823          	sd	a1,80(sp)
    80001a30:	04c13c23          	sd	a2,88(sp)
    80001a34:	06d13023          	sd	a3,96(sp)
    80001a38:	06e13423          	sd	a4,104(sp)
    80001a3c:	06f13823          	sd	a5,112(sp)
    80001a40:	07013c23          	sd	a6,120(sp)
    80001a44:	09113023          	sd	a7,128(sp)
    80001a48:	09213423          	sd	s2,136(sp)
    80001a4c:	09313823          	sd	s3,144(sp)
    80001a50:	09413c23          	sd	s4,152(sp)
    80001a54:	0b513023          	sd	s5,160(sp)
    80001a58:	0b613423          	sd	s6,168(sp)
    80001a5c:	0b713823          	sd	s7,176(sp)
    80001a60:	0b813c23          	sd	s8,184(sp)
    80001a64:	0d913023          	sd	s9,192(sp)
    80001a68:	0da13423          	sd	s10,200(sp)
    80001a6c:	0db13823          	sd	s11,208(sp)
    80001a70:	0dc13c23          	sd	t3,216(sp)
    80001a74:	0fd13023          	sd	t4,224(sp)
    80001a78:	0fe13423          	sd	t5,232(sp)
    80001a7c:	0ff13823          	sd	t6,240(sp)
    80001a80:	cd1ff0ef          	jal	ra,80001750 <kerneltrap>
    80001a84:	00013083          	ld	ra,0(sp)
    80001a88:	00813103          	ld	sp,8(sp)
    80001a8c:	01013183          	ld	gp,16(sp)
    80001a90:	02013283          	ld	t0,32(sp)
    80001a94:	02813303          	ld	t1,40(sp)
    80001a98:	03013383          	ld	t2,48(sp)
    80001a9c:	03813403          	ld	s0,56(sp)
    80001aa0:	04013483          	ld	s1,64(sp)
    80001aa4:	04813503          	ld	a0,72(sp)
    80001aa8:	05013583          	ld	a1,80(sp)
    80001aac:	05813603          	ld	a2,88(sp)
    80001ab0:	06013683          	ld	a3,96(sp)
    80001ab4:	06813703          	ld	a4,104(sp)
    80001ab8:	07013783          	ld	a5,112(sp)
    80001abc:	07813803          	ld	a6,120(sp)
    80001ac0:	08013883          	ld	a7,128(sp)
    80001ac4:	08813903          	ld	s2,136(sp)
    80001ac8:	09013983          	ld	s3,144(sp)
    80001acc:	09813a03          	ld	s4,152(sp)
    80001ad0:	0a013a83          	ld	s5,160(sp)
    80001ad4:	0a813b03          	ld	s6,168(sp)
    80001ad8:	0b013b83          	ld	s7,176(sp)
    80001adc:	0b813c03          	ld	s8,184(sp)
    80001ae0:	0c013c83          	ld	s9,192(sp)
    80001ae4:	0c813d03          	ld	s10,200(sp)
    80001ae8:	0d013d83          	ld	s11,208(sp)
    80001aec:	0d813e03          	ld	t3,216(sp)
    80001af0:	0e013e83          	ld	t4,224(sp)
    80001af4:	0e813f03          	ld	t5,232(sp)
    80001af8:	0f013f83          	ld	t6,240(sp)
    80001afc:	10010113          	addi	sp,sp,256
    80001b00:	10200073          	sret
    80001b04:	00000013          	nop
    80001b08:	00000013          	nop
    80001b0c:	00000013          	nop

0000000080001b10 <timervec>:
    80001b10:	34051573          	csrrw	a0,mscratch,a0
    80001b14:	00b53023          	sd	a1,0(a0)
    80001b18:	00c53423          	sd	a2,8(a0)
    80001b1c:	00d53823          	sd	a3,16(a0)
    80001b20:	01853583          	ld	a1,24(a0)
    80001b24:	02053603          	ld	a2,32(a0)
    80001b28:	0005b683          	ld	a3,0(a1)
    80001b2c:	00c686b3          	add	a3,a3,a2
    80001b30:	00d5b023          	sd	a3,0(a1)
    80001b34:	00200593          	li	a1,2
    80001b38:	14459073          	csrw	sip,a1
    80001b3c:	01053683          	ld	a3,16(a0)
    80001b40:	00853603          	ld	a2,8(a0)
    80001b44:	00053583          	ld	a1,0(a0)
    80001b48:	34051573          	csrrw	a0,mscratch,a0
    80001b4c:	30200073          	mret

0000000080001b50 <plicinit>:
    80001b50:	ff010113          	addi	sp,sp,-16
    80001b54:	00813423          	sd	s0,8(sp)
    80001b58:	01010413          	addi	s0,sp,16
    80001b5c:	00813403          	ld	s0,8(sp)
    80001b60:	0c0007b7          	lui	a5,0xc000
    80001b64:	00100713          	li	a4,1
    80001b68:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80001b6c:	00e7a223          	sw	a4,4(a5)
    80001b70:	01010113          	addi	sp,sp,16
    80001b74:	00008067          	ret

0000000080001b78 <plicinithart>:
    80001b78:	ff010113          	addi	sp,sp,-16
    80001b7c:	00813023          	sd	s0,0(sp)
    80001b80:	00113423          	sd	ra,8(sp)
    80001b84:	01010413          	addi	s0,sp,16
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	a48080e7          	jalr	-1464(ra) # 800015d0 <cpuid>
    80001b90:	0085171b          	slliw	a4,a0,0x8
    80001b94:	0c0027b7          	lui	a5,0xc002
    80001b98:	00e787b3          	add	a5,a5,a4
    80001b9c:	40200713          	li	a4,1026
    80001ba0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80001ba4:	00813083          	ld	ra,8(sp)
    80001ba8:	00013403          	ld	s0,0(sp)
    80001bac:	00d5151b          	slliw	a0,a0,0xd
    80001bb0:	0c2017b7          	lui	a5,0xc201
    80001bb4:	00a78533          	add	a0,a5,a0
    80001bb8:	00052023          	sw	zero,0(a0)
    80001bbc:	01010113          	addi	sp,sp,16
    80001bc0:	00008067          	ret

0000000080001bc4 <plic_claim>:
    80001bc4:	ff010113          	addi	sp,sp,-16
    80001bc8:	00813023          	sd	s0,0(sp)
    80001bcc:	00113423          	sd	ra,8(sp)
    80001bd0:	01010413          	addi	s0,sp,16
    80001bd4:	00000097          	auipc	ra,0x0
    80001bd8:	9fc080e7          	jalr	-1540(ra) # 800015d0 <cpuid>
    80001bdc:	00813083          	ld	ra,8(sp)
    80001be0:	00013403          	ld	s0,0(sp)
    80001be4:	00d5151b          	slliw	a0,a0,0xd
    80001be8:	0c2017b7          	lui	a5,0xc201
    80001bec:	00a78533          	add	a0,a5,a0
    80001bf0:	00452503          	lw	a0,4(a0)
    80001bf4:	01010113          	addi	sp,sp,16
    80001bf8:	00008067          	ret

0000000080001bfc <plic_complete>:
    80001bfc:	fe010113          	addi	sp,sp,-32
    80001c00:	00813823          	sd	s0,16(sp)
    80001c04:	00913423          	sd	s1,8(sp)
    80001c08:	00113c23          	sd	ra,24(sp)
    80001c0c:	02010413          	addi	s0,sp,32
    80001c10:	00050493          	mv	s1,a0
    80001c14:	00000097          	auipc	ra,0x0
    80001c18:	9bc080e7          	jalr	-1604(ra) # 800015d0 <cpuid>
    80001c1c:	01813083          	ld	ra,24(sp)
    80001c20:	01013403          	ld	s0,16(sp)
    80001c24:	00d5179b          	slliw	a5,a0,0xd
    80001c28:	0c201737          	lui	a4,0xc201
    80001c2c:	00f707b3          	add	a5,a4,a5
    80001c30:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80001c34:	00813483          	ld	s1,8(sp)
    80001c38:	02010113          	addi	sp,sp,32
    80001c3c:	00008067          	ret

0000000080001c40 <consolewrite>:
    80001c40:	fb010113          	addi	sp,sp,-80
    80001c44:	04813023          	sd	s0,64(sp)
    80001c48:	04113423          	sd	ra,72(sp)
    80001c4c:	02913c23          	sd	s1,56(sp)
    80001c50:	03213823          	sd	s2,48(sp)
    80001c54:	03313423          	sd	s3,40(sp)
    80001c58:	03413023          	sd	s4,32(sp)
    80001c5c:	01513c23          	sd	s5,24(sp)
    80001c60:	05010413          	addi	s0,sp,80
    80001c64:	06c05c63          	blez	a2,80001cdc <consolewrite+0x9c>
    80001c68:	00060993          	mv	s3,a2
    80001c6c:	00050a13          	mv	s4,a0
    80001c70:	00058493          	mv	s1,a1
    80001c74:	00000913          	li	s2,0
    80001c78:	fff00a93          	li	s5,-1
    80001c7c:	01c0006f          	j	80001c98 <consolewrite+0x58>
    80001c80:	fbf44503          	lbu	a0,-65(s0)
    80001c84:	0019091b          	addiw	s2,s2,1
    80001c88:	00148493          	addi	s1,s1,1
    80001c8c:	00001097          	auipc	ra,0x1
    80001c90:	a9c080e7          	jalr	-1380(ra) # 80002728 <uartputc>
    80001c94:	03298063          	beq	s3,s2,80001cb4 <consolewrite+0x74>
    80001c98:	00048613          	mv	a2,s1
    80001c9c:	00100693          	li	a3,1
    80001ca0:	000a0593          	mv	a1,s4
    80001ca4:	fbf40513          	addi	a0,s0,-65
    80001ca8:	00000097          	auipc	ra,0x0
    80001cac:	9e0080e7          	jalr	-1568(ra) # 80001688 <either_copyin>
    80001cb0:	fd5518e3          	bne	a0,s5,80001c80 <consolewrite+0x40>
    80001cb4:	04813083          	ld	ra,72(sp)
    80001cb8:	04013403          	ld	s0,64(sp)
    80001cbc:	03813483          	ld	s1,56(sp)
    80001cc0:	02813983          	ld	s3,40(sp)
    80001cc4:	02013a03          	ld	s4,32(sp)
    80001cc8:	01813a83          	ld	s5,24(sp)
    80001ccc:	00090513          	mv	a0,s2
    80001cd0:	03013903          	ld	s2,48(sp)
    80001cd4:	05010113          	addi	sp,sp,80
    80001cd8:	00008067          	ret
    80001cdc:	00000913          	li	s2,0
    80001ce0:	fd5ff06f          	j	80001cb4 <consolewrite+0x74>

0000000080001ce4 <consoleread>:
    80001ce4:	f9010113          	addi	sp,sp,-112
    80001ce8:	06813023          	sd	s0,96(sp)
    80001cec:	04913c23          	sd	s1,88(sp)
    80001cf0:	05213823          	sd	s2,80(sp)
    80001cf4:	05313423          	sd	s3,72(sp)
    80001cf8:	05413023          	sd	s4,64(sp)
    80001cfc:	03513c23          	sd	s5,56(sp)
    80001d00:	03613823          	sd	s6,48(sp)
    80001d04:	03713423          	sd	s7,40(sp)
    80001d08:	03813023          	sd	s8,32(sp)
    80001d0c:	06113423          	sd	ra,104(sp)
    80001d10:	01913c23          	sd	s9,24(sp)
    80001d14:	07010413          	addi	s0,sp,112
    80001d18:	00060b93          	mv	s7,a2
    80001d1c:	00050913          	mv	s2,a0
    80001d20:	00058c13          	mv	s8,a1
    80001d24:	00060b1b          	sext.w	s6,a2
    80001d28:	00003497          	auipc	s1,0x3
    80001d2c:	7c048493          	addi	s1,s1,1984 # 800054e8 <cons>
    80001d30:	00400993          	li	s3,4
    80001d34:	fff00a13          	li	s4,-1
    80001d38:	00a00a93          	li	s5,10
    80001d3c:	05705e63          	blez	s7,80001d98 <consoleread+0xb4>
    80001d40:	09c4a703          	lw	a4,156(s1)
    80001d44:	0984a783          	lw	a5,152(s1)
    80001d48:	0007071b          	sext.w	a4,a4
    80001d4c:	08e78463          	beq	a5,a4,80001dd4 <consoleread+0xf0>
    80001d50:	07f7f713          	andi	a4,a5,127
    80001d54:	00e48733          	add	a4,s1,a4
    80001d58:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80001d5c:	0017869b          	addiw	a3,a5,1
    80001d60:	08d4ac23          	sw	a3,152(s1)
    80001d64:	00070c9b          	sext.w	s9,a4
    80001d68:	0b370663          	beq	a4,s3,80001e14 <consoleread+0x130>
    80001d6c:	00100693          	li	a3,1
    80001d70:	f9f40613          	addi	a2,s0,-97
    80001d74:	000c0593          	mv	a1,s8
    80001d78:	00090513          	mv	a0,s2
    80001d7c:	f8e40fa3          	sb	a4,-97(s0)
    80001d80:	00000097          	auipc	ra,0x0
    80001d84:	8bc080e7          	jalr	-1860(ra) # 8000163c <either_copyout>
    80001d88:	01450863          	beq	a0,s4,80001d98 <consoleread+0xb4>
    80001d8c:	001c0c13          	addi	s8,s8,1
    80001d90:	fffb8b9b          	addiw	s7,s7,-1
    80001d94:	fb5c94e3          	bne	s9,s5,80001d3c <consoleread+0x58>
    80001d98:	000b851b          	sext.w	a0,s7
    80001d9c:	06813083          	ld	ra,104(sp)
    80001da0:	06013403          	ld	s0,96(sp)
    80001da4:	05813483          	ld	s1,88(sp)
    80001da8:	05013903          	ld	s2,80(sp)
    80001dac:	04813983          	ld	s3,72(sp)
    80001db0:	04013a03          	ld	s4,64(sp)
    80001db4:	03813a83          	ld	s5,56(sp)
    80001db8:	02813b83          	ld	s7,40(sp)
    80001dbc:	02013c03          	ld	s8,32(sp)
    80001dc0:	01813c83          	ld	s9,24(sp)
    80001dc4:	40ab053b          	subw	a0,s6,a0
    80001dc8:	03013b03          	ld	s6,48(sp)
    80001dcc:	07010113          	addi	sp,sp,112
    80001dd0:	00008067          	ret
    80001dd4:	00001097          	auipc	ra,0x1
    80001dd8:	1d8080e7          	jalr	472(ra) # 80002fac <push_on>
    80001ddc:	0984a703          	lw	a4,152(s1)
    80001de0:	09c4a783          	lw	a5,156(s1)
    80001de4:	0007879b          	sext.w	a5,a5
    80001de8:	fef70ce3          	beq	a4,a5,80001de0 <consoleread+0xfc>
    80001dec:	00001097          	auipc	ra,0x1
    80001df0:	234080e7          	jalr	564(ra) # 80003020 <pop_on>
    80001df4:	0984a783          	lw	a5,152(s1)
    80001df8:	07f7f713          	andi	a4,a5,127
    80001dfc:	00e48733          	add	a4,s1,a4
    80001e00:	01874703          	lbu	a4,24(a4)
    80001e04:	0017869b          	addiw	a3,a5,1
    80001e08:	08d4ac23          	sw	a3,152(s1)
    80001e0c:	00070c9b          	sext.w	s9,a4
    80001e10:	f5371ee3          	bne	a4,s3,80001d6c <consoleread+0x88>
    80001e14:	000b851b          	sext.w	a0,s7
    80001e18:	f96bf2e3          	bgeu	s7,s6,80001d9c <consoleread+0xb8>
    80001e1c:	08f4ac23          	sw	a5,152(s1)
    80001e20:	f7dff06f          	j	80001d9c <consoleread+0xb8>

0000000080001e24 <consputc>:
    80001e24:	10000793          	li	a5,256
    80001e28:	00f50663          	beq	a0,a5,80001e34 <consputc+0x10>
    80001e2c:	00001317          	auipc	t1,0x1
    80001e30:	9f430067          	jr	-1548(t1) # 80002820 <uartputc_sync>
    80001e34:	ff010113          	addi	sp,sp,-16
    80001e38:	00113423          	sd	ra,8(sp)
    80001e3c:	00813023          	sd	s0,0(sp)
    80001e40:	01010413          	addi	s0,sp,16
    80001e44:	00800513          	li	a0,8
    80001e48:	00001097          	auipc	ra,0x1
    80001e4c:	9d8080e7          	jalr	-1576(ra) # 80002820 <uartputc_sync>
    80001e50:	02000513          	li	a0,32
    80001e54:	00001097          	auipc	ra,0x1
    80001e58:	9cc080e7          	jalr	-1588(ra) # 80002820 <uartputc_sync>
    80001e5c:	00013403          	ld	s0,0(sp)
    80001e60:	00813083          	ld	ra,8(sp)
    80001e64:	00800513          	li	a0,8
    80001e68:	01010113          	addi	sp,sp,16
    80001e6c:	00001317          	auipc	t1,0x1
    80001e70:	9b430067          	jr	-1612(t1) # 80002820 <uartputc_sync>

0000000080001e74 <consoleintr>:
    80001e74:	fe010113          	addi	sp,sp,-32
    80001e78:	00813823          	sd	s0,16(sp)
    80001e7c:	00913423          	sd	s1,8(sp)
    80001e80:	01213023          	sd	s2,0(sp)
    80001e84:	00113c23          	sd	ra,24(sp)
    80001e88:	02010413          	addi	s0,sp,32
    80001e8c:	00003917          	auipc	s2,0x3
    80001e90:	65c90913          	addi	s2,s2,1628 # 800054e8 <cons>
    80001e94:	00050493          	mv	s1,a0
    80001e98:	00090513          	mv	a0,s2
    80001e9c:	00001097          	auipc	ra,0x1
    80001ea0:	e40080e7          	jalr	-448(ra) # 80002cdc <acquire>
    80001ea4:	02048c63          	beqz	s1,80001edc <consoleintr+0x68>
    80001ea8:	0a092783          	lw	a5,160(s2)
    80001eac:	09892703          	lw	a4,152(s2)
    80001eb0:	07f00693          	li	a3,127
    80001eb4:	40e7873b          	subw	a4,a5,a4
    80001eb8:	02e6e263          	bltu	a3,a4,80001edc <consoleintr+0x68>
    80001ebc:	00d00713          	li	a4,13
    80001ec0:	04e48063          	beq	s1,a4,80001f00 <consoleintr+0x8c>
    80001ec4:	07f7f713          	andi	a4,a5,127
    80001ec8:	00e90733          	add	a4,s2,a4
    80001ecc:	0017879b          	addiw	a5,a5,1
    80001ed0:	0af92023          	sw	a5,160(s2)
    80001ed4:	00970c23          	sb	s1,24(a4)
    80001ed8:	08f92e23          	sw	a5,156(s2)
    80001edc:	01013403          	ld	s0,16(sp)
    80001ee0:	01813083          	ld	ra,24(sp)
    80001ee4:	00813483          	ld	s1,8(sp)
    80001ee8:	00013903          	ld	s2,0(sp)
    80001eec:	00003517          	auipc	a0,0x3
    80001ef0:	5fc50513          	addi	a0,a0,1532 # 800054e8 <cons>
    80001ef4:	02010113          	addi	sp,sp,32
    80001ef8:	00001317          	auipc	t1,0x1
    80001efc:	eb030067          	jr	-336(t1) # 80002da8 <release>
    80001f00:	00a00493          	li	s1,10
    80001f04:	fc1ff06f          	j	80001ec4 <consoleintr+0x50>

0000000080001f08 <consoleinit>:
    80001f08:	fe010113          	addi	sp,sp,-32
    80001f0c:	00113c23          	sd	ra,24(sp)
    80001f10:	00813823          	sd	s0,16(sp)
    80001f14:	00913423          	sd	s1,8(sp)
    80001f18:	02010413          	addi	s0,sp,32
    80001f1c:	00003497          	auipc	s1,0x3
    80001f20:	5cc48493          	addi	s1,s1,1484 # 800054e8 <cons>
    80001f24:	00048513          	mv	a0,s1
    80001f28:	00002597          	auipc	a1,0x2
    80001f2c:	2b858593          	addi	a1,a1,696 # 800041e0 <console_handler+0xd40>
    80001f30:	00001097          	auipc	ra,0x1
    80001f34:	d88080e7          	jalr	-632(ra) # 80002cb8 <initlock>
    80001f38:	00000097          	auipc	ra,0x0
    80001f3c:	7ac080e7          	jalr	1964(ra) # 800026e4 <uartinit>
    80001f40:	01813083          	ld	ra,24(sp)
    80001f44:	01013403          	ld	s0,16(sp)
    80001f48:	00000797          	auipc	a5,0x0
    80001f4c:	d9c78793          	addi	a5,a5,-612 # 80001ce4 <consoleread>
    80001f50:	0af4bc23          	sd	a5,184(s1)
    80001f54:	00000797          	auipc	a5,0x0
    80001f58:	cec78793          	addi	a5,a5,-788 # 80001c40 <consolewrite>
    80001f5c:	0cf4b023          	sd	a5,192(s1)
    80001f60:	00813483          	ld	s1,8(sp)
    80001f64:	02010113          	addi	sp,sp,32
    80001f68:	00008067          	ret

0000000080001f6c <console_read>:
    80001f6c:	ff010113          	addi	sp,sp,-16
    80001f70:	00813423          	sd	s0,8(sp)
    80001f74:	01010413          	addi	s0,sp,16
    80001f78:	00813403          	ld	s0,8(sp)
    80001f7c:	00003317          	auipc	t1,0x3
    80001f80:	62433303          	ld	t1,1572(t1) # 800055a0 <devsw+0x10>
    80001f84:	01010113          	addi	sp,sp,16
    80001f88:	00030067          	jr	t1

0000000080001f8c <console_write>:
    80001f8c:	ff010113          	addi	sp,sp,-16
    80001f90:	00813423          	sd	s0,8(sp)
    80001f94:	01010413          	addi	s0,sp,16
    80001f98:	00813403          	ld	s0,8(sp)
    80001f9c:	00003317          	auipc	t1,0x3
    80001fa0:	60c33303          	ld	t1,1548(t1) # 800055a8 <devsw+0x18>
    80001fa4:	01010113          	addi	sp,sp,16
    80001fa8:	00030067          	jr	t1

0000000080001fac <panic>:
    80001fac:	fe010113          	addi	sp,sp,-32
    80001fb0:	00113c23          	sd	ra,24(sp)
    80001fb4:	00813823          	sd	s0,16(sp)
    80001fb8:	00913423          	sd	s1,8(sp)
    80001fbc:	02010413          	addi	s0,sp,32
    80001fc0:	00050493          	mv	s1,a0
    80001fc4:	00002517          	auipc	a0,0x2
    80001fc8:	22450513          	addi	a0,a0,548 # 800041e8 <console_handler+0xd48>
    80001fcc:	00003797          	auipc	a5,0x3
    80001fd0:	6607ae23          	sw	zero,1660(a5) # 80005648 <pr+0x18>
    80001fd4:	00000097          	auipc	ra,0x0
    80001fd8:	034080e7          	jalr	52(ra) # 80002008 <__printf>
    80001fdc:	00048513          	mv	a0,s1
    80001fe0:	00000097          	auipc	ra,0x0
    80001fe4:	028080e7          	jalr	40(ra) # 80002008 <__printf>
    80001fe8:	00002517          	auipc	a0,0x2
    80001fec:	1e050513          	addi	a0,a0,480 # 800041c8 <console_handler+0xd28>
    80001ff0:	00000097          	auipc	ra,0x0
    80001ff4:	018080e7          	jalr	24(ra) # 80002008 <__printf>
    80001ff8:	00100793          	li	a5,1
    80001ffc:	00002717          	auipc	a4,0x2
    80002000:	3ef72e23          	sw	a5,1020(a4) # 800043f8 <panicked>
    80002004:	0000006f          	j	80002004 <panic+0x58>

0000000080002008 <__printf>:
    80002008:	f3010113          	addi	sp,sp,-208
    8000200c:	08813023          	sd	s0,128(sp)
    80002010:	07313423          	sd	s3,104(sp)
    80002014:	09010413          	addi	s0,sp,144
    80002018:	05813023          	sd	s8,64(sp)
    8000201c:	08113423          	sd	ra,136(sp)
    80002020:	06913c23          	sd	s1,120(sp)
    80002024:	07213823          	sd	s2,112(sp)
    80002028:	07413023          	sd	s4,96(sp)
    8000202c:	05513c23          	sd	s5,88(sp)
    80002030:	05613823          	sd	s6,80(sp)
    80002034:	05713423          	sd	s7,72(sp)
    80002038:	03913c23          	sd	s9,56(sp)
    8000203c:	03a13823          	sd	s10,48(sp)
    80002040:	03b13423          	sd	s11,40(sp)
    80002044:	00003317          	auipc	t1,0x3
    80002048:	5ec30313          	addi	t1,t1,1516 # 80005630 <pr>
    8000204c:	01832c03          	lw	s8,24(t1)
    80002050:	00b43423          	sd	a1,8(s0)
    80002054:	00c43823          	sd	a2,16(s0)
    80002058:	00d43c23          	sd	a3,24(s0)
    8000205c:	02e43023          	sd	a4,32(s0)
    80002060:	02f43423          	sd	a5,40(s0)
    80002064:	03043823          	sd	a6,48(s0)
    80002068:	03143c23          	sd	a7,56(s0)
    8000206c:	00050993          	mv	s3,a0
    80002070:	4a0c1663          	bnez	s8,8000251c <__printf+0x514>
    80002074:	60098c63          	beqz	s3,8000268c <__printf+0x684>
    80002078:	0009c503          	lbu	a0,0(s3)
    8000207c:	00840793          	addi	a5,s0,8
    80002080:	f6f43c23          	sd	a5,-136(s0)
    80002084:	00000493          	li	s1,0
    80002088:	22050063          	beqz	a0,800022a8 <__printf+0x2a0>
    8000208c:	00002a37          	lui	s4,0x2
    80002090:	00018ab7          	lui	s5,0x18
    80002094:	000f4b37          	lui	s6,0xf4
    80002098:	00989bb7          	lui	s7,0x989
    8000209c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800020a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800020a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800020a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800020ac:	00148c9b          	addiw	s9,s1,1
    800020b0:	02500793          	li	a5,37
    800020b4:	01998933          	add	s2,s3,s9
    800020b8:	38f51263          	bne	a0,a5,8000243c <__printf+0x434>
    800020bc:	00094783          	lbu	a5,0(s2)
    800020c0:	00078c9b          	sext.w	s9,a5
    800020c4:	1e078263          	beqz	a5,800022a8 <__printf+0x2a0>
    800020c8:	0024849b          	addiw	s1,s1,2
    800020cc:	07000713          	li	a4,112
    800020d0:	00998933          	add	s2,s3,s1
    800020d4:	38e78a63          	beq	a5,a4,80002468 <__printf+0x460>
    800020d8:	20f76863          	bltu	a4,a5,800022e8 <__printf+0x2e0>
    800020dc:	42a78863          	beq	a5,a0,8000250c <__printf+0x504>
    800020e0:	06400713          	li	a4,100
    800020e4:	40e79663          	bne	a5,a4,800024f0 <__printf+0x4e8>
    800020e8:	f7843783          	ld	a5,-136(s0)
    800020ec:	0007a603          	lw	a2,0(a5)
    800020f0:	00878793          	addi	a5,a5,8
    800020f4:	f6f43c23          	sd	a5,-136(s0)
    800020f8:	42064a63          	bltz	a2,8000252c <__printf+0x524>
    800020fc:	00a00713          	li	a4,10
    80002100:	02e677bb          	remuw	a5,a2,a4
    80002104:	00002d97          	auipc	s11,0x2
    80002108:	10cd8d93          	addi	s11,s11,268 # 80004210 <digits>
    8000210c:	00900593          	li	a1,9
    80002110:	0006051b          	sext.w	a0,a2
    80002114:	00000c93          	li	s9,0
    80002118:	02079793          	slli	a5,a5,0x20
    8000211c:	0207d793          	srli	a5,a5,0x20
    80002120:	00fd87b3          	add	a5,s11,a5
    80002124:	0007c783          	lbu	a5,0(a5)
    80002128:	02e656bb          	divuw	a3,a2,a4
    8000212c:	f8f40023          	sb	a5,-128(s0)
    80002130:	14c5d863          	bge	a1,a2,80002280 <__printf+0x278>
    80002134:	06300593          	li	a1,99
    80002138:	00100c93          	li	s9,1
    8000213c:	02e6f7bb          	remuw	a5,a3,a4
    80002140:	02079793          	slli	a5,a5,0x20
    80002144:	0207d793          	srli	a5,a5,0x20
    80002148:	00fd87b3          	add	a5,s11,a5
    8000214c:	0007c783          	lbu	a5,0(a5)
    80002150:	02e6d73b          	divuw	a4,a3,a4
    80002154:	f8f400a3          	sb	a5,-127(s0)
    80002158:	12a5f463          	bgeu	a1,a0,80002280 <__printf+0x278>
    8000215c:	00a00693          	li	a3,10
    80002160:	00900593          	li	a1,9
    80002164:	02d777bb          	remuw	a5,a4,a3
    80002168:	02079793          	slli	a5,a5,0x20
    8000216c:	0207d793          	srli	a5,a5,0x20
    80002170:	00fd87b3          	add	a5,s11,a5
    80002174:	0007c503          	lbu	a0,0(a5)
    80002178:	02d757bb          	divuw	a5,a4,a3
    8000217c:	f8a40123          	sb	a0,-126(s0)
    80002180:	48e5f263          	bgeu	a1,a4,80002604 <__printf+0x5fc>
    80002184:	06300513          	li	a0,99
    80002188:	02d7f5bb          	remuw	a1,a5,a3
    8000218c:	02059593          	slli	a1,a1,0x20
    80002190:	0205d593          	srli	a1,a1,0x20
    80002194:	00bd85b3          	add	a1,s11,a1
    80002198:	0005c583          	lbu	a1,0(a1)
    8000219c:	02d7d7bb          	divuw	a5,a5,a3
    800021a0:	f8b401a3          	sb	a1,-125(s0)
    800021a4:	48e57263          	bgeu	a0,a4,80002628 <__printf+0x620>
    800021a8:	3e700513          	li	a0,999
    800021ac:	02d7f5bb          	remuw	a1,a5,a3
    800021b0:	02059593          	slli	a1,a1,0x20
    800021b4:	0205d593          	srli	a1,a1,0x20
    800021b8:	00bd85b3          	add	a1,s11,a1
    800021bc:	0005c583          	lbu	a1,0(a1)
    800021c0:	02d7d7bb          	divuw	a5,a5,a3
    800021c4:	f8b40223          	sb	a1,-124(s0)
    800021c8:	46e57663          	bgeu	a0,a4,80002634 <__printf+0x62c>
    800021cc:	02d7f5bb          	remuw	a1,a5,a3
    800021d0:	02059593          	slli	a1,a1,0x20
    800021d4:	0205d593          	srli	a1,a1,0x20
    800021d8:	00bd85b3          	add	a1,s11,a1
    800021dc:	0005c583          	lbu	a1,0(a1)
    800021e0:	02d7d7bb          	divuw	a5,a5,a3
    800021e4:	f8b402a3          	sb	a1,-123(s0)
    800021e8:	46ea7863          	bgeu	s4,a4,80002658 <__printf+0x650>
    800021ec:	02d7f5bb          	remuw	a1,a5,a3
    800021f0:	02059593          	slli	a1,a1,0x20
    800021f4:	0205d593          	srli	a1,a1,0x20
    800021f8:	00bd85b3          	add	a1,s11,a1
    800021fc:	0005c583          	lbu	a1,0(a1)
    80002200:	02d7d7bb          	divuw	a5,a5,a3
    80002204:	f8b40323          	sb	a1,-122(s0)
    80002208:	3eeaf863          	bgeu	s5,a4,800025f8 <__printf+0x5f0>
    8000220c:	02d7f5bb          	remuw	a1,a5,a3
    80002210:	02059593          	slli	a1,a1,0x20
    80002214:	0205d593          	srli	a1,a1,0x20
    80002218:	00bd85b3          	add	a1,s11,a1
    8000221c:	0005c583          	lbu	a1,0(a1)
    80002220:	02d7d7bb          	divuw	a5,a5,a3
    80002224:	f8b403a3          	sb	a1,-121(s0)
    80002228:	42eb7e63          	bgeu	s6,a4,80002664 <__printf+0x65c>
    8000222c:	02d7f5bb          	remuw	a1,a5,a3
    80002230:	02059593          	slli	a1,a1,0x20
    80002234:	0205d593          	srli	a1,a1,0x20
    80002238:	00bd85b3          	add	a1,s11,a1
    8000223c:	0005c583          	lbu	a1,0(a1)
    80002240:	02d7d7bb          	divuw	a5,a5,a3
    80002244:	f8b40423          	sb	a1,-120(s0)
    80002248:	42ebfc63          	bgeu	s7,a4,80002680 <__printf+0x678>
    8000224c:	02079793          	slli	a5,a5,0x20
    80002250:	0207d793          	srli	a5,a5,0x20
    80002254:	00fd8db3          	add	s11,s11,a5
    80002258:	000dc703          	lbu	a4,0(s11)
    8000225c:	00a00793          	li	a5,10
    80002260:	00900c93          	li	s9,9
    80002264:	f8e404a3          	sb	a4,-119(s0)
    80002268:	00065c63          	bgez	a2,80002280 <__printf+0x278>
    8000226c:	f9040713          	addi	a4,s0,-112
    80002270:	00f70733          	add	a4,a4,a5
    80002274:	02d00693          	li	a3,45
    80002278:	fed70823          	sb	a3,-16(a4)
    8000227c:	00078c93          	mv	s9,a5
    80002280:	f8040793          	addi	a5,s0,-128
    80002284:	01978cb3          	add	s9,a5,s9
    80002288:	f7f40d13          	addi	s10,s0,-129
    8000228c:	000cc503          	lbu	a0,0(s9)
    80002290:	fffc8c93          	addi	s9,s9,-1
    80002294:	00000097          	auipc	ra,0x0
    80002298:	b90080e7          	jalr	-1136(ra) # 80001e24 <consputc>
    8000229c:	ffac98e3          	bne	s9,s10,8000228c <__printf+0x284>
    800022a0:	00094503          	lbu	a0,0(s2)
    800022a4:	e00514e3          	bnez	a0,800020ac <__printf+0xa4>
    800022a8:	1a0c1663          	bnez	s8,80002454 <__printf+0x44c>
    800022ac:	08813083          	ld	ra,136(sp)
    800022b0:	08013403          	ld	s0,128(sp)
    800022b4:	07813483          	ld	s1,120(sp)
    800022b8:	07013903          	ld	s2,112(sp)
    800022bc:	06813983          	ld	s3,104(sp)
    800022c0:	06013a03          	ld	s4,96(sp)
    800022c4:	05813a83          	ld	s5,88(sp)
    800022c8:	05013b03          	ld	s6,80(sp)
    800022cc:	04813b83          	ld	s7,72(sp)
    800022d0:	04013c03          	ld	s8,64(sp)
    800022d4:	03813c83          	ld	s9,56(sp)
    800022d8:	03013d03          	ld	s10,48(sp)
    800022dc:	02813d83          	ld	s11,40(sp)
    800022e0:	0d010113          	addi	sp,sp,208
    800022e4:	00008067          	ret
    800022e8:	07300713          	li	a4,115
    800022ec:	1ce78a63          	beq	a5,a4,800024c0 <__printf+0x4b8>
    800022f0:	07800713          	li	a4,120
    800022f4:	1ee79e63          	bne	a5,a4,800024f0 <__printf+0x4e8>
    800022f8:	f7843783          	ld	a5,-136(s0)
    800022fc:	0007a703          	lw	a4,0(a5)
    80002300:	00878793          	addi	a5,a5,8
    80002304:	f6f43c23          	sd	a5,-136(s0)
    80002308:	28074263          	bltz	a4,8000258c <__printf+0x584>
    8000230c:	00002d97          	auipc	s11,0x2
    80002310:	f04d8d93          	addi	s11,s11,-252 # 80004210 <digits>
    80002314:	00f77793          	andi	a5,a4,15
    80002318:	00fd87b3          	add	a5,s11,a5
    8000231c:	0007c683          	lbu	a3,0(a5)
    80002320:	00f00613          	li	a2,15
    80002324:	0007079b          	sext.w	a5,a4
    80002328:	f8d40023          	sb	a3,-128(s0)
    8000232c:	0047559b          	srliw	a1,a4,0x4
    80002330:	0047569b          	srliw	a3,a4,0x4
    80002334:	00000c93          	li	s9,0
    80002338:	0ee65063          	bge	a2,a4,80002418 <__printf+0x410>
    8000233c:	00f6f693          	andi	a3,a3,15
    80002340:	00dd86b3          	add	a3,s11,a3
    80002344:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002348:	0087d79b          	srliw	a5,a5,0x8
    8000234c:	00100c93          	li	s9,1
    80002350:	f8d400a3          	sb	a3,-127(s0)
    80002354:	0cb67263          	bgeu	a2,a1,80002418 <__printf+0x410>
    80002358:	00f7f693          	andi	a3,a5,15
    8000235c:	00dd86b3          	add	a3,s11,a3
    80002360:	0006c583          	lbu	a1,0(a3)
    80002364:	00f00613          	li	a2,15
    80002368:	0047d69b          	srliw	a3,a5,0x4
    8000236c:	f8b40123          	sb	a1,-126(s0)
    80002370:	0047d593          	srli	a1,a5,0x4
    80002374:	28f67e63          	bgeu	a2,a5,80002610 <__printf+0x608>
    80002378:	00f6f693          	andi	a3,a3,15
    8000237c:	00dd86b3          	add	a3,s11,a3
    80002380:	0006c503          	lbu	a0,0(a3)
    80002384:	0087d813          	srli	a6,a5,0x8
    80002388:	0087d69b          	srliw	a3,a5,0x8
    8000238c:	f8a401a3          	sb	a0,-125(s0)
    80002390:	28b67663          	bgeu	a2,a1,8000261c <__printf+0x614>
    80002394:	00f6f693          	andi	a3,a3,15
    80002398:	00dd86b3          	add	a3,s11,a3
    8000239c:	0006c583          	lbu	a1,0(a3)
    800023a0:	00c7d513          	srli	a0,a5,0xc
    800023a4:	00c7d69b          	srliw	a3,a5,0xc
    800023a8:	f8b40223          	sb	a1,-124(s0)
    800023ac:	29067a63          	bgeu	a2,a6,80002640 <__printf+0x638>
    800023b0:	00f6f693          	andi	a3,a3,15
    800023b4:	00dd86b3          	add	a3,s11,a3
    800023b8:	0006c583          	lbu	a1,0(a3)
    800023bc:	0107d813          	srli	a6,a5,0x10
    800023c0:	0107d69b          	srliw	a3,a5,0x10
    800023c4:	f8b402a3          	sb	a1,-123(s0)
    800023c8:	28a67263          	bgeu	a2,a0,8000264c <__printf+0x644>
    800023cc:	00f6f693          	andi	a3,a3,15
    800023d0:	00dd86b3          	add	a3,s11,a3
    800023d4:	0006c683          	lbu	a3,0(a3)
    800023d8:	0147d79b          	srliw	a5,a5,0x14
    800023dc:	f8d40323          	sb	a3,-122(s0)
    800023e0:	21067663          	bgeu	a2,a6,800025ec <__printf+0x5e4>
    800023e4:	02079793          	slli	a5,a5,0x20
    800023e8:	0207d793          	srli	a5,a5,0x20
    800023ec:	00fd8db3          	add	s11,s11,a5
    800023f0:	000dc683          	lbu	a3,0(s11)
    800023f4:	00800793          	li	a5,8
    800023f8:	00700c93          	li	s9,7
    800023fc:	f8d403a3          	sb	a3,-121(s0)
    80002400:	00075c63          	bgez	a4,80002418 <__printf+0x410>
    80002404:	f9040713          	addi	a4,s0,-112
    80002408:	00f70733          	add	a4,a4,a5
    8000240c:	02d00693          	li	a3,45
    80002410:	fed70823          	sb	a3,-16(a4)
    80002414:	00078c93          	mv	s9,a5
    80002418:	f8040793          	addi	a5,s0,-128
    8000241c:	01978cb3          	add	s9,a5,s9
    80002420:	f7f40d13          	addi	s10,s0,-129
    80002424:	000cc503          	lbu	a0,0(s9)
    80002428:	fffc8c93          	addi	s9,s9,-1
    8000242c:	00000097          	auipc	ra,0x0
    80002430:	9f8080e7          	jalr	-1544(ra) # 80001e24 <consputc>
    80002434:	ff9d18e3          	bne	s10,s9,80002424 <__printf+0x41c>
    80002438:	0100006f          	j	80002448 <__printf+0x440>
    8000243c:	00000097          	auipc	ra,0x0
    80002440:	9e8080e7          	jalr	-1560(ra) # 80001e24 <consputc>
    80002444:	000c8493          	mv	s1,s9
    80002448:	00094503          	lbu	a0,0(s2)
    8000244c:	c60510e3          	bnez	a0,800020ac <__printf+0xa4>
    80002450:	e40c0ee3          	beqz	s8,800022ac <__printf+0x2a4>
    80002454:	00003517          	auipc	a0,0x3
    80002458:	1dc50513          	addi	a0,a0,476 # 80005630 <pr>
    8000245c:	00001097          	auipc	ra,0x1
    80002460:	94c080e7          	jalr	-1716(ra) # 80002da8 <release>
    80002464:	e49ff06f          	j	800022ac <__printf+0x2a4>
    80002468:	f7843783          	ld	a5,-136(s0)
    8000246c:	03000513          	li	a0,48
    80002470:	01000d13          	li	s10,16
    80002474:	00878713          	addi	a4,a5,8
    80002478:	0007bc83          	ld	s9,0(a5)
    8000247c:	f6e43c23          	sd	a4,-136(s0)
    80002480:	00000097          	auipc	ra,0x0
    80002484:	9a4080e7          	jalr	-1628(ra) # 80001e24 <consputc>
    80002488:	07800513          	li	a0,120
    8000248c:	00000097          	auipc	ra,0x0
    80002490:	998080e7          	jalr	-1640(ra) # 80001e24 <consputc>
    80002494:	00002d97          	auipc	s11,0x2
    80002498:	d7cd8d93          	addi	s11,s11,-644 # 80004210 <digits>
    8000249c:	03ccd793          	srli	a5,s9,0x3c
    800024a0:	00fd87b3          	add	a5,s11,a5
    800024a4:	0007c503          	lbu	a0,0(a5)
    800024a8:	fffd0d1b          	addiw	s10,s10,-1
    800024ac:	004c9c93          	slli	s9,s9,0x4
    800024b0:	00000097          	auipc	ra,0x0
    800024b4:	974080e7          	jalr	-1676(ra) # 80001e24 <consputc>
    800024b8:	fe0d12e3          	bnez	s10,8000249c <__printf+0x494>
    800024bc:	f8dff06f          	j	80002448 <__printf+0x440>
    800024c0:	f7843783          	ld	a5,-136(s0)
    800024c4:	0007bc83          	ld	s9,0(a5)
    800024c8:	00878793          	addi	a5,a5,8
    800024cc:	f6f43c23          	sd	a5,-136(s0)
    800024d0:	000c9a63          	bnez	s9,800024e4 <__printf+0x4dc>
    800024d4:	1080006f          	j	800025dc <__printf+0x5d4>
    800024d8:	001c8c93          	addi	s9,s9,1
    800024dc:	00000097          	auipc	ra,0x0
    800024e0:	948080e7          	jalr	-1720(ra) # 80001e24 <consputc>
    800024e4:	000cc503          	lbu	a0,0(s9)
    800024e8:	fe0518e3          	bnez	a0,800024d8 <__printf+0x4d0>
    800024ec:	f5dff06f          	j	80002448 <__printf+0x440>
    800024f0:	02500513          	li	a0,37
    800024f4:	00000097          	auipc	ra,0x0
    800024f8:	930080e7          	jalr	-1744(ra) # 80001e24 <consputc>
    800024fc:	000c8513          	mv	a0,s9
    80002500:	00000097          	auipc	ra,0x0
    80002504:	924080e7          	jalr	-1756(ra) # 80001e24 <consputc>
    80002508:	f41ff06f          	j	80002448 <__printf+0x440>
    8000250c:	02500513          	li	a0,37
    80002510:	00000097          	auipc	ra,0x0
    80002514:	914080e7          	jalr	-1772(ra) # 80001e24 <consputc>
    80002518:	f31ff06f          	j	80002448 <__printf+0x440>
    8000251c:	00030513          	mv	a0,t1
    80002520:	00000097          	auipc	ra,0x0
    80002524:	7bc080e7          	jalr	1980(ra) # 80002cdc <acquire>
    80002528:	b4dff06f          	j	80002074 <__printf+0x6c>
    8000252c:	40c0053b          	negw	a0,a2
    80002530:	00a00713          	li	a4,10
    80002534:	02e576bb          	remuw	a3,a0,a4
    80002538:	00002d97          	auipc	s11,0x2
    8000253c:	cd8d8d93          	addi	s11,s11,-808 # 80004210 <digits>
    80002540:	ff700593          	li	a1,-9
    80002544:	02069693          	slli	a3,a3,0x20
    80002548:	0206d693          	srli	a3,a3,0x20
    8000254c:	00dd86b3          	add	a3,s11,a3
    80002550:	0006c683          	lbu	a3,0(a3)
    80002554:	02e557bb          	divuw	a5,a0,a4
    80002558:	f8d40023          	sb	a3,-128(s0)
    8000255c:	10b65e63          	bge	a2,a1,80002678 <__printf+0x670>
    80002560:	06300593          	li	a1,99
    80002564:	02e7f6bb          	remuw	a3,a5,a4
    80002568:	02069693          	slli	a3,a3,0x20
    8000256c:	0206d693          	srli	a3,a3,0x20
    80002570:	00dd86b3          	add	a3,s11,a3
    80002574:	0006c683          	lbu	a3,0(a3)
    80002578:	02e7d73b          	divuw	a4,a5,a4
    8000257c:	00200793          	li	a5,2
    80002580:	f8d400a3          	sb	a3,-127(s0)
    80002584:	bca5ece3          	bltu	a1,a0,8000215c <__printf+0x154>
    80002588:	ce5ff06f          	j	8000226c <__printf+0x264>
    8000258c:	40e007bb          	negw	a5,a4
    80002590:	00002d97          	auipc	s11,0x2
    80002594:	c80d8d93          	addi	s11,s11,-896 # 80004210 <digits>
    80002598:	00f7f693          	andi	a3,a5,15
    8000259c:	00dd86b3          	add	a3,s11,a3
    800025a0:	0006c583          	lbu	a1,0(a3)
    800025a4:	ff100613          	li	a2,-15
    800025a8:	0047d69b          	srliw	a3,a5,0x4
    800025ac:	f8b40023          	sb	a1,-128(s0)
    800025b0:	0047d59b          	srliw	a1,a5,0x4
    800025b4:	0ac75e63          	bge	a4,a2,80002670 <__printf+0x668>
    800025b8:	00f6f693          	andi	a3,a3,15
    800025bc:	00dd86b3          	add	a3,s11,a3
    800025c0:	0006c603          	lbu	a2,0(a3)
    800025c4:	00f00693          	li	a3,15
    800025c8:	0087d79b          	srliw	a5,a5,0x8
    800025cc:	f8c400a3          	sb	a2,-127(s0)
    800025d0:	d8b6e4e3          	bltu	a3,a1,80002358 <__printf+0x350>
    800025d4:	00200793          	li	a5,2
    800025d8:	e2dff06f          	j	80002404 <__printf+0x3fc>
    800025dc:	00002c97          	auipc	s9,0x2
    800025e0:	c14c8c93          	addi	s9,s9,-1004 # 800041f0 <console_handler+0xd50>
    800025e4:	02800513          	li	a0,40
    800025e8:	ef1ff06f          	j	800024d8 <__printf+0x4d0>
    800025ec:	00700793          	li	a5,7
    800025f0:	00600c93          	li	s9,6
    800025f4:	e0dff06f          	j	80002400 <__printf+0x3f8>
    800025f8:	00700793          	li	a5,7
    800025fc:	00600c93          	li	s9,6
    80002600:	c69ff06f          	j	80002268 <__printf+0x260>
    80002604:	00300793          	li	a5,3
    80002608:	00200c93          	li	s9,2
    8000260c:	c5dff06f          	j	80002268 <__printf+0x260>
    80002610:	00300793          	li	a5,3
    80002614:	00200c93          	li	s9,2
    80002618:	de9ff06f          	j	80002400 <__printf+0x3f8>
    8000261c:	00400793          	li	a5,4
    80002620:	00300c93          	li	s9,3
    80002624:	dddff06f          	j	80002400 <__printf+0x3f8>
    80002628:	00400793          	li	a5,4
    8000262c:	00300c93          	li	s9,3
    80002630:	c39ff06f          	j	80002268 <__printf+0x260>
    80002634:	00500793          	li	a5,5
    80002638:	00400c93          	li	s9,4
    8000263c:	c2dff06f          	j	80002268 <__printf+0x260>
    80002640:	00500793          	li	a5,5
    80002644:	00400c93          	li	s9,4
    80002648:	db9ff06f          	j	80002400 <__printf+0x3f8>
    8000264c:	00600793          	li	a5,6
    80002650:	00500c93          	li	s9,5
    80002654:	dadff06f          	j	80002400 <__printf+0x3f8>
    80002658:	00600793          	li	a5,6
    8000265c:	00500c93          	li	s9,5
    80002660:	c09ff06f          	j	80002268 <__printf+0x260>
    80002664:	00800793          	li	a5,8
    80002668:	00700c93          	li	s9,7
    8000266c:	bfdff06f          	j	80002268 <__printf+0x260>
    80002670:	00100793          	li	a5,1
    80002674:	d91ff06f          	j	80002404 <__printf+0x3fc>
    80002678:	00100793          	li	a5,1
    8000267c:	bf1ff06f          	j	8000226c <__printf+0x264>
    80002680:	00900793          	li	a5,9
    80002684:	00800c93          	li	s9,8
    80002688:	be1ff06f          	j	80002268 <__printf+0x260>
    8000268c:	00002517          	auipc	a0,0x2
    80002690:	b6c50513          	addi	a0,a0,-1172 # 800041f8 <console_handler+0xd58>
    80002694:	00000097          	auipc	ra,0x0
    80002698:	918080e7          	jalr	-1768(ra) # 80001fac <panic>

000000008000269c <printfinit>:
    8000269c:	fe010113          	addi	sp,sp,-32
    800026a0:	00813823          	sd	s0,16(sp)
    800026a4:	00913423          	sd	s1,8(sp)
    800026a8:	00113c23          	sd	ra,24(sp)
    800026ac:	02010413          	addi	s0,sp,32
    800026b0:	00003497          	auipc	s1,0x3
    800026b4:	f8048493          	addi	s1,s1,-128 # 80005630 <pr>
    800026b8:	00048513          	mv	a0,s1
    800026bc:	00002597          	auipc	a1,0x2
    800026c0:	b4c58593          	addi	a1,a1,-1204 # 80004208 <console_handler+0xd68>
    800026c4:	00000097          	auipc	ra,0x0
    800026c8:	5f4080e7          	jalr	1524(ra) # 80002cb8 <initlock>
    800026cc:	01813083          	ld	ra,24(sp)
    800026d0:	01013403          	ld	s0,16(sp)
    800026d4:	0004ac23          	sw	zero,24(s1)
    800026d8:	00813483          	ld	s1,8(sp)
    800026dc:	02010113          	addi	sp,sp,32
    800026e0:	00008067          	ret

00000000800026e4 <uartinit>:
    800026e4:	ff010113          	addi	sp,sp,-16
    800026e8:	00813423          	sd	s0,8(sp)
    800026ec:	01010413          	addi	s0,sp,16
    800026f0:	100007b7          	lui	a5,0x10000
    800026f4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800026f8:	f8000713          	li	a4,-128
    800026fc:	00e781a3          	sb	a4,3(a5)
    80002700:	00300713          	li	a4,3
    80002704:	00e78023          	sb	a4,0(a5)
    80002708:	000780a3          	sb	zero,1(a5)
    8000270c:	00e781a3          	sb	a4,3(a5)
    80002710:	00700693          	li	a3,7
    80002714:	00d78123          	sb	a3,2(a5)
    80002718:	00e780a3          	sb	a4,1(a5)
    8000271c:	00813403          	ld	s0,8(sp)
    80002720:	01010113          	addi	sp,sp,16
    80002724:	00008067          	ret

0000000080002728 <uartputc>:
    80002728:	00002797          	auipc	a5,0x2
    8000272c:	cd07a783          	lw	a5,-816(a5) # 800043f8 <panicked>
    80002730:	00078463          	beqz	a5,80002738 <uartputc+0x10>
    80002734:	0000006f          	j	80002734 <uartputc+0xc>
    80002738:	fd010113          	addi	sp,sp,-48
    8000273c:	02813023          	sd	s0,32(sp)
    80002740:	00913c23          	sd	s1,24(sp)
    80002744:	01213823          	sd	s2,16(sp)
    80002748:	01313423          	sd	s3,8(sp)
    8000274c:	02113423          	sd	ra,40(sp)
    80002750:	03010413          	addi	s0,sp,48
    80002754:	00002917          	auipc	s2,0x2
    80002758:	cac90913          	addi	s2,s2,-852 # 80004400 <uart_tx_r>
    8000275c:	00093783          	ld	a5,0(s2)
    80002760:	00002497          	auipc	s1,0x2
    80002764:	ca848493          	addi	s1,s1,-856 # 80004408 <uart_tx_w>
    80002768:	0004b703          	ld	a4,0(s1)
    8000276c:	02078693          	addi	a3,a5,32
    80002770:	00050993          	mv	s3,a0
    80002774:	02e69c63          	bne	a3,a4,800027ac <uartputc+0x84>
    80002778:	00001097          	auipc	ra,0x1
    8000277c:	834080e7          	jalr	-1996(ra) # 80002fac <push_on>
    80002780:	00093783          	ld	a5,0(s2)
    80002784:	0004b703          	ld	a4,0(s1)
    80002788:	02078793          	addi	a5,a5,32
    8000278c:	00e79463          	bne	a5,a4,80002794 <uartputc+0x6c>
    80002790:	0000006f          	j	80002790 <uartputc+0x68>
    80002794:	00001097          	auipc	ra,0x1
    80002798:	88c080e7          	jalr	-1908(ra) # 80003020 <pop_on>
    8000279c:	00093783          	ld	a5,0(s2)
    800027a0:	0004b703          	ld	a4,0(s1)
    800027a4:	02078693          	addi	a3,a5,32
    800027a8:	fce688e3          	beq	a3,a4,80002778 <uartputc+0x50>
    800027ac:	01f77693          	andi	a3,a4,31
    800027b0:	00003597          	auipc	a1,0x3
    800027b4:	ea058593          	addi	a1,a1,-352 # 80005650 <uart_tx_buf>
    800027b8:	00d586b3          	add	a3,a1,a3
    800027bc:	00170713          	addi	a4,a4,1
    800027c0:	01368023          	sb	s3,0(a3)
    800027c4:	00e4b023          	sd	a4,0(s1)
    800027c8:	10000637          	lui	a2,0x10000
    800027cc:	02f71063          	bne	a4,a5,800027ec <uartputc+0xc4>
    800027d0:	0340006f          	j	80002804 <uartputc+0xdc>
    800027d4:	00074703          	lbu	a4,0(a4)
    800027d8:	00f93023          	sd	a5,0(s2)
    800027dc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800027e0:	00093783          	ld	a5,0(s2)
    800027e4:	0004b703          	ld	a4,0(s1)
    800027e8:	00f70e63          	beq	a4,a5,80002804 <uartputc+0xdc>
    800027ec:	00564683          	lbu	a3,5(a2)
    800027f0:	01f7f713          	andi	a4,a5,31
    800027f4:	00e58733          	add	a4,a1,a4
    800027f8:	0206f693          	andi	a3,a3,32
    800027fc:	00178793          	addi	a5,a5,1
    80002800:	fc069ae3          	bnez	a3,800027d4 <uartputc+0xac>
    80002804:	02813083          	ld	ra,40(sp)
    80002808:	02013403          	ld	s0,32(sp)
    8000280c:	01813483          	ld	s1,24(sp)
    80002810:	01013903          	ld	s2,16(sp)
    80002814:	00813983          	ld	s3,8(sp)
    80002818:	03010113          	addi	sp,sp,48
    8000281c:	00008067          	ret

0000000080002820 <uartputc_sync>:
    80002820:	ff010113          	addi	sp,sp,-16
    80002824:	00813423          	sd	s0,8(sp)
    80002828:	01010413          	addi	s0,sp,16
    8000282c:	00002717          	auipc	a4,0x2
    80002830:	bcc72703          	lw	a4,-1076(a4) # 800043f8 <panicked>
    80002834:	02071663          	bnez	a4,80002860 <uartputc_sync+0x40>
    80002838:	00050793          	mv	a5,a0
    8000283c:	100006b7          	lui	a3,0x10000
    80002840:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002844:	02077713          	andi	a4,a4,32
    80002848:	fe070ce3          	beqz	a4,80002840 <uartputc_sync+0x20>
    8000284c:	0ff7f793          	andi	a5,a5,255
    80002850:	00f68023          	sb	a5,0(a3)
    80002854:	00813403          	ld	s0,8(sp)
    80002858:	01010113          	addi	sp,sp,16
    8000285c:	00008067          	ret
    80002860:	0000006f          	j	80002860 <uartputc_sync+0x40>

0000000080002864 <uartstart>:
    80002864:	ff010113          	addi	sp,sp,-16
    80002868:	00813423          	sd	s0,8(sp)
    8000286c:	01010413          	addi	s0,sp,16
    80002870:	00002617          	auipc	a2,0x2
    80002874:	b9060613          	addi	a2,a2,-1136 # 80004400 <uart_tx_r>
    80002878:	00002517          	auipc	a0,0x2
    8000287c:	b9050513          	addi	a0,a0,-1136 # 80004408 <uart_tx_w>
    80002880:	00063783          	ld	a5,0(a2)
    80002884:	00053703          	ld	a4,0(a0)
    80002888:	04f70263          	beq	a4,a5,800028cc <uartstart+0x68>
    8000288c:	100005b7          	lui	a1,0x10000
    80002890:	00003817          	auipc	a6,0x3
    80002894:	dc080813          	addi	a6,a6,-576 # 80005650 <uart_tx_buf>
    80002898:	01c0006f          	j	800028b4 <uartstart+0x50>
    8000289c:	0006c703          	lbu	a4,0(a3)
    800028a0:	00f63023          	sd	a5,0(a2)
    800028a4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800028a8:	00063783          	ld	a5,0(a2)
    800028ac:	00053703          	ld	a4,0(a0)
    800028b0:	00f70e63          	beq	a4,a5,800028cc <uartstart+0x68>
    800028b4:	01f7f713          	andi	a4,a5,31
    800028b8:	00e806b3          	add	a3,a6,a4
    800028bc:	0055c703          	lbu	a4,5(a1)
    800028c0:	00178793          	addi	a5,a5,1
    800028c4:	02077713          	andi	a4,a4,32
    800028c8:	fc071ae3          	bnez	a4,8000289c <uartstart+0x38>
    800028cc:	00813403          	ld	s0,8(sp)
    800028d0:	01010113          	addi	sp,sp,16
    800028d4:	00008067          	ret

00000000800028d8 <uartgetc>:
    800028d8:	ff010113          	addi	sp,sp,-16
    800028dc:	00813423          	sd	s0,8(sp)
    800028e0:	01010413          	addi	s0,sp,16
    800028e4:	10000737          	lui	a4,0x10000
    800028e8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800028ec:	0017f793          	andi	a5,a5,1
    800028f0:	00078c63          	beqz	a5,80002908 <uartgetc+0x30>
    800028f4:	00074503          	lbu	a0,0(a4)
    800028f8:	0ff57513          	andi	a0,a0,255
    800028fc:	00813403          	ld	s0,8(sp)
    80002900:	01010113          	addi	sp,sp,16
    80002904:	00008067          	ret
    80002908:	fff00513          	li	a0,-1
    8000290c:	ff1ff06f          	j	800028fc <uartgetc+0x24>

0000000080002910 <uartintr>:
    80002910:	100007b7          	lui	a5,0x10000
    80002914:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80002918:	0017f793          	andi	a5,a5,1
    8000291c:	0a078463          	beqz	a5,800029c4 <uartintr+0xb4>
    80002920:	fe010113          	addi	sp,sp,-32
    80002924:	00813823          	sd	s0,16(sp)
    80002928:	00913423          	sd	s1,8(sp)
    8000292c:	00113c23          	sd	ra,24(sp)
    80002930:	02010413          	addi	s0,sp,32
    80002934:	100004b7          	lui	s1,0x10000
    80002938:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000293c:	0ff57513          	andi	a0,a0,255
    80002940:	fffff097          	auipc	ra,0xfffff
    80002944:	534080e7          	jalr	1332(ra) # 80001e74 <consoleintr>
    80002948:	0054c783          	lbu	a5,5(s1)
    8000294c:	0017f793          	andi	a5,a5,1
    80002950:	fe0794e3          	bnez	a5,80002938 <uartintr+0x28>
    80002954:	00002617          	auipc	a2,0x2
    80002958:	aac60613          	addi	a2,a2,-1364 # 80004400 <uart_tx_r>
    8000295c:	00002517          	auipc	a0,0x2
    80002960:	aac50513          	addi	a0,a0,-1364 # 80004408 <uart_tx_w>
    80002964:	00063783          	ld	a5,0(a2)
    80002968:	00053703          	ld	a4,0(a0)
    8000296c:	04f70263          	beq	a4,a5,800029b0 <uartintr+0xa0>
    80002970:	100005b7          	lui	a1,0x10000
    80002974:	00003817          	auipc	a6,0x3
    80002978:	cdc80813          	addi	a6,a6,-804 # 80005650 <uart_tx_buf>
    8000297c:	01c0006f          	j	80002998 <uartintr+0x88>
    80002980:	0006c703          	lbu	a4,0(a3)
    80002984:	00f63023          	sd	a5,0(a2)
    80002988:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000298c:	00063783          	ld	a5,0(a2)
    80002990:	00053703          	ld	a4,0(a0)
    80002994:	00f70e63          	beq	a4,a5,800029b0 <uartintr+0xa0>
    80002998:	01f7f713          	andi	a4,a5,31
    8000299c:	00e806b3          	add	a3,a6,a4
    800029a0:	0055c703          	lbu	a4,5(a1)
    800029a4:	00178793          	addi	a5,a5,1
    800029a8:	02077713          	andi	a4,a4,32
    800029ac:	fc071ae3          	bnez	a4,80002980 <uartintr+0x70>
    800029b0:	01813083          	ld	ra,24(sp)
    800029b4:	01013403          	ld	s0,16(sp)
    800029b8:	00813483          	ld	s1,8(sp)
    800029bc:	02010113          	addi	sp,sp,32
    800029c0:	00008067          	ret
    800029c4:	00002617          	auipc	a2,0x2
    800029c8:	a3c60613          	addi	a2,a2,-1476 # 80004400 <uart_tx_r>
    800029cc:	00002517          	auipc	a0,0x2
    800029d0:	a3c50513          	addi	a0,a0,-1476 # 80004408 <uart_tx_w>
    800029d4:	00063783          	ld	a5,0(a2)
    800029d8:	00053703          	ld	a4,0(a0)
    800029dc:	04f70263          	beq	a4,a5,80002a20 <uartintr+0x110>
    800029e0:	100005b7          	lui	a1,0x10000
    800029e4:	00003817          	auipc	a6,0x3
    800029e8:	c6c80813          	addi	a6,a6,-916 # 80005650 <uart_tx_buf>
    800029ec:	01c0006f          	j	80002a08 <uartintr+0xf8>
    800029f0:	0006c703          	lbu	a4,0(a3)
    800029f4:	00f63023          	sd	a5,0(a2)
    800029f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800029fc:	00063783          	ld	a5,0(a2)
    80002a00:	00053703          	ld	a4,0(a0)
    80002a04:	02f70063          	beq	a4,a5,80002a24 <uartintr+0x114>
    80002a08:	01f7f713          	andi	a4,a5,31
    80002a0c:	00e806b3          	add	a3,a6,a4
    80002a10:	0055c703          	lbu	a4,5(a1)
    80002a14:	00178793          	addi	a5,a5,1
    80002a18:	02077713          	andi	a4,a4,32
    80002a1c:	fc071ae3          	bnez	a4,800029f0 <uartintr+0xe0>
    80002a20:	00008067          	ret
    80002a24:	00008067          	ret

0000000080002a28 <kinit>:
    80002a28:	fc010113          	addi	sp,sp,-64
    80002a2c:	02913423          	sd	s1,40(sp)
    80002a30:	fffff7b7          	lui	a5,0xfffff
    80002a34:	00004497          	auipc	s1,0x4
    80002a38:	c3b48493          	addi	s1,s1,-965 # 8000666f <end+0xfff>
    80002a3c:	02813823          	sd	s0,48(sp)
    80002a40:	01313c23          	sd	s3,24(sp)
    80002a44:	00f4f4b3          	and	s1,s1,a5
    80002a48:	02113c23          	sd	ra,56(sp)
    80002a4c:	03213023          	sd	s2,32(sp)
    80002a50:	01413823          	sd	s4,16(sp)
    80002a54:	01513423          	sd	s5,8(sp)
    80002a58:	04010413          	addi	s0,sp,64
    80002a5c:	000017b7          	lui	a5,0x1
    80002a60:	01100993          	li	s3,17
    80002a64:	00f487b3          	add	a5,s1,a5
    80002a68:	01b99993          	slli	s3,s3,0x1b
    80002a6c:	06f9e063          	bltu	s3,a5,80002acc <kinit+0xa4>
    80002a70:	00003a97          	auipc	s5,0x3
    80002a74:	c00a8a93          	addi	s5,s5,-1024 # 80005670 <end>
    80002a78:	0754ec63          	bltu	s1,s5,80002af0 <kinit+0xc8>
    80002a7c:	0734fa63          	bgeu	s1,s3,80002af0 <kinit+0xc8>
    80002a80:	00088a37          	lui	s4,0x88
    80002a84:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002a88:	00002917          	auipc	s2,0x2
    80002a8c:	98890913          	addi	s2,s2,-1656 # 80004410 <kmem>
    80002a90:	00ca1a13          	slli	s4,s4,0xc
    80002a94:	0140006f          	j	80002aa8 <kinit+0x80>
    80002a98:	000017b7          	lui	a5,0x1
    80002a9c:	00f484b3          	add	s1,s1,a5
    80002aa0:	0554e863          	bltu	s1,s5,80002af0 <kinit+0xc8>
    80002aa4:	0534f663          	bgeu	s1,s3,80002af0 <kinit+0xc8>
    80002aa8:	00001637          	lui	a2,0x1
    80002aac:	00100593          	li	a1,1
    80002ab0:	00048513          	mv	a0,s1
    80002ab4:	00000097          	auipc	ra,0x0
    80002ab8:	5e4080e7          	jalr	1508(ra) # 80003098 <__memset>
    80002abc:	00093783          	ld	a5,0(s2)
    80002ac0:	00f4b023          	sd	a5,0(s1)
    80002ac4:	00993023          	sd	s1,0(s2)
    80002ac8:	fd4498e3          	bne	s1,s4,80002a98 <kinit+0x70>
    80002acc:	03813083          	ld	ra,56(sp)
    80002ad0:	03013403          	ld	s0,48(sp)
    80002ad4:	02813483          	ld	s1,40(sp)
    80002ad8:	02013903          	ld	s2,32(sp)
    80002adc:	01813983          	ld	s3,24(sp)
    80002ae0:	01013a03          	ld	s4,16(sp)
    80002ae4:	00813a83          	ld	s5,8(sp)
    80002ae8:	04010113          	addi	sp,sp,64
    80002aec:	00008067          	ret
    80002af0:	00001517          	auipc	a0,0x1
    80002af4:	73850513          	addi	a0,a0,1848 # 80004228 <digits+0x18>
    80002af8:	fffff097          	auipc	ra,0xfffff
    80002afc:	4b4080e7          	jalr	1204(ra) # 80001fac <panic>

0000000080002b00 <freerange>:
    80002b00:	fc010113          	addi	sp,sp,-64
    80002b04:	000017b7          	lui	a5,0x1
    80002b08:	02913423          	sd	s1,40(sp)
    80002b0c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80002b10:	009504b3          	add	s1,a0,s1
    80002b14:	fffff537          	lui	a0,0xfffff
    80002b18:	02813823          	sd	s0,48(sp)
    80002b1c:	02113c23          	sd	ra,56(sp)
    80002b20:	03213023          	sd	s2,32(sp)
    80002b24:	01313c23          	sd	s3,24(sp)
    80002b28:	01413823          	sd	s4,16(sp)
    80002b2c:	01513423          	sd	s5,8(sp)
    80002b30:	01613023          	sd	s6,0(sp)
    80002b34:	04010413          	addi	s0,sp,64
    80002b38:	00a4f4b3          	and	s1,s1,a0
    80002b3c:	00f487b3          	add	a5,s1,a5
    80002b40:	06f5e463          	bltu	a1,a5,80002ba8 <freerange+0xa8>
    80002b44:	00003a97          	auipc	s5,0x3
    80002b48:	b2ca8a93          	addi	s5,s5,-1236 # 80005670 <end>
    80002b4c:	0954e263          	bltu	s1,s5,80002bd0 <freerange+0xd0>
    80002b50:	01100993          	li	s3,17
    80002b54:	01b99993          	slli	s3,s3,0x1b
    80002b58:	0734fc63          	bgeu	s1,s3,80002bd0 <freerange+0xd0>
    80002b5c:	00058a13          	mv	s4,a1
    80002b60:	00002917          	auipc	s2,0x2
    80002b64:	8b090913          	addi	s2,s2,-1872 # 80004410 <kmem>
    80002b68:	00002b37          	lui	s6,0x2
    80002b6c:	0140006f          	j	80002b80 <freerange+0x80>
    80002b70:	000017b7          	lui	a5,0x1
    80002b74:	00f484b3          	add	s1,s1,a5
    80002b78:	0554ec63          	bltu	s1,s5,80002bd0 <freerange+0xd0>
    80002b7c:	0534fa63          	bgeu	s1,s3,80002bd0 <freerange+0xd0>
    80002b80:	00001637          	lui	a2,0x1
    80002b84:	00100593          	li	a1,1
    80002b88:	00048513          	mv	a0,s1
    80002b8c:	00000097          	auipc	ra,0x0
    80002b90:	50c080e7          	jalr	1292(ra) # 80003098 <__memset>
    80002b94:	00093703          	ld	a4,0(s2)
    80002b98:	016487b3          	add	a5,s1,s6
    80002b9c:	00e4b023          	sd	a4,0(s1)
    80002ba0:	00993023          	sd	s1,0(s2)
    80002ba4:	fcfa76e3          	bgeu	s4,a5,80002b70 <freerange+0x70>
    80002ba8:	03813083          	ld	ra,56(sp)
    80002bac:	03013403          	ld	s0,48(sp)
    80002bb0:	02813483          	ld	s1,40(sp)
    80002bb4:	02013903          	ld	s2,32(sp)
    80002bb8:	01813983          	ld	s3,24(sp)
    80002bbc:	01013a03          	ld	s4,16(sp)
    80002bc0:	00813a83          	ld	s5,8(sp)
    80002bc4:	00013b03          	ld	s6,0(sp)
    80002bc8:	04010113          	addi	sp,sp,64
    80002bcc:	00008067          	ret
    80002bd0:	00001517          	auipc	a0,0x1
    80002bd4:	65850513          	addi	a0,a0,1624 # 80004228 <digits+0x18>
    80002bd8:	fffff097          	auipc	ra,0xfffff
    80002bdc:	3d4080e7          	jalr	980(ra) # 80001fac <panic>

0000000080002be0 <kfree>:
    80002be0:	fe010113          	addi	sp,sp,-32
    80002be4:	00813823          	sd	s0,16(sp)
    80002be8:	00113c23          	sd	ra,24(sp)
    80002bec:	00913423          	sd	s1,8(sp)
    80002bf0:	02010413          	addi	s0,sp,32
    80002bf4:	03451793          	slli	a5,a0,0x34
    80002bf8:	04079c63          	bnez	a5,80002c50 <kfree+0x70>
    80002bfc:	00003797          	auipc	a5,0x3
    80002c00:	a7478793          	addi	a5,a5,-1420 # 80005670 <end>
    80002c04:	00050493          	mv	s1,a0
    80002c08:	04f56463          	bltu	a0,a5,80002c50 <kfree+0x70>
    80002c0c:	01100793          	li	a5,17
    80002c10:	01b79793          	slli	a5,a5,0x1b
    80002c14:	02f57e63          	bgeu	a0,a5,80002c50 <kfree+0x70>
    80002c18:	00001637          	lui	a2,0x1
    80002c1c:	00100593          	li	a1,1
    80002c20:	00000097          	auipc	ra,0x0
    80002c24:	478080e7          	jalr	1144(ra) # 80003098 <__memset>
    80002c28:	00001797          	auipc	a5,0x1
    80002c2c:	7e878793          	addi	a5,a5,2024 # 80004410 <kmem>
    80002c30:	0007b703          	ld	a4,0(a5)
    80002c34:	01813083          	ld	ra,24(sp)
    80002c38:	01013403          	ld	s0,16(sp)
    80002c3c:	00e4b023          	sd	a4,0(s1)
    80002c40:	0097b023          	sd	s1,0(a5)
    80002c44:	00813483          	ld	s1,8(sp)
    80002c48:	02010113          	addi	sp,sp,32
    80002c4c:	00008067          	ret
    80002c50:	00001517          	auipc	a0,0x1
    80002c54:	5d850513          	addi	a0,a0,1496 # 80004228 <digits+0x18>
    80002c58:	fffff097          	auipc	ra,0xfffff
    80002c5c:	354080e7          	jalr	852(ra) # 80001fac <panic>

0000000080002c60 <kalloc>:
    80002c60:	fe010113          	addi	sp,sp,-32
    80002c64:	00813823          	sd	s0,16(sp)
    80002c68:	00913423          	sd	s1,8(sp)
    80002c6c:	00113c23          	sd	ra,24(sp)
    80002c70:	02010413          	addi	s0,sp,32
    80002c74:	00001797          	auipc	a5,0x1
    80002c78:	79c78793          	addi	a5,a5,1948 # 80004410 <kmem>
    80002c7c:	0007b483          	ld	s1,0(a5)
    80002c80:	02048063          	beqz	s1,80002ca0 <kalloc+0x40>
    80002c84:	0004b703          	ld	a4,0(s1)
    80002c88:	00001637          	lui	a2,0x1
    80002c8c:	00500593          	li	a1,5
    80002c90:	00048513          	mv	a0,s1
    80002c94:	00e7b023          	sd	a4,0(a5)
    80002c98:	00000097          	auipc	ra,0x0
    80002c9c:	400080e7          	jalr	1024(ra) # 80003098 <__memset>
    80002ca0:	01813083          	ld	ra,24(sp)
    80002ca4:	01013403          	ld	s0,16(sp)
    80002ca8:	00048513          	mv	a0,s1
    80002cac:	00813483          	ld	s1,8(sp)
    80002cb0:	02010113          	addi	sp,sp,32
    80002cb4:	00008067          	ret

0000000080002cb8 <initlock>:
    80002cb8:	ff010113          	addi	sp,sp,-16
    80002cbc:	00813423          	sd	s0,8(sp)
    80002cc0:	01010413          	addi	s0,sp,16
    80002cc4:	00813403          	ld	s0,8(sp)
    80002cc8:	00b53423          	sd	a1,8(a0)
    80002ccc:	00052023          	sw	zero,0(a0)
    80002cd0:	00053823          	sd	zero,16(a0)
    80002cd4:	01010113          	addi	sp,sp,16
    80002cd8:	00008067          	ret

0000000080002cdc <acquire>:
    80002cdc:	fe010113          	addi	sp,sp,-32
    80002ce0:	00813823          	sd	s0,16(sp)
    80002ce4:	00913423          	sd	s1,8(sp)
    80002ce8:	00113c23          	sd	ra,24(sp)
    80002cec:	01213023          	sd	s2,0(sp)
    80002cf0:	02010413          	addi	s0,sp,32
    80002cf4:	00050493          	mv	s1,a0
    80002cf8:	10002973          	csrr	s2,sstatus
    80002cfc:	100027f3          	csrr	a5,sstatus
    80002d00:	ffd7f793          	andi	a5,a5,-3
    80002d04:	10079073          	csrw	sstatus,a5
    80002d08:	fffff097          	auipc	ra,0xfffff
    80002d0c:	8e8080e7          	jalr	-1816(ra) # 800015f0 <mycpu>
    80002d10:	07852783          	lw	a5,120(a0)
    80002d14:	06078e63          	beqz	a5,80002d90 <acquire+0xb4>
    80002d18:	fffff097          	auipc	ra,0xfffff
    80002d1c:	8d8080e7          	jalr	-1832(ra) # 800015f0 <mycpu>
    80002d20:	07852783          	lw	a5,120(a0)
    80002d24:	0004a703          	lw	a4,0(s1)
    80002d28:	0017879b          	addiw	a5,a5,1
    80002d2c:	06f52c23          	sw	a5,120(a0)
    80002d30:	04071063          	bnez	a4,80002d70 <acquire+0x94>
    80002d34:	00100713          	li	a4,1
    80002d38:	00070793          	mv	a5,a4
    80002d3c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80002d40:	0007879b          	sext.w	a5,a5
    80002d44:	fe079ae3          	bnez	a5,80002d38 <acquire+0x5c>
    80002d48:	0ff0000f          	fence
    80002d4c:	fffff097          	auipc	ra,0xfffff
    80002d50:	8a4080e7          	jalr	-1884(ra) # 800015f0 <mycpu>
    80002d54:	01813083          	ld	ra,24(sp)
    80002d58:	01013403          	ld	s0,16(sp)
    80002d5c:	00a4b823          	sd	a0,16(s1)
    80002d60:	00013903          	ld	s2,0(sp)
    80002d64:	00813483          	ld	s1,8(sp)
    80002d68:	02010113          	addi	sp,sp,32
    80002d6c:	00008067          	ret
    80002d70:	0104b903          	ld	s2,16(s1)
    80002d74:	fffff097          	auipc	ra,0xfffff
    80002d78:	87c080e7          	jalr	-1924(ra) # 800015f0 <mycpu>
    80002d7c:	faa91ce3          	bne	s2,a0,80002d34 <acquire+0x58>
    80002d80:	00001517          	auipc	a0,0x1
    80002d84:	4b050513          	addi	a0,a0,1200 # 80004230 <digits+0x20>
    80002d88:	fffff097          	auipc	ra,0xfffff
    80002d8c:	224080e7          	jalr	548(ra) # 80001fac <panic>
    80002d90:	00195913          	srli	s2,s2,0x1
    80002d94:	fffff097          	auipc	ra,0xfffff
    80002d98:	85c080e7          	jalr	-1956(ra) # 800015f0 <mycpu>
    80002d9c:	00197913          	andi	s2,s2,1
    80002da0:	07252e23          	sw	s2,124(a0)
    80002da4:	f75ff06f          	j	80002d18 <acquire+0x3c>

0000000080002da8 <release>:
    80002da8:	fe010113          	addi	sp,sp,-32
    80002dac:	00813823          	sd	s0,16(sp)
    80002db0:	00113c23          	sd	ra,24(sp)
    80002db4:	00913423          	sd	s1,8(sp)
    80002db8:	01213023          	sd	s2,0(sp)
    80002dbc:	02010413          	addi	s0,sp,32
    80002dc0:	00052783          	lw	a5,0(a0)
    80002dc4:	00079a63          	bnez	a5,80002dd8 <release+0x30>
    80002dc8:	00001517          	auipc	a0,0x1
    80002dcc:	47050513          	addi	a0,a0,1136 # 80004238 <digits+0x28>
    80002dd0:	fffff097          	auipc	ra,0xfffff
    80002dd4:	1dc080e7          	jalr	476(ra) # 80001fac <panic>
    80002dd8:	01053903          	ld	s2,16(a0)
    80002ddc:	00050493          	mv	s1,a0
    80002de0:	fffff097          	auipc	ra,0xfffff
    80002de4:	810080e7          	jalr	-2032(ra) # 800015f0 <mycpu>
    80002de8:	fea910e3          	bne	s2,a0,80002dc8 <release+0x20>
    80002dec:	0004b823          	sd	zero,16(s1)
    80002df0:	0ff0000f          	fence
    80002df4:	0f50000f          	fence	iorw,ow
    80002df8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80002dfc:	ffffe097          	auipc	ra,0xffffe
    80002e00:	7f4080e7          	jalr	2036(ra) # 800015f0 <mycpu>
    80002e04:	100027f3          	csrr	a5,sstatus
    80002e08:	0027f793          	andi	a5,a5,2
    80002e0c:	04079a63          	bnez	a5,80002e60 <release+0xb8>
    80002e10:	07852783          	lw	a5,120(a0)
    80002e14:	02f05e63          	blez	a5,80002e50 <release+0xa8>
    80002e18:	fff7871b          	addiw	a4,a5,-1
    80002e1c:	06e52c23          	sw	a4,120(a0)
    80002e20:	00071c63          	bnez	a4,80002e38 <release+0x90>
    80002e24:	07c52783          	lw	a5,124(a0)
    80002e28:	00078863          	beqz	a5,80002e38 <release+0x90>
    80002e2c:	100027f3          	csrr	a5,sstatus
    80002e30:	0027e793          	ori	a5,a5,2
    80002e34:	10079073          	csrw	sstatus,a5
    80002e38:	01813083          	ld	ra,24(sp)
    80002e3c:	01013403          	ld	s0,16(sp)
    80002e40:	00813483          	ld	s1,8(sp)
    80002e44:	00013903          	ld	s2,0(sp)
    80002e48:	02010113          	addi	sp,sp,32
    80002e4c:	00008067          	ret
    80002e50:	00001517          	auipc	a0,0x1
    80002e54:	40850513          	addi	a0,a0,1032 # 80004258 <digits+0x48>
    80002e58:	fffff097          	auipc	ra,0xfffff
    80002e5c:	154080e7          	jalr	340(ra) # 80001fac <panic>
    80002e60:	00001517          	auipc	a0,0x1
    80002e64:	3e050513          	addi	a0,a0,992 # 80004240 <digits+0x30>
    80002e68:	fffff097          	auipc	ra,0xfffff
    80002e6c:	144080e7          	jalr	324(ra) # 80001fac <panic>

0000000080002e70 <holding>:
    80002e70:	00052783          	lw	a5,0(a0)
    80002e74:	00079663          	bnez	a5,80002e80 <holding+0x10>
    80002e78:	00000513          	li	a0,0
    80002e7c:	00008067          	ret
    80002e80:	fe010113          	addi	sp,sp,-32
    80002e84:	00813823          	sd	s0,16(sp)
    80002e88:	00913423          	sd	s1,8(sp)
    80002e8c:	00113c23          	sd	ra,24(sp)
    80002e90:	02010413          	addi	s0,sp,32
    80002e94:	01053483          	ld	s1,16(a0)
    80002e98:	ffffe097          	auipc	ra,0xffffe
    80002e9c:	758080e7          	jalr	1880(ra) # 800015f0 <mycpu>
    80002ea0:	01813083          	ld	ra,24(sp)
    80002ea4:	01013403          	ld	s0,16(sp)
    80002ea8:	40a48533          	sub	a0,s1,a0
    80002eac:	00153513          	seqz	a0,a0
    80002eb0:	00813483          	ld	s1,8(sp)
    80002eb4:	02010113          	addi	sp,sp,32
    80002eb8:	00008067          	ret

0000000080002ebc <push_off>:
    80002ebc:	fe010113          	addi	sp,sp,-32
    80002ec0:	00813823          	sd	s0,16(sp)
    80002ec4:	00113c23          	sd	ra,24(sp)
    80002ec8:	00913423          	sd	s1,8(sp)
    80002ecc:	02010413          	addi	s0,sp,32
    80002ed0:	100024f3          	csrr	s1,sstatus
    80002ed4:	100027f3          	csrr	a5,sstatus
    80002ed8:	ffd7f793          	andi	a5,a5,-3
    80002edc:	10079073          	csrw	sstatus,a5
    80002ee0:	ffffe097          	auipc	ra,0xffffe
    80002ee4:	710080e7          	jalr	1808(ra) # 800015f0 <mycpu>
    80002ee8:	07852783          	lw	a5,120(a0)
    80002eec:	02078663          	beqz	a5,80002f18 <push_off+0x5c>
    80002ef0:	ffffe097          	auipc	ra,0xffffe
    80002ef4:	700080e7          	jalr	1792(ra) # 800015f0 <mycpu>
    80002ef8:	07852783          	lw	a5,120(a0)
    80002efc:	01813083          	ld	ra,24(sp)
    80002f00:	01013403          	ld	s0,16(sp)
    80002f04:	0017879b          	addiw	a5,a5,1
    80002f08:	06f52c23          	sw	a5,120(a0)
    80002f0c:	00813483          	ld	s1,8(sp)
    80002f10:	02010113          	addi	sp,sp,32
    80002f14:	00008067          	ret
    80002f18:	0014d493          	srli	s1,s1,0x1
    80002f1c:	ffffe097          	auipc	ra,0xffffe
    80002f20:	6d4080e7          	jalr	1748(ra) # 800015f0 <mycpu>
    80002f24:	0014f493          	andi	s1,s1,1
    80002f28:	06952e23          	sw	s1,124(a0)
    80002f2c:	fc5ff06f          	j	80002ef0 <push_off+0x34>

0000000080002f30 <pop_off>:
    80002f30:	ff010113          	addi	sp,sp,-16
    80002f34:	00813023          	sd	s0,0(sp)
    80002f38:	00113423          	sd	ra,8(sp)
    80002f3c:	01010413          	addi	s0,sp,16
    80002f40:	ffffe097          	auipc	ra,0xffffe
    80002f44:	6b0080e7          	jalr	1712(ra) # 800015f0 <mycpu>
    80002f48:	100027f3          	csrr	a5,sstatus
    80002f4c:	0027f793          	andi	a5,a5,2
    80002f50:	04079663          	bnez	a5,80002f9c <pop_off+0x6c>
    80002f54:	07852783          	lw	a5,120(a0)
    80002f58:	02f05a63          	blez	a5,80002f8c <pop_off+0x5c>
    80002f5c:	fff7871b          	addiw	a4,a5,-1
    80002f60:	06e52c23          	sw	a4,120(a0)
    80002f64:	00071c63          	bnez	a4,80002f7c <pop_off+0x4c>
    80002f68:	07c52783          	lw	a5,124(a0)
    80002f6c:	00078863          	beqz	a5,80002f7c <pop_off+0x4c>
    80002f70:	100027f3          	csrr	a5,sstatus
    80002f74:	0027e793          	ori	a5,a5,2
    80002f78:	10079073          	csrw	sstatus,a5
    80002f7c:	00813083          	ld	ra,8(sp)
    80002f80:	00013403          	ld	s0,0(sp)
    80002f84:	01010113          	addi	sp,sp,16
    80002f88:	00008067          	ret
    80002f8c:	00001517          	auipc	a0,0x1
    80002f90:	2cc50513          	addi	a0,a0,716 # 80004258 <digits+0x48>
    80002f94:	fffff097          	auipc	ra,0xfffff
    80002f98:	018080e7          	jalr	24(ra) # 80001fac <panic>
    80002f9c:	00001517          	auipc	a0,0x1
    80002fa0:	2a450513          	addi	a0,a0,676 # 80004240 <digits+0x30>
    80002fa4:	fffff097          	auipc	ra,0xfffff
    80002fa8:	008080e7          	jalr	8(ra) # 80001fac <panic>

0000000080002fac <push_on>:
    80002fac:	fe010113          	addi	sp,sp,-32
    80002fb0:	00813823          	sd	s0,16(sp)
    80002fb4:	00113c23          	sd	ra,24(sp)
    80002fb8:	00913423          	sd	s1,8(sp)
    80002fbc:	02010413          	addi	s0,sp,32
    80002fc0:	100024f3          	csrr	s1,sstatus
    80002fc4:	100027f3          	csrr	a5,sstatus
    80002fc8:	0027e793          	ori	a5,a5,2
    80002fcc:	10079073          	csrw	sstatus,a5
    80002fd0:	ffffe097          	auipc	ra,0xffffe
    80002fd4:	620080e7          	jalr	1568(ra) # 800015f0 <mycpu>
    80002fd8:	07852783          	lw	a5,120(a0)
    80002fdc:	02078663          	beqz	a5,80003008 <push_on+0x5c>
    80002fe0:	ffffe097          	auipc	ra,0xffffe
    80002fe4:	610080e7          	jalr	1552(ra) # 800015f0 <mycpu>
    80002fe8:	07852783          	lw	a5,120(a0)
    80002fec:	01813083          	ld	ra,24(sp)
    80002ff0:	01013403          	ld	s0,16(sp)
    80002ff4:	0017879b          	addiw	a5,a5,1
    80002ff8:	06f52c23          	sw	a5,120(a0)
    80002ffc:	00813483          	ld	s1,8(sp)
    80003000:	02010113          	addi	sp,sp,32
    80003004:	00008067          	ret
    80003008:	0014d493          	srli	s1,s1,0x1
    8000300c:	ffffe097          	auipc	ra,0xffffe
    80003010:	5e4080e7          	jalr	1508(ra) # 800015f0 <mycpu>
    80003014:	0014f493          	andi	s1,s1,1
    80003018:	06952e23          	sw	s1,124(a0)
    8000301c:	fc5ff06f          	j	80002fe0 <push_on+0x34>

0000000080003020 <pop_on>:
    80003020:	ff010113          	addi	sp,sp,-16
    80003024:	00813023          	sd	s0,0(sp)
    80003028:	00113423          	sd	ra,8(sp)
    8000302c:	01010413          	addi	s0,sp,16
    80003030:	ffffe097          	auipc	ra,0xffffe
    80003034:	5c0080e7          	jalr	1472(ra) # 800015f0 <mycpu>
    80003038:	100027f3          	csrr	a5,sstatus
    8000303c:	0027f793          	andi	a5,a5,2
    80003040:	04078463          	beqz	a5,80003088 <pop_on+0x68>
    80003044:	07852783          	lw	a5,120(a0)
    80003048:	02f05863          	blez	a5,80003078 <pop_on+0x58>
    8000304c:	fff7879b          	addiw	a5,a5,-1
    80003050:	06f52c23          	sw	a5,120(a0)
    80003054:	07853783          	ld	a5,120(a0)
    80003058:	00079863          	bnez	a5,80003068 <pop_on+0x48>
    8000305c:	100027f3          	csrr	a5,sstatus
    80003060:	ffd7f793          	andi	a5,a5,-3
    80003064:	10079073          	csrw	sstatus,a5
    80003068:	00813083          	ld	ra,8(sp)
    8000306c:	00013403          	ld	s0,0(sp)
    80003070:	01010113          	addi	sp,sp,16
    80003074:	00008067          	ret
    80003078:	00001517          	auipc	a0,0x1
    8000307c:	20850513          	addi	a0,a0,520 # 80004280 <digits+0x70>
    80003080:	fffff097          	auipc	ra,0xfffff
    80003084:	f2c080e7          	jalr	-212(ra) # 80001fac <panic>
    80003088:	00001517          	auipc	a0,0x1
    8000308c:	1d850513          	addi	a0,a0,472 # 80004260 <digits+0x50>
    80003090:	fffff097          	auipc	ra,0xfffff
    80003094:	f1c080e7          	jalr	-228(ra) # 80001fac <panic>

0000000080003098 <__memset>:
    80003098:	ff010113          	addi	sp,sp,-16
    8000309c:	00813423          	sd	s0,8(sp)
    800030a0:	01010413          	addi	s0,sp,16
    800030a4:	1a060e63          	beqz	a2,80003260 <__memset+0x1c8>
    800030a8:	40a007b3          	neg	a5,a0
    800030ac:	0077f793          	andi	a5,a5,7
    800030b0:	00778693          	addi	a3,a5,7
    800030b4:	00b00813          	li	a6,11
    800030b8:	0ff5f593          	andi	a1,a1,255
    800030bc:	fff6071b          	addiw	a4,a2,-1
    800030c0:	1b06e663          	bltu	a3,a6,8000326c <__memset+0x1d4>
    800030c4:	1cd76463          	bltu	a4,a3,8000328c <__memset+0x1f4>
    800030c8:	1a078e63          	beqz	a5,80003284 <__memset+0x1ec>
    800030cc:	00b50023          	sb	a1,0(a0)
    800030d0:	00100713          	li	a4,1
    800030d4:	1ae78463          	beq	a5,a4,8000327c <__memset+0x1e4>
    800030d8:	00b500a3          	sb	a1,1(a0)
    800030dc:	00200713          	li	a4,2
    800030e0:	1ae78a63          	beq	a5,a4,80003294 <__memset+0x1fc>
    800030e4:	00b50123          	sb	a1,2(a0)
    800030e8:	00300713          	li	a4,3
    800030ec:	18e78463          	beq	a5,a4,80003274 <__memset+0x1dc>
    800030f0:	00b501a3          	sb	a1,3(a0)
    800030f4:	00400713          	li	a4,4
    800030f8:	1ae78263          	beq	a5,a4,8000329c <__memset+0x204>
    800030fc:	00b50223          	sb	a1,4(a0)
    80003100:	00500713          	li	a4,5
    80003104:	1ae78063          	beq	a5,a4,800032a4 <__memset+0x20c>
    80003108:	00b502a3          	sb	a1,5(a0)
    8000310c:	00700713          	li	a4,7
    80003110:	18e79e63          	bne	a5,a4,800032ac <__memset+0x214>
    80003114:	00b50323          	sb	a1,6(a0)
    80003118:	00700e93          	li	t4,7
    8000311c:	00859713          	slli	a4,a1,0x8
    80003120:	00e5e733          	or	a4,a1,a4
    80003124:	01059e13          	slli	t3,a1,0x10
    80003128:	01c76e33          	or	t3,a4,t3
    8000312c:	01859313          	slli	t1,a1,0x18
    80003130:	006e6333          	or	t1,t3,t1
    80003134:	02059893          	slli	a7,a1,0x20
    80003138:	40f60e3b          	subw	t3,a2,a5
    8000313c:	011368b3          	or	a7,t1,a7
    80003140:	02859813          	slli	a6,a1,0x28
    80003144:	0108e833          	or	a6,a7,a6
    80003148:	03059693          	slli	a3,a1,0x30
    8000314c:	003e589b          	srliw	a7,t3,0x3
    80003150:	00d866b3          	or	a3,a6,a3
    80003154:	03859713          	slli	a4,a1,0x38
    80003158:	00389813          	slli	a6,a7,0x3
    8000315c:	00f507b3          	add	a5,a0,a5
    80003160:	00e6e733          	or	a4,a3,a4
    80003164:	000e089b          	sext.w	a7,t3
    80003168:	00f806b3          	add	a3,a6,a5
    8000316c:	00e7b023          	sd	a4,0(a5)
    80003170:	00878793          	addi	a5,a5,8
    80003174:	fed79ce3          	bne	a5,a3,8000316c <__memset+0xd4>
    80003178:	ff8e7793          	andi	a5,t3,-8
    8000317c:	0007871b          	sext.w	a4,a5
    80003180:	01d787bb          	addw	a5,a5,t4
    80003184:	0ce88e63          	beq	a7,a4,80003260 <__memset+0x1c8>
    80003188:	00f50733          	add	a4,a0,a5
    8000318c:	00b70023          	sb	a1,0(a4)
    80003190:	0017871b          	addiw	a4,a5,1
    80003194:	0cc77663          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    80003198:	00e50733          	add	a4,a0,a4
    8000319c:	00b70023          	sb	a1,0(a4)
    800031a0:	0027871b          	addiw	a4,a5,2
    800031a4:	0ac77e63          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    800031a8:	00e50733          	add	a4,a0,a4
    800031ac:	00b70023          	sb	a1,0(a4)
    800031b0:	0037871b          	addiw	a4,a5,3
    800031b4:	0ac77663          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    800031b8:	00e50733          	add	a4,a0,a4
    800031bc:	00b70023          	sb	a1,0(a4)
    800031c0:	0047871b          	addiw	a4,a5,4
    800031c4:	08c77e63          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    800031c8:	00e50733          	add	a4,a0,a4
    800031cc:	00b70023          	sb	a1,0(a4)
    800031d0:	0057871b          	addiw	a4,a5,5
    800031d4:	08c77663          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    800031d8:	00e50733          	add	a4,a0,a4
    800031dc:	00b70023          	sb	a1,0(a4)
    800031e0:	0067871b          	addiw	a4,a5,6
    800031e4:	06c77e63          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    800031e8:	00e50733          	add	a4,a0,a4
    800031ec:	00b70023          	sb	a1,0(a4)
    800031f0:	0077871b          	addiw	a4,a5,7
    800031f4:	06c77663          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    800031f8:	00e50733          	add	a4,a0,a4
    800031fc:	00b70023          	sb	a1,0(a4)
    80003200:	0087871b          	addiw	a4,a5,8
    80003204:	04c77e63          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    80003208:	00e50733          	add	a4,a0,a4
    8000320c:	00b70023          	sb	a1,0(a4)
    80003210:	0097871b          	addiw	a4,a5,9
    80003214:	04c77663          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    80003218:	00e50733          	add	a4,a0,a4
    8000321c:	00b70023          	sb	a1,0(a4)
    80003220:	00a7871b          	addiw	a4,a5,10
    80003224:	02c77e63          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    80003228:	00e50733          	add	a4,a0,a4
    8000322c:	00b70023          	sb	a1,0(a4)
    80003230:	00b7871b          	addiw	a4,a5,11
    80003234:	02c77663          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    80003238:	00e50733          	add	a4,a0,a4
    8000323c:	00b70023          	sb	a1,0(a4)
    80003240:	00c7871b          	addiw	a4,a5,12
    80003244:	00c77e63          	bgeu	a4,a2,80003260 <__memset+0x1c8>
    80003248:	00e50733          	add	a4,a0,a4
    8000324c:	00b70023          	sb	a1,0(a4)
    80003250:	00d7879b          	addiw	a5,a5,13
    80003254:	00c7f663          	bgeu	a5,a2,80003260 <__memset+0x1c8>
    80003258:	00f507b3          	add	a5,a0,a5
    8000325c:	00b78023          	sb	a1,0(a5)
    80003260:	00813403          	ld	s0,8(sp)
    80003264:	01010113          	addi	sp,sp,16
    80003268:	00008067          	ret
    8000326c:	00b00693          	li	a3,11
    80003270:	e55ff06f          	j	800030c4 <__memset+0x2c>
    80003274:	00300e93          	li	t4,3
    80003278:	ea5ff06f          	j	8000311c <__memset+0x84>
    8000327c:	00100e93          	li	t4,1
    80003280:	e9dff06f          	j	8000311c <__memset+0x84>
    80003284:	00000e93          	li	t4,0
    80003288:	e95ff06f          	j	8000311c <__memset+0x84>
    8000328c:	00000793          	li	a5,0
    80003290:	ef9ff06f          	j	80003188 <__memset+0xf0>
    80003294:	00200e93          	li	t4,2
    80003298:	e85ff06f          	j	8000311c <__memset+0x84>
    8000329c:	00400e93          	li	t4,4
    800032a0:	e7dff06f          	j	8000311c <__memset+0x84>
    800032a4:	00500e93          	li	t4,5
    800032a8:	e75ff06f          	j	8000311c <__memset+0x84>
    800032ac:	00600e93          	li	t4,6
    800032b0:	e6dff06f          	j	8000311c <__memset+0x84>

00000000800032b4 <__memmove>:
    800032b4:	ff010113          	addi	sp,sp,-16
    800032b8:	00813423          	sd	s0,8(sp)
    800032bc:	01010413          	addi	s0,sp,16
    800032c0:	0e060863          	beqz	a2,800033b0 <__memmove+0xfc>
    800032c4:	fff6069b          	addiw	a3,a2,-1
    800032c8:	0006881b          	sext.w	a6,a3
    800032cc:	0ea5e863          	bltu	a1,a0,800033bc <__memmove+0x108>
    800032d0:	00758713          	addi	a4,a1,7
    800032d4:	00a5e7b3          	or	a5,a1,a0
    800032d8:	40a70733          	sub	a4,a4,a0
    800032dc:	0077f793          	andi	a5,a5,7
    800032e0:	00f73713          	sltiu	a4,a4,15
    800032e4:	00174713          	xori	a4,a4,1
    800032e8:	0017b793          	seqz	a5,a5
    800032ec:	00e7f7b3          	and	a5,a5,a4
    800032f0:	10078863          	beqz	a5,80003400 <__memmove+0x14c>
    800032f4:	00900793          	li	a5,9
    800032f8:	1107f463          	bgeu	a5,a6,80003400 <__memmove+0x14c>
    800032fc:	0036581b          	srliw	a6,a2,0x3
    80003300:	fff8081b          	addiw	a6,a6,-1
    80003304:	02081813          	slli	a6,a6,0x20
    80003308:	01d85893          	srli	a7,a6,0x1d
    8000330c:	00858813          	addi	a6,a1,8
    80003310:	00058793          	mv	a5,a1
    80003314:	00050713          	mv	a4,a0
    80003318:	01088833          	add	a6,a7,a6
    8000331c:	0007b883          	ld	a7,0(a5)
    80003320:	00878793          	addi	a5,a5,8
    80003324:	00870713          	addi	a4,a4,8
    80003328:	ff173c23          	sd	a7,-8(a4)
    8000332c:	ff0798e3          	bne	a5,a6,8000331c <__memmove+0x68>
    80003330:	ff867713          	andi	a4,a2,-8
    80003334:	02071793          	slli	a5,a4,0x20
    80003338:	0207d793          	srli	a5,a5,0x20
    8000333c:	00f585b3          	add	a1,a1,a5
    80003340:	40e686bb          	subw	a3,a3,a4
    80003344:	00f507b3          	add	a5,a0,a5
    80003348:	06e60463          	beq	a2,a4,800033b0 <__memmove+0xfc>
    8000334c:	0005c703          	lbu	a4,0(a1)
    80003350:	00e78023          	sb	a4,0(a5)
    80003354:	04068e63          	beqz	a3,800033b0 <__memmove+0xfc>
    80003358:	0015c603          	lbu	a2,1(a1)
    8000335c:	00100713          	li	a4,1
    80003360:	00c780a3          	sb	a2,1(a5)
    80003364:	04e68663          	beq	a3,a4,800033b0 <__memmove+0xfc>
    80003368:	0025c603          	lbu	a2,2(a1)
    8000336c:	00200713          	li	a4,2
    80003370:	00c78123          	sb	a2,2(a5)
    80003374:	02e68e63          	beq	a3,a4,800033b0 <__memmove+0xfc>
    80003378:	0035c603          	lbu	a2,3(a1)
    8000337c:	00300713          	li	a4,3
    80003380:	00c781a3          	sb	a2,3(a5)
    80003384:	02e68663          	beq	a3,a4,800033b0 <__memmove+0xfc>
    80003388:	0045c603          	lbu	a2,4(a1)
    8000338c:	00400713          	li	a4,4
    80003390:	00c78223          	sb	a2,4(a5)
    80003394:	00e68e63          	beq	a3,a4,800033b0 <__memmove+0xfc>
    80003398:	0055c603          	lbu	a2,5(a1)
    8000339c:	00500713          	li	a4,5
    800033a0:	00c782a3          	sb	a2,5(a5)
    800033a4:	00e68663          	beq	a3,a4,800033b0 <__memmove+0xfc>
    800033a8:	0065c703          	lbu	a4,6(a1)
    800033ac:	00e78323          	sb	a4,6(a5)
    800033b0:	00813403          	ld	s0,8(sp)
    800033b4:	01010113          	addi	sp,sp,16
    800033b8:	00008067          	ret
    800033bc:	02061713          	slli	a4,a2,0x20
    800033c0:	02075713          	srli	a4,a4,0x20
    800033c4:	00e587b3          	add	a5,a1,a4
    800033c8:	f0f574e3          	bgeu	a0,a5,800032d0 <__memmove+0x1c>
    800033cc:	02069613          	slli	a2,a3,0x20
    800033d0:	02065613          	srli	a2,a2,0x20
    800033d4:	fff64613          	not	a2,a2
    800033d8:	00e50733          	add	a4,a0,a4
    800033dc:	00c78633          	add	a2,a5,a2
    800033e0:	fff7c683          	lbu	a3,-1(a5)
    800033e4:	fff78793          	addi	a5,a5,-1
    800033e8:	fff70713          	addi	a4,a4,-1
    800033ec:	00d70023          	sb	a3,0(a4)
    800033f0:	fec798e3          	bne	a5,a2,800033e0 <__memmove+0x12c>
    800033f4:	00813403          	ld	s0,8(sp)
    800033f8:	01010113          	addi	sp,sp,16
    800033fc:	00008067          	ret
    80003400:	02069713          	slli	a4,a3,0x20
    80003404:	02075713          	srli	a4,a4,0x20
    80003408:	00170713          	addi	a4,a4,1
    8000340c:	00e50733          	add	a4,a0,a4
    80003410:	00050793          	mv	a5,a0
    80003414:	0005c683          	lbu	a3,0(a1)
    80003418:	00178793          	addi	a5,a5,1
    8000341c:	00158593          	addi	a1,a1,1
    80003420:	fed78fa3          	sb	a3,-1(a5)
    80003424:	fee798e3          	bne	a5,a4,80003414 <__memmove+0x160>
    80003428:	f89ff06f          	j	800033b0 <__memmove+0xfc>

000000008000342c <__putc>:
    8000342c:	fe010113          	addi	sp,sp,-32
    80003430:	00813823          	sd	s0,16(sp)
    80003434:	00113c23          	sd	ra,24(sp)
    80003438:	02010413          	addi	s0,sp,32
    8000343c:	00050793          	mv	a5,a0
    80003440:	fef40593          	addi	a1,s0,-17
    80003444:	00100613          	li	a2,1
    80003448:	00000513          	li	a0,0
    8000344c:	fef407a3          	sb	a5,-17(s0)
    80003450:	fffff097          	auipc	ra,0xfffff
    80003454:	b3c080e7          	jalr	-1220(ra) # 80001f8c <console_write>
    80003458:	01813083          	ld	ra,24(sp)
    8000345c:	01013403          	ld	s0,16(sp)
    80003460:	02010113          	addi	sp,sp,32
    80003464:	00008067          	ret

0000000080003468 <__getc>:
    80003468:	fe010113          	addi	sp,sp,-32
    8000346c:	00813823          	sd	s0,16(sp)
    80003470:	00113c23          	sd	ra,24(sp)
    80003474:	02010413          	addi	s0,sp,32
    80003478:	fe840593          	addi	a1,s0,-24
    8000347c:	00100613          	li	a2,1
    80003480:	00000513          	li	a0,0
    80003484:	fffff097          	auipc	ra,0xfffff
    80003488:	ae8080e7          	jalr	-1304(ra) # 80001f6c <console_read>
    8000348c:	fe844503          	lbu	a0,-24(s0)
    80003490:	01813083          	ld	ra,24(sp)
    80003494:	01013403          	ld	s0,16(sp)
    80003498:	02010113          	addi	sp,sp,32
    8000349c:	00008067          	ret

00000000800034a0 <console_handler>:
    800034a0:	fe010113          	addi	sp,sp,-32
    800034a4:	00813823          	sd	s0,16(sp)
    800034a8:	00113c23          	sd	ra,24(sp)
    800034ac:	00913423          	sd	s1,8(sp)
    800034b0:	02010413          	addi	s0,sp,32
    800034b4:	14202773          	csrr	a4,scause
    800034b8:	100027f3          	csrr	a5,sstatus
    800034bc:	0027f793          	andi	a5,a5,2
    800034c0:	06079e63          	bnez	a5,8000353c <console_handler+0x9c>
    800034c4:	00074c63          	bltz	a4,800034dc <console_handler+0x3c>
    800034c8:	01813083          	ld	ra,24(sp)
    800034cc:	01013403          	ld	s0,16(sp)
    800034d0:	00813483          	ld	s1,8(sp)
    800034d4:	02010113          	addi	sp,sp,32
    800034d8:	00008067          	ret
    800034dc:	0ff77713          	andi	a4,a4,255
    800034e0:	00900793          	li	a5,9
    800034e4:	fef712e3          	bne	a4,a5,800034c8 <console_handler+0x28>
    800034e8:	ffffe097          	auipc	ra,0xffffe
    800034ec:	6dc080e7          	jalr	1756(ra) # 80001bc4 <plic_claim>
    800034f0:	00a00793          	li	a5,10
    800034f4:	00050493          	mv	s1,a0
    800034f8:	02f50c63          	beq	a0,a5,80003530 <console_handler+0x90>
    800034fc:	fc0506e3          	beqz	a0,800034c8 <console_handler+0x28>
    80003500:	00050593          	mv	a1,a0
    80003504:	00001517          	auipc	a0,0x1
    80003508:	c8450513          	addi	a0,a0,-892 # 80004188 <console_handler+0xce8>
    8000350c:	fffff097          	auipc	ra,0xfffff
    80003510:	afc080e7          	jalr	-1284(ra) # 80002008 <__printf>
    80003514:	01013403          	ld	s0,16(sp)
    80003518:	01813083          	ld	ra,24(sp)
    8000351c:	00048513          	mv	a0,s1
    80003520:	00813483          	ld	s1,8(sp)
    80003524:	02010113          	addi	sp,sp,32
    80003528:	ffffe317          	auipc	t1,0xffffe
    8000352c:	6d430067          	jr	1748(t1) # 80001bfc <plic_complete>
    80003530:	fffff097          	auipc	ra,0xfffff
    80003534:	3e0080e7          	jalr	992(ra) # 80002910 <uartintr>
    80003538:	fddff06f          	j	80003514 <console_handler+0x74>
    8000353c:	00001517          	auipc	a0,0x1
    80003540:	d4c50513          	addi	a0,a0,-692 # 80004288 <digits+0x78>
    80003544:	fffff097          	auipc	ra,0xfffff
    80003548:	a68080e7          	jalr	-1432(ra) # 80001fac <panic>
	...
