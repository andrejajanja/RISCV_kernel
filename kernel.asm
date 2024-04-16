
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
    8000001c:	338010ef          	jal	ra,80001354 <start>

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
    80001084:	160000ef          	jal	ra,800011e4 <_Z12ecallHandlerv>

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
    asm("mv a1, %0;"
        "li a0, 0x01;": : "r"(size));
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
    80001144:	00050513          	mv	a0,a0
    asm("li a0, 0x02;"
                 "mv a1, %0;"
                 "ecall;": "=r"(pointer));
    return (int)readA0();
    80001148:	0005051b          	sext.w	a0,a0
    8000114c:	00813403          	ld	s0,8(sp)
    80001150:	01010113          	addi	sp,sp,16
    80001154:	00008067          	ret

0000000080001158 <main>:
//
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"


int main(){
    80001158:	ff010113          	addi	sp,sp,-16
    8000115c:	00113423          	sd	ra,8(sp)
    80001160:	00813023          	sd	s0,0(sp)
    80001164:	01010413          	addi	s0,sp,16
    //initialize system data structures and register values
    initializeSystemRegisters();
    80001168:	00000097          	auipc	ra,0x0
    8000116c:	030080e7          	jalr	48(ra) # 80001198 <_Z25initializeSystemRegistersv>

    int* ptr1 = (int*)mem_alloc(10);
    80001170:	00a00513          	li	a0,10
    80001174:	00000097          	auipc	ra,0x0
    80001178:	f9c080e7          	jalr	-100(ra) # 80001110 <_Z9mem_allocm>
    ptr1++;

    stopEmulator();
    8000117c:	00000097          	auipc	ra,0x0
    80001180:	040080e7          	jalr	64(ra) # 800011bc <_Z12stopEmulatorv>
    return 0;
    80001184:	00000513          	li	a0,0
    80001188:	00813083          	ld	ra,8(sp)
    8000118c:	00013403          	ld	s0,0(sp)
    80001190:	01010113          	addi	sp,sp,16
    80001194:	00008067          	ret

0000000080001198 <_Z25initializeSystemRegistersv>:
// Created by os on 4/15/24.
//

#include "../h/riscv.hpp"

void initializeSystemRegisters(){
    80001198:	ff010113          	addi	sp,sp,-16
    8000119c:	00813423          	sd	s0,8(sp)
    800011a0:	01010413          	addi	s0,sp,16
    writeStvec((uint64)&ecallWrapper);
    800011a4:	00003797          	auipc	a5,0x3
    800011a8:	22c7b783          	ld	a5,556(a5) # 800043d0 <_GLOBAL_OFFSET_TABLE_+0x10>
    return value;
}

//write ops
inline void writeStvec(uint64 value){
    asm("csrw stvec, %0;": :"r"(value));
    800011ac:	10579073          	csrw	stvec,a5
    //asm("la t0, _Z12ecallWrapperv;"
        //"csrw stvec, t0;");
}
    800011b0:	00813403          	ld	s0,8(sp)
    800011b4:	01010113          	addi	sp,sp,16
    800011b8:	00008067          	ret

00000000800011bc <_Z12stopEmulatorv>:

void stopEmulator(){
    800011bc:	ff010113          	addi	sp,sp,-16
    800011c0:	00813423          	sd	s0,8(sp)
    800011c4:	01010413          	addi	s0,sp,16
    //defined in project file
    asm("la t0, 0x100000;" //adress
         "la t1, 0x5555;" //value
         "sw t1, 0(t0);");
    800011c8:	001002b7          	lui	t0,0x100
    800011cc:	00005337          	lui	t1,0x5
    800011d0:	5553031b          	addiw	t1,t1,1365
    800011d4:	0062a023          	sw	t1,0(t0) # 100000 <_entry-0x7ff00000>
}
    800011d8:	00813403          	ld	s0,8(sp)
    800011dc:	01010113          	addi	sp,sp,16
    800011e0:	00008067          	ret

00000000800011e4 <_Z12ecallHandlerv>:

void ecallHandler(){
    800011e4:	fe010113          	addi	sp,sp,-32
    800011e8:	00113c23          	sd	ra,24(sp)
    800011ec:	00813823          	sd	s0,16(sp)
    800011f0:	00913423          	sd	s1,8(sp)
    800011f4:	01213023          	sd	s2,0(sp)
    800011f8:	02010413          	addi	s0,sp,32
    asm("csrr %0, scause;": "=r"(value));
    800011fc:	14202773          	csrr	a4,scause
    asm("csrr %0, sepc;": "=r"(value));
    80001200:	141024f3          	csrr	s1,sepc
    uint64 scause = readScause();
    uint64 sepc = readSepc()+4;
    80001204:	00448493          	addi	s1,s1,4
    uint64 sstatus = readSstatus();
    //handle for timer interrupt
    if(scause == 0x8000000000000001UL){
    80001208:	fff00793          	li	a5,-1
    8000120c:	03f79793          	slli	a5,a5,0x3f
    80001210:	00178793          	addi	a5,a5,1
    80001214:	02f70863          	beq	a4,a5,80001244 <_Z12ecallHandlerv+0x60>
        //trigger context switch or something
        printString("TIMER SIGNAL");
        writeSepc(sepc);
        writeSstatus(sstatus);
        return;
    }else if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL){
    80001218:	ff870713          	addi	a4,a4,-8
    8000121c:	00100793          	li	a5,1
    80001220:	04e7fc63          	bgeu	a5,a4,80001278 <_Z12ecallHandlerv+0x94>
    80001224:	00003497          	auipc	s1,0x3
    80001228:	e6448493          	addi	s1,s1,-412 # 80004088 <console_handler+0xbf8>
void ecallHandler();
void stopEmulator();

//some ubiquidous functions
inline void printString(const char* str){
    while (*str != '\0'){
    8000122c:	0004c503          	lbu	a0,0(s1)
    80001230:	0e050c63          	beqz	a0,80001328 <_Z12ecallHandlerv+0x144>
        __putc(*str);
    80001234:	00002097          	auipc	ra,0x2
    80001238:	1e8080e7          	jalr	488(ra) # 8000341c <__putc>
        str++;
    8000123c:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001240:	fedff06f          	j	8000122c <_Z12ecallHandlerv+0x48>
    80001244:	00003917          	auipc	s2,0x3
    80001248:	dbc90913          	addi	s2,s2,-580 # 80004000 <console_handler+0xb70>
    8000124c:	00094503          	lbu	a0,0(s2)
    80001250:	00050a63          	beqz	a0,80001264 <_Z12ecallHandlerv+0x80>
        __putc(*str);
    80001254:	00002097          	auipc	ra,0x2
    80001258:	1c8080e7          	jalr	456(ra) # 8000341c <__putc>
        str++;
    8000125c:	00190913          	addi	s2,s2,1
    while (*str != '\0'){
    80001260:	fedff06f          	j	8000124c <_Z12ecallHandlerv+0x68>
    }
    __putc('\n');
    80001264:	00a00513          	li	a0,10
    80001268:	00002097          	auipc	ra,0x2
    8000126c:	1b4080e7          	jalr	436(ra) # 8000341c <__putc>
    asm("csrw sepc, %0;": : "r"(value));
    80001270:	14149073          	csrw	sepc,s1
        return;
    80001274:	0c80006f          	j	8000133c <_Z12ecallHandlerv+0x158>
    asm("mv %0, a0;": "=r"(value));
    80001278:	00050793          	mv	a5,a0
        //handle for ecall as a software interrupt
        uint64 opCode = readA0();
        switch (opCode) {
    8000127c:	00100713          	li	a4,1
    80001280:	02e78663          	beq	a5,a4,800012ac <_Z12ecallHandlerv+0xc8>
    80001284:	00200713          	li	a4,2
    80001288:	04e78c63          	beq	a5,a4,800012e0 <_Z12ecallHandlerv+0xfc>
    8000128c:	00003917          	auipc	s2,0x3
    80001290:	db490913          	addi	s2,s2,-588 # 80004040 <console_handler+0xbb0>
    while (*str != '\0'){
    80001294:	00094503          	lbu	a0,0(s2)
    80001298:	06050c63          	beqz	a0,80001310 <_Z12ecallHandlerv+0x12c>
        __putc(*str);
    8000129c:	00002097          	auipc	ra,0x2
    800012a0:	180080e7          	jalr	384(ra) # 8000341c <__putc>
        str++;
    800012a4:	00190913          	addi	s2,s2,1
    while (*str != '\0'){
    800012a8:	fedff06f          	j	80001294 <_Z12ecallHandlerv+0xb0>
    800012ac:	00003917          	auipc	s2,0x3
    800012b0:	d6490913          	addi	s2,s2,-668 # 80004010 <console_handler+0xb80>
    800012b4:	00094503          	lbu	a0,0(s2)
    800012b8:	00050a63          	beqz	a0,800012cc <_Z12ecallHandlerv+0xe8>
        __putc(*str);
    800012bc:	00002097          	auipc	ra,0x2
    800012c0:	160080e7          	jalr	352(ra) # 8000341c <__putc>
        str++;
    800012c4:	00190913          	addi	s2,s2,1
    while (*str != '\0'){
    800012c8:	fedff06f          	j	800012b4 <_Z12ecallHandlerv+0xd0>
    __putc('\n');
    800012cc:	00a00513          	li	a0,10
    800012d0:	00002097          	auipc	ra,0x2
    800012d4:	14c080e7          	jalr	332(ra) # 8000341c <__putc>
    asm("csrw sepc, %0;": : "r"(value));
    800012d8:	14149073          	csrw	sepc,s1
                break;
        };

        writeSepc(sepc);
        writeSstatus(sstatus);
        return;
    800012dc:	0600006f          	j	8000133c <_Z12ecallHandlerv+0x158>
        switch (opCode) {
    800012e0:	00003917          	auipc	s2,0x3
    800012e4:	d4890913          	addi	s2,s2,-696 # 80004028 <console_handler+0xb98>
    while (*str != '\0'){
    800012e8:	00094503          	lbu	a0,0(s2)
    800012ec:	00050a63          	beqz	a0,80001300 <_Z12ecallHandlerv+0x11c>
        __putc(*str);
    800012f0:	00002097          	auipc	ra,0x2
    800012f4:	12c080e7          	jalr	300(ra) # 8000341c <__putc>
        str++;
    800012f8:	00190913          	addi	s2,s2,1
    while (*str != '\0'){
    800012fc:	fedff06f          	j	800012e8 <_Z12ecallHandlerv+0x104>
    __putc('\n');
    80001300:	00a00513          	li	a0,10
    80001304:	00002097          	auipc	ra,0x2
    80001308:	118080e7          	jalr	280(ra) # 8000341c <__putc>
    return;
    8000130c:	fcdff06f          	j	800012d8 <_Z12ecallHandlerv+0xf4>
    __putc('\n');
    80001310:	00a00513          	li	a0,10
    80001314:	00002097          	auipc	ra,0x2
    80001318:	108080e7          	jalr	264(ra) # 8000341c <__putc>
                stopEmulator();
    8000131c:	00000097          	auipc	ra,0x0
    80001320:	ea0080e7          	jalr	-352(ra) # 800011bc <_Z12stopEmulatorv>
                break;
    80001324:	fb5ff06f          	j	800012d8 <_Z12ecallHandlerv+0xf4>
    80001328:	00a00513          	li	a0,10
    8000132c:	00002097          	auipc	ra,0x2
    80001330:	0f0080e7          	jalr	240(ra) # 8000341c <__putc>
    }

    //this is error case, because no other case should go here, print something
    printString("ERROR: Unknown scause value, shutting down...");
    stopEmulator();
    80001334:	00000097          	auipc	ra,0x0
    80001338:	e88080e7          	jalr	-376(ra) # 800011bc <_Z12stopEmulatorv>
    8000133c:	01813083          	ld	ra,24(sp)
    80001340:	01013403          	ld	s0,16(sp)
    80001344:	00813483          	ld	s1,8(sp)
    80001348:	00013903          	ld	s2,0(sp)
    8000134c:	02010113          	addi	sp,sp,32
    80001350:	00008067          	ret

0000000080001354 <start>:
    80001354:	ff010113          	addi	sp,sp,-16
    80001358:	00813423          	sd	s0,8(sp)
    8000135c:	01010413          	addi	s0,sp,16
    80001360:	300027f3          	csrr	a5,mstatus
    80001364:	ffffe737          	lui	a4,0xffffe
    80001368:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff918f>
    8000136c:	00e7f7b3          	and	a5,a5,a4
    80001370:	00001737          	lui	a4,0x1
    80001374:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001378:	00e7e7b3          	or	a5,a5,a4
    8000137c:	30079073          	csrw	mstatus,a5
    80001380:	00000797          	auipc	a5,0x0
    80001384:	16078793          	addi	a5,a5,352 # 800014e0 <system_main>
    80001388:	34179073          	csrw	mepc,a5
    8000138c:	00000793          	li	a5,0
    80001390:	18079073          	csrw	satp,a5
    80001394:	000107b7          	lui	a5,0x10
    80001398:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000139c:	30279073          	csrw	medeleg,a5
    800013a0:	30379073          	csrw	mideleg,a5
    800013a4:	104027f3          	csrr	a5,sie
    800013a8:	2227e793          	ori	a5,a5,546
    800013ac:	10479073          	csrw	sie,a5
    800013b0:	fff00793          	li	a5,-1
    800013b4:	00a7d793          	srli	a5,a5,0xa
    800013b8:	3b079073          	csrw	pmpaddr0,a5
    800013bc:	00f00793          	li	a5,15
    800013c0:	3a079073          	csrw	pmpcfg0,a5
    800013c4:	f14027f3          	csrr	a5,mhartid
    800013c8:	0200c737          	lui	a4,0x200c
    800013cc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800013d0:	0007869b          	sext.w	a3,a5
    800013d4:	00269713          	slli	a4,a3,0x2
    800013d8:	000f4637          	lui	a2,0xf4
    800013dc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800013e0:	00d70733          	add	a4,a4,a3
    800013e4:	0037979b          	slliw	a5,a5,0x3
    800013e8:	020046b7          	lui	a3,0x2004
    800013ec:	00d787b3          	add	a5,a5,a3
    800013f0:	00c585b3          	add	a1,a1,a2
    800013f4:	00371693          	slli	a3,a4,0x3
    800013f8:	00003717          	auipc	a4,0x3
    800013fc:	02870713          	addi	a4,a4,40 # 80004420 <timer_scratch>
    80001400:	00b7b023          	sd	a1,0(a5)
    80001404:	00d70733          	add	a4,a4,a3
    80001408:	00f73c23          	sd	a5,24(a4)
    8000140c:	02c73023          	sd	a2,32(a4)
    80001410:	34071073          	csrw	mscratch,a4
    80001414:	00000797          	auipc	a5,0x0
    80001418:	6ec78793          	addi	a5,a5,1772 # 80001b00 <timervec>
    8000141c:	30579073          	csrw	mtvec,a5
    80001420:	300027f3          	csrr	a5,mstatus
    80001424:	0087e793          	ori	a5,a5,8
    80001428:	30079073          	csrw	mstatus,a5
    8000142c:	304027f3          	csrr	a5,mie
    80001430:	0807e793          	ori	a5,a5,128
    80001434:	30479073          	csrw	mie,a5
    80001438:	f14027f3          	csrr	a5,mhartid
    8000143c:	0007879b          	sext.w	a5,a5
    80001440:	00078213          	mv	tp,a5
    80001444:	30200073          	mret
    80001448:	00813403          	ld	s0,8(sp)
    8000144c:	01010113          	addi	sp,sp,16
    80001450:	00008067          	ret

0000000080001454 <timerinit>:
    80001454:	ff010113          	addi	sp,sp,-16
    80001458:	00813423          	sd	s0,8(sp)
    8000145c:	01010413          	addi	s0,sp,16
    80001460:	f14027f3          	csrr	a5,mhartid
    80001464:	0200c737          	lui	a4,0x200c
    80001468:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000146c:	0007869b          	sext.w	a3,a5
    80001470:	00269713          	slli	a4,a3,0x2
    80001474:	000f4637          	lui	a2,0xf4
    80001478:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000147c:	00d70733          	add	a4,a4,a3
    80001480:	0037979b          	slliw	a5,a5,0x3
    80001484:	020046b7          	lui	a3,0x2004
    80001488:	00d787b3          	add	a5,a5,a3
    8000148c:	00c585b3          	add	a1,a1,a2
    80001490:	00371693          	slli	a3,a4,0x3
    80001494:	00003717          	auipc	a4,0x3
    80001498:	f8c70713          	addi	a4,a4,-116 # 80004420 <timer_scratch>
    8000149c:	00b7b023          	sd	a1,0(a5)
    800014a0:	00d70733          	add	a4,a4,a3
    800014a4:	00f73c23          	sd	a5,24(a4)
    800014a8:	02c73023          	sd	a2,32(a4)
    800014ac:	34071073          	csrw	mscratch,a4
    800014b0:	00000797          	auipc	a5,0x0
    800014b4:	65078793          	addi	a5,a5,1616 # 80001b00 <timervec>
    800014b8:	30579073          	csrw	mtvec,a5
    800014bc:	300027f3          	csrr	a5,mstatus
    800014c0:	0087e793          	ori	a5,a5,8
    800014c4:	30079073          	csrw	mstatus,a5
    800014c8:	304027f3          	csrr	a5,mie
    800014cc:	0807e793          	ori	a5,a5,128
    800014d0:	30479073          	csrw	mie,a5
    800014d4:	00813403          	ld	s0,8(sp)
    800014d8:	01010113          	addi	sp,sp,16
    800014dc:	00008067          	ret

00000000800014e0 <system_main>:
    800014e0:	fe010113          	addi	sp,sp,-32
    800014e4:	00813823          	sd	s0,16(sp)
    800014e8:	00913423          	sd	s1,8(sp)
    800014ec:	00113c23          	sd	ra,24(sp)
    800014f0:	02010413          	addi	s0,sp,32
    800014f4:	00000097          	auipc	ra,0x0
    800014f8:	0c4080e7          	jalr	196(ra) # 800015b8 <cpuid>
    800014fc:	00003497          	auipc	s1,0x3
    80001500:	ef448493          	addi	s1,s1,-268 # 800043f0 <started>
    80001504:	02050263          	beqz	a0,80001528 <system_main+0x48>
    80001508:	0004a783          	lw	a5,0(s1)
    8000150c:	0007879b          	sext.w	a5,a5
    80001510:	fe078ce3          	beqz	a5,80001508 <system_main+0x28>
    80001514:	0ff0000f          	fence
    80001518:	00003517          	auipc	a0,0x3
    8000151c:	bd050513          	addi	a0,a0,-1072 # 800040e8 <console_handler+0xc58>
    80001520:	00001097          	auipc	ra,0x1
    80001524:	a7c080e7          	jalr	-1412(ra) # 80001f9c <panic>
    80001528:	00001097          	auipc	ra,0x1
    8000152c:	9d0080e7          	jalr	-1584(ra) # 80001ef8 <consoleinit>
    80001530:	00001097          	auipc	ra,0x1
    80001534:	15c080e7          	jalr	348(ra) # 8000268c <printfinit>
    80001538:	00003517          	auipc	a0,0x3
    8000153c:	c9050513          	addi	a0,a0,-880 # 800041c8 <console_handler+0xd38>
    80001540:	00001097          	auipc	ra,0x1
    80001544:	ab8080e7          	jalr	-1352(ra) # 80001ff8 <__printf>
    80001548:	00003517          	auipc	a0,0x3
    8000154c:	b7050513          	addi	a0,a0,-1168 # 800040b8 <console_handler+0xc28>
    80001550:	00001097          	auipc	ra,0x1
    80001554:	aa8080e7          	jalr	-1368(ra) # 80001ff8 <__printf>
    80001558:	00003517          	auipc	a0,0x3
    8000155c:	c7050513          	addi	a0,a0,-912 # 800041c8 <console_handler+0xd38>
    80001560:	00001097          	auipc	ra,0x1
    80001564:	a98080e7          	jalr	-1384(ra) # 80001ff8 <__printf>
    80001568:	00001097          	auipc	ra,0x1
    8000156c:	4b0080e7          	jalr	1200(ra) # 80002a18 <kinit>
    80001570:	00000097          	auipc	ra,0x0
    80001574:	148080e7          	jalr	328(ra) # 800016b8 <trapinit>
    80001578:	00000097          	auipc	ra,0x0
    8000157c:	16c080e7          	jalr	364(ra) # 800016e4 <trapinithart>
    80001580:	00000097          	auipc	ra,0x0
    80001584:	5c0080e7          	jalr	1472(ra) # 80001b40 <plicinit>
    80001588:	00000097          	auipc	ra,0x0
    8000158c:	5e0080e7          	jalr	1504(ra) # 80001b68 <plicinithart>
    80001590:	00000097          	auipc	ra,0x0
    80001594:	078080e7          	jalr	120(ra) # 80001608 <userinit>
    80001598:	0ff0000f          	fence
    8000159c:	00100793          	li	a5,1
    800015a0:	00003517          	auipc	a0,0x3
    800015a4:	b3050513          	addi	a0,a0,-1232 # 800040d0 <console_handler+0xc40>
    800015a8:	00f4a023          	sw	a5,0(s1)
    800015ac:	00001097          	auipc	ra,0x1
    800015b0:	a4c080e7          	jalr	-1460(ra) # 80001ff8 <__printf>
    800015b4:	0000006f          	j	800015b4 <system_main+0xd4>

00000000800015b8 <cpuid>:
    800015b8:	ff010113          	addi	sp,sp,-16
    800015bc:	00813423          	sd	s0,8(sp)
    800015c0:	01010413          	addi	s0,sp,16
    800015c4:	00020513          	mv	a0,tp
    800015c8:	00813403          	ld	s0,8(sp)
    800015cc:	0005051b          	sext.w	a0,a0
    800015d0:	01010113          	addi	sp,sp,16
    800015d4:	00008067          	ret

00000000800015d8 <mycpu>:
    800015d8:	ff010113          	addi	sp,sp,-16
    800015dc:	00813423          	sd	s0,8(sp)
    800015e0:	01010413          	addi	s0,sp,16
    800015e4:	00020793          	mv	a5,tp
    800015e8:	00813403          	ld	s0,8(sp)
    800015ec:	0007879b          	sext.w	a5,a5
    800015f0:	00779793          	slli	a5,a5,0x7
    800015f4:	00004517          	auipc	a0,0x4
    800015f8:	e5c50513          	addi	a0,a0,-420 # 80005450 <cpus>
    800015fc:	00f50533          	add	a0,a0,a5
    80001600:	01010113          	addi	sp,sp,16
    80001604:	00008067          	ret

0000000080001608 <userinit>:
    80001608:	ff010113          	addi	sp,sp,-16
    8000160c:	00813423          	sd	s0,8(sp)
    80001610:	01010413          	addi	s0,sp,16
    80001614:	00813403          	ld	s0,8(sp)
    80001618:	01010113          	addi	sp,sp,16
    8000161c:	00000317          	auipc	t1,0x0
    80001620:	b3c30067          	jr	-1220(t1) # 80001158 <main>

0000000080001624 <either_copyout>:
    80001624:	ff010113          	addi	sp,sp,-16
    80001628:	00813023          	sd	s0,0(sp)
    8000162c:	00113423          	sd	ra,8(sp)
    80001630:	01010413          	addi	s0,sp,16
    80001634:	02051663          	bnez	a0,80001660 <either_copyout+0x3c>
    80001638:	00058513          	mv	a0,a1
    8000163c:	00060593          	mv	a1,a2
    80001640:	0006861b          	sext.w	a2,a3
    80001644:	00002097          	auipc	ra,0x2
    80001648:	c60080e7          	jalr	-928(ra) # 800032a4 <__memmove>
    8000164c:	00813083          	ld	ra,8(sp)
    80001650:	00013403          	ld	s0,0(sp)
    80001654:	00000513          	li	a0,0
    80001658:	01010113          	addi	sp,sp,16
    8000165c:	00008067          	ret
    80001660:	00003517          	auipc	a0,0x3
    80001664:	ab050513          	addi	a0,a0,-1360 # 80004110 <console_handler+0xc80>
    80001668:	00001097          	auipc	ra,0x1
    8000166c:	934080e7          	jalr	-1740(ra) # 80001f9c <panic>

0000000080001670 <either_copyin>:
    80001670:	ff010113          	addi	sp,sp,-16
    80001674:	00813023          	sd	s0,0(sp)
    80001678:	00113423          	sd	ra,8(sp)
    8000167c:	01010413          	addi	s0,sp,16
    80001680:	02059463          	bnez	a1,800016a8 <either_copyin+0x38>
    80001684:	00060593          	mv	a1,a2
    80001688:	0006861b          	sext.w	a2,a3
    8000168c:	00002097          	auipc	ra,0x2
    80001690:	c18080e7          	jalr	-1000(ra) # 800032a4 <__memmove>
    80001694:	00813083          	ld	ra,8(sp)
    80001698:	00013403          	ld	s0,0(sp)
    8000169c:	00000513          	li	a0,0
    800016a0:	01010113          	addi	sp,sp,16
    800016a4:	00008067          	ret
    800016a8:	00003517          	auipc	a0,0x3
    800016ac:	a9050513          	addi	a0,a0,-1392 # 80004138 <console_handler+0xca8>
    800016b0:	00001097          	auipc	ra,0x1
    800016b4:	8ec080e7          	jalr	-1812(ra) # 80001f9c <panic>

00000000800016b8 <trapinit>:
    800016b8:	ff010113          	addi	sp,sp,-16
    800016bc:	00813423          	sd	s0,8(sp)
    800016c0:	01010413          	addi	s0,sp,16
    800016c4:	00813403          	ld	s0,8(sp)
    800016c8:	00003597          	auipc	a1,0x3
    800016cc:	a9858593          	addi	a1,a1,-1384 # 80004160 <console_handler+0xcd0>
    800016d0:	00004517          	auipc	a0,0x4
    800016d4:	e0050513          	addi	a0,a0,-512 # 800054d0 <tickslock>
    800016d8:	01010113          	addi	sp,sp,16
    800016dc:	00001317          	auipc	t1,0x1
    800016e0:	5cc30067          	jr	1484(t1) # 80002ca8 <initlock>

00000000800016e4 <trapinithart>:
    800016e4:	ff010113          	addi	sp,sp,-16
    800016e8:	00813423          	sd	s0,8(sp)
    800016ec:	01010413          	addi	s0,sp,16
    800016f0:	00000797          	auipc	a5,0x0
    800016f4:	30078793          	addi	a5,a5,768 # 800019f0 <kernelvec>
    800016f8:	10579073          	csrw	stvec,a5
    800016fc:	00813403          	ld	s0,8(sp)
    80001700:	01010113          	addi	sp,sp,16
    80001704:	00008067          	ret

0000000080001708 <usertrap>:
    80001708:	ff010113          	addi	sp,sp,-16
    8000170c:	00813423          	sd	s0,8(sp)
    80001710:	01010413          	addi	s0,sp,16
    80001714:	00813403          	ld	s0,8(sp)
    80001718:	01010113          	addi	sp,sp,16
    8000171c:	00008067          	ret

0000000080001720 <usertrapret>:
    80001720:	ff010113          	addi	sp,sp,-16
    80001724:	00813423          	sd	s0,8(sp)
    80001728:	01010413          	addi	s0,sp,16
    8000172c:	00813403          	ld	s0,8(sp)
    80001730:	01010113          	addi	sp,sp,16
    80001734:	00008067          	ret

0000000080001738 <kerneltrap>:
    80001738:	fe010113          	addi	sp,sp,-32
    8000173c:	00813823          	sd	s0,16(sp)
    80001740:	00113c23          	sd	ra,24(sp)
    80001744:	00913423          	sd	s1,8(sp)
    80001748:	02010413          	addi	s0,sp,32
    8000174c:	142025f3          	csrr	a1,scause
    80001750:	100027f3          	csrr	a5,sstatus
    80001754:	0027f793          	andi	a5,a5,2
    80001758:	10079c63          	bnez	a5,80001870 <kerneltrap+0x138>
    8000175c:	142027f3          	csrr	a5,scause
    80001760:	0207ce63          	bltz	a5,8000179c <kerneltrap+0x64>
    80001764:	00003517          	auipc	a0,0x3
    80001768:	a4450513          	addi	a0,a0,-1468 # 800041a8 <console_handler+0xd18>
    8000176c:	00001097          	auipc	ra,0x1
    80001770:	88c080e7          	jalr	-1908(ra) # 80001ff8 <__printf>
    80001774:	141025f3          	csrr	a1,sepc
    80001778:	14302673          	csrr	a2,stval
    8000177c:	00003517          	auipc	a0,0x3
    80001780:	a3c50513          	addi	a0,a0,-1476 # 800041b8 <console_handler+0xd28>
    80001784:	00001097          	auipc	ra,0x1
    80001788:	874080e7          	jalr	-1932(ra) # 80001ff8 <__printf>
    8000178c:	00003517          	auipc	a0,0x3
    80001790:	a4450513          	addi	a0,a0,-1468 # 800041d0 <console_handler+0xd40>
    80001794:	00001097          	auipc	ra,0x1
    80001798:	808080e7          	jalr	-2040(ra) # 80001f9c <panic>
    8000179c:	0ff7f713          	andi	a4,a5,255
    800017a0:	00900693          	li	a3,9
    800017a4:	04d70063          	beq	a4,a3,800017e4 <kerneltrap+0xac>
    800017a8:	fff00713          	li	a4,-1
    800017ac:	03f71713          	slli	a4,a4,0x3f
    800017b0:	00170713          	addi	a4,a4,1
    800017b4:	fae798e3          	bne	a5,a4,80001764 <kerneltrap+0x2c>
    800017b8:	00000097          	auipc	ra,0x0
    800017bc:	e00080e7          	jalr	-512(ra) # 800015b8 <cpuid>
    800017c0:	06050663          	beqz	a0,8000182c <kerneltrap+0xf4>
    800017c4:	144027f3          	csrr	a5,sip
    800017c8:	ffd7f793          	andi	a5,a5,-3
    800017cc:	14479073          	csrw	sip,a5
    800017d0:	01813083          	ld	ra,24(sp)
    800017d4:	01013403          	ld	s0,16(sp)
    800017d8:	00813483          	ld	s1,8(sp)
    800017dc:	02010113          	addi	sp,sp,32
    800017e0:	00008067          	ret
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	3d0080e7          	jalr	976(ra) # 80001bb4 <plic_claim>
    800017ec:	00a00793          	li	a5,10
    800017f0:	00050493          	mv	s1,a0
    800017f4:	06f50863          	beq	a0,a5,80001864 <kerneltrap+0x12c>
    800017f8:	fc050ce3          	beqz	a0,800017d0 <kerneltrap+0x98>
    800017fc:	00050593          	mv	a1,a0
    80001800:	00003517          	auipc	a0,0x3
    80001804:	98850513          	addi	a0,a0,-1656 # 80004188 <console_handler+0xcf8>
    80001808:	00000097          	auipc	ra,0x0
    8000180c:	7f0080e7          	jalr	2032(ra) # 80001ff8 <__printf>
    80001810:	01013403          	ld	s0,16(sp)
    80001814:	01813083          	ld	ra,24(sp)
    80001818:	00048513          	mv	a0,s1
    8000181c:	00813483          	ld	s1,8(sp)
    80001820:	02010113          	addi	sp,sp,32
    80001824:	00000317          	auipc	t1,0x0
    80001828:	3c830067          	jr	968(t1) # 80001bec <plic_complete>
    8000182c:	00004517          	auipc	a0,0x4
    80001830:	ca450513          	addi	a0,a0,-860 # 800054d0 <tickslock>
    80001834:	00001097          	auipc	ra,0x1
    80001838:	498080e7          	jalr	1176(ra) # 80002ccc <acquire>
    8000183c:	00003717          	auipc	a4,0x3
    80001840:	bb870713          	addi	a4,a4,-1096 # 800043f4 <ticks>
    80001844:	00072783          	lw	a5,0(a4)
    80001848:	00004517          	auipc	a0,0x4
    8000184c:	c8850513          	addi	a0,a0,-888 # 800054d0 <tickslock>
    80001850:	0017879b          	addiw	a5,a5,1
    80001854:	00f72023          	sw	a5,0(a4)
    80001858:	00001097          	auipc	ra,0x1
    8000185c:	540080e7          	jalr	1344(ra) # 80002d98 <release>
    80001860:	f65ff06f          	j	800017c4 <kerneltrap+0x8c>
    80001864:	00001097          	auipc	ra,0x1
    80001868:	09c080e7          	jalr	156(ra) # 80002900 <uartintr>
    8000186c:	fa5ff06f          	j	80001810 <kerneltrap+0xd8>
    80001870:	00003517          	auipc	a0,0x3
    80001874:	8f850513          	addi	a0,a0,-1800 # 80004168 <console_handler+0xcd8>
    80001878:	00000097          	auipc	ra,0x0
    8000187c:	724080e7          	jalr	1828(ra) # 80001f9c <panic>

0000000080001880 <clockintr>:
    80001880:	fe010113          	addi	sp,sp,-32
    80001884:	00813823          	sd	s0,16(sp)
    80001888:	00913423          	sd	s1,8(sp)
    8000188c:	00113c23          	sd	ra,24(sp)
    80001890:	02010413          	addi	s0,sp,32
    80001894:	00004497          	auipc	s1,0x4
    80001898:	c3c48493          	addi	s1,s1,-964 # 800054d0 <tickslock>
    8000189c:	00048513          	mv	a0,s1
    800018a0:	00001097          	auipc	ra,0x1
    800018a4:	42c080e7          	jalr	1068(ra) # 80002ccc <acquire>
    800018a8:	00003717          	auipc	a4,0x3
    800018ac:	b4c70713          	addi	a4,a4,-1204 # 800043f4 <ticks>
    800018b0:	00072783          	lw	a5,0(a4)
    800018b4:	01013403          	ld	s0,16(sp)
    800018b8:	01813083          	ld	ra,24(sp)
    800018bc:	00048513          	mv	a0,s1
    800018c0:	0017879b          	addiw	a5,a5,1
    800018c4:	00813483          	ld	s1,8(sp)
    800018c8:	00f72023          	sw	a5,0(a4)
    800018cc:	02010113          	addi	sp,sp,32
    800018d0:	00001317          	auipc	t1,0x1
    800018d4:	4c830067          	jr	1224(t1) # 80002d98 <release>

00000000800018d8 <devintr>:
    800018d8:	142027f3          	csrr	a5,scause
    800018dc:	00000513          	li	a0,0
    800018e0:	0007c463          	bltz	a5,800018e8 <devintr+0x10>
    800018e4:	00008067          	ret
    800018e8:	fe010113          	addi	sp,sp,-32
    800018ec:	00813823          	sd	s0,16(sp)
    800018f0:	00113c23          	sd	ra,24(sp)
    800018f4:	00913423          	sd	s1,8(sp)
    800018f8:	02010413          	addi	s0,sp,32
    800018fc:	0ff7f713          	andi	a4,a5,255
    80001900:	00900693          	li	a3,9
    80001904:	04d70c63          	beq	a4,a3,8000195c <devintr+0x84>
    80001908:	fff00713          	li	a4,-1
    8000190c:	03f71713          	slli	a4,a4,0x3f
    80001910:	00170713          	addi	a4,a4,1
    80001914:	00e78c63          	beq	a5,a4,8000192c <devintr+0x54>
    80001918:	01813083          	ld	ra,24(sp)
    8000191c:	01013403          	ld	s0,16(sp)
    80001920:	00813483          	ld	s1,8(sp)
    80001924:	02010113          	addi	sp,sp,32
    80001928:	00008067          	ret
    8000192c:	00000097          	auipc	ra,0x0
    80001930:	c8c080e7          	jalr	-884(ra) # 800015b8 <cpuid>
    80001934:	06050663          	beqz	a0,800019a0 <devintr+0xc8>
    80001938:	144027f3          	csrr	a5,sip
    8000193c:	ffd7f793          	andi	a5,a5,-3
    80001940:	14479073          	csrw	sip,a5
    80001944:	01813083          	ld	ra,24(sp)
    80001948:	01013403          	ld	s0,16(sp)
    8000194c:	00813483          	ld	s1,8(sp)
    80001950:	00200513          	li	a0,2
    80001954:	02010113          	addi	sp,sp,32
    80001958:	00008067          	ret
    8000195c:	00000097          	auipc	ra,0x0
    80001960:	258080e7          	jalr	600(ra) # 80001bb4 <plic_claim>
    80001964:	00a00793          	li	a5,10
    80001968:	00050493          	mv	s1,a0
    8000196c:	06f50663          	beq	a0,a5,800019d8 <devintr+0x100>
    80001970:	00100513          	li	a0,1
    80001974:	fa0482e3          	beqz	s1,80001918 <devintr+0x40>
    80001978:	00048593          	mv	a1,s1
    8000197c:	00003517          	auipc	a0,0x3
    80001980:	80c50513          	addi	a0,a0,-2036 # 80004188 <console_handler+0xcf8>
    80001984:	00000097          	auipc	ra,0x0
    80001988:	674080e7          	jalr	1652(ra) # 80001ff8 <__printf>
    8000198c:	00048513          	mv	a0,s1
    80001990:	00000097          	auipc	ra,0x0
    80001994:	25c080e7          	jalr	604(ra) # 80001bec <plic_complete>
    80001998:	00100513          	li	a0,1
    8000199c:	f7dff06f          	j	80001918 <devintr+0x40>
    800019a0:	00004517          	auipc	a0,0x4
    800019a4:	b3050513          	addi	a0,a0,-1232 # 800054d0 <tickslock>
    800019a8:	00001097          	auipc	ra,0x1
    800019ac:	324080e7          	jalr	804(ra) # 80002ccc <acquire>
    800019b0:	00003717          	auipc	a4,0x3
    800019b4:	a4470713          	addi	a4,a4,-1468 # 800043f4 <ticks>
    800019b8:	00072783          	lw	a5,0(a4)
    800019bc:	00004517          	auipc	a0,0x4
    800019c0:	b1450513          	addi	a0,a0,-1260 # 800054d0 <tickslock>
    800019c4:	0017879b          	addiw	a5,a5,1
    800019c8:	00f72023          	sw	a5,0(a4)
    800019cc:	00001097          	auipc	ra,0x1
    800019d0:	3cc080e7          	jalr	972(ra) # 80002d98 <release>
    800019d4:	f65ff06f          	j	80001938 <devintr+0x60>
    800019d8:	00001097          	auipc	ra,0x1
    800019dc:	f28080e7          	jalr	-216(ra) # 80002900 <uartintr>
    800019e0:	fadff06f          	j	8000198c <devintr+0xb4>
	...

00000000800019f0 <kernelvec>:
    800019f0:	f0010113          	addi	sp,sp,-256
    800019f4:	00113023          	sd	ra,0(sp)
    800019f8:	00213423          	sd	sp,8(sp)
    800019fc:	00313823          	sd	gp,16(sp)
    80001a00:	00413c23          	sd	tp,24(sp)
    80001a04:	02513023          	sd	t0,32(sp)
    80001a08:	02613423          	sd	t1,40(sp)
    80001a0c:	02713823          	sd	t2,48(sp)
    80001a10:	02813c23          	sd	s0,56(sp)
    80001a14:	04913023          	sd	s1,64(sp)
    80001a18:	04a13423          	sd	a0,72(sp)
    80001a1c:	04b13823          	sd	a1,80(sp)
    80001a20:	04c13c23          	sd	a2,88(sp)
    80001a24:	06d13023          	sd	a3,96(sp)
    80001a28:	06e13423          	sd	a4,104(sp)
    80001a2c:	06f13823          	sd	a5,112(sp)
    80001a30:	07013c23          	sd	a6,120(sp)
    80001a34:	09113023          	sd	a7,128(sp)
    80001a38:	09213423          	sd	s2,136(sp)
    80001a3c:	09313823          	sd	s3,144(sp)
    80001a40:	09413c23          	sd	s4,152(sp)
    80001a44:	0b513023          	sd	s5,160(sp)
    80001a48:	0b613423          	sd	s6,168(sp)
    80001a4c:	0b713823          	sd	s7,176(sp)
    80001a50:	0b813c23          	sd	s8,184(sp)
    80001a54:	0d913023          	sd	s9,192(sp)
    80001a58:	0da13423          	sd	s10,200(sp)
    80001a5c:	0db13823          	sd	s11,208(sp)
    80001a60:	0dc13c23          	sd	t3,216(sp)
    80001a64:	0fd13023          	sd	t4,224(sp)
    80001a68:	0fe13423          	sd	t5,232(sp)
    80001a6c:	0ff13823          	sd	t6,240(sp)
    80001a70:	cc9ff0ef          	jal	ra,80001738 <kerneltrap>
    80001a74:	00013083          	ld	ra,0(sp)
    80001a78:	00813103          	ld	sp,8(sp)
    80001a7c:	01013183          	ld	gp,16(sp)
    80001a80:	02013283          	ld	t0,32(sp)
    80001a84:	02813303          	ld	t1,40(sp)
    80001a88:	03013383          	ld	t2,48(sp)
    80001a8c:	03813403          	ld	s0,56(sp)
    80001a90:	04013483          	ld	s1,64(sp)
    80001a94:	04813503          	ld	a0,72(sp)
    80001a98:	05013583          	ld	a1,80(sp)
    80001a9c:	05813603          	ld	a2,88(sp)
    80001aa0:	06013683          	ld	a3,96(sp)
    80001aa4:	06813703          	ld	a4,104(sp)
    80001aa8:	07013783          	ld	a5,112(sp)
    80001aac:	07813803          	ld	a6,120(sp)
    80001ab0:	08013883          	ld	a7,128(sp)
    80001ab4:	08813903          	ld	s2,136(sp)
    80001ab8:	09013983          	ld	s3,144(sp)
    80001abc:	09813a03          	ld	s4,152(sp)
    80001ac0:	0a013a83          	ld	s5,160(sp)
    80001ac4:	0a813b03          	ld	s6,168(sp)
    80001ac8:	0b013b83          	ld	s7,176(sp)
    80001acc:	0b813c03          	ld	s8,184(sp)
    80001ad0:	0c013c83          	ld	s9,192(sp)
    80001ad4:	0c813d03          	ld	s10,200(sp)
    80001ad8:	0d013d83          	ld	s11,208(sp)
    80001adc:	0d813e03          	ld	t3,216(sp)
    80001ae0:	0e013e83          	ld	t4,224(sp)
    80001ae4:	0e813f03          	ld	t5,232(sp)
    80001ae8:	0f013f83          	ld	t6,240(sp)
    80001aec:	10010113          	addi	sp,sp,256
    80001af0:	10200073          	sret
    80001af4:	00000013          	nop
    80001af8:	00000013          	nop
    80001afc:	00000013          	nop

0000000080001b00 <timervec>:
    80001b00:	34051573          	csrrw	a0,mscratch,a0
    80001b04:	00b53023          	sd	a1,0(a0)
    80001b08:	00c53423          	sd	a2,8(a0)
    80001b0c:	00d53823          	sd	a3,16(a0)
    80001b10:	01853583          	ld	a1,24(a0)
    80001b14:	02053603          	ld	a2,32(a0)
    80001b18:	0005b683          	ld	a3,0(a1)
    80001b1c:	00c686b3          	add	a3,a3,a2
    80001b20:	00d5b023          	sd	a3,0(a1)
    80001b24:	00200593          	li	a1,2
    80001b28:	14459073          	csrw	sip,a1
    80001b2c:	01053683          	ld	a3,16(a0)
    80001b30:	00853603          	ld	a2,8(a0)
    80001b34:	00053583          	ld	a1,0(a0)
    80001b38:	34051573          	csrrw	a0,mscratch,a0
    80001b3c:	30200073          	mret

0000000080001b40 <plicinit>:
    80001b40:	ff010113          	addi	sp,sp,-16
    80001b44:	00813423          	sd	s0,8(sp)
    80001b48:	01010413          	addi	s0,sp,16
    80001b4c:	00813403          	ld	s0,8(sp)
    80001b50:	0c0007b7          	lui	a5,0xc000
    80001b54:	00100713          	li	a4,1
    80001b58:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80001b5c:	00e7a223          	sw	a4,4(a5)
    80001b60:	01010113          	addi	sp,sp,16
    80001b64:	00008067          	ret

0000000080001b68 <plicinithart>:
    80001b68:	ff010113          	addi	sp,sp,-16
    80001b6c:	00813023          	sd	s0,0(sp)
    80001b70:	00113423          	sd	ra,8(sp)
    80001b74:	01010413          	addi	s0,sp,16
    80001b78:	00000097          	auipc	ra,0x0
    80001b7c:	a40080e7          	jalr	-1472(ra) # 800015b8 <cpuid>
    80001b80:	0085171b          	slliw	a4,a0,0x8
    80001b84:	0c0027b7          	lui	a5,0xc002
    80001b88:	00e787b3          	add	a5,a5,a4
    80001b8c:	40200713          	li	a4,1026
    80001b90:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80001b94:	00813083          	ld	ra,8(sp)
    80001b98:	00013403          	ld	s0,0(sp)
    80001b9c:	00d5151b          	slliw	a0,a0,0xd
    80001ba0:	0c2017b7          	lui	a5,0xc201
    80001ba4:	00a78533          	add	a0,a5,a0
    80001ba8:	00052023          	sw	zero,0(a0)
    80001bac:	01010113          	addi	sp,sp,16
    80001bb0:	00008067          	ret

0000000080001bb4 <plic_claim>:
    80001bb4:	ff010113          	addi	sp,sp,-16
    80001bb8:	00813023          	sd	s0,0(sp)
    80001bbc:	00113423          	sd	ra,8(sp)
    80001bc0:	01010413          	addi	s0,sp,16
    80001bc4:	00000097          	auipc	ra,0x0
    80001bc8:	9f4080e7          	jalr	-1548(ra) # 800015b8 <cpuid>
    80001bcc:	00813083          	ld	ra,8(sp)
    80001bd0:	00013403          	ld	s0,0(sp)
    80001bd4:	00d5151b          	slliw	a0,a0,0xd
    80001bd8:	0c2017b7          	lui	a5,0xc201
    80001bdc:	00a78533          	add	a0,a5,a0
    80001be0:	00452503          	lw	a0,4(a0)
    80001be4:	01010113          	addi	sp,sp,16
    80001be8:	00008067          	ret

0000000080001bec <plic_complete>:
    80001bec:	fe010113          	addi	sp,sp,-32
    80001bf0:	00813823          	sd	s0,16(sp)
    80001bf4:	00913423          	sd	s1,8(sp)
    80001bf8:	00113c23          	sd	ra,24(sp)
    80001bfc:	02010413          	addi	s0,sp,32
    80001c00:	00050493          	mv	s1,a0
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	9b4080e7          	jalr	-1612(ra) # 800015b8 <cpuid>
    80001c0c:	01813083          	ld	ra,24(sp)
    80001c10:	01013403          	ld	s0,16(sp)
    80001c14:	00d5179b          	slliw	a5,a0,0xd
    80001c18:	0c201737          	lui	a4,0xc201
    80001c1c:	00f707b3          	add	a5,a4,a5
    80001c20:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80001c24:	00813483          	ld	s1,8(sp)
    80001c28:	02010113          	addi	sp,sp,32
    80001c2c:	00008067          	ret

0000000080001c30 <consolewrite>:
    80001c30:	fb010113          	addi	sp,sp,-80
    80001c34:	04813023          	sd	s0,64(sp)
    80001c38:	04113423          	sd	ra,72(sp)
    80001c3c:	02913c23          	sd	s1,56(sp)
    80001c40:	03213823          	sd	s2,48(sp)
    80001c44:	03313423          	sd	s3,40(sp)
    80001c48:	03413023          	sd	s4,32(sp)
    80001c4c:	01513c23          	sd	s5,24(sp)
    80001c50:	05010413          	addi	s0,sp,80
    80001c54:	06c05c63          	blez	a2,80001ccc <consolewrite+0x9c>
    80001c58:	00060993          	mv	s3,a2
    80001c5c:	00050a13          	mv	s4,a0
    80001c60:	00058493          	mv	s1,a1
    80001c64:	00000913          	li	s2,0
    80001c68:	fff00a93          	li	s5,-1
    80001c6c:	01c0006f          	j	80001c88 <consolewrite+0x58>
    80001c70:	fbf44503          	lbu	a0,-65(s0)
    80001c74:	0019091b          	addiw	s2,s2,1
    80001c78:	00148493          	addi	s1,s1,1
    80001c7c:	00001097          	auipc	ra,0x1
    80001c80:	a9c080e7          	jalr	-1380(ra) # 80002718 <uartputc>
    80001c84:	03298063          	beq	s3,s2,80001ca4 <consolewrite+0x74>
    80001c88:	00048613          	mv	a2,s1
    80001c8c:	00100693          	li	a3,1
    80001c90:	000a0593          	mv	a1,s4
    80001c94:	fbf40513          	addi	a0,s0,-65
    80001c98:	00000097          	auipc	ra,0x0
    80001c9c:	9d8080e7          	jalr	-1576(ra) # 80001670 <either_copyin>
    80001ca0:	fd5518e3          	bne	a0,s5,80001c70 <consolewrite+0x40>
    80001ca4:	04813083          	ld	ra,72(sp)
    80001ca8:	04013403          	ld	s0,64(sp)
    80001cac:	03813483          	ld	s1,56(sp)
    80001cb0:	02813983          	ld	s3,40(sp)
    80001cb4:	02013a03          	ld	s4,32(sp)
    80001cb8:	01813a83          	ld	s5,24(sp)
    80001cbc:	00090513          	mv	a0,s2
    80001cc0:	03013903          	ld	s2,48(sp)
    80001cc4:	05010113          	addi	sp,sp,80
    80001cc8:	00008067          	ret
    80001ccc:	00000913          	li	s2,0
    80001cd0:	fd5ff06f          	j	80001ca4 <consolewrite+0x74>

0000000080001cd4 <consoleread>:
    80001cd4:	f9010113          	addi	sp,sp,-112
    80001cd8:	06813023          	sd	s0,96(sp)
    80001cdc:	04913c23          	sd	s1,88(sp)
    80001ce0:	05213823          	sd	s2,80(sp)
    80001ce4:	05313423          	sd	s3,72(sp)
    80001ce8:	05413023          	sd	s4,64(sp)
    80001cec:	03513c23          	sd	s5,56(sp)
    80001cf0:	03613823          	sd	s6,48(sp)
    80001cf4:	03713423          	sd	s7,40(sp)
    80001cf8:	03813023          	sd	s8,32(sp)
    80001cfc:	06113423          	sd	ra,104(sp)
    80001d00:	01913c23          	sd	s9,24(sp)
    80001d04:	07010413          	addi	s0,sp,112
    80001d08:	00060b93          	mv	s7,a2
    80001d0c:	00050913          	mv	s2,a0
    80001d10:	00058c13          	mv	s8,a1
    80001d14:	00060b1b          	sext.w	s6,a2
    80001d18:	00003497          	auipc	s1,0x3
    80001d1c:	7d048493          	addi	s1,s1,2000 # 800054e8 <cons>
    80001d20:	00400993          	li	s3,4
    80001d24:	fff00a13          	li	s4,-1
    80001d28:	00a00a93          	li	s5,10
    80001d2c:	05705e63          	blez	s7,80001d88 <consoleread+0xb4>
    80001d30:	09c4a703          	lw	a4,156(s1)
    80001d34:	0984a783          	lw	a5,152(s1)
    80001d38:	0007071b          	sext.w	a4,a4
    80001d3c:	08e78463          	beq	a5,a4,80001dc4 <consoleread+0xf0>
    80001d40:	07f7f713          	andi	a4,a5,127
    80001d44:	00e48733          	add	a4,s1,a4
    80001d48:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80001d4c:	0017869b          	addiw	a3,a5,1
    80001d50:	08d4ac23          	sw	a3,152(s1)
    80001d54:	00070c9b          	sext.w	s9,a4
    80001d58:	0b370663          	beq	a4,s3,80001e04 <consoleread+0x130>
    80001d5c:	00100693          	li	a3,1
    80001d60:	f9f40613          	addi	a2,s0,-97
    80001d64:	000c0593          	mv	a1,s8
    80001d68:	00090513          	mv	a0,s2
    80001d6c:	f8e40fa3          	sb	a4,-97(s0)
    80001d70:	00000097          	auipc	ra,0x0
    80001d74:	8b4080e7          	jalr	-1868(ra) # 80001624 <either_copyout>
    80001d78:	01450863          	beq	a0,s4,80001d88 <consoleread+0xb4>
    80001d7c:	001c0c13          	addi	s8,s8,1
    80001d80:	fffb8b9b          	addiw	s7,s7,-1
    80001d84:	fb5c94e3          	bne	s9,s5,80001d2c <consoleread+0x58>
    80001d88:	000b851b          	sext.w	a0,s7
    80001d8c:	06813083          	ld	ra,104(sp)
    80001d90:	06013403          	ld	s0,96(sp)
    80001d94:	05813483          	ld	s1,88(sp)
    80001d98:	05013903          	ld	s2,80(sp)
    80001d9c:	04813983          	ld	s3,72(sp)
    80001da0:	04013a03          	ld	s4,64(sp)
    80001da4:	03813a83          	ld	s5,56(sp)
    80001da8:	02813b83          	ld	s7,40(sp)
    80001dac:	02013c03          	ld	s8,32(sp)
    80001db0:	01813c83          	ld	s9,24(sp)
    80001db4:	40ab053b          	subw	a0,s6,a0
    80001db8:	03013b03          	ld	s6,48(sp)
    80001dbc:	07010113          	addi	sp,sp,112
    80001dc0:	00008067          	ret
    80001dc4:	00001097          	auipc	ra,0x1
    80001dc8:	1d8080e7          	jalr	472(ra) # 80002f9c <push_on>
    80001dcc:	0984a703          	lw	a4,152(s1)
    80001dd0:	09c4a783          	lw	a5,156(s1)
    80001dd4:	0007879b          	sext.w	a5,a5
    80001dd8:	fef70ce3          	beq	a4,a5,80001dd0 <consoleread+0xfc>
    80001ddc:	00001097          	auipc	ra,0x1
    80001de0:	234080e7          	jalr	564(ra) # 80003010 <pop_on>
    80001de4:	0984a783          	lw	a5,152(s1)
    80001de8:	07f7f713          	andi	a4,a5,127
    80001dec:	00e48733          	add	a4,s1,a4
    80001df0:	01874703          	lbu	a4,24(a4)
    80001df4:	0017869b          	addiw	a3,a5,1
    80001df8:	08d4ac23          	sw	a3,152(s1)
    80001dfc:	00070c9b          	sext.w	s9,a4
    80001e00:	f5371ee3          	bne	a4,s3,80001d5c <consoleread+0x88>
    80001e04:	000b851b          	sext.w	a0,s7
    80001e08:	f96bf2e3          	bgeu	s7,s6,80001d8c <consoleread+0xb8>
    80001e0c:	08f4ac23          	sw	a5,152(s1)
    80001e10:	f7dff06f          	j	80001d8c <consoleread+0xb8>

0000000080001e14 <consputc>:
    80001e14:	10000793          	li	a5,256
    80001e18:	00f50663          	beq	a0,a5,80001e24 <consputc+0x10>
    80001e1c:	00001317          	auipc	t1,0x1
    80001e20:	9f430067          	jr	-1548(t1) # 80002810 <uartputc_sync>
    80001e24:	ff010113          	addi	sp,sp,-16
    80001e28:	00113423          	sd	ra,8(sp)
    80001e2c:	00813023          	sd	s0,0(sp)
    80001e30:	01010413          	addi	s0,sp,16
    80001e34:	00800513          	li	a0,8
    80001e38:	00001097          	auipc	ra,0x1
    80001e3c:	9d8080e7          	jalr	-1576(ra) # 80002810 <uartputc_sync>
    80001e40:	02000513          	li	a0,32
    80001e44:	00001097          	auipc	ra,0x1
    80001e48:	9cc080e7          	jalr	-1588(ra) # 80002810 <uartputc_sync>
    80001e4c:	00013403          	ld	s0,0(sp)
    80001e50:	00813083          	ld	ra,8(sp)
    80001e54:	00800513          	li	a0,8
    80001e58:	01010113          	addi	sp,sp,16
    80001e5c:	00001317          	auipc	t1,0x1
    80001e60:	9b430067          	jr	-1612(t1) # 80002810 <uartputc_sync>

0000000080001e64 <consoleintr>:
    80001e64:	fe010113          	addi	sp,sp,-32
    80001e68:	00813823          	sd	s0,16(sp)
    80001e6c:	00913423          	sd	s1,8(sp)
    80001e70:	01213023          	sd	s2,0(sp)
    80001e74:	00113c23          	sd	ra,24(sp)
    80001e78:	02010413          	addi	s0,sp,32
    80001e7c:	00003917          	auipc	s2,0x3
    80001e80:	66c90913          	addi	s2,s2,1644 # 800054e8 <cons>
    80001e84:	00050493          	mv	s1,a0
    80001e88:	00090513          	mv	a0,s2
    80001e8c:	00001097          	auipc	ra,0x1
    80001e90:	e40080e7          	jalr	-448(ra) # 80002ccc <acquire>
    80001e94:	02048c63          	beqz	s1,80001ecc <consoleintr+0x68>
    80001e98:	0a092783          	lw	a5,160(s2)
    80001e9c:	09892703          	lw	a4,152(s2)
    80001ea0:	07f00693          	li	a3,127
    80001ea4:	40e7873b          	subw	a4,a5,a4
    80001ea8:	02e6e263          	bltu	a3,a4,80001ecc <consoleintr+0x68>
    80001eac:	00d00713          	li	a4,13
    80001eb0:	04e48063          	beq	s1,a4,80001ef0 <consoleintr+0x8c>
    80001eb4:	07f7f713          	andi	a4,a5,127
    80001eb8:	00e90733          	add	a4,s2,a4
    80001ebc:	0017879b          	addiw	a5,a5,1
    80001ec0:	0af92023          	sw	a5,160(s2)
    80001ec4:	00970c23          	sb	s1,24(a4)
    80001ec8:	08f92e23          	sw	a5,156(s2)
    80001ecc:	01013403          	ld	s0,16(sp)
    80001ed0:	01813083          	ld	ra,24(sp)
    80001ed4:	00813483          	ld	s1,8(sp)
    80001ed8:	00013903          	ld	s2,0(sp)
    80001edc:	00003517          	auipc	a0,0x3
    80001ee0:	60c50513          	addi	a0,a0,1548 # 800054e8 <cons>
    80001ee4:	02010113          	addi	sp,sp,32
    80001ee8:	00001317          	auipc	t1,0x1
    80001eec:	eb030067          	jr	-336(t1) # 80002d98 <release>
    80001ef0:	00a00493          	li	s1,10
    80001ef4:	fc1ff06f          	j	80001eb4 <consoleintr+0x50>

0000000080001ef8 <consoleinit>:
    80001ef8:	fe010113          	addi	sp,sp,-32
    80001efc:	00113c23          	sd	ra,24(sp)
    80001f00:	00813823          	sd	s0,16(sp)
    80001f04:	00913423          	sd	s1,8(sp)
    80001f08:	02010413          	addi	s0,sp,32
    80001f0c:	00003497          	auipc	s1,0x3
    80001f10:	5dc48493          	addi	s1,s1,1500 # 800054e8 <cons>
    80001f14:	00048513          	mv	a0,s1
    80001f18:	00002597          	auipc	a1,0x2
    80001f1c:	2c858593          	addi	a1,a1,712 # 800041e0 <console_handler+0xd50>
    80001f20:	00001097          	auipc	ra,0x1
    80001f24:	d88080e7          	jalr	-632(ra) # 80002ca8 <initlock>
    80001f28:	00000097          	auipc	ra,0x0
    80001f2c:	7ac080e7          	jalr	1964(ra) # 800026d4 <uartinit>
    80001f30:	01813083          	ld	ra,24(sp)
    80001f34:	01013403          	ld	s0,16(sp)
    80001f38:	00000797          	auipc	a5,0x0
    80001f3c:	d9c78793          	addi	a5,a5,-612 # 80001cd4 <consoleread>
    80001f40:	0af4bc23          	sd	a5,184(s1)
    80001f44:	00000797          	auipc	a5,0x0
    80001f48:	cec78793          	addi	a5,a5,-788 # 80001c30 <consolewrite>
    80001f4c:	0cf4b023          	sd	a5,192(s1)
    80001f50:	00813483          	ld	s1,8(sp)
    80001f54:	02010113          	addi	sp,sp,32
    80001f58:	00008067          	ret

0000000080001f5c <console_read>:
    80001f5c:	ff010113          	addi	sp,sp,-16
    80001f60:	00813423          	sd	s0,8(sp)
    80001f64:	01010413          	addi	s0,sp,16
    80001f68:	00813403          	ld	s0,8(sp)
    80001f6c:	00003317          	auipc	t1,0x3
    80001f70:	63433303          	ld	t1,1588(t1) # 800055a0 <devsw+0x10>
    80001f74:	01010113          	addi	sp,sp,16
    80001f78:	00030067          	jr	t1

0000000080001f7c <console_write>:
    80001f7c:	ff010113          	addi	sp,sp,-16
    80001f80:	00813423          	sd	s0,8(sp)
    80001f84:	01010413          	addi	s0,sp,16
    80001f88:	00813403          	ld	s0,8(sp)
    80001f8c:	00003317          	auipc	t1,0x3
    80001f90:	61c33303          	ld	t1,1564(t1) # 800055a8 <devsw+0x18>
    80001f94:	01010113          	addi	sp,sp,16
    80001f98:	00030067          	jr	t1

0000000080001f9c <panic>:
    80001f9c:	fe010113          	addi	sp,sp,-32
    80001fa0:	00113c23          	sd	ra,24(sp)
    80001fa4:	00813823          	sd	s0,16(sp)
    80001fa8:	00913423          	sd	s1,8(sp)
    80001fac:	02010413          	addi	s0,sp,32
    80001fb0:	00050493          	mv	s1,a0
    80001fb4:	00002517          	auipc	a0,0x2
    80001fb8:	23450513          	addi	a0,a0,564 # 800041e8 <console_handler+0xd58>
    80001fbc:	00003797          	auipc	a5,0x3
    80001fc0:	6807a623          	sw	zero,1676(a5) # 80005648 <pr+0x18>
    80001fc4:	00000097          	auipc	ra,0x0
    80001fc8:	034080e7          	jalr	52(ra) # 80001ff8 <__printf>
    80001fcc:	00048513          	mv	a0,s1
    80001fd0:	00000097          	auipc	ra,0x0
    80001fd4:	028080e7          	jalr	40(ra) # 80001ff8 <__printf>
    80001fd8:	00002517          	auipc	a0,0x2
    80001fdc:	1f050513          	addi	a0,a0,496 # 800041c8 <console_handler+0xd38>
    80001fe0:	00000097          	auipc	ra,0x0
    80001fe4:	018080e7          	jalr	24(ra) # 80001ff8 <__printf>
    80001fe8:	00100793          	li	a5,1
    80001fec:	00002717          	auipc	a4,0x2
    80001ff0:	40f72623          	sw	a5,1036(a4) # 800043f8 <panicked>
    80001ff4:	0000006f          	j	80001ff4 <panic+0x58>

0000000080001ff8 <__printf>:
    80001ff8:	f3010113          	addi	sp,sp,-208
    80001ffc:	08813023          	sd	s0,128(sp)
    80002000:	07313423          	sd	s3,104(sp)
    80002004:	09010413          	addi	s0,sp,144
    80002008:	05813023          	sd	s8,64(sp)
    8000200c:	08113423          	sd	ra,136(sp)
    80002010:	06913c23          	sd	s1,120(sp)
    80002014:	07213823          	sd	s2,112(sp)
    80002018:	07413023          	sd	s4,96(sp)
    8000201c:	05513c23          	sd	s5,88(sp)
    80002020:	05613823          	sd	s6,80(sp)
    80002024:	05713423          	sd	s7,72(sp)
    80002028:	03913c23          	sd	s9,56(sp)
    8000202c:	03a13823          	sd	s10,48(sp)
    80002030:	03b13423          	sd	s11,40(sp)
    80002034:	00003317          	auipc	t1,0x3
    80002038:	5fc30313          	addi	t1,t1,1532 # 80005630 <pr>
    8000203c:	01832c03          	lw	s8,24(t1)
    80002040:	00b43423          	sd	a1,8(s0)
    80002044:	00c43823          	sd	a2,16(s0)
    80002048:	00d43c23          	sd	a3,24(s0)
    8000204c:	02e43023          	sd	a4,32(s0)
    80002050:	02f43423          	sd	a5,40(s0)
    80002054:	03043823          	sd	a6,48(s0)
    80002058:	03143c23          	sd	a7,56(s0)
    8000205c:	00050993          	mv	s3,a0
    80002060:	4a0c1663          	bnez	s8,8000250c <__printf+0x514>
    80002064:	60098c63          	beqz	s3,8000267c <__printf+0x684>
    80002068:	0009c503          	lbu	a0,0(s3)
    8000206c:	00840793          	addi	a5,s0,8
    80002070:	f6f43c23          	sd	a5,-136(s0)
    80002074:	00000493          	li	s1,0
    80002078:	22050063          	beqz	a0,80002298 <__printf+0x2a0>
    8000207c:	00002a37          	lui	s4,0x2
    80002080:	00018ab7          	lui	s5,0x18
    80002084:	000f4b37          	lui	s6,0xf4
    80002088:	00989bb7          	lui	s7,0x989
    8000208c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002090:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002094:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002098:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000209c:	00148c9b          	addiw	s9,s1,1
    800020a0:	02500793          	li	a5,37
    800020a4:	01998933          	add	s2,s3,s9
    800020a8:	38f51263          	bne	a0,a5,8000242c <__printf+0x434>
    800020ac:	00094783          	lbu	a5,0(s2)
    800020b0:	00078c9b          	sext.w	s9,a5
    800020b4:	1e078263          	beqz	a5,80002298 <__printf+0x2a0>
    800020b8:	0024849b          	addiw	s1,s1,2
    800020bc:	07000713          	li	a4,112
    800020c0:	00998933          	add	s2,s3,s1
    800020c4:	38e78a63          	beq	a5,a4,80002458 <__printf+0x460>
    800020c8:	20f76863          	bltu	a4,a5,800022d8 <__printf+0x2e0>
    800020cc:	42a78863          	beq	a5,a0,800024fc <__printf+0x504>
    800020d0:	06400713          	li	a4,100
    800020d4:	40e79663          	bne	a5,a4,800024e0 <__printf+0x4e8>
    800020d8:	f7843783          	ld	a5,-136(s0)
    800020dc:	0007a603          	lw	a2,0(a5)
    800020e0:	00878793          	addi	a5,a5,8
    800020e4:	f6f43c23          	sd	a5,-136(s0)
    800020e8:	42064a63          	bltz	a2,8000251c <__printf+0x524>
    800020ec:	00a00713          	li	a4,10
    800020f0:	02e677bb          	remuw	a5,a2,a4
    800020f4:	00002d97          	auipc	s11,0x2
    800020f8:	11cd8d93          	addi	s11,s11,284 # 80004210 <digits>
    800020fc:	00900593          	li	a1,9
    80002100:	0006051b          	sext.w	a0,a2
    80002104:	00000c93          	li	s9,0
    80002108:	02079793          	slli	a5,a5,0x20
    8000210c:	0207d793          	srli	a5,a5,0x20
    80002110:	00fd87b3          	add	a5,s11,a5
    80002114:	0007c783          	lbu	a5,0(a5)
    80002118:	02e656bb          	divuw	a3,a2,a4
    8000211c:	f8f40023          	sb	a5,-128(s0)
    80002120:	14c5d863          	bge	a1,a2,80002270 <__printf+0x278>
    80002124:	06300593          	li	a1,99
    80002128:	00100c93          	li	s9,1
    8000212c:	02e6f7bb          	remuw	a5,a3,a4
    80002130:	02079793          	slli	a5,a5,0x20
    80002134:	0207d793          	srli	a5,a5,0x20
    80002138:	00fd87b3          	add	a5,s11,a5
    8000213c:	0007c783          	lbu	a5,0(a5)
    80002140:	02e6d73b          	divuw	a4,a3,a4
    80002144:	f8f400a3          	sb	a5,-127(s0)
    80002148:	12a5f463          	bgeu	a1,a0,80002270 <__printf+0x278>
    8000214c:	00a00693          	li	a3,10
    80002150:	00900593          	li	a1,9
    80002154:	02d777bb          	remuw	a5,a4,a3
    80002158:	02079793          	slli	a5,a5,0x20
    8000215c:	0207d793          	srli	a5,a5,0x20
    80002160:	00fd87b3          	add	a5,s11,a5
    80002164:	0007c503          	lbu	a0,0(a5)
    80002168:	02d757bb          	divuw	a5,a4,a3
    8000216c:	f8a40123          	sb	a0,-126(s0)
    80002170:	48e5f263          	bgeu	a1,a4,800025f4 <__printf+0x5fc>
    80002174:	06300513          	li	a0,99
    80002178:	02d7f5bb          	remuw	a1,a5,a3
    8000217c:	02059593          	slli	a1,a1,0x20
    80002180:	0205d593          	srli	a1,a1,0x20
    80002184:	00bd85b3          	add	a1,s11,a1
    80002188:	0005c583          	lbu	a1,0(a1)
    8000218c:	02d7d7bb          	divuw	a5,a5,a3
    80002190:	f8b401a3          	sb	a1,-125(s0)
    80002194:	48e57263          	bgeu	a0,a4,80002618 <__printf+0x620>
    80002198:	3e700513          	li	a0,999
    8000219c:	02d7f5bb          	remuw	a1,a5,a3
    800021a0:	02059593          	slli	a1,a1,0x20
    800021a4:	0205d593          	srli	a1,a1,0x20
    800021a8:	00bd85b3          	add	a1,s11,a1
    800021ac:	0005c583          	lbu	a1,0(a1)
    800021b0:	02d7d7bb          	divuw	a5,a5,a3
    800021b4:	f8b40223          	sb	a1,-124(s0)
    800021b8:	46e57663          	bgeu	a0,a4,80002624 <__printf+0x62c>
    800021bc:	02d7f5bb          	remuw	a1,a5,a3
    800021c0:	02059593          	slli	a1,a1,0x20
    800021c4:	0205d593          	srli	a1,a1,0x20
    800021c8:	00bd85b3          	add	a1,s11,a1
    800021cc:	0005c583          	lbu	a1,0(a1)
    800021d0:	02d7d7bb          	divuw	a5,a5,a3
    800021d4:	f8b402a3          	sb	a1,-123(s0)
    800021d8:	46ea7863          	bgeu	s4,a4,80002648 <__printf+0x650>
    800021dc:	02d7f5bb          	remuw	a1,a5,a3
    800021e0:	02059593          	slli	a1,a1,0x20
    800021e4:	0205d593          	srli	a1,a1,0x20
    800021e8:	00bd85b3          	add	a1,s11,a1
    800021ec:	0005c583          	lbu	a1,0(a1)
    800021f0:	02d7d7bb          	divuw	a5,a5,a3
    800021f4:	f8b40323          	sb	a1,-122(s0)
    800021f8:	3eeaf863          	bgeu	s5,a4,800025e8 <__printf+0x5f0>
    800021fc:	02d7f5bb          	remuw	a1,a5,a3
    80002200:	02059593          	slli	a1,a1,0x20
    80002204:	0205d593          	srli	a1,a1,0x20
    80002208:	00bd85b3          	add	a1,s11,a1
    8000220c:	0005c583          	lbu	a1,0(a1)
    80002210:	02d7d7bb          	divuw	a5,a5,a3
    80002214:	f8b403a3          	sb	a1,-121(s0)
    80002218:	42eb7e63          	bgeu	s6,a4,80002654 <__printf+0x65c>
    8000221c:	02d7f5bb          	remuw	a1,a5,a3
    80002220:	02059593          	slli	a1,a1,0x20
    80002224:	0205d593          	srli	a1,a1,0x20
    80002228:	00bd85b3          	add	a1,s11,a1
    8000222c:	0005c583          	lbu	a1,0(a1)
    80002230:	02d7d7bb          	divuw	a5,a5,a3
    80002234:	f8b40423          	sb	a1,-120(s0)
    80002238:	42ebfc63          	bgeu	s7,a4,80002670 <__printf+0x678>
    8000223c:	02079793          	slli	a5,a5,0x20
    80002240:	0207d793          	srli	a5,a5,0x20
    80002244:	00fd8db3          	add	s11,s11,a5
    80002248:	000dc703          	lbu	a4,0(s11)
    8000224c:	00a00793          	li	a5,10
    80002250:	00900c93          	li	s9,9
    80002254:	f8e404a3          	sb	a4,-119(s0)
    80002258:	00065c63          	bgez	a2,80002270 <__printf+0x278>
    8000225c:	f9040713          	addi	a4,s0,-112
    80002260:	00f70733          	add	a4,a4,a5
    80002264:	02d00693          	li	a3,45
    80002268:	fed70823          	sb	a3,-16(a4)
    8000226c:	00078c93          	mv	s9,a5
    80002270:	f8040793          	addi	a5,s0,-128
    80002274:	01978cb3          	add	s9,a5,s9
    80002278:	f7f40d13          	addi	s10,s0,-129
    8000227c:	000cc503          	lbu	a0,0(s9)
    80002280:	fffc8c93          	addi	s9,s9,-1
    80002284:	00000097          	auipc	ra,0x0
    80002288:	b90080e7          	jalr	-1136(ra) # 80001e14 <consputc>
    8000228c:	ffac98e3          	bne	s9,s10,8000227c <__printf+0x284>
    80002290:	00094503          	lbu	a0,0(s2)
    80002294:	e00514e3          	bnez	a0,8000209c <__printf+0xa4>
    80002298:	1a0c1663          	bnez	s8,80002444 <__printf+0x44c>
    8000229c:	08813083          	ld	ra,136(sp)
    800022a0:	08013403          	ld	s0,128(sp)
    800022a4:	07813483          	ld	s1,120(sp)
    800022a8:	07013903          	ld	s2,112(sp)
    800022ac:	06813983          	ld	s3,104(sp)
    800022b0:	06013a03          	ld	s4,96(sp)
    800022b4:	05813a83          	ld	s5,88(sp)
    800022b8:	05013b03          	ld	s6,80(sp)
    800022bc:	04813b83          	ld	s7,72(sp)
    800022c0:	04013c03          	ld	s8,64(sp)
    800022c4:	03813c83          	ld	s9,56(sp)
    800022c8:	03013d03          	ld	s10,48(sp)
    800022cc:	02813d83          	ld	s11,40(sp)
    800022d0:	0d010113          	addi	sp,sp,208
    800022d4:	00008067          	ret
    800022d8:	07300713          	li	a4,115
    800022dc:	1ce78a63          	beq	a5,a4,800024b0 <__printf+0x4b8>
    800022e0:	07800713          	li	a4,120
    800022e4:	1ee79e63          	bne	a5,a4,800024e0 <__printf+0x4e8>
    800022e8:	f7843783          	ld	a5,-136(s0)
    800022ec:	0007a703          	lw	a4,0(a5)
    800022f0:	00878793          	addi	a5,a5,8
    800022f4:	f6f43c23          	sd	a5,-136(s0)
    800022f8:	28074263          	bltz	a4,8000257c <__printf+0x584>
    800022fc:	00002d97          	auipc	s11,0x2
    80002300:	f14d8d93          	addi	s11,s11,-236 # 80004210 <digits>
    80002304:	00f77793          	andi	a5,a4,15
    80002308:	00fd87b3          	add	a5,s11,a5
    8000230c:	0007c683          	lbu	a3,0(a5)
    80002310:	00f00613          	li	a2,15
    80002314:	0007079b          	sext.w	a5,a4
    80002318:	f8d40023          	sb	a3,-128(s0)
    8000231c:	0047559b          	srliw	a1,a4,0x4
    80002320:	0047569b          	srliw	a3,a4,0x4
    80002324:	00000c93          	li	s9,0
    80002328:	0ee65063          	bge	a2,a4,80002408 <__printf+0x410>
    8000232c:	00f6f693          	andi	a3,a3,15
    80002330:	00dd86b3          	add	a3,s11,a3
    80002334:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002338:	0087d79b          	srliw	a5,a5,0x8
    8000233c:	00100c93          	li	s9,1
    80002340:	f8d400a3          	sb	a3,-127(s0)
    80002344:	0cb67263          	bgeu	a2,a1,80002408 <__printf+0x410>
    80002348:	00f7f693          	andi	a3,a5,15
    8000234c:	00dd86b3          	add	a3,s11,a3
    80002350:	0006c583          	lbu	a1,0(a3)
    80002354:	00f00613          	li	a2,15
    80002358:	0047d69b          	srliw	a3,a5,0x4
    8000235c:	f8b40123          	sb	a1,-126(s0)
    80002360:	0047d593          	srli	a1,a5,0x4
    80002364:	28f67e63          	bgeu	a2,a5,80002600 <__printf+0x608>
    80002368:	00f6f693          	andi	a3,a3,15
    8000236c:	00dd86b3          	add	a3,s11,a3
    80002370:	0006c503          	lbu	a0,0(a3)
    80002374:	0087d813          	srli	a6,a5,0x8
    80002378:	0087d69b          	srliw	a3,a5,0x8
    8000237c:	f8a401a3          	sb	a0,-125(s0)
    80002380:	28b67663          	bgeu	a2,a1,8000260c <__printf+0x614>
    80002384:	00f6f693          	andi	a3,a3,15
    80002388:	00dd86b3          	add	a3,s11,a3
    8000238c:	0006c583          	lbu	a1,0(a3)
    80002390:	00c7d513          	srli	a0,a5,0xc
    80002394:	00c7d69b          	srliw	a3,a5,0xc
    80002398:	f8b40223          	sb	a1,-124(s0)
    8000239c:	29067a63          	bgeu	a2,a6,80002630 <__printf+0x638>
    800023a0:	00f6f693          	andi	a3,a3,15
    800023a4:	00dd86b3          	add	a3,s11,a3
    800023a8:	0006c583          	lbu	a1,0(a3)
    800023ac:	0107d813          	srli	a6,a5,0x10
    800023b0:	0107d69b          	srliw	a3,a5,0x10
    800023b4:	f8b402a3          	sb	a1,-123(s0)
    800023b8:	28a67263          	bgeu	a2,a0,8000263c <__printf+0x644>
    800023bc:	00f6f693          	andi	a3,a3,15
    800023c0:	00dd86b3          	add	a3,s11,a3
    800023c4:	0006c683          	lbu	a3,0(a3)
    800023c8:	0147d79b          	srliw	a5,a5,0x14
    800023cc:	f8d40323          	sb	a3,-122(s0)
    800023d0:	21067663          	bgeu	a2,a6,800025dc <__printf+0x5e4>
    800023d4:	02079793          	slli	a5,a5,0x20
    800023d8:	0207d793          	srli	a5,a5,0x20
    800023dc:	00fd8db3          	add	s11,s11,a5
    800023e0:	000dc683          	lbu	a3,0(s11)
    800023e4:	00800793          	li	a5,8
    800023e8:	00700c93          	li	s9,7
    800023ec:	f8d403a3          	sb	a3,-121(s0)
    800023f0:	00075c63          	bgez	a4,80002408 <__printf+0x410>
    800023f4:	f9040713          	addi	a4,s0,-112
    800023f8:	00f70733          	add	a4,a4,a5
    800023fc:	02d00693          	li	a3,45
    80002400:	fed70823          	sb	a3,-16(a4)
    80002404:	00078c93          	mv	s9,a5
    80002408:	f8040793          	addi	a5,s0,-128
    8000240c:	01978cb3          	add	s9,a5,s9
    80002410:	f7f40d13          	addi	s10,s0,-129
    80002414:	000cc503          	lbu	a0,0(s9)
    80002418:	fffc8c93          	addi	s9,s9,-1
    8000241c:	00000097          	auipc	ra,0x0
    80002420:	9f8080e7          	jalr	-1544(ra) # 80001e14 <consputc>
    80002424:	ff9d18e3          	bne	s10,s9,80002414 <__printf+0x41c>
    80002428:	0100006f          	j	80002438 <__printf+0x440>
    8000242c:	00000097          	auipc	ra,0x0
    80002430:	9e8080e7          	jalr	-1560(ra) # 80001e14 <consputc>
    80002434:	000c8493          	mv	s1,s9
    80002438:	00094503          	lbu	a0,0(s2)
    8000243c:	c60510e3          	bnez	a0,8000209c <__printf+0xa4>
    80002440:	e40c0ee3          	beqz	s8,8000229c <__printf+0x2a4>
    80002444:	00003517          	auipc	a0,0x3
    80002448:	1ec50513          	addi	a0,a0,492 # 80005630 <pr>
    8000244c:	00001097          	auipc	ra,0x1
    80002450:	94c080e7          	jalr	-1716(ra) # 80002d98 <release>
    80002454:	e49ff06f          	j	8000229c <__printf+0x2a4>
    80002458:	f7843783          	ld	a5,-136(s0)
    8000245c:	03000513          	li	a0,48
    80002460:	01000d13          	li	s10,16
    80002464:	00878713          	addi	a4,a5,8
    80002468:	0007bc83          	ld	s9,0(a5)
    8000246c:	f6e43c23          	sd	a4,-136(s0)
    80002470:	00000097          	auipc	ra,0x0
    80002474:	9a4080e7          	jalr	-1628(ra) # 80001e14 <consputc>
    80002478:	07800513          	li	a0,120
    8000247c:	00000097          	auipc	ra,0x0
    80002480:	998080e7          	jalr	-1640(ra) # 80001e14 <consputc>
    80002484:	00002d97          	auipc	s11,0x2
    80002488:	d8cd8d93          	addi	s11,s11,-628 # 80004210 <digits>
    8000248c:	03ccd793          	srli	a5,s9,0x3c
    80002490:	00fd87b3          	add	a5,s11,a5
    80002494:	0007c503          	lbu	a0,0(a5)
    80002498:	fffd0d1b          	addiw	s10,s10,-1
    8000249c:	004c9c93          	slli	s9,s9,0x4
    800024a0:	00000097          	auipc	ra,0x0
    800024a4:	974080e7          	jalr	-1676(ra) # 80001e14 <consputc>
    800024a8:	fe0d12e3          	bnez	s10,8000248c <__printf+0x494>
    800024ac:	f8dff06f          	j	80002438 <__printf+0x440>
    800024b0:	f7843783          	ld	a5,-136(s0)
    800024b4:	0007bc83          	ld	s9,0(a5)
    800024b8:	00878793          	addi	a5,a5,8
    800024bc:	f6f43c23          	sd	a5,-136(s0)
    800024c0:	000c9a63          	bnez	s9,800024d4 <__printf+0x4dc>
    800024c4:	1080006f          	j	800025cc <__printf+0x5d4>
    800024c8:	001c8c93          	addi	s9,s9,1
    800024cc:	00000097          	auipc	ra,0x0
    800024d0:	948080e7          	jalr	-1720(ra) # 80001e14 <consputc>
    800024d4:	000cc503          	lbu	a0,0(s9)
    800024d8:	fe0518e3          	bnez	a0,800024c8 <__printf+0x4d0>
    800024dc:	f5dff06f          	j	80002438 <__printf+0x440>
    800024e0:	02500513          	li	a0,37
    800024e4:	00000097          	auipc	ra,0x0
    800024e8:	930080e7          	jalr	-1744(ra) # 80001e14 <consputc>
    800024ec:	000c8513          	mv	a0,s9
    800024f0:	00000097          	auipc	ra,0x0
    800024f4:	924080e7          	jalr	-1756(ra) # 80001e14 <consputc>
    800024f8:	f41ff06f          	j	80002438 <__printf+0x440>
    800024fc:	02500513          	li	a0,37
    80002500:	00000097          	auipc	ra,0x0
    80002504:	914080e7          	jalr	-1772(ra) # 80001e14 <consputc>
    80002508:	f31ff06f          	j	80002438 <__printf+0x440>
    8000250c:	00030513          	mv	a0,t1
    80002510:	00000097          	auipc	ra,0x0
    80002514:	7bc080e7          	jalr	1980(ra) # 80002ccc <acquire>
    80002518:	b4dff06f          	j	80002064 <__printf+0x6c>
    8000251c:	40c0053b          	negw	a0,a2
    80002520:	00a00713          	li	a4,10
    80002524:	02e576bb          	remuw	a3,a0,a4
    80002528:	00002d97          	auipc	s11,0x2
    8000252c:	ce8d8d93          	addi	s11,s11,-792 # 80004210 <digits>
    80002530:	ff700593          	li	a1,-9
    80002534:	02069693          	slli	a3,a3,0x20
    80002538:	0206d693          	srli	a3,a3,0x20
    8000253c:	00dd86b3          	add	a3,s11,a3
    80002540:	0006c683          	lbu	a3,0(a3)
    80002544:	02e557bb          	divuw	a5,a0,a4
    80002548:	f8d40023          	sb	a3,-128(s0)
    8000254c:	10b65e63          	bge	a2,a1,80002668 <__printf+0x670>
    80002550:	06300593          	li	a1,99
    80002554:	02e7f6bb          	remuw	a3,a5,a4
    80002558:	02069693          	slli	a3,a3,0x20
    8000255c:	0206d693          	srli	a3,a3,0x20
    80002560:	00dd86b3          	add	a3,s11,a3
    80002564:	0006c683          	lbu	a3,0(a3)
    80002568:	02e7d73b          	divuw	a4,a5,a4
    8000256c:	00200793          	li	a5,2
    80002570:	f8d400a3          	sb	a3,-127(s0)
    80002574:	bca5ece3          	bltu	a1,a0,8000214c <__printf+0x154>
    80002578:	ce5ff06f          	j	8000225c <__printf+0x264>
    8000257c:	40e007bb          	negw	a5,a4
    80002580:	00002d97          	auipc	s11,0x2
    80002584:	c90d8d93          	addi	s11,s11,-880 # 80004210 <digits>
    80002588:	00f7f693          	andi	a3,a5,15
    8000258c:	00dd86b3          	add	a3,s11,a3
    80002590:	0006c583          	lbu	a1,0(a3)
    80002594:	ff100613          	li	a2,-15
    80002598:	0047d69b          	srliw	a3,a5,0x4
    8000259c:	f8b40023          	sb	a1,-128(s0)
    800025a0:	0047d59b          	srliw	a1,a5,0x4
    800025a4:	0ac75e63          	bge	a4,a2,80002660 <__printf+0x668>
    800025a8:	00f6f693          	andi	a3,a3,15
    800025ac:	00dd86b3          	add	a3,s11,a3
    800025b0:	0006c603          	lbu	a2,0(a3)
    800025b4:	00f00693          	li	a3,15
    800025b8:	0087d79b          	srliw	a5,a5,0x8
    800025bc:	f8c400a3          	sb	a2,-127(s0)
    800025c0:	d8b6e4e3          	bltu	a3,a1,80002348 <__printf+0x350>
    800025c4:	00200793          	li	a5,2
    800025c8:	e2dff06f          	j	800023f4 <__printf+0x3fc>
    800025cc:	00002c97          	auipc	s9,0x2
    800025d0:	c24c8c93          	addi	s9,s9,-988 # 800041f0 <console_handler+0xd60>
    800025d4:	02800513          	li	a0,40
    800025d8:	ef1ff06f          	j	800024c8 <__printf+0x4d0>
    800025dc:	00700793          	li	a5,7
    800025e0:	00600c93          	li	s9,6
    800025e4:	e0dff06f          	j	800023f0 <__printf+0x3f8>
    800025e8:	00700793          	li	a5,7
    800025ec:	00600c93          	li	s9,6
    800025f0:	c69ff06f          	j	80002258 <__printf+0x260>
    800025f4:	00300793          	li	a5,3
    800025f8:	00200c93          	li	s9,2
    800025fc:	c5dff06f          	j	80002258 <__printf+0x260>
    80002600:	00300793          	li	a5,3
    80002604:	00200c93          	li	s9,2
    80002608:	de9ff06f          	j	800023f0 <__printf+0x3f8>
    8000260c:	00400793          	li	a5,4
    80002610:	00300c93          	li	s9,3
    80002614:	dddff06f          	j	800023f0 <__printf+0x3f8>
    80002618:	00400793          	li	a5,4
    8000261c:	00300c93          	li	s9,3
    80002620:	c39ff06f          	j	80002258 <__printf+0x260>
    80002624:	00500793          	li	a5,5
    80002628:	00400c93          	li	s9,4
    8000262c:	c2dff06f          	j	80002258 <__printf+0x260>
    80002630:	00500793          	li	a5,5
    80002634:	00400c93          	li	s9,4
    80002638:	db9ff06f          	j	800023f0 <__printf+0x3f8>
    8000263c:	00600793          	li	a5,6
    80002640:	00500c93          	li	s9,5
    80002644:	dadff06f          	j	800023f0 <__printf+0x3f8>
    80002648:	00600793          	li	a5,6
    8000264c:	00500c93          	li	s9,5
    80002650:	c09ff06f          	j	80002258 <__printf+0x260>
    80002654:	00800793          	li	a5,8
    80002658:	00700c93          	li	s9,7
    8000265c:	bfdff06f          	j	80002258 <__printf+0x260>
    80002660:	00100793          	li	a5,1
    80002664:	d91ff06f          	j	800023f4 <__printf+0x3fc>
    80002668:	00100793          	li	a5,1
    8000266c:	bf1ff06f          	j	8000225c <__printf+0x264>
    80002670:	00900793          	li	a5,9
    80002674:	00800c93          	li	s9,8
    80002678:	be1ff06f          	j	80002258 <__printf+0x260>
    8000267c:	00002517          	auipc	a0,0x2
    80002680:	b7c50513          	addi	a0,a0,-1156 # 800041f8 <console_handler+0xd68>
    80002684:	00000097          	auipc	ra,0x0
    80002688:	918080e7          	jalr	-1768(ra) # 80001f9c <panic>

000000008000268c <printfinit>:
    8000268c:	fe010113          	addi	sp,sp,-32
    80002690:	00813823          	sd	s0,16(sp)
    80002694:	00913423          	sd	s1,8(sp)
    80002698:	00113c23          	sd	ra,24(sp)
    8000269c:	02010413          	addi	s0,sp,32
    800026a0:	00003497          	auipc	s1,0x3
    800026a4:	f9048493          	addi	s1,s1,-112 # 80005630 <pr>
    800026a8:	00048513          	mv	a0,s1
    800026ac:	00002597          	auipc	a1,0x2
    800026b0:	b5c58593          	addi	a1,a1,-1188 # 80004208 <console_handler+0xd78>
    800026b4:	00000097          	auipc	ra,0x0
    800026b8:	5f4080e7          	jalr	1524(ra) # 80002ca8 <initlock>
    800026bc:	01813083          	ld	ra,24(sp)
    800026c0:	01013403          	ld	s0,16(sp)
    800026c4:	0004ac23          	sw	zero,24(s1)
    800026c8:	00813483          	ld	s1,8(sp)
    800026cc:	02010113          	addi	sp,sp,32
    800026d0:	00008067          	ret

00000000800026d4 <uartinit>:
    800026d4:	ff010113          	addi	sp,sp,-16
    800026d8:	00813423          	sd	s0,8(sp)
    800026dc:	01010413          	addi	s0,sp,16
    800026e0:	100007b7          	lui	a5,0x10000
    800026e4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800026e8:	f8000713          	li	a4,-128
    800026ec:	00e781a3          	sb	a4,3(a5)
    800026f0:	00300713          	li	a4,3
    800026f4:	00e78023          	sb	a4,0(a5)
    800026f8:	000780a3          	sb	zero,1(a5)
    800026fc:	00e781a3          	sb	a4,3(a5)
    80002700:	00700693          	li	a3,7
    80002704:	00d78123          	sb	a3,2(a5)
    80002708:	00e780a3          	sb	a4,1(a5)
    8000270c:	00813403          	ld	s0,8(sp)
    80002710:	01010113          	addi	sp,sp,16
    80002714:	00008067          	ret

0000000080002718 <uartputc>:
    80002718:	00002797          	auipc	a5,0x2
    8000271c:	ce07a783          	lw	a5,-800(a5) # 800043f8 <panicked>
    80002720:	00078463          	beqz	a5,80002728 <uartputc+0x10>
    80002724:	0000006f          	j	80002724 <uartputc+0xc>
    80002728:	fd010113          	addi	sp,sp,-48
    8000272c:	02813023          	sd	s0,32(sp)
    80002730:	00913c23          	sd	s1,24(sp)
    80002734:	01213823          	sd	s2,16(sp)
    80002738:	01313423          	sd	s3,8(sp)
    8000273c:	02113423          	sd	ra,40(sp)
    80002740:	03010413          	addi	s0,sp,48
    80002744:	00002917          	auipc	s2,0x2
    80002748:	cbc90913          	addi	s2,s2,-836 # 80004400 <uart_tx_r>
    8000274c:	00093783          	ld	a5,0(s2)
    80002750:	00002497          	auipc	s1,0x2
    80002754:	cb848493          	addi	s1,s1,-840 # 80004408 <uart_tx_w>
    80002758:	0004b703          	ld	a4,0(s1)
    8000275c:	02078693          	addi	a3,a5,32
    80002760:	00050993          	mv	s3,a0
    80002764:	02e69c63          	bne	a3,a4,8000279c <uartputc+0x84>
    80002768:	00001097          	auipc	ra,0x1
    8000276c:	834080e7          	jalr	-1996(ra) # 80002f9c <push_on>
    80002770:	00093783          	ld	a5,0(s2)
    80002774:	0004b703          	ld	a4,0(s1)
    80002778:	02078793          	addi	a5,a5,32
    8000277c:	00e79463          	bne	a5,a4,80002784 <uartputc+0x6c>
    80002780:	0000006f          	j	80002780 <uartputc+0x68>
    80002784:	00001097          	auipc	ra,0x1
    80002788:	88c080e7          	jalr	-1908(ra) # 80003010 <pop_on>
    8000278c:	00093783          	ld	a5,0(s2)
    80002790:	0004b703          	ld	a4,0(s1)
    80002794:	02078693          	addi	a3,a5,32
    80002798:	fce688e3          	beq	a3,a4,80002768 <uartputc+0x50>
    8000279c:	01f77693          	andi	a3,a4,31
    800027a0:	00003597          	auipc	a1,0x3
    800027a4:	eb058593          	addi	a1,a1,-336 # 80005650 <uart_tx_buf>
    800027a8:	00d586b3          	add	a3,a1,a3
    800027ac:	00170713          	addi	a4,a4,1
    800027b0:	01368023          	sb	s3,0(a3)
    800027b4:	00e4b023          	sd	a4,0(s1)
    800027b8:	10000637          	lui	a2,0x10000
    800027bc:	02f71063          	bne	a4,a5,800027dc <uartputc+0xc4>
    800027c0:	0340006f          	j	800027f4 <uartputc+0xdc>
    800027c4:	00074703          	lbu	a4,0(a4)
    800027c8:	00f93023          	sd	a5,0(s2)
    800027cc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800027d0:	00093783          	ld	a5,0(s2)
    800027d4:	0004b703          	ld	a4,0(s1)
    800027d8:	00f70e63          	beq	a4,a5,800027f4 <uartputc+0xdc>
    800027dc:	00564683          	lbu	a3,5(a2)
    800027e0:	01f7f713          	andi	a4,a5,31
    800027e4:	00e58733          	add	a4,a1,a4
    800027e8:	0206f693          	andi	a3,a3,32
    800027ec:	00178793          	addi	a5,a5,1
    800027f0:	fc069ae3          	bnez	a3,800027c4 <uartputc+0xac>
    800027f4:	02813083          	ld	ra,40(sp)
    800027f8:	02013403          	ld	s0,32(sp)
    800027fc:	01813483          	ld	s1,24(sp)
    80002800:	01013903          	ld	s2,16(sp)
    80002804:	00813983          	ld	s3,8(sp)
    80002808:	03010113          	addi	sp,sp,48
    8000280c:	00008067          	ret

0000000080002810 <uartputc_sync>:
    80002810:	ff010113          	addi	sp,sp,-16
    80002814:	00813423          	sd	s0,8(sp)
    80002818:	01010413          	addi	s0,sp,16
    8000281c:	00002717          	auipc	a4,0x2
    80002820:	bdc72703          	lw	a4,-1060(a4) # 800043f8 <panicked>
    80002824:	02071663          	bnez	a4,80002850 <uartputc_sync+0x40>
    80002828:	00050793          	mv	a5,a0
    8000282c:	100006b7          	lui	a3,0x10000
    80002830:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002834:	02077713          	andi	a4,a4,32
    80002838:	fe070ce3          	beqz	a4,80002830 <uartputc_sync+0x20>
    8000283c:	0ff7f793          	andi	a5,a5,255
    80002840:	00f68023          	sb	a5,0(a3)
    80002844:	00813403          	ld	s0,8(sp)
    80002848:	01010113          	addi	sp,sp,16
    8000284c:	00008067          	ret
    80002850:	0000006f          	j	80002850 <uartputc_sync+0x40>

0000000080002854 <uartstart>:
    80002854:	ff010113          	addi	sp,sp,-16
    80002858:	00813423          	sd	s0,8(sp)
    8000285c:	01010413          	addi	s0,sp,16
    80002860:	00002617          	auipc	a2,0x2
    80002864:	ba060613          	addi	a2,a2,-1120 # 80004400 <uart_tx_r>
    80002868:	00002517          	auipc	a0,0x2
    8000286c:	ba050513          	addi	a0,a0,-1120 # 80004408 <uart_tx_w>
    80002870:	00063783          	ld	a5,0(a2)
    80002874:	00053703          	ld	a4,0(a0)
    80002878:	04f70263          	beq	a4,a5,800028bc <uartstart+0x68>
    8000287c:	100005b7          	lui	a1,0x10000
    80002880:	00003817          	auipc	a6,0x3
    80002884:	dd080813          	addi	a6,a6,-560 # 80005650 <uart_tx_buf>
    80002888:	01c0006f          	j	800028a4 <uartstart+0x50>
    8000288c:	0006c703          	lbu	a4,0(a3)
    80002890:	00f63023          	sd	a5,0(a2)
    80002894:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002898:	00063783          	ld	a5,0(a2)
    8000289c:	00053703          	ld	a4,0(a0)
    800028a0:	00f70e63          	beq	a4,a5,800028bc <uartstart+0x68>
    800028a4:	01f7f713          	andi	a4,a5,31
    800028a8:	00e806b3          	add	a3,a6,a4
    800028ac:	0055c703          	lbu	a4,5(a1)
    800028b0:	00178793          	addi	a5,a5,1
    800028b4:	02077713          	andi	a4,a4,32
    800028b8:	fc071ae3          	bnez	a4,8000288c <uartstart+0x38>
    800028bc:	00813403          	ld	s0,8(sp)
    800028c0:	01010113          	addi	sp,sp,16
    800028c4:	00008067          	ret

00000000800028c8 <uartgetc>:
    800028c8:	ff010113          	addi	sp,sp,-16
    800028cc:	00813423          	sd	s0,8(sp)
    800028d0:	01010413          	addi	s0,sp,16
    800028d4:	10000737          	lui	a4,0x10000
    800028d8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800028dc:	0017f793          	andi	a5,a5,1
    800028e0:	00078c63          	beqz	a5,800028f8 <uartgetc+0x30>
    800028e4:	00074503          	lbu	a0,0(a4)
    800028e8:	0ff57513          	andi	a0,a0,255
    800028ec:	00813403          	ld	s0,8(sp)
    800028f0:	01010113          	addi	sp,sp,16
    800028f4:	00008067          	ret
    800028f8:	fff00513          	li	a0,-1
    800028fc:	ff1ff06f          	j	800028ec <uartgetc+0x24>

0000000080002900 <uartintr>:
    80002900:	100007b7          	lui	a5,0x10000
    80002904:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80002908:	0017f793          	andi	a5,a5,1
    8000290c:	0a078463          	beqz	a5,800029b4 <uartintr+0xb4>
    80002910:	fe010113          	addi	sp,sp,-32
    80002914:	00813823          	sd	s0,16(sp)
    80002918:	00913423          	sd	s1,8(sp)
    8000291c:	00113c23          	sd	ra,24(sp)
    80002920:	02010413          	addi	s0,sp,32
    80002924:	100004b7          	lui	s1,0x10000
    80002928:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000292c:	0ff57513          	andi	a0,a0,255
    80002930:	fffff097          	auipc	ra,0xfffff
    80002934:	534080e7          	jalr	1332(ra) # 80001e64 <consoleintr>
    80002938:	0054c783          	lbu	a5,5(s1)
    8000293c:	0017f793          	andi	a5,a5,1
    80002940:	fe0794e3          	bnez	a5,80002928 <uartintr+0x28>
    80002944:	00002617          	auipc	a2,0x2
    80002948:	abc60613          	addi	a2,a2,-1348 # 80004400 <uart_tx_r>
    8000294c:	00002517          	auipc	a0,0x2
    80002950:	abc50513          	addi	a0,a0,-1348 # 80004408 <uart_tx_w>
    80002954:	00063783          	ld	a5,0(a2)
    80002958:	00053703          	ld	a4,0(a0)
    8000295c:	04f70263          	beq	a4,a5,800029a0 <uartintr+0xa0>
    80002960:	100005b7          	lui	a1,0x10000
    80002964:	00003817          	auipc	a6,0x3
    80002968:	cec80813          	addi	a6,a6,-788 # 80005650 <uart_tx_buf>
    8000296c:	01c0006f          	j	80002988 <uartintr+0x88>
    80002970:	0006c703          	lbu	a4,0(a3)
    80002974:	00f63023          	sd	a5,0(a2)
    80002978:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000297c:	00063783          	ld	a5,0(a2)
    80002980:	00053703          	ld	a4,0(a0)
    80002984:	00f70e63          	beq	a4,a5,800029a0 <uartintr+0xa0>
    80002988:	01f7f713          	andi	a4,a5,31
    8000298c:	00e806b3          	add	a3,a6,a4
    80002990:	0055c703          	lbu	a4,5(a1)
    80002994:	00178793          	addi	a5,a5,1
    80002998:	02077713          	andi	a4,a4,32
    8000299c:	fc071ae3          	bnez	a4,80002970 <uartintr+0x70>
    800029a0:	01813083          	ld	ra,24(sp)
    800029a4:	01013403          	ld	s0,16(sp)
    800029a8:	00813483          	ld	s1,8(sp)
    800029ac:	02010113          	addi	sp,sp,32
    800029b0:	00008067          	ret
    800029b4:	00002617          	auipc	a2,0x2
    800029b8:	a4c60613          	addi	a2,a2,-1460 # 80004400 <uart_tx_r>
    800029bc:	00002517          	auipc	a0,0x2
    800029c0:	a4c50513          	addi	a0,a0,-1460 # 80004408 <uart_tx_w>
    800029c4:	00063783          	ld	a5,0(a2)
    800029c8:	00053703          	ld	a4,0(a0)
    800029cc:	04f70263          	beq	a4,a5,80002a10 <uartintr+0x110>
    800029d0:	100005b7          	lui	a1,0x10000
    800029d4:	00003817          	auipc	a6,0x3
    800029d8:	c7c80813          	addi	a6,a6,-900 # 80005650 <uart_tx_buf>
    800029dc:	01c0006f          	j	800029f8 <uartintr+0xf8>
    800029e0:	0006c703          	lbu	a4,0(a3)
    800029e4:	00f63023          	sd	a5,0(a2)
    800029e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800029ec:	00063783          	ld	a5,0(a2)
    800029f0:	00053703          	ld	a4,0(a0)
    800029f4:	02f70063          	beq	a4,a5,80002a14 <uartintr+0x114>
    800029f8:	01f7f713          	andi	a4,a5,31
    800029fc:	00e806b3          	add	a3,a6,a4
    80002a00:	0055c703          	lbu	a4,5(a1)
    80002a04:	00178793          	addi	a5,a5,1
    80002a08:	02077713          	andi	a4,a4,32
    80002a0c:	fc071ae3          	bnez	a4,800029e0 <uartintr+0xe0>
    80002a10:	00008067          	ret
    80002a14:	00008067          	ret

0000000080002a18 <kinit>:
    80002a18:	fc010113          	addi	sp,sp,-64
    80002a1c:	02913423          	sd	s1,40(sp)
    80002a20:	fffff7b7          	lui	a5,0xfffff
    80002a24:	00004497          	auipc	s1,0x4
    80002a28:	c4b48493          	addi	s1,s1,-949 # 8000666f <end+0xfff>
    80002a2c:	02813823          	sd	s0,48(sp)
    80002a30:	01313c23          	sd	s3,24(sp)
    80002a34:	00f4f4b3          	and	s1,s1,a5
    80002a38:	02113c23          	sd	ra,56(sp)
    80002a3c:	03213023          	sd	s2,32(sp)
    80002a40:	01413823          	sd	s4,16(sp)
    80002a44:	01513423          	sd	s5,8(sp)
    80002a48:	04010413          	addi	s0,sp,64
    80002a4c:	000017b7          	lui	a5,0x1
    80002a50:	01100993          	li	s3,17
    80002a54:	00f487b3          	add	a5,s1,a5
    80002a58:	01b99993          	slli	s3,s3,0x1b
    80002a5c:	06f9e063          	bltu	s3,a5,80002abc <kinit+0xa4>
    80002a60:	00003a97          	auipc	s5,0x3
    80002a64:	c10a8a93          	addi	s5,s5,-1008 # 80005670 <end>
    80002a68:	0754ec63          	bltu	s1,s5,80002ae0 <kinit+0xc8>
    80002a6c:	0734fa63          	bgeu	s1,s3,80002ae0 <kinit+0xc8>
    80002a70:	00088a37          	lui	s4,0x88
    80002a74:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002a78:	00002917          	auipc	s2,0x2
    80002a7c:	99890913          	addi	s2,s2,-1640 # 80004410 <kmem>
    80002a80:	00ca1a13          	slli	s4,s4,0xc
    80002a84:	0140006f          	j	80002a98 <kinit+0x80>
    80002a88:	000017b7          	lui	a5,0x1
    80002a8c:	00f484b3          	add	s1,s1,a5
    80002a90:	0554e863          	bltu	s1,s5,80002ae0 <kinit+0xc8>
    80002a94:	0534f663          	bgeu	s1,s3,80002ae0 <kinit+0xc8>
    80002a98:	00001637          	lui	a2,0x1
    80002a9c:	00100593          	li	a1,1
    80002aa0:	00048513          	mv	a0,s1
    80002aa4:	00000097          	auipc	ra,0x0
    80002aa8:	5e4080e7          	jalr	1508(ra) # 80003088 <__memset>
    80002aac:	00093783          	ld	a5,0(s2)
    80002ab0:	00f4b023          	sd	a5,0(s1)
    80002ab4:	00993023          	sd	s1,0(s2)
    80002ab8:	fd4498e3          	bne	s1,s4,80002a88 <kinit+0x70>
    80002abc:	03813083          	ld	ra,56(sp)
    80002ac0:	03013403          	ld	s0,48(sp)
    80002ac4:	02813483          	ld	s1,40(sp)
    80002ac8:	02013903          	ld	s2,32(sp)
    80002acc:	01813983          	ld	s3,24(sp)
    80002ad0:	01013a03          	ld	s4,16(sp)
    80002ad4:	00813a83          	ld	s5,8(sp)
    80002ad8:	04010113          	addi	sp,sp,64
    80002adc:	00008067          	ret
    80002ae0:	00001517          	auipc	a0,0x1
    80002ae4:	74850513          	addi	a0,a0,1864 # 80004228 <digits+0x18>
    80002ae8:	fffff097          	auipc	ra,0xfffff
    80002aec:	4b4080e7          	jalr	1204(ra) # 80001f9c <panic>

0000000080002af0 <freerange>:
    80002af0:	fc010113          	addi	sp,sp,-64
    80002af4:	000017b7          	lui	a5,0x1
    80002af8:	02913423          	sd	s1,40(sp)
    80002afc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80002b00:	009504b3          	add	s1,a0,s1
    80002b04:	fffff537          	lui	a0,0xfffff
    80002b08:	02813823          	sd	s0,48(sp)
    80002b0c:	02113c23          	sd	ra,56(sp)
    80002b10:	03213023          	sd	s2,32(sp)
    80002b14:	01313c23          	sd	s3,24(sp)
    80002b18:	01413823          	sd	s4,16(sp)
    80002b1c:	01513423          	sd	s5,8(sp)
    80002b20:	01613023          	sd	s6,0(sp)
    80002b24:	04010413          	addi	s0,sp,64
    80002b28:	00a4f4b3          	and	s1,s1,a0
    80002b2c:	00f487b3          	add	a5,s1,a5
    80002b30:	06f5e463          	bltu	a1,a5,80002b98 <freerange+0xa8>
    80002b34:	00003a97          	auipc	s5,0x3
    80002b38:	b3ca8a93          	addi	s5,s5,-1220 # 80005670 <end>
    80002b3c:	0954e263          	bltu	s1,s5,80002bc0 <freerange+0xd0>
    80002b40:	01100993          	li	s3,17
    80002b44:	01b99993          	slli	s3,s3,0x1b
    80002b48:	0734fc63          	bgeu	s1,s3,80002bc0 <freerange+0xd0>
    80002b4c:	00058a13          	mv	s4,a1
    80002b50:	00002917          	auipc	s2,0x2
    80002b54:	8c090913          	addi	s2,s2,-1856 # 80004410 <kmem>
    80002b58:	00002b37          	lui	s6,0x2
    80002b5c:	0140006f          	j	80002b70 <freerange+0x80>
    80002b60:	000017b7          	lui	a5,0x1
    80002b64:	00f484b3          	add	s1,s1,a5
    80002b68:	0554ec63          	bltu	s1,s5,80002bc0 <freerange+0xd0>
    80002b6c:	0534fa63          	bgeu	s1,s3,80002bc0 <freerange+0xd0>
    80002b70:	00001637          	lui	a2,0x1
    80002b74:	00100593          	li	a1,1
    80002b78:	00048513          	mv	a0,s1
    80002b7c:	00000097          	auipc	ra,0x0
    80002b80:	50c080e7          	jalr	1292(ra) # 80003088 <__memset>
    80002b84:	00093703          	ld	a4,0(s2)
    80002b88:	016487b3          	add	a5,s1,s6
    80002b8c:	00e4b023          	sd	a4,0(s1)
    80002b90:	00993023          	sd	s1,0(s2)
    80002b94:	fcfa76e3          	bgeu	s4,a5,80002b60 <freerange+0x70>
    80002b98:	03813083          	ld	ra,56(sp)
    80002b9c:	03013403          	ld	s0,48(sp)
    80002ba0:	02813483          	ld	s1,40(sp)
    80002ba4:	02013903          	ld	s2,32(sp)
    80002ba8:	01813983          	ld	s3,24(sp)
    80002bac:	01013a03          	ld	s4,16(sp)
    80002bb0:	00813a83          	ld	s5,8(sp)
    80002bb4:	00013b03          	ld	s6,0(sp)
    80002bb8:	04010113          	addi	sp,sp,64
    80002bbc:	00008067          	ret
    80002bc0:	00001517          	auipc	a0,0x1
    80002bc4:	66850513          	addi	a0,a0,1640 # 80004228 <digits+0x18>
    80002bc8:	fffff097          	auipc	ra,0xfffff
    80002bcc:	3d4080e7          	jalr	980(ra) # 80001f9c <panic>

0000000080002bd0 <kfree>:
    80002bd0:	fe010113          	addi	sp,sp,-32
    80002bd4:	00813823          	sd	s0,16(sp)
    80002bd8:	00113c23          	sd	ra,24(sp)
    80002bdc:	00913423          	sd	s1,8(sp)
    80002be0:	02010413          	addi	s0,sp,32
    80002be4:	03451793          	slli	a5,a0,0x34
    80002be8:	04079c63          	bnez	a5,80002c40 <kfree+0x70>
    80002bec:	00003797          	auipc	a5,0x3
    80002bf0:	a8478793          	addi	a5,a5,-1404 # 80005670 <end>
    80002bf4:	00050493          	mv	s1,a0
    80002bf8:	04f56463          	bltu	a0,a5,80002c40 <kfree+0x70>
    80002bfc:	01100793          	li	a5,17
    80002c00:	01b79793          	slli	a5,a5,0x1b
    80002c04:	02f57e63          	bgeu	a0,a5,80002c40 <kfree+0x70>
    80002c08:	00001637          	lui	a2,0x1
    80002c0c:	00100593          	li	a1,1
    80002c10:	00000097          	auipc	ra,0x0
    80002c14:	478080e7          	jalr	1144(ra) # 80003088 <__memset>
    80002c18:	00001797          	auipc	a5,0x1
    80002c1c:	7f878793          	addi	a5,a5,2040 # 80004410 <kmem>
    80002c20:	0007b703          	ld	a4,0(a5)
    80002c24:	01813083          	ld	ra,24(sp)
    80002c28:	01013403          	ld	s0,16(sp)
    80002c2c:	00e4b023          	sd	a4,0(s1)
    80002c30:	0097b023          	sd	s1,0(a5)
    80002c34:	00813483          	ld	s1,8(sp)
    80002c38:	02010113          	addi	sp,sp,32
    80002c3c:	00008067          	ret
    80002c40:	00001517          	auipc	a0,0x1
    80002c44:	5e850513          	addi	a0,a0,1512 # 80004228 <digits+0x18>
    80002c48:	fffff097          	auipc	ra,0xfffff
    80002c4c:	354080e7          	jalr	852(ra) # 80001f9c <panic>

0000000080002c50 <kalloc>:
    80002c50:	fe010113          	addi	sp,sp,-32
    80002c54:	00813823          	sd	s0,16(sp)
    80002c58:	00913423          	sd	s1,8(sp)
    80002c5c:	00113c23          	sd	ra,24(sp)
    80002c60:	02010413          	addi	s0,sp,32
    80002c64:	00001797          	auipc	a5,0x1
    80002c68:	7ac78793          	addi	a5,a5,1964 # 80004410 <kmem>
    80002c6c:	0007b483          	ld	s1,0(a5)
    80002c70:	02048063          	beqz	s1,80002c90 <kalloc+0x40>
    80002c74:	0004b703          	ld	a4,0(s1)
    80002c78:	00001637          	lui	a2,0x1
    80002c7c:	00500593          	li	a1,5
    80002c80:	00048513          	mv	a0,s1
    80002c84:	00e7b023          	sd	a4,0(a5)
    80002c88:	00000097          	auipc	ra,0x0
    80002c8c:	400080e7          	jalr	1024(ra) # 80003088 <__memset>
    80002c90:	01813083          	ld	ra,24(sp)
    80002c94:	01013403          	ld	s0,16(sp)
    80002c98:	00048513          	mv	a0,s1
    80002c9c:	00813483          	ld	s1,8(sp)
    80002ca0:	02010113          	addi	sp,sp,32
    80002ca4:	00008067          	ret

0000000080002ca8 <initlock>:
    80002ca8:	ff010113          	addi	sp,sp,-16
    80002cac:	00813423          	sd	s0,8(sp)
    80002cb0:	01010413          	addi	s0,sp,16
    80002cb4:	00813403          	ld	s0,8(sp)
    80002cb8:	00b53423          	sd	a1,8(a0)
    80002cbc:	00052023          	sw	zero,0(a0)
    80002cc0:	00053823          	sd	zero,16(a0)
    80002cc4:	01010113          	addi	sp,sp,16
    80002cc8:	00008067          	ret

0000000080002ccc <acquire>:
    80002ccc:	fe010113          	addi	sp,sp,-32
    80002cd0:	00813823          	sd	s0,16(sp)
    80002cd4:	00913423          	sd	s1,8(sp)
    80002cd8:	00113c23          	sd	ra,24(sp)
    80002cdc:	01213023          	sd	s2,0(sp)
    80002ce0:	02010413          	addi	s0,sp,32
    80002ce4:	00050493          	mv	s1,a0
    80002ce8:	10002973          	csrr	s2,sstatus
    80002cec:	100027f3          	csrr	a5,sstatus
    80002cf0:	ffd7f793          	andi	a5,a5,-3
    80002cf4:	10079073          	csrw	sstatus,a5
    80002cf8:	fffff097          	auipc	ra,0xfffff
    80002cfc:	8e0080e7          	jalr	-1824(ra) # 800015d8 <mycpu>
    80002d00:	07852783          	lw	a5,120(a0)
    80002d04:	06078e63          	beqz	a5,80002d80 <acquire+0xb4>
    80002d08:	fffff097          	auipc	ra,0xfffff
    80002d0c:	8d0080e7          	jalr	-1840(ra) # 800015d8 <mycpu>
    80002d10:	07852783          	lw	a5,120(a0)
    80002d14:	0004a703          	lw	a4,0(s1)
    80002d18:	0017879b          	addiw	a5,a5,1
    80002d1c:	06f52c23          	sw	a5,120(a0)
    80002d20:	04071063          	bnez	a4,80002d60 <acquire+0x94>
    80002d24:	00100713          	li	a4,1
    80002d28:	00070793          	mv	a5,a4
    80002d2c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80002d30:	0007879b          	sext.w	a5,a5
    80002d34:	fe079ae3          	bnez	a5,80002d28 <acquire+0x5c>
    80002d38:	0ff0000f          	fence
    80002d3c:	fffff097          	auipc	ra,0xfffff
    80002d40:	89c080e7          	jalr	-1892(ra) # 800015d8 <mycpu>
    80002d44:	01813083          	ld	ra,24(sp)
    80002d48:	01013403          	ld	s0,16(sp)
    80002d4c:	00a4b823          	sd	a0,16(s1)
    80002d50:	00013903          	ld	s2,0(sp)
    80002d54:	00813483          	ld	s1,8(sp)
    80002d58:	02010113          	addi	sp,sp,32
    80002d5c:	00008067          	ret
    80002d60:	0104b903          	ld	s2,16(s1)
    80002d64:	fffff097          	auipc	ra,0xfffff
    80002d68:	874080e7          	jalr	-1932(ra) # 800015d8 <mycpu>
    80002d6c:	faa91ce3          	bne	s2,a0,80002d24 <acquire+0x58>
    80002d70:	00001517          	auipc	a0,0x1
    80002d74:	4c050513          	addi	a0,a0,1216 # 80004230 <digits+0x20>
    80002d78:	fffff097          	auipc	ra,0xfffff
    80002d7c:	224080e7          	jalr	548(ra) # 80001f9c <panic>
    80002d80:	00195913          	srli	s2,s2,0x1
    80002d84:	fffff097          	auipc	ra,0xfffff
    80002d88:	854080e7          	jalr	-1964(ra) # 800015d8 <mycpu>
    80002d8c:	00197913          	andi	s2,s2,1
    80002d90:	07252e23          	sw	s2,124(a0)
    80002d94:	f75ff06f          	j	80002d08 <acquire+0x3c>

0000000080002d98 <release>:
    80002d98:	fe010113          	addi	sp,sp,-32
    80002d9c:	00813823          	sd	s0,16(sp)
    80002da0:	00113c23          	sd	ra,24(sp)
    80002da4:	00913423          	sd	s1,8(sp)
    80002da8:	01213023          	sd	s2,0(sp)
    80002dac:	02010413          	addi	s0,sp,32
    80002db0:	00052783          	lw	a5,0(a0)
    80002db4:	00079a63          	bnez	a5,80002dc8 <release+0x30>
    80002db8:	00001517          	auipc	a0,0x1
    80002dbc:	48050513          	addi	a0,a0,1152 # 80004238 <digits+0x28>
    80002dc0:	fffff097          	auipc	ra,0xfffff
    80002dc4:	1dc080e7          	jalr	476(ra) # 80001f9c <panic>
    80002dc8:	01053903          	ld	s2,16(a0)
    80002dcc:	00050493          	mv	s1,a0
    80002dd0:	fffff097          	auipc	ra,0xfffff
    80002dd4:	808080e7          	jalr	-2040(ra) # 800015d8 <mycpu>
    80002dd8:	fea910e3          	bne	s2,a0,80002db8 <release+0x20>
    80002ddc:	0004b823          	sd	zero,16(s1)
    80002de0:	0ff0000f          	fence
    80002de4:	0f50000f          	fence	iorw,ow
    80002de8:	0804a02f          	amoswap.w	zero,zero,(s1)
    80002dec:	ffffe097          	auipc	ra,0xffffe
    80002df0:	7ec080e7          	jalr	2028(ra) # 800015d8 <mycpu>
    80002df4:	100027f3          	csrr	a5,sstatus
    80002df8:	0027f793          	andi	a5,a5,2
    80002dfc:	04079a63          	bnez	a5,80002e50 <release+0xb8>
    80002e00:	07852783          	lw	a5,120(a0)
    80002e04:	02f05e63          	blez	a5,80002e40 <release+0xa8>
    80002e08:	fff7871b          	addiw	a4,a5,-1
    80002e0c:	06e52c23          	sw	a4,120(a0)
    80002e10:	00071c63          	bnez	a4,80002e28 <release+0x90>
    80002e14:	07c52783          	lw	a5,124(a0)
    80002e18:	00078863          	beqz	a5,80002e28 <release+0x90>
    80002e1c:	100027f3          	csrr	a5,sstatus
    80002e20:	0027e793          	ori	a5,a5,2
    80002e24:	10079073          	csrw	sstatus,a5
    80002e28:	01813083          	ld	ra,24(sp)
    80002e2c:	01013403          	ld	s0,16(sp)
    80002e30:	00813483          	ld	s1,8(sp)
    80002e34:	00013903          	ld	s2,0(sp)
    80002e38:	02010113          	addi	sp,sp,32
    80002e3c:	00008067          	ret
    80002e40:	00001517          	auipc	a0,0x1
    80002e44:	41850513          	addi	a0,a0,1048 # 80004258 <digits+0x48>
    80002e48:	fffff097          	auipc	ra,0xfffff
    80002e4c:	154080e7          	jalr	340(ra) # 80001f9c <panic>
    80002e50:	00001517          	auipc	a0,0x1
    80002e54:	3f050513          	addi	a0,a0,1008 # 80004240 <digits+0x30>
    80002e58:	fffff097          	auipc	ra,0xfffff
    80002e5c:	144080e7          	jalr	324(ra) # 80001f9c <panic>

0000000080002e60 <holding>:
    80002e60:	00052783          	lw	a5,0(a0)
    80002e64:	00079663          	bnez	a5,80002e70 <holding+0x10>
    80002e68:	00000513          	li	a0,0
    80002e6c:	00008067          	ret
    80002e70:	fe010113          	addi	sp,sp,-32
    80002e74:	00813823          	sd	s0,16(sp)
    80002e78:	00913423          	sd	s1,8(sp)
    80002e7c:	00113c23          	sd	ra,24(sp)
    80002e80:	02010413          	addi	s0,sp,32
    80002e84:	01053483          	ld	s1,16(a0)
    80002e88:	ffffe097          	auipc	ra,0xffffe
    80002e8c:	750080e7          	jalr	1872(ra) # 800015d8 <mycpu>
    80002e90:	01813083          	ld	ra,24(sp)
    80002e94:	01013403          	ld	s0,16(sp)
    80002e98:	40a48533          	sub	a0,s1,a0
    80002e9c:	00153513          	seqz	a0,a0
    80002ea0:	00813483          	ld	s1,8(sp)
    80002ea4:	02010113          	addi	sp,sp,32
    80002ea8:	00008067          	ret

0000000080002eac <push_off>:
    80002eac:	fe010113          	addi	sp,sp,-32
    80002eb0:	00813823          	sd	s0,16(sp)
    80002eb4:	00113c23          	sd	ra,24(sp)
    80002eb8:	00913423          	sd	s1,8(sp)
    80002ebc:	02010413          	addi	s0,sp,32
    80002ec0:	100024f3          	csrr	s1,sstatus
    80002ec4:	100027f3          	csrr	a5,sstatus
    80002ec8:	ffd7f793          	andi	a5,a5,-3
    80002ecc:	10079073          	csrw	sstatus,a5
    80002ed0:	ffffe097          	auipc	ra,0xffffe
    80002ed4:	708080e7          	jalr	1800(ra) # 800015d8 <mycpu>
    80002ed8:	07852783          	lw	a5,120(a0)
    80002edc:	02078663          	beqz	a5,80002f08 <push_off+0x5c>
    80002ee0:	ffffe097          	auipc	ra,0xffffe
    80002ee4:	6f8080e7          	jalr	1784(ra) # 800015d8 <mycpu>
    80002ee8:	07852783          	lw	a5,120(a0)
    80002eec:	01813083          	ld	ra,24(sp)
    80002ef0:	01013403          	ld	s0,16(sp)
    80002ef4:	0017879b          	addiw	a5,a5,1
    80002ef8:	06f52c23          	sw	a5,120(a0)
    80002efc:	00813483          	ld	s1,8(sp)
    80002f00:	02010113          	addi	sp,sp,32
    80002f04:	00008067          	ret
    80002f08:	0014d493          	srli	s1,s1,0x1
    80002f0c:	ffffe097          	auipc	ra,0xffffe
    80002f10:	6cc080e7          	jalr	1740(ra) # 800015d8 <mycpu>
    80002f14:	0014f493          	andi	s1,s1,1
    80002f18:	06952e23          	sw	s1,124(a0)
    80002f1c:	fc5ff06f          	j	80002ee0 <push_off+0x34>

0000000080002f20 <pop_off>:
    80002f20:	ff010113          	addi	sp,sp,-16
    80002f24:	00813023          	sd	s0,0(sp)
    80002f28:	00113423          	sd	ra,8(sp)
    80002f2c:	01010413          	addi	s0,sp,16
    80002f30:	ffffe097          	auipc	ra,0xffffe
    80002f34:	6a8080e7          	jalr	1704(ra) # 800015d8 <mycpu>
    80002f38:	100027f3          	csrr	a5,sstatus
    80002f3c:	0027f793          	andi	a5,a5,2
    80002f40:	04079663          	bnez	a5,80002f8c <pop_off+0x6c>
    80002f44:	07852783          	lw	a5,120(a0)
    80002f48:	02f05a63          	blez	a5,80002f7c <pop_off+0x5c>
    80002f4c:	fff7871b          	addiw	a4,a5,-1
    80002f50:	06e52c23          	sw	a4,120(a0)
    80002f54:	00071c63          	bnez	a4,80002f6c <pop_off+0x4c>
    80002f58:	07c52783          	lw	a5,124(a0)
    80002f5c:	00078863          	beqz	a5,80002f6c <pop_off+0x4c>
    80002f60:	100027f3          	csrr	a5,sstatus
    80002f64:	0027e793          	ori	a5,a5,2
    80002f68:	10079073          	csrw	sstatus,a5
    80002f6c:	00813083          	ld	ra,8(sp)
    80002f70:	00013403          	ld	s0,0(sp)
    80002f74:	01010113          	addi	sp,sp,16
    80002f78:	00008067          	ret
    80002f7c:	00001517          	auipc	a0,0x1
    80002f80:	2dc50513          	addi	a0,a0,732 # 80004258 <digits+0x48>
    80002f84:	fffff097          	auipc	ra,0xfffff
    80002f88:	018080e7          	jalr	24(ra) # 80001f9c <panic>
    80002f8c:	00001517          	auipc	a0,0x1
    80002f90:	2b450513          	addi	a0,a0,692 # 80004240 <digits+0x30>
    80002f94:	fffff097          	auipc	ra,0xfffff
    80002f98:	008080e7          	jalr	8(ra) # 80001f9c <panic>

0000000080002f9c <push_on>:
    80002f9c:	fe010113          	addi	sp,sp,-32
    80002fa0:	00813823          	sd	s0,16(sp)
    80002fa4:	00113c23          	sd	ra,24(sp)
    80002fa8:	00913423          	sd	s1,8(sp)
    80002fac:	02010413          	addi	s0,sp,32
    80002fb0:	100024f3          	csrr	s1,sstatus
    80002fb4:	100027f3          	csrr	a5,sstatus
    80002fb8:	0027e793          	ori	a5,a5,2
    80002fbc:	10079073          	csrw	sstatus,a5
    80002fc0:	ffffe097          	auipc	ra,0xffffe
    80002fc4:	618080e7          	jalr	1560(ra) # 800015d8 <mycpu>
    80002fc8:	07852783          	lw	a5,120(a0)
    80002fcc:	02078663          	beqz	a5,80002ff8 <push_on+0x5c>
    80002fd0:	ffffe097          	auipc	ra,0xffffe
    80002fd4:	608080e7          	jalr	1544(ra) # 800015d8 <mycpu>
    80002fd8:	07852783          	lw	a5,120(a0)
    80002fdc:	01813083          	ld	ra,24(sp)
    80002fe0:	01013403          	ld	s0,16(sp)
    80002fe4:	0017879b          	addiw	a5,a5,1
    80002fe8:	06f52c23          	sw	a5,120(a0)
    80002fec:	00813483          	ld	s1,8(sp)
    80002ff0:	02010113          	addi	sp,sp,32
    80002ff4:	00008067          	ret
    80002ff8:	0014d493          	srli	s1,s1,0x1
    80002ffc:	ffffe097          	auipc	ra,0xffffe
    80003000:	5dc080e7          	jalr	1500(ra) # 800015d8 <mycpu>
    80003004:	0014f493          	andi	s1,s1,1
    80003008:	06952e23          	sw	s1,124(a0)
    8000300c:	fc5ff06f          	j	80002fd0 <push_on+0x34>

0000000080003010 <pop_on>:
    80003010:	ff010113          	addi	sp,sp,-16
    80003014:	00813023          	sd	s0,0(sp)
    80003018:	00113423          	sd	ra,8(sp)
    8000301c:	01010413          	addi	s0,sp,16
    80003020:	ffffe097          	auipc	ra,0xffffe
    80003024:	5b8080e7          	jalr	1464(ra) # 800015d8 <mycpu>
    80003028:	100027f3          	csrr	a5,sstatus
    8000302c:	0027f793          	andi	a5,a5,2
    80003030:	04078463          	beqz	a5,80003078 <pop_on+0x68>
    80003034:	07852783          	lw	a5,120(a0)
    80003038:	02f05863          	blez	a5,80003068 <pop_on+0x58>
    8000303c:	fff7879b          	addiw	a5,a5,-1
    80003040:	06f52c23          	sw	a5,120(a0)
    80003044:	07853783          	ld	a5,120(a0)
    80003048:	00079863          	bnez	a5,80003058 <pop_on+0x48>
    8000304c:	100027f3          	csrr	a5,sstatus
    80003050:	ffd7f793          	andi	a5,a5,-3
    80003054:	10079073          	csrw	sstatus,a5
    80003058:	00813083          	ld	ra,8(sp)
    8000305c:	00013403          	ld	s0,0(sp)
    80003060:	01010113          	addi	sp,sp,16
    80003064:	00008067          	ret
    80003068:	00001517          	auipc	a0,0x1
    8000306c:	21850513          	addi	a0,a0,536 # 80004280 <digits+0x70>
    80003070:	fffff097          	auipc	ra,0xfffff
    80003074:	f2c080e7          	jalr	-212(ra) # 80001f9c <panic>
    80003078:	00001517          	auipc	a0,0x1
    8000307c:	1e850513          	addi	a0,a0,488 # 80004260 <digits+0x50>
    80003080:	fffff097          	auipc	ra,0xfffff
    80003084:	f1c080e7          	jalr	-228(ra) # 80001f9c <panic>

0000000080003088 <__memset>:
    80003088:	ff010113          	addi	sp,sp,-16
    8000308c:	00813423          	sd	s0,8(sp)
    80003090:	01010413          	addi	s0,sp,16
    80003094:	1a060e63          	beqz	a2,80003250 <__memset+0x1c8>
    80003098:	40a007b3          	neg	a5,a0
    8000309c:	0077f793          	andi	a5,a5,7
    800030a0:	00778693          	addi	a3,a5,7
    800030a4:	00b00813          	li	a6,11
    800030a8:	0ff5f593          	andi	a1,a1,255
    800030ac:	fff6071b          	addiw	a4,a2,-1
    800030b0:	1b06e663          	bltu	a3,a6,8000325c <__memset+0x1d4>
    800030b4:	1cd76463          	bltu	a4,a3,8000327c <__memset+0x1f4>
    800030b8:	1a078e63          	beqz	a5,80003274 <__memset+0x1ec>
    800030bc:	00b50023          	sb	a1,0(a0)
    800030c0:	00100713          	li	a4,1
    800030c4:	1ae78463          	beq	a5,a4,8000326c <__memset+0x1e4>
    800030c8:	00b500a3          	sb	a1,1(a0)
    800030cc:	00200713          	li	a4,2
    800030d0:	1ae78a63          	beq	a5,a4,80003284 <__memset+0x1fc>
    800030d4:	00b50123          	sb	a1,2(a0)
    800030d8:	00300713          	li	a4,3
    800030dc:	18e78463          	beq	a5,a4,80003264 <__memset+0x1dc>
    800030e0:	00b501a3          	sb	a1,3(a0)
    800030e4:	00400713          	li	a4,4
    800030e8:	1ae78263          	beq	a5,a4,8000328c <__memset+0x204>
    800030ec:	00b50223          	sb	a1,4(a0)
    800030f0:	00500713          	li	a4,5
    800030f4:	1ae78063          	beq	a5,a4,80003294 <__memset+0x20c>
    800030f8:	00b502a3          	sb	a1,5(a0)
    800030fc:	00700713          	li	a4,7
    80003100:	18e79e63          	bne	a5,a4,8000329c <__memset+0x214>
    80003104:	00b50323          	sb	a1,6(a0)
    80003108:	00700e93          	li	t4,7
    8000310c:	00859713          	slli	a4,a1,0x8
    80003110:	00e5e733          	or	a4,a1,a4
    80003114:	01059e13          	slli	t3,a1,0x10
    80003118:	01c76e33          	or	t3,a4,t3
    8000311c:	01859313          	slli	t1,a1,0x18
    80003120:	006e6333          	or	t1,t3,t1
    80003124:	02059893          	slli	a7,a1,0x20
    80003128:	40f60e3b          	subw	t3,a2,a5
    8000312c:	011368b3          	or	a7,t1,a7
    80003130:	02859813          	slli	a6,a1,0x28
    80003134:	0108e833          	or	a6,a7,a6
    80003138:	03059693          	slli	a3,a1,0x30
    8000313c:	003e589b          	srliw	a7,t3,0x3
    80003140:	00d866b3          	or	a3,a6,a3
    80003144:	03859713          	slli	a4,a1,0x38
    80003148:	00389813          	slli	a6,a7,0x3
    8000314c:	00f507b3          	add	a5,a0,a5
    80003150:	00e6e733          	or	a4,a3,a4
    80003154:	000e089b          	sext.w	a7,t3
    80003158:	00f806b3          	add	a3,a6,a5
    8000315c:	00e7b023          	sd	a4,0(a5)
    80003160:	00878793          	addi	a5,a5,8
    80003164:	fed79ce3          	bne	a5,a3,8000315c <__memset+0xd4>
    80003168:	ff8e7793          	andi	a5,t3,-8
    8000316c:	0007871b          	sext.w	a4,a5
    80003170:	01d787bb          	addw	a5,a5,t4
    80003174:	0ce88e63          	beq	a7,a4,80003250 <__memset+0x1c8>
    80003178:	00f50733          	add	a4,a0,a5
    8000317c:	00b70023          	sb	a1,0(a4)
    80003180:	0017871b          	addiw	a4,a5,1
    80003184:	0cc77663          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    80003188:	00e50733          	add	a4,a0,a4
    8000318c:	00b70023          	sb	a1,0(a4)
    80003190:	0027871b          	addiw	a4,a5,2
    80003194:	0ac77e63          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    80003198:	00e50733          	add	a4,a0,a4
    8000319c:	00b70023          	sb	a1,0(a4)
    800031a0:	0037871b          	addiw	a4,a5,3
    800031a4:	0ac77663          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    800031a8:	00e50733          	add	a4,a0,a4
    800031ac:	00b70023          	sb	a1,0(a4)
    800031b0:	0047871b          	addiw	a4,a5,4
    800031b4:	08c77e63          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    800031b8:	00e50733          	add	a4,a0,a4
    800031bc:	00b70023          	sb	a1,0(a4)
    800031c0:	0057871b          	addiw	a4,a5,5
    800031c4:	08c77663          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    800031c8:	00e50733          	add	a4,a0,a4
    800031cc:	00b70023          	sb	a1,0(a4)
    800031d0:	0067871b          	addiw	a4,a5,6
    800031d4:	06c77e63          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    800031d8:	00e50733          	add	a4,a0,a4
    800031dc:	00b70023          	sb	a1,0(a4)
    800031e0:	0077871b          	addiw	a4,a5,7
    800031e4:	06c77663          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    800031e8:	00e50733          	add	a4,a0,a4
    800031ec:	00b70023          	sb	a1,0(a4)
    800031f0:	0087871b          	addiw	a4,a5,8
    800031f4:	04c77e63          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    800031f8:	00e50733          	add	a4,a0,a4
    800031fc:	00b70023          	sb	a1,0(a4)
    80003200:	0097871b          	addiw	a4,a5,9
    80003204:	04c77663          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    80003208:	00e50733          	add	a4,a0,a4
    8000320c:	00b70023          	sb	a1,0(a4)
    80003210:	00a7871b          	addiw	a4,a5,10
    80003214:	02c77e63          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    80003218:	00e50733          	add	a4,a0,a4
    8000321c:	00b70023          	sb	a1,0(a4)
    80003220:	00b7871b          	addiw	a4,a5,11
    80003224:	02c77663          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    80003228:	00e50733          	add	a4,a0,a4
    8000322c:	00b70023          	sb	a1,0(a4)
    80003230:	00c7871b          	addiw	a4,a5,12
    80003234:	00c77e63          	bgeu	a4,a2,80003250 <__memset+0x1c8>
    80003238:	00e50733          	add	a4,a0,a4
    8000323c:	00b70023          	sb	a1,0(a4)
    80003240:	00d7879b          	addiw	a5,a5,13
    80003244:	00c7f663          	bgeu	a5,a2,80003250 <__memset+0x1c8>
    80003248:	00f507b3          	add	a5,a0,a5
    8000324c:	00b78023          	sb	a1,0(a5)
    80003250:	00813403          	ld	s0,8(sp)
    80003254:	01010113          	addi	sp,sp,16
    80003258:	00008067          	ret
    8000325c:	00b00693          	li	a3,11
    80003260:	e55ff06f          	j	800030b4 <__memset+0x2c>
    80003264:	00300e93          	li	t4,3
    80003268:	ea5ff06f          	j	8000310c <__memset+0x84>
    8000326c:	00100e93          	li	t4,1
    80003270:	e9dff06f          	j	8000310c <__memset+0x84>
    80003274:	00000e93          	li	t4,0
    80003278:	e95ff06f          	j	8000310c <__memset+0x84>
    8000327c:	00000793          	li	a5,0
    80003280:	ef9ff06f          	j	80003178 <__memset+0xf0>
    80003284:	00200e93          	li	t4,2
    80003288:	e85ff06f          	j	8000310c <__memset+0x84>
    8000328c:	00400e93          	li	t4,4
    80003290:	e7dff06f          	j	8000310c <__memset+0x84>
    80003294:	00500e93          	li	t4,5
    80003298:	e75ff06f          	j	8000310c <__memset+0x84>
    8000329c:	00600e93          	li	t4,6
    800032a0:	e6dff06f          	j	8000310c <__memset+0x84>

00000000800032a4 <__memmove>:
    800032a4:	ff010113          	addi	sp,sp,-16
    800032a8:	00813423          	sd	s0,8(sp)
    800032ac:	01010413          	addi	s0,sp,16
    800032b0:	0e060863          	beqz	a2,800033a0 <__memmove+0xfc>
    800032b4:	fff6069b          	addiw	a3,a2,-1
    800032b8:	0006881b          	sext.w	a6,a3
    800032bc:	0ea5e863          	bltu	a1,a0,800033ac <__memmove+0x108>
    800032c0:	00758713          	addi	a4,a1,7
    800032c4:	00a5e7b3          	or	a5,a1,a0
    800032c8:	40a70733          	sub	a4,a4,a0
    800032cc:	0077f793          	andi	a5,a5,7
    800032d0:	00f73713          	sltiu	a4,a4,15
    800032d4:	00174713          	xori	a4,a4,1
    800032d8:	0017b793          	seqz	a5,a5
    800032dc:	00e7f7b3          	and	a5,a5,a4
    800032e0:	10078863          	beqz	a5,800033f0 <__memmove+0x14c>
    800032e4:	00900793          	li	a5,9
    800032e8:	1107f463          	bgeu	a5,a6,800033f0 <__memmove+0x14c>
    800032ec:	0036581b          	srliw	a6,a2,0x3
    800032f0:	fff8081b          	addiw	a6,a6,-1
    800032f4:	02081813          	slli	a6,a6,0x20
    800032f8:	01d85893          	srli	a7,a6,0x1d
    800032fc:	00858813          	addi	a6,a1,8
    80003300:	00058793          	mv	a5,a1
    80003304:	00050713          	mv	a4,a0
    80003308:	01088833          	add	a6,a7,a6
    8000330c:	0007b883          	ld	a7,0(a5)
    80003310:	00878793          	addi	a5,a5,8
    80003314:	00870713          	addi	a4,a4,8
    80003318:	ff173c23          	sd	a7,-8(a4)
    8000331c:	ff0798e3          	bne	a5,a6,8000330c <__memmove+0x68>
    80003320:	ff867713          	andi	a4,a2,-8
    80003324:	02071793          	slli	a5,a4,0x20
    80003328:	0207d793          	srli	a5,a5,0x20
    8000332c:	00f585b3          	add	a1,a1,a5
    80003330:	40e686bb          	subw	a3,a3,a4
    80003334:	00f507b3          	add	a5,a0,a5
    80003338:	06e60463          	beq	a2,a4,800033a0 <__memmove+0xfc>
    8000333c:	0005c703          	lbu	a4,0(a1)
    80003340:	00e78023          	sb	a4,0(a5)
    80003344:	04068e63          	beqz	a3,800033a0 <__memmove+0xfc>
    80003348:	0015c603          	lbu	a2,1(a1)
    8000334c:	00100713          	li	a4,1
    80003350:	00c780a3          	sb	a2,1(a5)
    80003354:	04e68663          	beq	a3,a4,800033a0 <__memmove+0xfc>
    80003358:	0025c603          	lbu	a2,2(a1)
    8000335c:	00200713          	li	a4,2
    80003360:	00c78123          	sb	a2,2(a5)
    80003364:	02e68e63          	beq	a3,a4,800033a0 <__memmove+0xfc>
    80003368:	0035c603          	lbu	a2,3(a1)
    8000336c:	00300713          	li	a4,3
    80003370:	00c781a3          	sb	a2,3(a5)
    80003374:	02e68663          	beq	a3,a4,800033a0 <__memmove+0xfc>
    80003378:	0045c603          	lbu	a2,4(a1)
    8000337c:	00400713          	li	a4,4
    80003380:	00c78223          	sb	a2,4(a5)
    80003384:	00e68e63          	beq	a3,a4,800033a0 <__memmove+0xfc>
    80003388:	0055c603          	lbu	a2,5(a1)
    8000338c:	00500713          	li	a4,5
    80003390:	00c782a3          	sb	a2,5(a5)
    80003394:	00e68663          	beq	a3,a4,800033a0 <__memmove+0xfc>
    80003398:	0065c703          	lbu	a4,6(a1)
    8000339c:	00e78323          	sb	a4,6(a5)
    800033a0:	00813403          	ld	s0,8(sp)
    800033a4:	01010113          	addi	sp,sp,16
    800033a8:	00008067          	ret
    800033ac:	02061713          	slli	a4,a2,0x20
    800033b0:	02075713          	srli	a4,a4,0x20
    800033b4:	00e587b3          	add	a5,a1,a4
    800033b8:	f0f574e3          	bgeu	a0,a5,800032c0 <__memmove+0x1c>
    800033bc:	02069613          	slli	a2,a3,0x20
    800033c0:	02065613          	srli	a2,a2,0x20
    800033c4:	fff64613          	not	a2,a2
    800033c8:	00e50733          	add	a4,a0,a4
    800033cc:	00c78633          	add	a2,a5,a2
    800033d0:	fff7c683          	lbu	a3,-1(a5)
    800033d4:	fff78793          	addi	a5,a5,-1
    800033d8:	fff70713          	addi	a4,a4,-1
    800033dc:	00d70023          	sb	a3,0(a4)
    800033e0:	fec798e3          	bne	a5,a2,800033d0 <__memmove+0x12c>
    800033e4:	00813403          	ld	s0,8(sp)
    800033e8:	01010113          	addi	sp,sp,16
    800033ec:	00008067          	ret
    800033f0:	02069713          	slli	a4,a3,0x20
    800033f4:	02075713          	srli	a4,a4,0x20
    800033f8:	00170713          	addi	a4,a4,1
    800033fc:	00e50733          	add	a4,a0,a4
    80003400:	00050793          	mv	a5,a0
    80003404:	0005c683          	lbu	a3,0(a1)
    80003408:	00178793          	addi	a5,a5,1
    8000340c:	00158593          	addi	a1,a1,1
    80003410:	fed78fa3          	sb	a3,-1(a5)
    80003414:	fee798e3          	bne	a5,a4,80003404 <__memmove+0x160>
    80003418:	f89ff06f          	j	800033a0 <__memmove+0xfc>

000000008000341c <__putc>:
    8000341c:	fe010113          	addi	sp,sp,-32
    80003420:	00813823          	sd	s0,16(sp)
    80003424:	00113c23          	sd	ra,24(sp)
    80003428:	02010413          	addi	s0,sp,32
    8000342c:	00050793          	mv	a5,a0
    80003430:	fef40593          	addi	a1,s0,-17
    80003434:	00100613          	li	a2,1
    80003438:	00000513          	li	a0,0
    8000343c:	fef407a3          	sb	a5,-17(s0)
    80003440:	fffff097          	auipc	ra,0xfffff
    80003444:	b3c080e7          	jalr	-1220(ra) # 80001f7c <console_write>
    80003448:	01813083          	ld	ra,24(sp)
    8000344c:	01013403          	ld	s0,16(sp)
    80003450:	02010113          	addi	sp,sp,32
    80003454:	00008067          	ret

0000000080003458 <__getc>:
    80003458:	fe010113          	addi	sp,sp,-32
    8000345c:	00813823          	sd	s0,16(sp)
    80003460:	00113c23          	sd	ra,24(sp)
    80003464:	02010413          	addi	s0,sp,32
    80003468:	fe840593          	addi	a1,s0,-24
    8000346c:	00100613          	li	a2,1
    80003470:	00000513          	li	a0,0
    80003474:	fffff097          	auipc	ra,0xfffff
    80003478:	ae8080e7          	jalr	-1304(ra) # 80001f5c <console_read>
    8000347c:	fe844503          	lbu	a0,-24(s0)
    80003480:	01813083          	ld	ra,24(sp)
    80003484:	01013403          	ld	s0,16(sp)
    80003488:	02010113          	addi	sp,sp,32
    8000348c:	00008067          	ret

0000000080003490 <console_handler>:
    80003490:	fe010113          	addi	sp,sp,-32
    80003494:	00813823          	sd	s0,16(sp)
    80003498:	00113c23          	sd	ra,24(sp)
    8000349c:	00913423          	sd	s1,8(sp)
    800034a0:	02010413          	addi	s0,sp,32
    800034a4:	14202773          	csrr	a4,scause
    800034a8:	100027f3          	csrr	a5,sstatus
    800034ac:	0027f793          	andi	a5,a5,2
    800034b0:	06079e63          	bnez	a5,8000352c <console_handler+0x9c>
    800034b4:	00074c63          	bltz	a4,800034cc <console_handler+0x3c>
    800034b8:	01813083          	ld	ra,24(sp)
    800034bc:	01013403          	ld	s0,16(sp)
    800034c0:	00813483          	ld	s1,8(sp)
    800034c4:	02010113          	addi	sp,sp,32
    800034c8:	00008067          	ret
    800034cc:	0ff77713          	andi	a4,a4,255
    800034d0:	00900793          	li	a5,9
    800034d4:	fef712e3          	bne	a4,a5,800034b8 <console_handler+0x28>
    800034d8:	ffffe097          	auipc	ra,0xffffe
    800034dc:	6dc080e7          	jalr	1756(ra) # 80001bb4 <plic_claim>
    800034e0:	00a00793          	li	a5,10
    800034e4:	00050493          	mv	s1,a0
    800034e8:	02f50c63          	beq	a0,a5,80003520 <console_handler+0x90>
    800034ec:	fc0506e3          	beqz	a0,800034b8 <console_handler+0x28>
    800034f0:	00050593          	mv	a1,a0
    800034f4:	00001517          	auipc	a0,0x1
    800034f8:	c9450513          	addi	a0,a0,-876 # 80004188 <console_handler+0xcf8>
    800034fc:	fffff097          	auipc	ra,0xfffff
    80003500:	afc080e7          	jalr	-1284(ra) # 80001ff8 <__printf>
    80003504:	01013403          	ld	s0,16(sp)
    80003508:	01813083          	ld	ra,24(sp)
    8000350c:	00048513          	mv	a0,s1
    80003510:	00813483          	ld	s1,8(sp)
    80003514:	02010113          	addi	sp,sp,32
    80003518:	ffffe317          	auipc	t1,0xffffe
    8000351c:	6d430067          	jr	1748(t1) # 80001bec <plic_complete>
    80003520:	fffff097          	auipc	ra,0xfffff
    80003524:	3e0080e7          	jalr	992(ra) # 80002900 <uartintr>
    80003528:	fddff06f          	j	80003504 <console_handler+0x74>
    8000352c:	00001517          	auipc	a0,0x1
    80003530:	d5c50513          	addi	a0,a0,-676 # 80004288 <digits+0x78>
    80003534:	fffff097          	auipc	ra,0xfffff
    80003538:	a68080e7          	jalr	-1432(ra) # 80001f9c <panic>
	...
