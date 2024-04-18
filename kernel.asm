
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	5d813103          	ld	sp,1496(sp) # 800045d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	708010ef          	jal	ra,80001724 <start>

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
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
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
    8000102c:	04b13c23          	sd	a1,88(sp)
    80001030:	06c13023          	sd	a2,96(sp)
    80001034:	06d13423          	sd	a3,104(sp)
    80001038:	06e13823          	sd	a4,112(sp)
    8000103c:	06f13c23          	sd	a5,120(sp)
    80001040:	09013023          	sd	a6,128(sp)
    80001044:	09113423          	sd	a7,136(sp)
    80001048:	09213823          	sd	s2,144(sp)
    8000104c:	09313c23          	sd	s3,152(sp)
    80001050:	0b413023          	sd	s4,160(sp)
    80001054:	0b513423          	sd	s5,168(sp)
    80001058:	0b613823          	sd	s6,176(sp)
    8000105c:	0b713c23          	sd	s7,184(sp)
    80001060:	0d813023          	sd	s8,192(sp)
    80001064:	0d913423          	sd	s9,200(sp)
    80001068:	0da13823          	sd	s10,208(sp)
    8000106c:	0db13c23          	sd	s11,216(sp)
    80001070:	0fc13023          	sd	t3,224(sp)
    80001074:	0fd13423          	sd	t4,232(sp)
    80001078:	0fe13823          	sd	t5,240(sp)
    8000107c:	0ff13c23          	sd	t6,248(sp)

    call _Z12ecallHandlerv
    80001080:	318000ef          	jal	ra,80001398 <_Z12ecallHandlerv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001084:	00013003          	ld	zero,0(sp)
    80001088:	00813083          	ld	ra,8(sp)
    8000108c:	01013103          	ld	sp,16(sp)
    80001090:	01813183          	ld	gp,24(sp)
    80001094:	02013203          	ld	tp,32(sp)
    80001098:	02813283          	ld	t0,40(sp)
    8000109c:	03013303          	ld	t1,48(sp)
    800010a0:	03813383          	ld	t2,56(sp)
    800010a4:	04013403          	ld	s0,64(sp)
    800010a8:	04813483          	ld	s1,72(sp)
    800010ac:	05813583          	ld	a1,88(sp)
    800010b0:	06013603          	ld	a2,96(sp)
    800010b4:	06813683          	ld	a3,104(sp)
    800010b8:	07013703          	ld	a4,112(sp)
    800010bc:	07813783          	ld	a5,120(sp)
    800010c0:	08013803          	ld	a6,128(sp)
    800010c4:	08813883          	ld	a7,136(sp)
    800010c8:	09013903          	ld	s2,144(sp)
    800010cc:	09813983          	ld	s3,152(sp)
    800010d0:	0a013a03          	ld	s4,160(sp)
    800010d4:	0a813a83          	ld	s5,168(sp)
    800010d8:	0b013b03          	ld	s6,176(sp)
    800010dc:	0b813b83          	ld	s7,184(sp)
    800010e0:	0c013c03          	ld	s8,192(sp)
    800010e4:	0c813c83          	ld	s9,200(sp)
    800010e8:	0d013d03          	ld	s10,208(sp)
    800010ec:	0d813d83          	ld	s11,216(sp)
    800010f0:	0e013e03          	ld	t3,224(sp)
    800010f4:	0e813e83          	ld	t4,232(sp)
    800010f8:	0f013f03          	ld	t5,240(sp)
    800010fc:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001100:	10010113          	addi	sp,sp,256
    80001104:	10200073          	sret
	...

0000000080001110 <_Z9mem_allocm>:
//
// Created by os on 4/15/24.
//
#include "../h/syscall_c.hpp"

void* mem_alloc(uint64 size){
    80001110:	ff010113          	addi	sp,sp,-16
    80001114:	00813423          	sd	s0,8(sp)
    80001118:	01010413          	addi	s0,sp,16

    size += sizeof(size_t); //this is to account for metadata for size of allocated segment
    8000111c:	00850513          	addi	a0,a0,8 # 1008 <_entry-0x7fffeff8>

    //recalculating size to be number of memory blocks, instead of bytes.
    if(size == 0) return nullptr;
    80001120:	02050c63          	beqz	a0,80001158 <_Z9mem_allocm+0x48>
    if(size < MEM_BLOCK_SIZE){
    80001124:	03f00793          	li	a5,63
    80001128:	02a7f463          	bgeu	a5,a0,80001150 <_Z9mem_allocm+0x40>
        size = 1;
    }else{
        size = size/MEM_BLOCK_SIZE+1;
    8000112c:	00655513          	srli	a0,a0,0x6
    80001130:	00150513          	addi	a0,a0,1
    }

    asm("mv a1, %0;"
        "li a0, 0x01;" : : "r"(size));
    80001134:	00050593          	mv	a1,a0
    80001138:	00100513          	li	a0,1
    asm("ecall;");
    8000113c:	00000073          	ecall
    return value;
}

inline uint64 readA0(){
    uint64 value;
    asm("mv %0, a0;": "=r"(value));
    80001140:	00050513          	mv	a0,a0

    uint64 value = readA0();
    return (void*)value;
}
    80001144:	00813403          	ld	s0,8(sp)
    80001148:	01010113          	addi	sp,sp,16
    8000114c:	00008067          	ret
        size = 1;
    80001150:	00100513          	li	a0,1
    80001154:	fe1ff06f          	j	80001134 <_Z9mem_allocm+0x24>
    if(size == 0) return nullptr;
    80001158:	00000513          	li	a0,0
    8000115c:	fe9ff06f          	j	80001144 <_Z9mem_allocm+0x34>

0000000080001160 <_Z8mem_freePv>:

int mem_free(void* pointer){
    80001160:	ff010113          	addi	sp,sp,-16
    80001164:	00813423          	sd	s0,8(sp)
    80001168:	01010413          	addi	s0,sp,16
    if(pointer == nullptr) return -1;
    8000116c:	02050263          	beqz	a0,80001190 <_Z8mem_freePv+0x30>
    //if((uint64) pointer > )
    asm("mv a1, %0;"
        "li a0, 0x02;"
        "ecall;": : "r"(pointer));
    80001170:	00050593          	mv	a1,a0
    80001174:	00200513          	li	a0,2
    80001178:	00000073          	ecall
    8000117c:	00050513          	mv	a0,a0
    uint64 value = readA0();
    return (int)value;
    80001180:	0005051b          	sext.w	a0,a0
    80001184:	00813403          	ld	s0,8(sp)
    80001188:	01010113          	addi	sp,sp,16
    8000118c:	00008067          	ret
    if(pointer == nullptr) return -1;
    80001190:	fff00513          	li	a0,-1
    80001194:	ff1ff06f          	j	80001184 <_Z8mem_freePv+0x24>

0000000080001198 <main>:
//
#include "../h/riscv.hpp"
#include "../h/mem.hpp"
#include "../h/syscall_c.hpp"

int main(){
    80001198:	fe010113          	addi	sp,sp,-32
    8000119c:	00113c23          	sd	ra,24(sp)
    800011a0:	00813823          	sd	s0,16(sp)
    800011a4:	00913423          	sd	s1,8(sp)
    800011a8:	01213023          	sd	s2,0(sp)
    800011ac:	02010413          	addi	s0,sp,32
    //initialize system data structures and register values
    initializeSystemRegisters();
    800011b0:	00000097          	auipc	ra,0x0
    800011b4:	064080e7          	jalr	100(ra) # 80001214 <_Z25initializeSystemRegistersv>
    MemoryAllocator::initialize();
    800011b8:	00000097          	auipc	ra,0x0
    800011bc:	374080e7          	jalr	884(ra) # 8000152c <_ZN15MemoryAllocator10initializeEv>

    //start user main
    int* ptr1 = (int*)mem_alloc(10);
    800011c0:	00a00513          	li	a0,10
    800011c4:	00000097          	auipc	ra,0x0
    800011c8:	f4c080e7          	jalr	-180(ra) # 80001110 <_Z9mem_allocm>
    ptr1++;
    800011cc:	00450493          	addi	s1,a0,4
    }
    return;
}

inline void printUint(uint64 number){
    while(number > 0){
    800011d0:	02048063          	beqz	s1,800011f0 <main+0x58>
        int digit = number%10;
    800011d4:	00a00913          	li	s2,10
    800011d8:	0324f533          	remu	a0,s1,s2
        __putc((char)(48+digit));
    800011dc:	03050513          	addi	a0,a0,48
    800011e0:	00002097          	auipc	ra,0x2
    800011e4:	60c080e7          	jalr	1548(ra) # 800037ec <__putc>
        number/=10;
    800011e8:	0324d4b3          	divu	s1,s1,s2
    while(number > 0){
    800011ec:	fe5ff06f          	j	800011d0 <main+0x38>
    printUint((uint64)ptr1);
    //end user main

    stopEmulator();
    800011f0:	00000097          	auipc	ra,0x0
    800011f4:	048080e7          	jalr	72(ra) # 80001238 <_Z12stopEmulatorv>
    return 0;
    800011f8:	00000513          	li	a0,0
    800011fc:	01813083          	ld	ra,24(sp)
    80001200:	01013403          	ld	s0,16(sp)
    80001204:	00813483          	ld	s1,8(sp)
    80001208:	00013903          	ld	s2,0(sp)
    8000120c:	02010113          	addi	sp,sp,32
    80001210:	00008067          	ret

0000000080001214 <_Z25initializeSystemRegistersv>:
//

#include "../h/riscv.hpp"
#include "../h/mem.hpp"

void initializeSystemRegisters(){
    80001214:	ff010113          	addi	sp,sp,-16
    80001218:	00813423          	sd	s0,8(sp)
    8000121c:	01010413          	addi	s0,sp,16
    writeStvec((uint64)&ecallWrapper);
    80001220:	00003797          	auipc	a5,0x3
    80001224:	3c07b783          	ld	a5,960(a5) # 800045e0 <_GLOBAL_OFFSET_TABLE_+0x18>
    asm("csrw stvec, %0;": :"r"(value));
    80001228:	10579073          	csrw	stvec,a5
    //asm("la t0, _Z12ecallWrapperv;"
    //"csrw stvec, t0;");
}
    8000122c:	00813403          	ld	s0,8(sp)
    80001230:	01010113          	addi	sp,sp,16
    80001234:	00008067          	ret

0000000080001238 <_Z12stopEmulatorv>:

void stopEmulator(){
    80001238:	ff010113          	addi	sp,sp,-16
    8000123c:	00813423          	sd	s0,8(sp)
    80001240:	01010413          	addi	s0,sp,16
    //defined in project file
    asm("la t0, 0x100000;" //adress
        "la t1, 0x5555;" //value
        "sw t1, 0(t0);");
    80001244:	001002b7          	lui	t0,0x100
    80001248:	00005337          	lui	t1,0x5
    8000124c:	5553031b          	addiw	t1,t1,1365
    80001250:	0062a023          	sw	t1,0(t0) # 100000 <_entry-0x7ff00000>
}
    80001254:	00813403          	ld	s0,8(sp)
    80001258:	01010113          	addi	sp,sp,16
    8000125c:	00008067          	ret

0000000080001260 <_Z12timerHandlermm>:

void timerHandler(uint64 sepc, uint64 sstatus){
    80001260:	fe010113          	addi	sp,sp,-32
    80001264:	00113c23          	sd	ra,24(sp)
    80001268:	00813823          	sd	s0,16(sp)
    8000126c:	00913423          	sd	s1,8(sp)
    80001270:	01213023          	sd	s2,0(sp)
    80001274:	02010413          	addi	s0,sp,32
    80001278:	00050913          	mv	s2,a0
    8000127c:	00003497          	auipc	s1,0x3
    80001280:	da448493          	addi	s1,s1,-604 # 80004020 <CONSOLE_STATUS+0x10>
    while (*str != '\0'){
    80001284:	0004c503          	lbu	a0,0(s1)
    80001288:	00050a63          	beqz	a0,8000129c <_Z12timerHandlermm+0x3c>
        __putc(*str);
    8000128c:	00002097          	auipc	ra,0x2
    80001290:	560080e7          	jalr	1376(ra) # 800037ec <__putc>
        str++;
    80001294:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001298:	fedff06f          	j	80001284 <_Z12timerHandlermm+0x24>
    asm("csrw sepc, %0;": : "r"(value));
    8000129c:	14191073          	csrw	sepc,s2
    //trigger context switch or something
    printString("TIMER SIGNAL");
    writeSepc(sepc);
    writeSstatus(sstatus);
}
    800012a0:	01813083          	ld	ra,24(sp)
    800012a4:	01013403          	ld	s0,16(sp)
    800012a8:	00813483          	ld	s1,8(sp)
    800012ac:	00013903          	ld	s2,0(sp)
    800012b0:	02010113          	addi	sp,sp,32
    800012b4:	00008067          	ret

00000000800012b8 <_Z17systemCallHandlerv>:

void systemCallHandler(){
    800012b8:	fe010113          	addi	sp,sp,-32
    800012bc:	00113c23          	sd	ra,24(sp)
    800012c0:	00813823          	sd	s0,16(sp)
    800012c4:	00913423          	sd	s1,8(sp)
    800012c8:	01213023          	sd	s2,0(sp)
    800012cc:	02010413          	addi	s0,sp,32
    asm("mv %0, a0;": "=r"(value));
    800012d0:	00050493          	mv	s1,a0
    asm("mv %0, a1;": "=r"(value));
    800012d4:	00058513          	mv	a0,a1
    uint64 opCode = readA0();
    uint64 arg = readA1();
    void* ptr;
    switch (opCode) {
    800012d8:	00100793          	li	a5,1
    800012dc:	02f48663          	beq	s1,a5,80001308 <_Z17systemCallHandlerv+0x50>
    800012e0:	00200793          	li	a5,2
    800012e4:	02f48a63          	beq	s1,a5,80001318 <_Z17systemCallHandlerv+0x60>
    800012e8:	00003917          	auipc	s2,0x3
    800012ec:	d6090913          	addi	s2,s2,-672 # 80004048 <CONSOLE_STATUS+0x38>
    while (*str != '\0'){
    800012f0:	00094503          	lbu	a0,0(s2)
    800012f4:	04050263          	beqz	a0,80001338 <_Z17systemCallHandlerv+0x80>
        __putc(*str);
    800012f8:	00002097          	auipc	ra,0x2
    800012fc:	4f4080e7          	jalr	1268(ra) # 800037ec <__putc>
        str++;
    80001300:	00190913          	addi	s2,s2,1
    while (*str != '\0'){
    80001304:	fedff06f          	j	800012f0 <_Z17systemCallHandlerv+0x38>
        case 0x01: //mem_alloc
            ptr = MemoryAllocator::mem_allocate(arg);
    80001308:	00000097          	auipc	ra,0x0
    8000130c:	280080e7          	jalr	640(ra) # 80001588 <_ZN15MemoryAllocator12mem_allocateEm>
    asm("mv a0, %0;": : "r"(value));
    80001310:	00050513          	mv	a0,a0
}
    80001314:	06c0006f          	j	80001380 <_Z17systemCallHandlerv+0xc8>
    switch (opCode) {
    80001318:	00003497          	auipc	s1,0x3
    8000131c:	d1848493          	addi	s1,s1,-744 # 80004030 <CONSOLE_STATUS+0x20>
    while (*str != '\0'){
    80001320:	0004c503          	lbu	a0,0(s1)
    80001324:	04050e63          	beqz	a0,80001380 <_Z17systemCallHandlerv+0xc8>
        __putc(*str);
    80001328:	00002097          	auipc	ra,0x2
    8000132c:	4c4080e7          	jalr	1220(ra) # 800037ec <__putc>
        str++;
    80001330:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001334:	fedff06f          	j	80001320 <_Z17systemCallHandlerv+0x68>
    while(number > 0){
    80001338:	02048063          	beqz	s1,80001358 <_Z17systemCallHandlerv+0xa0>
        int digit = number%10;
    8000133c:	00a00913          	li	s2,10
    80001340:	0324f533          	remu	a0,s1,s2
        __putc((char)(48+digit));
    80001344:	03050513          	addi	a0,a0,48
    80001348:	00002097          	auipc	ra,0x2
    8000134c:	4a4080e7          	jalr	1188(ra) # 800037ec <__putc>
        number/=10;
    80001350:	0324d4b3          	divu	s1,s1,s2
    while(number > 0){
    80001354:	fe5ff06f          	j	80001338 <_Z17systemCallHandlerv+0x80>
    80001358:	00003497          	auipc	s1,0x3
    8000135c:	d3048493          	addi	s1,s1,-720 # 80004088 <CONSOLE_STATUS+0x78>
    while (*str != '\0'){
    80001360:	0004c503          	lbu	a0,0(s1)
    80001364:	00050a63          	beqz	a0,80001378 <_Z17systemCallHandlerv+0xc0>
        __putc(*str);
    80001368:	00002097          	auipc	ra,0x2
    8000136c:	484080e7          	jalr	1156(ra) # 800037ec <__putc>
        str++;
    80001370:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001374:	fedff06f          	j	80001360 <_Z17systemCallHandlerv+0xa8>
        default: //some random code, that should be handler as error
            //this is error case, because no other case should go here, print something
            printString("OS DETECTED ERROR: Unhandled opCode value for system call: '");
            printUint(opCode);
            printString("' ,shutting down...\n");
            stopEmulator();
    80001378:	00000097          	auipc	ra,0x0
    8000137c:	ec0080e7          	jalr	-320(ra) # 80001238 <_Z12stopEmulatorv>
            break;
    };
}
    80001380:	01813083          	ld	ra,24(sp)
    80001384:	01013403          	ld	s0,16(sp)
    80001388:	00813483          	ld	s1,8(sp)
    8000138c:	00013903          	ld	s2,0(sp)
    80001390:	02010113          	addi	sp,sp,32
    80001394:	00008067          	ret

0000000080001398 <_Z12ecallHandlerv>:

void ecallHandler(){
    80001398:	fd010113          	addi	sp,sp,-48
    8000139c:	02113423          	sd	ra,40(sp)
    800013a0:	02813023          	sd	s0,32(sp)
    800013a4:	00913c23          	sd	s1,24(sp)
    800013a8:	01213823          	sd	s2,16(sp)
    800013ac:	01313423          	sd	s3,8(sp)
    800013b0:	03010413          	addi	s0,sp,48
    asm("csrr %0, scause;": "=r"(value));
    800013b4:	142024f3          	csrr	s1,scause
    asm("csrr %0, sepc;": "=r"(value));
    800013b8:	14102973          	csrr	s2,sepc
    uint64 scause = readScause();
    uint64 sepc = readSepc()+4;
    800013bc:	00490913          	addi	s2,s2,4
    asm("csrr %0, sstatus;": "=r"(value));
    800013c0:	100025f3          	csrr	a1,sstatus
    uint64 sstatus = readSstatus();

    switch (scause) {
    800013c4:	00700793          	li	a5,7
    800013c8:	0cf48263          	beq	s1,a5,8000148c <_Z12ecallHandlerv+0xf4>
    800013cc:	0297f663          	bgeu	a5,s1,800013f8 <_Z12ecallHandlerv+0x60>
    800013d0:	00900793          	li	a5,9
    800013d4:	06f48a63          	beq	s1,a5,80001448 <_Z12ecallHandlerv+0xb0>
    800013d8:	fff00793          	li	a5,-1
    800013dc:	03f79793          	slli	a5,a5,0x3f
    800013e0:	00178793          	addi	a5,a5,1
    800013e4:	0cf49a63          	bne	s1,a5,800014b8 <_Z12ecallHandlerv+0x120>
        case 0x8000000000000001UL:
            timerHandler(sepc, sstatus);
    800013e8:	00090513          	mv	a0,s2
    800013ec:	00000097          	auipc	ra,0x0
    800013f0:	e74080e7          	jalr	-396(ra) # 80001260 <_Z12timerHandlermm>
            break;
    800013f4:	1180006f          	j	8000150c <_Z12ecallHandlerv+0x174>
    switch (scause) {
    800013f8:	00200793          	li	a5,2
    800013fc:	04f48c63          	beq	s1,a5,80001454 <_Z12ecallHandlerv+0xbc>
    80001400:	00500793          	li	a5,5
    80001404:	02f49263          	bne	s1,a5,80001428 <_Z12ecallHandlerv+0x90>
    80001408:	00003497          	auipc	s1,0x3
    8000140c:	cd848493          	addi	s1,s1,-808 # 800040e0 <CONSOLE_STATUS+0xd0>
    while (*str != '\0'){
    80001410:	0004c503          	lbu	a0,0(s1)
    80001414:	06050663          	beqz	a0,80001480 <_Z12ecallHandlerv+0xe8>
        __putc(*str);
    80001418:	00002097          	auipc	ra,0x2
    8000141c:	3d4080e7          	jalr	980(ra) # 800037ec <__putc>
        str++;
    80001420:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001424:	fedff06f          	j	80001410 <_Z12ecallHandlerv+0x78>
    80001428:	00003997          	auipc	s3,0x3
    8000142c:	d4898993          	addi	s3,s3,-696 # 80004170 <CONSOLE_STATUS+0x160>
    80001430:	0009c503          	lbu	a0,0(s3)
    80001434:	08050863          	beqz	a0,800014c4 <_Z12ecallHandlerv+0x12c>
        __putc(*str);
    80001438:	00002097          	auipc	ra,0x2
    8000143c:	3b4080e7          	jalr	948(ra) # 800037ec <__putc>
        str++;
    80001440:	00198993          	addi	s3,s3,1
    while (*str != '\0'){
    80001444:	fedff06f          	j	80001430 <_Z12ecallHandlerv+0x98>
        case 0x0000000000000008UL | 0x0000000000000009UL:
            systemCallHandler();
    80001448:	00000097          	auipc	ra,0x0
    8000144c:	e70080e7          	jalr	-400(ra) # 800012b8 <_Z17systemCallHandlerv>
            break;
    80001450:	0bc0006f          	j	8000150c <_Z12ecallHandlerv+0x174>
    switch (scause) {
    80001454:	00003497          	auipc	s1,0x3
    80001458:	c4c48493          	addi	s1,s1,-948 # 800040a0 <CONSOLE_STATUS+0x90>
    8000145c:	0004c503          	lbu	a0,0(s1)
    80001460:	00050a63          	beqz	a0,80001474 <_Z12ecallHandlerv+0xdc>
        __putc(*str);
    80001464:	00002097          	auipc	ra,0x2
    80001468:	388080e7          	jalr	904(ra) # 800037ec <__putc>
        str++;
    8000146c:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001470:	fedff06f          	j	8000145c <_Z12ecallHandlerv+0xc4>
        case 0x0000000000000002UL:
            printString("OS DETECTED ERROR: Illegal instruction\nShutting down...\n");
            stopEmulator();
    80001474:	00000097          	auipc	ra,0x0
    80001478:	dc4080e7          	jalr	-572(ra) # 80001238 <_Z12stopEmulatorv>
            break;
    8000147c:	0900006f          	j	8000150c <_Z12ecallHandlerv+0x174>
        case 0x0000000000000005UL:
            printString("OS DETECTED ERROR: reading from forbidden address\nShutting down...\n");
            stopEmulator();
    80001480:	00000097          	auipc	ra,0x0
    80001484:	db8080e7          	jalr	-584(ra) # 80001238 <_Z12stopEmulatorv>
            break;
    80001488:	0840006f          	j	8000150c <_Z12ecallHandlerv+0x174>
    switch (scause) {
    8000148c:	00003497          	auipc	s1,0x3
    80001490:	c9c48493          	addi	s1,s1,-868 # 80004128 <CONSOLE_STATUS+0x118>
    80001494:	0004c503          	lbu	a0,0(s1)
    80001498:	00050a63          	beqz	a0,800014ac <_Z12ecallHandlerv+0x114>
        __putc(*str);
    8000149c:	00002097          	auipc	ra,0x2
    800014a0:	350080e7          	jalr	848(ra) # 800037ec <__putc>
        str++;
    800014a4:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    800014a8:	fedff06f          	j	80001494 <_Z12ecallHandlerv+0xfc>
        case 0x0000000000000007UL:
            printString("OS DETECTED ERROR: writing to forbidden address\nShutting down...\n");
            stopEmulator();
    800014ac:	00000097          	auipc	ra,0x0
    800014b0:	d8c080e7          	jalr	-628(ra) # 80001238 <_Z12stopEmulatorv>
            break;
    800014b4:	0580006f          	j	8000150c <_Z12ecallHandlerv+0x174>
    switch (scause) {
    800014b8:	00003997          	auipc	s3,0x3
    800014bc:	cb898993          	addi	s3,s3,-840 # 80004170 <CONSOLE_STATUS+0x160>
    800014c0:	f71ff06f          	j	80001430 <_Z12ecallHandlerv+0x98>
    while(number > 0){
    800014c4:	02048063          	beqz	s1,800014e4 <_Z12ecallHandlerv+0x14c>
        int digit = number%10;
    800014c8:	00a00993          	li	s3,10
    800014cc:	0334f533          	remu	a0,s1,s3
        __putc((char)(48+digit));
    800014d0:	03050513          	addi	a0,a0,48
    800014d4:	00002097          	auipc	ra,0x2
    800014d8:	318080e7          	jalr	792(ra) # 800037ec <__putc>
        number/=10;
    800014dc:	0334d4b3          	divu	s1,s1,s3
    while(number > 0){
    800014e0:	fe5ff06f          	j	800014c4 <_Z12ecallHandlerv+0x12c>
    800014e4:	00003497          	auipc	s1,0x3
    800014e8:	cbc48493          	addi	s1,s1,-836 # 800041a0 <CONSOLE_STATUS+0x190>
    while (*str != '\0'){
    800014ec:	0004c503          	lbu	a0,0(s1)
    800014f0:	00050a63          	beqz	a0,80001504 <_Z12ecallHandlerv+0x16c>
        __putc(*str);
    800014f4:	00002097          	auipc	ra,0x2
    800014f8:	2f8080e7          	jalr	760(ra) # 800037ec <__putc>
        str++;
    800014fc:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001500:	fedff06f          	j	800014ec <_Z12ecallHandlerv+0x154>
        default:
            //this is error case, because no other case should go here, print something
            printString("OS DETECTED ERROR: Unhandled scause value: '");
            printUint(scause);
            printString("'\nShutting down...\n");
            stopEmulator();
    80001504:	00000097          	auipc	ra,0x0
    80001508:	d34080e7          	jalr	-716(ra) # 80001238 <_Z12stopEmulatorv>
    asm("csrw sepc, %0;": : "r"(value));
    8000150c:	14191073          	csrw	sepc,s2
    }

    writeSepc(sepc);
    writeSstatus(sstatus);
    return;
    80001510:	02813083          	ld	ra,40(sp)
    80001514:	02013403          	ld	s0,32(sp)
    80001518:	01813483          	ld	s1,24(sp)
    8000151c:	01013903          	ld	s2,16(sp)
    80001520:	00813983          	ld	s3,8(sp)
    80001524:	03010113          	addi	sp,sp,48
    80001528:	00008067          	ret

000000008000152c <_ZN15MemoryAllocator10initializeEv>:

MemSegment* MemoryAllocator::segmentsHead = nullptr;
uint32 MemoryAllocator::totalSize = 0;
uint32 MemoryAllocator::segmentsNumber = 1;

void MemoryAllocator::initialize(){
    8000152c:	ff010113          	addi	sp,sp,-16
    80001530:	00813423          	sd	s0,8(sp)
    80001534:	01010413          	addi	s0,sp,16
    MemoryAllocator::segmentsHead = (MemSegment*)(HEAP_START_ADDR);
    80001538:	00003617          	auipc	a2,0x3
    8000153c:	09863603          	ld	a2,152(a2) # 800045d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001540:	00063783          	ld	a5,0(a2)
    80001544:	00003717          	auipc	a4,0x3
    80001548:	0ec70713          	addi	a4,a4,236 # 80004630 <_ZN15MemoryAllocator12segmentsHeadE>
    8000154c:	00f73023          	sd	a5,0(a4)
    segmentsHead->left = nullptr;
    80001550:	0007b023          	sd	zero,0(a5)
    segmentsHead->right = nullptr;
    80001554:	00073683          	ld	a3,0(a4)
    80001558:	0006b423          	sd	zero,8(a3)
    //size of every block is in number of memory blocks, not bytes
    segmentsHead->size = size_t(uint64(HEAP_END_ADDR) - uint64(HEAP_START_ADDR))/MEM_BLOCK_SIZE;
    8000155c:	00003797          	auipc	a5,0x3
    80001560:	08c7b783          	ld	a5,140(a5) # 800045e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80001564:	0007b783          	ld	a5,0(a5)
    80001568:	00063603          	ld	a2,0(a2)
    8000156c:	40c787b3          	sub	a5,a5,a2
    80001570:	0067d793          	srli	a5,a5,0x6
    80001574:	00f6b823          	sd	a5,16(a3)
    totalSize = MemoryAllocator::segmentsHead->size;
    80001578:	00f72423          	sw	a5,8(a4)
}
    8000157c:	00813403          	ld	s0,8(sp)
    80001580:	01010113          	addi	sp,sp,16
    80001584:	00008067          	ret

0000000080001588 <_ZN15MemoryAllocator12mem_allocateEm>:

void* MemoryAllocator::mem_allocate(size_t size) {
    80001588:	ff010113          	addi	sp,sp,-16
    8000158c:	00813423          	sd	s0,8(sp)
    80001590:	01010413          	addi	s0,sp,16
    //doing some checks if it should even try to allocate space
    if(segmentsNumber == 0 || size > totalSize) return nullptr;
    80001594:	00003797          	auipc	a5,0x3
    80001598:	02c7a783          	lw	a5,44(a5) # 800045c0 <_ZN15MemoryAllocator14segmentsNumberE>
    8000159c:	10078463          	beqz	a5,800016a4 <_ZN15MemoryAllocator12mem_allocateEm+0x11c>
    800015a0:	00050713          	mv	a4,a0
    800015a4:	00003797          	auipc	a5,0x3
    800015a8:	0947e783          	lwu	a5,148(a5) # 80004638 <_ZN15MemoryAllocator9totalSizeE>
    800015ac:	10a7e063          	bltu	a5,a0,800016ac <_ZN15MemoryAllocator12mem_allocateEm+0x124>

    //first fit algorithm -- TODO in the future, upgrade this to some exotic algorithm with binary tree
    MemSegment* temp = segmentsHead;
    800015b0:	00003517          	auipc	a0,0x3
    800015b4:	08053503          	ld	a0,128(a0) # 80004630 <_ZN15MemoryAllocator12segmentsHeadE>
    800015b8:	0600006f          	j	80001618 <_ZN15MemoryAllocator12mem_allocateEm+0x90>
    while(temp){ // TODO TEST: check for bugs in this implementation

        if(size == temp->size){
            if(temp->left) temp->left->right = temp->right;
    800015bc:	00053783          	ld	a5,0(a0)
    800015c0:	00078663          	beqz	a5,800015cc <_ZN15MemoryAllocator12mem_allocateEm+0x44>
    800015c4:	00853683          	ld	a3,8(a0)
    800015c8:	00d7b423          	sd	a3,8(a5)
            if(temp->right) temp->right->left = temp->left;
    800015cc:	00853783          	ld	a5,8(a0)
    800015d0:	00078663          	beqz	a5,800015dc <_ZN15MemoryAllocator12mem_allocateEm+0x54>
    800015d4:	00053683          	ld	a3,0(a0)
    800015d8:	00d7b023          	sd	a3,0(a5)
            segmentsNumber--;
    800015dc:	00003697          	auipc	a3,0x3
    800015e0:	fe468693          	addi	a3,a3,-28 # 800045c0 <_ZN15MemoryAllocator14segmentsNumberE>
    800015e4:	0006a783          	lw	a5,0(a3)
    800015e8:	fff7879b          	addiw	a5,a5,-1
    800015ec:	00f6a023          	sw	a5,0(a3)
            *((size_t*)temp) = size; //this is size in segments stored in metadata
    800015f0:	00e53023          	sd	a4,0(a0)
            temp += sizeof(size_t); //shift pointer to account for metadata
    800015f4:	0c050513          	addi	a0,a0,192
        temp = temp->right;
    }

    //segment of sufficient size wasn't found, thus returning null for failed allocation
    return nullptr;
}
    800015f8:	00813403          	ld	s0,8(sp)
    800015fc:	01010113          	addi	sp,sp,16
    80001600:	00008067          	ret
            if(temp == segmentsHead) segmentsHead += offset;
    80001604:	00f687b3          	add	a5,a3,a5
    80001608:	00003697          	auipc	a3,0x3
    8000160c:	02f6b423          	sd	a5,40(a3) # 80004630 <_ZN15MemoryAllocator12segmentsHeadE>
    80001610:	0880006f          	j	80001698 <_ZN15MemoryAllocator12mem_allocateEm+0x110>
        temp = temp->right;
    80001614:	00853503          	ld	a0,8(a0)
    while(temp){ // TODO TEST: check for bugs in this implementation
    80001618:	fe0500e3          	beqz	a0,800015f8 <_ZN15MemoryAllocator12mem_allocateEm+0x70>
        if(size == temp->size){
    8000161c:	01053783          	ld	a5,16(a0)
    80001620:	f8e78ee3          	beq	a5,a4,800015bc <_ZN15MemoryAllocator12mem_allocateEm+0x34>
        if(size < temp->size){
    80001624:	fef778e3          	bgeu	a4,a5,80001614 <_ZN15MemoryAllocator12mem_allocateEm+0x8c>
            if(temp->left) temp->left->right = temp + offset;
    80001628:	00053683          	ld	a3,0(a0)
    8000162c:	00068c63          	beqz	a3,80001644 <_ZN15MemoryAllocator12mem_allocateEm+0xbc>
    80001630:	00171793          	slli	a5,a4,0x1
    80001634:	00e787b3          	add	a5,a5,a4
    80001638:	00979793          	slli	a5,a5,0x9
    8000163c:	00f507b3          	add	a5,a0,a5
    80001640:	00f6b423          	sd	a5,8(a3)
            if(temp->right) temp->right->left = temp + offset;
    80001644:	00853683          	ld	a3,8(a0)
    80001648:	00068c63          	beqz	a3,80001660 <_ZN15MemoryAllocator12mem_allocateEm+0xd8>
    8000164c:	00171793          	slli	a5,a4,0x1
    80001650:	00e787b3          	add	a5,a5,a4
    80001654:	00979793          	slli	a5,a5,0x9
    80001658:	00f507b3          	add	a5,a0,a5
    8000165c:	00f6b023          	sd	a5,0(a3)
            (temp + offset)->left = temp->left;
    80001660:	00171793          	slli	a5,a4,0x1
    80001664:	00e787b3          	add	a5,a5,a4
    80001668:	00979793          	slli	a5,a5,0x9
    8000166c:	00f506b3          	add	a3,a0,a5
    80001670:	00053603          	ld	a2,0(a0)
    80001674:	00c6b023          	sd	a2,0(a3)
            (temp + offset)->right = temp->right;
    80001678:	00853603          	ld	a2,8(a0)
    8000167c:	00c6b423          	sd	a2,8(a3)
            (temp + offset)->size = temp->size-size;
    80001680:	01053603          	ld	a2,16(a0)
    80001684:	40e60633          	sub	a2,a2,a4
    80001688:	00c6b823          	sd	a2,16(a3)
            if(temp == segmentsHead) segmentsHead += offset;
    8000168c:	00003697          	auipc	a3,0x3
    80001690:	fa46b683          	ld	a3,-92(a3) # 80004630 <_ZN15MemoryAllocator12segmentsHeadE>
    80001694:	f6a688e3          	beq	a3,a0,80001604 <_ZN15MemoryAllocator12mem_allocateEm+0x7c>
            *((size_t*)temp) = size; //this is size in segments stored in metadata
    80001698:	00e53023          	sd	a4,0(a0)
            temp += sizeof(size_t); //shift pointer to account for metadata
    8000169c:	0c050513          	addi	a0,a0,192
            return (void*)temp;
    800016a0:	f59ff06f          	j	800015f8 <_ZN15MemoryAllocator12mem_allocateEm+0x70>
    if(segmentsNumber == 0 || size > totalSize) return nullptr;
    800016a4:	00000513          	li	a0,0
    800016a8:	f51ff06f          	j	800015f8 <_ZN15MemoryAllocator12mem_allocateEm+0x70>
    800016ac:	00000513          	li	a0,0
    800016b0:	f49ff06f          	j	800015f8 <_ZN15MemoryAllocator12mem_allocateEm+0x70>

00000000800016b4 <_ZN15MemoryAllocator8mem_freeEPv>:

int MemoryAllocator::mem_free(void* ptr) {
    800016b4:	fe010113          	addi	sp,sp,-32
    800016b8:	00113c23          	sd	ra,24(sp)
    800016bc:	00813823          	sd	s0,16(sp)
    800016c0:	00913423          	sd	s1,8(sp)
    800016c4:	01213023          	sd	s2,0(sp)
    800016c8:	02010413          	addi	s0,sp,32
    size_t offset = *((size_t*)ptr-sizeof(size_t)) * MEM_BLOCK_SIZE;
    800016cc:	fc053483          	ld	s1,-64(a0)
    800016d0:	00649493          	slli	s1,s1,0x6
    while(number > 0){
    800016d4:	02048063          	beqz	s1,800016f4 <_ZN15MemoryAllocator8mem_freeEPv+0x40>
        int digit = number%10;
    800016d8:	00a00913          	li	s2,10
    800016dc:	0324f533          	remu	a0,s1,s2
        __putc((char)(48+digit));
    800016e0:	03050513          	addi	a0,a0,48
    800016e4:	00002097          	auipc	ra,0x2
    800016e8:	108080e7          	jalr	264(ra) # 800037ec <__putc>
        number/=10;
    800016ec:	0324d4b3          	divu	s1,s1,s2
    while(number > 0){
    800016f0:	fe5ff06f          	j	800016d4 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
    MemSegment* pointer = (MemSegment*)ptr-sizeof(size_t);

    printUint(offset);

    //TODO MEM_FREE: WRITE THIS ON PAPER SO YOU GET ALL THE EDGE CASES RIGHT!!!
    MemSegment* temp = segmentsHead;
    800016f4:	00003797          	auipc	a5,0x3
    800016f8:	f3c7b783          	ld	a5,-196(a5) # 80004630 <_ZN15MemoryAllocator12segmentsHeadE>
    800016fc:	0080006f          	j	80001704 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
    while(temp){
        //detect between which segments is this segment to be fred up
        if(temp->right){
    80001700:	0087b783          	ld	a5,8(a5)
    while(temp){
    80001704:	fe079ee3          	bnez	a5,80001700 <_ZN15MemoryAllocator8mem_freeEPv+0x4c>

        temp = temp->right;
    }

    return 0;
    80001708:	00000513          	li	a0,0
    8000170c:	01813083          	ld	ra,24(sp)
    80001710:	01013403          	ld	s0,16(sp)
    80001714:	00813483          	ld	s1,8(sp)
    80001718:	00013903          	ld	s2,0(sp)
    8000171c:	02010113          	addi	sp,sp,32
    80001720:	00008067          	ret

0000000080001724 <start>:
    80001724:	ff010113          	addi	sp,sp,-16
    80001728:	00813423          	sd	s0,8(sp)
    8000172c:	01010413          	addi	s0,sp,16
    80001730:	300027f3          	csrr	a5,mstatus
    80001734:	ffffe737          	lui	a4,0xffffe
    80001738:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff8f6f>
    8000173c:	00e7f7b3          	and	a5,a5,a4
    80001740:	00001737          	lui	a4,0x1
    80001744:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001748:	00e7e7b3          	or	a5,a5,a4
    8000174c:	30079073          	csrw	mstatus,a5
    80001750:	00000797          	auipc	a5,0x0
    80001754:	16078793          	addi	a5,a5,352 # 800018b0 <system_main>
    80001758:	34179073          	csrw	mepc,a5
    8000175c:	00000793          	li	a5,0
    80001760:	18079073          	csrw	satp,a5
    80001764:	000107b7          	lui	a5,0x10
    80001768:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    8000176c:	30279073          	csrw	medeleg,a5
    80001770:	30379073          	csrw	mideleg,a5
    80001774:	104027f3          	csrr	a5,sie
    80001778:	2227e793          	ori	a5,a5,546
    8000177c:	10479073          	csrw	sie,a5
    80001780:	fff00793          	li	a5,-1
    80001784:	00a7d793          	srli	a5,a5,0xa
    80001788:	3b079073          	csrw	pmpaddr0,a5
    8000178c:	00f00793          	li	a5,15
    80001790:	3a079073          	csrw	pmpcfg0,a5
    80001794:	f14027f3          	csrr	a5,mhartid
    80001798:	0200c737          	lui	a4,0x200c
    8000179c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800017a0:	0007869b          	sext.w	a3,a5
    800017a4:	00269713          	slli	a4,a3,0x2
    800017a8:	000f4637          	lui	a2,0xf4
    800017ac:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800017b0:	00d70733          	add	a4,a4,a3
    800017b4:	0037979b          	slliw	a5,a5,0x3
    800017b8:	020046b7          	lui	a3,0x2004
    800017bc:	00d787b3          	add	a5,a5,a3
    800017c0:	00c585b3          	add	a1,a1,a2
    800017c4:	00371693          	slli	a3,a4,0x3
    800017c8:	00003717          	auipc	a4,0x3
    800017cc:	e7870713          	addi	a4,a4,-392 # 80004640 <timer_scratch>
    800017d0:	00b7b023          	sd	a1,0(a5)
    800017d4:	00d70733          	add	a4,a4,a3
    800017d8:	00f73c23          	sd	a5,24(a4)
    800017dc:	02c73023          	sd	a2,32(a4)
    800017e0:	34071073          	csrw	mscratch,a4
    800017e4:	00000797          	auipc	a5,0x0
    800017e8:	6ec78793          	addi	a5,a5,1772 # 80001ed0 <timervec>
    800017ec:	30579073          	csrw	mtvec,a5
    800017f0:	300027f3          	csrr	a5,mstatus
    800017f4:	0087e793          	ori	a5,a5,8
    800017f8:	30079073          	csrw	mstatus,a5
    800017fc:	304027f3          	csrr	a5,mie
    80001800:	0807e793          	ori	a5,a5,128
    80001804:	30479073          	csrw	mie,a5
    80001808:	f14027f3          	csrr	a5,mhartid
    8000180c:	0007879b          	sext.w	a5,a5
    80001810:	00078213          	mv	tp,a5
    80001814:	30200073          	mret
    80001818:	00813403          	ld	s0,8(sp)
    8000181c:	01010113          	addi	sp,sp,16
    80001820:	00008067          	ret

0000000080001824 <timerinit>:
    80001824:	ff010113          	addi	sp,sp,-16
    80001828:	00813423          	sd	s0,8(sp)
    8000182c:	01010413          	addi	s0,sp,16
    80001830:	f14027f3          	csrr	a5,mhartid
    80001834:	0200c737          	lui	a4,0x200c
    80001838:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000183c:	0007869b          	sext.w	a3,a5
    80001840:	00269713          	slli	a4,a3,0x2
    80001844:	000f4637          	lui	a2,0xf4
    80001848:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    8000184c:	00d70733          	add	a4,a4,a3
    80001850:	0037979b          	slliw	a5,a5,0x3
    80001854:	020046b7          	lui	a3,0x2004
    80001858:	00d787b3          	add	a5,a5,a3
    8000185c:	00c585b3          	add	a1,a1,a2
    80001860:	00371693          	slli	a3,a4,0x3
    80001864:	00003717          	auipc	a4,0x3
    80001868:	ddc70713          	addi	a4,a4,-548 # 80004640 <timer_scratch>
    8000186c:	00b7b023          	sd	a1,0(a5)
    80001870:	00d70733          	add	a4,a4,a3
    80001874:	00f73c23          	sd	a5,24(a4)
    80001878:	02c73023          	sd	a2,32(a4)
    8000187c:	34071073          	csrw	mscratch,a4
    80001880:	00000797          	auipc	a5,0x0
    80001884:	65078793          	addi	a5,a5,1616 # 80001ed0 <timervec>
    80001888:	30579073          	csrw	mtvec,a5
    8000188c:	300027f3          	csrr	a5,mstatus
    80001890:	0087e793          	ori	a5,a5,8
    80001894:	30079073          	csrw	mstatus,a5
    80001898:	304027f3          	csrr	a5,mie
    8000189c:	0807e793          	ori	a5,a5,128
    800018a0:	30479073          	csrw	mie,a5
    800018a4:	00813403          	ld	s0,8(sp)
    800018a8:	01010113          	addi	sp,sp,16
    800018ac:	00008067          	ret

00000000800018b0 <system_main>:
    800018b0:	fe010113          	addi	sp,sp,-32
    800018b4:	00813823          	sd	s0,16(sp)
    800018b8:	00913423          	sd	s1,8(sp)
    800018bc:	00113c23          	sd	ra,24(sp)
    800018c0:	02010413          	addi	s0,sp,32
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	0c4080e7          	jalr	196(ra) # 80001988 <cpuid>
    800018cc:	00003497          	auipc	s1,0x3
    800018d0:	d3448493          	addi	s1,s1,-716 # 80004600 <started>
    800018d4:	02050263          	beqz	a0,800018f8 <system_main+0x48>
    800018d8:	0004a783          	lw	a5,0(s1)
    800018dc:	0007879b          	sext.w	a5,a5
    800018e0:	fe078ce3          	beqz	a5,800018d8 <system_main+0x28>
    800018e4:	0ff0000f          	fence
    800018e8:	00003517          	auipc	a0,0x3
    800018ec:	90050513          	addi	a0,a0,-1792 # 800041e8 <CONSOLE_STATUS+0x1d8>
    800018f0:	00001097          	auipc	ra,0x1
    800018f4:	a7c080e7          	jalr	-1412(ra) # 8000236c <panic>
    800018f8:	00001097          	auipc	ra,0x1
    800018fc:	9d0080e7          	jalr	-1584(ra) # 800022c8 <consoleinit>
    80001900:	00001097          	auipc	ra,0x1
    80001904:	15c080e7          	jalr	348(ra) # 80002a5c <printfinit>
    80001908:	00003517          	auipc	a0,0x3
    8000190c:	86050513          	addi	a0,a0,-1952 # 80004168 <CONSOLE_STATUS+0x158>
    80001910:	00001097          	auipc	ra,0x1
    80001914:	ab8080e7          	jalr	-1352(ra) # 800023c8 <__printf>
    80001918:	00003517          	auipc	a0,0x3
    8000191c:	8a050513          	addi	a0,a0,-1888 # 800041b8 <CONSOLE_STATUS+0x1a8>
    80001920:	00001097          	auipc	ra,0x1
    80001924:	aa8080e7          	jalr	-1368(ra) # 800023c8 <__printf>
    80001928:	00003517          	auipc	a0,0x3
    8000192c:	84050513          	addi	a0,a0,-1984 # 80004168 <CONSOLE_STATUS+0x158>
    80001930:	00001097          	auipc	ra,0x1
    80001934:	a98080e7          	jalr	-1384(ra) # 800023c8 <__printf>
    80001938:	00001097          	auipc	ra,0x1
    8000193c:	4b0080e7          	jalr	1200(ra) # 80002de8 <kinit>
    80001940:	00000097          	auipc	ra,0x0
    80001944:	148080e7          	jalr	328(ra) # 80001a88 <trapinit>
    80001948:	00000097          	auipc	ra,0x0
    8000194c:	16c080e7          	jalr	364(ra) # 80001ab4 <trapinithart>
    80001950:	00000097          	auipc	ra,0x0
    80001954:	5c0080e7          	jalr	1472(ra) # 80001f10 <plicinit>
    80001958:	00000097          	auipc	ra,0x0
    8000195c:	5e0080e7          	jalr	1504(ra) # 80001f38 <plicinithart>
    80001960:	00000097          	auipc	ra,0x0
    80001964:	078080e7          	jalr	120(ra) # 800019d8 <userinit>
    80001968:	0ff0000f          	fence
    8000196c:	00100793          	li	a5,1
    80001970:	00003517          	auipc	a0,0x3
    80001974:	86050513          	addi	a0,a0,-1952 # 800041d0 <CONSOLE_STATUS+0x1c0>
    80001978:	00f4a023          	sw	a5,0(s1)
    8000197c:	00001097          	auipc	ra,0x1
    80001980:	a4c080e7          	jalr	-1460(ra) # 800023c8 <__printf>
    80001984:	0000006f          	j	80001984 <system_main+0xd4>

0000000080001988 <cpuid>:
    80001988:	ff010113          	addi	sp,sp,-16
    8000198c:	00813423          	sd	s0,8(sp)
    80001990:	01010413          	addi	s0,sp,16
    80001994:	00020513          	mv	a0,tp
    80001998:	00813403          	ld	s0,8(sp)
    8000199c:	0005051b          	sext.w	a0,a0
    800019a0:	01010113          	addi	sp,sp,16
    800019a4:	00008067          	ret

00000000800019a8 <mycpu>:
    800019a8:	ff010113          	addi	sp,sp,-16
    800019ac:	00813423          	sd	s0,8(sp)
    800019b0:	01010413          	addi	s0,sp,16
    800019b4:	00020793          	mv	a5,tp
    800019b8:	00813403          	ld	s0,8(sp)
    800019bc:	0007879b          	sext.w	a5,a5
    800019c0:	00779793          	slli	a5,a5,0x7
    800019c4:	00004517          	auipc	a0,0x4
    800019c8:	cac50513          	addi	a0,a0,-852 # 80005670 <cpus>
    800019cc:	00f50533          	add	a0,a0,a5
    800019d0:	01010113          	addi	sp,sp,16
    800019d4:	00008067          	ret

00000000800019d8 <userinit>:
    800019d8:	ff010113          	addi	sp,sp,-16
    800019dc:	00813423          	sd	s0,8(sp)
    800019e0:	01010413          	addi	s0,sp,16
    800019e4:	00813403          	ld	s0,8(sp)
    800019e8:	01010113          	addi	sp,sp,16
    800019ec:	fffff317          	auipc	t1,0xfffff
    800019f0:	7ac30067          	jr	1964(t1) # 80001198 <main>

00000000800019f4 <either_copyout>:
    800019f4:	ff010113          	addi	sp,sp,-16
    800019f8:	00813023          	sd	s0,0(sp)
    800019fc:	00113423          	sd	ra,8(sp)
    80001a00:	01010413          	addi	s0,sp,16
    80001a04:	02051663          	bnez	a0,80001a30 <either_copyout+0x3c>
    80001a08:	00058513          	mv	a0,a1
    80001a0c:	00060593          	mv	a1,a2
    80001a10:	0006861b          	sext.w	a2,a3
    80001a14:	00002097          	auipc	ra,0x2
    80001a18:	c60080e7          	jalr	-928(ra) # 80003674 <__memmove>
    80001a1c:	00813083          	ld	ra,8(sp)
    80001a20:	00013403          	ld	s0,0(sp)
    80001a24:	00000513          	li	a0,0
    80001a28:	01010113          	addi	sp,sp,16
    80001a2c:	00008067          	ret
    80001a30:	00002517          	auipc	a0,0x2
    80001a34:	7e050513          	addi	a0,a0,2016 # 80004210 <CONSOLE_STATUS+0x200>
    80001a38:	00001097          	auipc	ra,0x1
    80001a3c:	934080e7          	jalr	-1740(ra) # 8000236c <panic>

0000000080001a40 <either_copyin>:
    80001a40:	ff010113          	addi	sp,sp,-16
    80001a44:	00813023          	sd	s0,0(sp)
    80001a48:	00113423          	sd	ra,8(sp)
    80001a4c:	01010413          	addi	s0,sp,16
    80001a50:	02059463          	bnez	a1,80001a78 <either_copyin+0x38>
    80001a54:	00060593          	mv	a1,a2
    80001a58:	0006861b          	sext.w	a2,a3
    80001a5c:	00002097          	auipc	ra,0x2
    80001a60:	c18080e7          	jalr	-1000(ra) # 80003674 <__memmove>
    80001a64:	00813083          	ld	ra,8(sp)
    80001a68:	00013403          	ld	s0,0(sp)
    80001a6c:	00000513          	li	a0,0
    80001a70:	01010113          	addi	sp,sp,16
    80001a74:	00008067          	ret
    80001a78:	00002517          	auipc	a0,0x2
    80001a7c:	7c050513          	addi	a0,a0,1984 # 80004238 <CONSOLE_STATUS+0x228>
    80001a80:	00001097          	auipc	ra,0x1
    80001a84:	8ec080e7          	jalr	-1812(ra) # 8000236c <panic>

0000000080001a88 <trapinit>:
    80001a88:	ff010113          	addi	sp,sp,-16
    80001a8c:	00813423          	sd	s0,8(sp)
    80001a90:	01010413          	addi	s0,sp,16
    80001a94:	00813403          	ld	s0,8(sp)
    80001a98:	00002597          	auipc	a1,0x2
    80001a9c:	7c858593          	addi	a1,a1,1992 # 80004260 <CONSOLE_STATUS+0x250>
    80001aa0:	00004517          	auipc	a0,0x4
    80001aa4:	c5050513          	addi	a0,a0,-944 # 800056f0 <tickslock>
    80001aa8:	01010113          	addi	sp,sp,16
    80001aac:	00001317          	auipc	t1,0x1
    80001ab0:	5cc30067          	jr	1484(t1) # 80003078 <initlock>

0000000080001ab4 <trapinithart>:
    80001ab4:	ff010113          	addi	sp,sp,-16
    80001ab8:	00813423          	sd	s0,8(sp)
    80001abc:	01010413          	addi	s0,sp,16
    80001ac0:	00000797          	auipc	a5,0x0
    80001ac4:	30078793          	addi	a5,a5,768 # 80001dc0 <kernelvec>
    80001ac8:	10579073          	csrw	stvec,a5
    80001acc:	00813403          	ld	s0,8(sp)
    80001ad0:	01010113          	addi	sp,sp,16
    80001ad4:	00008067          	ret

0000000080001ad8 <usertrap>:
    80001ad8:	ff010113          	addi	sp,sp,-16
    80001adc:	00813423          	sd	s0,8(sp)
    80001ae0:	01010413          	addi	s0,sp,16
    80001ae4:	00813403          	ld	s0,8(sp)
    80001ae8:	01010113          	addi	sp,sp,16
    80001aec:	00008067          	ret

0000000080001af0 <usertrapret>:
    80001af0:	ff010113          	addi	sp,sp,-16
    80001af4:	00813423          	sd	s0,8(sp)
    80001af8:	01010413          	addi	s0,sp,16
    80001afc:	00813403          	ld	s0,8(sp)
    80001b00:	01010113          	addi	sp,sp,16
    80001b04:	00008067          	ret

0000000080001b08 <kerneltrap>:
    80001b08:	fe010113          	addi	sp,sp,-32
    80001b0c:	00813823          	sd	s0,16(sp)
    80001b10:	00113c23          	sd	ra,24(sp)
    80001b14:	00913423          	sd	s1,8(sp)
    80001b18:	02010413          	addi	s0,sp,32
    80001b1c:	142025f3          	csrr	a1,scause
    80001b20:	100027f3          	csrr	a5,sstatus
    80001b24:	0027f793          	andi	a5,a5,2
    80001b28:	10079c63          	bnez	a5,80001c40 <kerneltrap+0x138>
    80001b2c:	142027f3          	csrr	a5,scause
    80001b30:	0207ce63          	bltz	a5,80001b6c <kerneltrap+0x64>
    80001b34:	00002517          	auipc	a0,0x2
    80001b38:	77450513          	addi	a0,a0,1908 # 800042a8 <CONSOLE_STATUS+0x298>
    80001b3c:	00001097          	auipc	ra,0x1
    80001b40:	88c080e7          	jalr	-1908(ra) # 800023c8 <__printf>
    80001b44:	141025f3          	csrr	a1,sepc
    80001b48:	14302673          	csrr	a2,stval
    80001b4c:	00002517          	auipc	a0,0x2
    80001b50:	76c50513          	addi	a0,a0,1900 # 800042b8 <CONSOLE_STATUS+0x2a8>
    80001b54:	00001097          	auipc	ra,0x1
    80001b58:	874080e7          	jalr	-1932(ra) # 800023c8 <__printf>
    80001b5c:	00002517          	auipc	a0,0x2
    80001b60:	77450513          	addi	a0,a0,1908 # 800042d0 <CONSOLE_STATUS+0x2c0>
    80001b64:	00001097          	auipc	ra,0x1
    80001b68:	808080e7          	jalr	-2040(ra) # 8000236c <panic>
    80001b6c:	0ff7f713          	andi	a4,a5,255
    80001b70:	00900693          	li	a3,9
    80001b74:	04d70063          	beq	a4,a3,80001bb4 <kerneltrap+0xac>
    80001b78:	fff00713          	li	a4,-1
    80001b7c:	03f71713          	slli	a4,a4,0x3f
    80001b80:	00170713          	addi	a4,a4,1
    80001b84:	fae798e3          	bne	a5,a4,80001b34 <kerneltrap+0x2c>
    80001b88:	00000097          	auipc	ra,0x0
    80001b8c:	e00080e7          	jalr	-512(ra) # 80001988 <cpuid>
    80001b90:	06050663          	beqz	a0,80001bfc <kerneltrap+0xf4>
    80001b94:	144027f3          	csrr	a5,sip
    80001b98:	ffd7f793          	andi	a5,a5,-3
    80001b9c:	14479073          	csrw	sip,a5
    80001ba0:	01813083          	ld	ra,24(sp)
    80001ba4:	01013403          	ld	s0,16(sp)
    80001ba8:	00813483          	ld	s1,8(sp)
    80001bac:	02010113          	addi	sp,sp,32
    80001bb0:	00008067          	ret
    80001bb4:	00000097          	auipc	ra,0x0
    80001bb8:	3d0080e7          	jalr	976(ra) # 80001f84 <plic_claim>
    80001bbc:	00a00793          	li	a5,10
    80001bc0:	00050493          	mv	s1,a0
    80001bc4:	06f50863          	beq	a0,a5,80001c34 <kerneltrap+0x12c>
    80001bc8:	fc050ce3          	beqz	a0,80001ba0 <kerneltrap+0x98>
    80001bcc:	00050593          	mv	a1,a0
    80001bd0:	00002517          	auipc	a0,0x2
    80001bd4:	6b850513          	addi	a0,a0,1720 # 80004288 <CONSOLE_STATUS+0x278>
    80001bd8:	00000097          	auipc	ra,0x0
    80001bdc:	7f0080e7          	jalr	2032(ra) # 800023c8 <__printf>
    80001be0:	01013403          	ld	s0,16(sp)
    80001be4:	01813083          	ld	ra,24(sp)
    80001be8:	00048513          	mv	a0,s1
    80001bec:	00813483          	ld	s1,8(sp)
    80001bf0:	02010113          	addi	sp,sp,32
    80001bf4:	00000317          	auipc	t1,0x0
    80001bf8:	3c830067          	jr	968(t1) # 80001fbc <plic_complete>
    80001bfc:	00004517          	auipc	a0,0x4
    80001c00:	af450513          	addi	a0,a0,-1292 # 800056f0 <tickslock>
    80001c04:	00001097          	auipc	ra,0x1
    80001c08:	498080e7          	jalr	1176(ra) # 8000309c <acquire>
    80001c0c:	00003717          	auipc	a4,0x3
    80001c10:	9f870713          	addi	a4,a4,-1544 # 80004604 <ticks>
    80001c14:	00072783          	lw	a5,0(a4)
    80001c18:	00004517          	auipc	a0,0x4
    80001c1c:	ad850513          	addi	a0,a0,-1320 # 800056f0 <tickslock>
    80001c20:	0017879b          	addiw	a5,a5,1
    80001c24:	00f72023          	sw	a5,0(a4)
    80001c28:	00001097          	auipc	ra,0x1
    80001c2c:	540080e7          	jalr	1344(ra) # 80003168 <release>
    80001c30:	f65ff06f          	j	80001b94 <kerneltrap+0x8c>
    80001c34:	00001097          	auipc	ra,0x1
    80001c38:	09c080e7          	jalr	156(ra) # 80002cd0 <uartintr>
    80001c3c:	fa5ff06f          	j	80001be0 <kerneltrap+0xd8>
    80001c40:	00002517          	auipc	a0,0x2
    80001c44:	62850513          	addi	a0,a0,1576 # 80004268 <CONSOLE_STATUS+0x258>
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	724080e7          	jalr	1828(ra) # 8000236c <panic>

0000000080001c50 <clockintr>:
    80001c50:	fe010113          	addi	sp,sp,-32
    80001c54:	00813823          	sd	s0,16(sp)
    80001c58:	00913423          	sd	s1,8(sp)
    80001c5c:	00113c23          	sd	ra,24(sp)
    80001c60:	02010413          	addi	s0,sp,32
    80001c64:	00004497          	auipc	s1,0x4
    80001c68:	a8c48493          	addi	s1,s1,-1396 # 800056f0 <tickslock>
    80001c6c:	00048513          	mv	a0,s1
    80001c70:	00001097          	auipc	ra,0x1
    80001c74:	42c080e7          	jalr	1068(ra) # 8000309c <acquire>
    80001c78:	00003717          	auipc	a4,0x3
    80001c7c:	98c70713          	addi	a4,a4,-1652 # 80004604 <ticks>
    80001c80:	00072783          	lw	a5,0(a4)
    80001c84:	01013403          	ld	s0,16(sp)
    80001c88:	01813083          	ld	ra,24(sp)
    80001c8c:	00048513          	mv	a0,s1
    80001c90:	0017879b          	addiw	a5,a5,1
    80001c94:	00813483          	ld	s1,8(sp)
    80001c98:	00f72023          	sw	a5,0(a4)
    80001c9c:	02010113          	addi	sp,sp,32
    80001ca0:	00001317          	auipc	t1,0x1
    80001ca4:	4c830067          	jr	1224(t1) # 80003168 <release>

0000000080001ca8 <devintr>:
    80001ca8:	142027f3          	csrr	a5,scause
    80001cac:	00000513          	li	a0,0
    80001cb0:	0007c463          	bltz	a5,80001cb8 <devintr+0x10>
    80001cb4:	00008067          	ret
    80001cb8:	fe010113          	addi	sp,sp,-32
    80001cbc:	00813823          	sd	s0,16(sp)
    80001cc0:	00113c23          	sd	ra,24(sp)
    80001cc4:	00913423          	sd	s1,8(sp)
    80001cc8:	02010413          	addi	s0,sp,32
    80001ccc:	0ff7f713          	andi	a4,a5,255
    80001cd0:	00900693          	li	a3,9
    80001cd4:	04d70c63          	beq	a4,a3,80001d2c <devintr+0x84>
    80001cd8:	fff00713          	li	a4,-1
    80001cdc:	03f71713          	slli	a4,a4,0x3f
    80001ce0:	00170713          	addi	a4,a4,1
    80001ce4:	00e78c63          	beq	a5,a4,80001cfc <devintr+0x54>
    80001ce8:	01813083          	ld	ra,24(sp)
    80001cec:	01013403          	ld	s0,16(sp)
    80001cf0:	00813483          	ld	s1,8(sp)
    80001cf4:	02010113          	addi	sp,sp,32
    80001cf8:	00008067          	ret
    80001cfc:	00000097          	auipc	ra,0x0
    80001d00:	c8c080e7          	jalr	-884(ra) # 80001988 <cpuid>
    80001d04:	06050663          	beqz	a0,80001d70 <devintr+0xc8>
    80001d08:	144027f3          	csrr	a5,sip
    80001d0c:	ffd7f793          	andi	a5,a5,-3
    80001d10:	14479073          	csrw	sip,a5
    80001d14:	01813083          	ld	ra,24(sp)
    80001d18:	01013403          	ld	s0,16(sp)
    80001d1c:	00813483          	ld	s1,8(sp)
    80001d20:	00200513          	li	a0,2
    80001d24:	02010113          	addi	sp,sp,32
    80001d28:	00008067          	ret
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	258080e7          	jalr	600(ra) # 80001f84 <plic_claim>
    80001d34:	00a00793          	li	a5,10
    80001d38:	00050493          	mv	s1,a0
    80001d3c:	06f50663          	beq	a0,a5,80001da8 <devintr+0x100>
    80001d40:	00100513          	li	a0,1
    80001d44:	fa0482e3          	beqz	s1,80001ce8 <devintr+0x40>
    80001d48:	00048593          	mv	a1,s1
    80001d4c:	00002517          	auipc	a0,0x2
    80001d50:	53c50513          	addi	a0,a0,1340 # 80004288 <CONSOLE_STATUS+0x278>
    80001d54:	00000097          	auipc	ra,0x0
    80001d58:	674080e7          	jalr	1652(ra) # 800023c8 <__printf>
    80001d5c:	00048513          	mv	a0,s1
    80001d60:	00000097          	auipc	ra,0x0
    80001d64:	25c080e7          	jalr	604(ra) # 80001fbc <plic_complete>
    80001d68:	00100513          	li	a0,1
    80001d6c:	f7dff06f          	j	80001ce8 <devintr+0x40>
    80001d70:	00004517          	auipc	a0,0x4
    80001d74:	98050513          	addi	a0,a0,-1664 # 800056f0 <tickslock>
    80001d78:	00001097          	auipc	ra,0x1
    80001d7c:	324080e7          	jalr	804(ra) # 8000309c <acquire>
    80001d80:	00003717          	auipc	a4,0x3
    80001d84:	88470713          	addi	a4,a4,-1916 # 80004604 <ticks>
    80001d88:	00072783          	lw	a5,0(a4)
    80001d8c:	00004517          	auipc	a0,0x4
    80001d90:	96450513          	addi	a0,a0,-1692 # 800056f0 <tickslock>
    80001d94:	0017879b          	addiw	a5,a5,1
    80001d98:	00f72023          	sw	a5,0(a4)
    80001d9c:	00001097          	auipc	ra,0x1
    80001da0:	3cc080e7          	jalr	972(ra) # 80003168 <release>
    80001da4:	f65ff06f          	j	80001d08 <devintr+0x60>
    80001da8:	00001097          	auipc	ra,0x1
    80001dac:	f28080e7          	jalr	-216(ra) # 80002cd0 <uartintr>
    80001db0:	fadff06f          	j	80001d5c <devintr+0xb4>
	...

0000000080001dc0 <kernelvec>:
    80001dc0:	f0010113          	addi	sp,sp,-256
    80001dc4:	00113023          	sd	ra,0(sp)
    80001dc8:	00213423          	sd	sp,8(sp)
    80001dcc:	00313823          	sd	gp,16(sp)
    80001dd0:	00413c23          	sd	tp,24(sp)
    80001dd4:	02513023          	sd	t0,32(sp)
    80001dd8:	02613423          	sd	t1,40(sp)
    80001ddc:	02713823          	sd	t2,48(sp)
    80001de0:	02813c23          	sd	s0,56(sp)
    80001de4:	04913023          	sd	s1,64(sp)
    80001de8:	04a13423          	sd	a0,72(sp)
    80001dec:	04b13823          	sd	a1,80(sp)
    80001df0:	04c13c23          	sd	a2,88(sp)
    80001df4:	06d13023          	sd	a3,96(sp)
    80001df8:	06e13423          	sd	a4,104(sp)
    80001dfc:	06f13823          	sd	a5,112(sp)
    80001e00:	07013c23          	sd	a6,120(sp)
    80001e04:	09113023          	sd	a7,128(sp)
    80001e08:	09213423          	sd	s2,136(sp)
    80001e0c:	09313823          	sd	s3,144(sp)
    80001e10:	09413c23          	sd	s4,152(sp)
    80001e14:	0b513023          	sd	s5,160(sp)
    80001e18:	0b613423          	sd	s6,168(sp)
    80001e1c:	0b713823          	sd	s7,176(sp)
    80001e20:	0b813c23          	sd	s8,184(sp)
    80001e24:	0d913023          	sd	s9,192(sp)
    80001e28:	0da13423          	sd	s10,200(sp)
    80001e2c:	0db13823          	sd	s11,208(sp)
    80001e30:	0dc13c23          	sd	t3,216(sp)
    80001e34:	0fd13023          	sd	t4,224(sp)
    80001e38:	0fe13423          	sd	t5,232(sp)
    80001e3c:	0ff13823          	sd	t6,240(sp)
    80001e40:	cc9ff0ef          	jal	ra,80001b08 <kerneltrap>
    80001e44:	00013083          	ld	ra,0(sp)
    80001e48:	00813103          	ld	sp,8(sp)
    80001e4c:	01013183          	ld	gp,16(sp)
    80001e50:	02013283          	ld	t0,32(sp)
    80001e54:	02813303          	ld	t1,40(sp)
    80001e58:	03013383          	ld	t2,48(sp)
    80001e5c:	03813403          	ld	s0,56(sp)
    80001e60:	04013483          	ld	s1,64(sp)
    80001e64:	04813503          	ld	a0,72(sp)
    80001e68:	05013583          	ld	a1,80(sp)
    80001e6c:	05813603          	ld	a2,88(sp)
    80001e70:	06013683          	ld	a3,96(sp)
    80001e74:	06813703          	ld	a4,104(sp)
    80001e78:	07013783          	ld	a5,112(sp)
    80001e7c:	07813803          	ld	a6,120(sp)
    80001e80:	08013883          	ld	a7,128(sp)
    80001e84:	08813903          	ld	s2,136(sp)
    80001e88:	09013983          	ld	s3,144(sp)
    80001e8c:	09813a03          	ld	s4,152(sp)
    80001e90:	0a013a83          	ld	s5,160(sp)
    80001e94:	0a813b03          	ld	s6,168(sp)
    80001e98:	0b013b83          	ld	s7,176(sp)
    80001e9c:	0b813c03          	ld	s8,184(sp)
    80001ea0:	0c013c83          	ld	s9,192(sp)
    80001ea4:	0c813d03          	ld	s10,200(sp)
    80001ea8:	0d013d83          	ld	s11,208(sp)
    80001eac:	0d813e03          	ld	t3,216(sp)
    80001eb0:	0e013e83          	ld	t4,224(sp)
    80001eb4:	0e813f03          	ld	t5,232(sp)
    80001eb8:	0f013f83          	ld	t6,240(sp)
    80001ebc:	10010113          	addi	sp,sp,256
    80001ec0:	10200073          	sret
    80001ec4:	00000013          	nop
    80001ec8:	00000013          	nop
    80001ecc:	00000013          	nop

0000000080001ed0 <timervec>:
    80001ed0:	34051573          	csrrw	a0,mscratch,a0
    80001ed4:	00b53023          	sd	a1,0(a0)
    80001ed8:	00c53423          	sd	a2,8(a0)
    80001edc:	00d53823          	sd	a3,16(a0)
    80001ee0:	01853583          	ld	a1,24(a0)
    80001ee4:	02053603          	ld	a2,32(a0)
    80001ee8:	0005b683          	ld	a3,0(a1)
    80001eec:	00c686b3          	add	a3,a3,a2
    80001ef0:	00d5b023          	sd	a3,0(a1)
    80001ef4:	00200593          	li	a1,2
    80001ef8:	14459073          	csrw	sip,a1
    80001efc:	01053683          	ld	a3,16(a0)
    80001f00:	00853603          	ld	a2,8(a0)
    80001f04:	00053583          	ld	a1,0(a0)
    80001f08:	34051573          	csrrw	a0,mscratch,a0
    80001f0c:	30200073          	mret

0000000080001f10 <plicinit>:
    80001f10:	ff010113          	addi	sp,sp,-16
    80001f14:	00813423          	sd	s0,8(sp)
    80001f18:	01010413          	addi	s0,sp,16
    80001f1c:	00813403          	ld	s0,8(sp)
    80001f20:	0c0007b7          	lui	a5,0xc000
    80001f24:	00100713          	li	a4,1
    80001f28:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80001f2c:	00e7a223          	sw	a4,4(a5)
    80001f30:	01010113          	addi	sp,sp,16
    80001f34:	00008067          	ret

0000000080001f38 <plicinithart>:
    80001f38:	ff010113          	addi	sp,sp,-16
    80001f3c:	00813023          	sd	s0,0(sp)
    80001f40:	00113423          	sd	ra,8(sp)
    80001f44:	01010413          	addi	s0,sp,16
    80001f48:	00000097          	auipc	ra,0x0
    80001f4c:	a40080e7          	jalr	-1472(ra) # 80001988 <cpuid>
    80001f50:	0085171b          	slliw	a4,a0,0x8
    80001f54:	0c0027b7          	lui	a5,0xc002
    80001f58:	00e787b3          	add	a5,a5,a4
    80001f5c:	40200713          	li	a4,1026
    80001f60:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80001f64:	00813083          	ld	ra,8(sp)
    80001f68:	00013403          	ld	s0,0(sp)
    80001f6c:	00d5151b          	slliw	a0,a0,0xd
    80001f70:	0c2017b7          	lui	a5,0xc201
    80001f74:	00a78533          	add	a0,a5,a0
    80001f78:	00052023          	sw	zero,0(a0)
    80001f7c:	01010113          	addi	sp,sp,16
    80001f80:	00008067          	ret

0000000080001f84 <plic_claim>:
    80001f84:	ff010113          	addi	sp,sp,-16
    80001f88:	00813023          	sd	s0,0(sp)
    80001f8c:	00113423          	sd	ra,8(sp)
    80001f90:	01010413          	addi	s0,sp,16
    80001f94:	00000097          	auipc	ra,0x0
    80001f98:	9f4080e7          	jalr	-1548(ra) # 80001988 <cpuid>
    80001f9c:	00813083          	ld	ra,8(sp)
    80001fa0:	00013403          	ld	s0,0(sp)
    80001fa4:	00d5151b          	slliw	a0,a0,0xd
    80001fa8:	0c2017b7          	lui	a5,0xc201
    80001fac:	00a78533          	add	a0,a5,a0
    80001fb0:	00452503          	lw	a0,4(a0)
    80001fb4:	01010113          	addi	sp,sp,16
    80001fb8:	00008067          	ret

0000000080001fbc <plic_complete>:
    80001fbc:	fe010113          	addi	sp,sp,-32
    80001fc0:	00813823          	sd	s0,16(sp)
    80001fc4:	00913423          	sd	s1,8(sp)
    80001fc8:	00113c23          	sd	ra,24(sp)
    80001fcc:	02010413          	addi	s0,sp,32
    80001fd0:	00050493          	mv	s1,a0
    80001fd4:	00000097          	auipc	ra,0x0
    80001fd8:	9b4080e7          	jalr	-1612(ra) # 80001988 <cpuid>
    80001fdc:	01813083          	ld	ra,24(sp)
    80001fe0:	01013403          	ld	s0,16(sp)
    80001fe4:	00d5179b          	slliw	a5,a0,0xd
    80001fe8:	0c201737          	lui	a4,0xc201
    80001fec:	00f707b3          	add	a5,a4,a5
    80001ff0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80001ff4:	00813483          	ld	s1,8(sp)
    80001ff8:	02010113          	addi	sp,sp,32
    80001ffc:	00008067          	ret

0000000080002000 <consolewrite>:
    80002000:	fb010113          	addi	sp,sp,-80
    80002004:	04813023          	sd	s0,64(sp)
    80002008:	04113423          	sd	ra,72(sp)
    8000200c:	02913c23          	sd	s1,56(sp)
    80002010:	03213823          	sd	s2,48(sp)
    80002014:	03313423          	sd	s3,40(sp)
    80002018:	03413023          	sd	s4,32(sp)
    8000201c:	01513c23          	sd	s5,24(sp)
    80002020:	05010413          	addi	s0,sp,80
    80002024:	06c05c63          	blez	a2,8000209c <consolewrite+0x9c>
    80002028:	00060993          	mv	s3,a2
    8000202c:	00050a13          	mv	s4,a0
    80002030:	00058493          	mv	s1,a1
    80002034:	00000913          	li	s2,0
    80002038:	fff00a93          	li	s5,-1
    8000203c:	01c0006f          	j	80002058 <consolewrite+0x58>
    80002040:	fbf44503          	lbu	a0,-65(s0)
    80002044:	0019091b          	addiw	s2,s2,1
    80002048:	00148493          	addi	s1,s1,1
    8000204c:	00001097          	auipc	ra,0x1
    80002050:	a9c080e7          	jalr	-1380(ra) # 80002ae8 <uartputc>
    80002054:	03298063          	beq	s3,s2,80002074 <consolewrite+0x74>
    80002058:	00048613          	mv	a2,s1
    8000205c:	00100693          	li	a3,1
    80002060:	000a0593          	mv	a1,s4
    80002064:	fbf40513          	addi	a0,s0,-65
    80002068:	00000097          	auipc	ra,0x0
    8000206c:	9d8080e7          	jalr	-1576(ra) # 80001a40 <either_copyin>
    80002070:	fd5518e3          	bne	a0,s5,80002040 <consolewrite+0x40>
    80002074:	04813083          	ld	ra,72(sp)
    80002078:	04013403          	ld	s0,64(sp)
    8000207c:	03813483          	ld	s1,56(sp)
    80002080:	02813983          	ld	s3,40(sp)
    80002084:	02013a03          	ld	s4,32(sp)
    80002088:	01813a83          	ld	s5,24(sp)
    8000208c:	00090513          	mv	a0,s2
    80002090:	03013903          	ld	s2,48(sp)
    80002094:	05010113          	addi	sp,sp,80
    80002098:	00008067          	ret
    8000209c:	00000913          	li	s2,0
    800020a0:	fd5ff06f          	j	80002074 <consolewrite+0x74>

00000000800020a4 <consoleread>:
    800020a4:	f9010113          	addi	sp,sp,-112
    800020a8:	06813023          	sd	s0,96(sp)
    800020ac:	04913c23          	sd	s1,88(sp)
    800020b0:	05213823          	sd	s2,80(sp)
    800020b4:	05313423          	sd	s3,72(sp)
    800020b8:	05413023          	sd	s4,64(sp)
    800020bc:	03513c23          	sd	s5,56(sp)
    800020c0:	03613823          	sd	s6,48(sp)
    800020c4:	03713423          	sd	s7,40(sp)
    800020c8:	03813023          	sd	s8,32(sp)
    800020cc:	06113423          	sd	ra,104(sp)
    800020d0:	01913c23          	sd	s9,24(sp)
    800020d4:	07010413          	addi	s0,sp,112
    800020d8:	00060b93          	mv	s7,a2
    800020dc:	00050913          	mv	s2,a0
    800020e0:	00058c13          	mv	s8,a1
    800020e4:	00060b1b          	sext.w	s6,a2
    800020e8:	00003497          	auipc	s1,0x3
    800020ec:	62048493          	addi	s1,s1,1568 # 80005708 <cons>
    800020f0:	00400993          	li	s3,4
    800020f4:	fff00a13          	li	s4,-1
    800020f8:	00a00a93          	li	s5,10
    800020fc:	05705e63          	blez	s7,80002158 <consoleread+0xb4>
    80002100:	09c4a703          	lw	a4,156(s1)
    80002104:	0984a783          	lw	a5,152(s1)
    80002108:	0007071b          	sext.w	a4,a4
    8000210c:	08e78463          	beq	a5,a4,80002194 <consoleread+0xf0>
    80002110:	07f7f713          	andi	a4,a5,127
    80002114:	00e48733          	add	a4,s1,a4
    80002118:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000211c:	0017869b          	addiw	a3,a5,1
    80002120:	08d4ac23          	sw	a3,152(s1)
    80002124:	00070c9b          	sext.w	s9,a4
    80002128:	0b370663          	beq	a4,s3,800021d4 <consoleread+0x130>
    8000212c:	00100693          	li	a3,1
    80002130:	f9f40613          	addi	a2,s0,-97
    80002134:	000c0593          	mv	a1,s8
    80002138:	00090513          	mv	a0,s2
    8000213c:	f8e40fa3          	sb	a4,-97(s0)
    80002140:	00000097          	auipc	ra,0x0
    80002144:	8b4080e7          	jalr	-1868(ra) # 800019f4 <either_copyout>
    80002148:	01450863          	beq	a0,s4,80002158 <consoleread+0xb4>
    8000214c:	001c0c13          	addi	s8,s8,1
    80002150:	fffb8b9b          	addiw	s7,s7,-1
    80002154:	fb5c94e3          	bne	s9,s5,800020fc <consoleread+0x58>
    80002158:	000b851b          	sext.w	a0,s7
    8000215c:	06813083          	ld	ra,104(sp)
    80002160:	06013403          	ld	s0,96(sp)
    80002164:	05813483          	ld	s1,88(sp)
    80002168:	05013903          	ld	s2,80(sp)
    8000216c:	04813983          	ld	s3,72(sp)
    80002170:	04013a03          	ld	s4,64(sp)
    80002174:	03813a83          	ld	s5,56(sp)
    80002178:	02813b83          	ld	s7,40(sp)
    8000217c:	02013c03          	ld	s8,32(sp)
    80002180:	01813c83          	ld	s9,24(sp)
    80002184:	40ab053b          	subw	a0,s6,a0
    80002188:	03013b03          	ld	s6,48(sp)
    8000218c:	07010113          	addi	sp,sp,112
    80002190:	00008067          	ret
    80002194:	00001097          	auipc	ra,0x1
    80002198:	1d8080e7          	jalr	472(ra) # 8000336c <push_on>
    8000219c:	0984a703          	lw	a4,152(s1)
    800021a0:	09c4a783          	lw	a5,156(s1)
    800021a4:	0007879b          	sext.w	a5,a5
    800021a8:	fef70ce3          	beq	a4,a5,800021a0 <consoleread+0xfc>
    800021ac:	00001097          	auipc	ra,0x1
    800021b0:	234080e7          	jalr	564(ra) # 800033e0 <pop_on>
    800021b4:	0984a783          	lw	a5,152(s1)
    800021b8:	07f7f713          	andi	a4,a5,127
    800021bc:	00e48733          	add	a4,s1,a4
    800021c0:	01874703          	lbu	a4,24(a4)
    800021c4:	0017869b          	addiw	a3,a5,1
    800021c8:	08d4ac23          	sw	a3,152(s1)
    800021cc:	00070c9b          	sext.w	s9,a4
    800021d0:	f5371ee3          	bne	a4,s3,8000212c <consoleread+0x88>
    800021d4:	000b851b          	sext.w	a0,s7
    800021d8:	f96bf2e3          	bgeu	s7,s6,8000215c <consoleread+0xb8>
    800021dc:	08f4ac23          	sw	a5,152(s1)
    800021e0:	f7dff06f          	j	8000215c <consoleread+0xb8>

00000000800021e4 <consputc>:
    800021e4:	10000793          	li	a5,256
    800021e8:	00f50663          	beq	a0,a5,800021f4 <consputc+0x10>
    800021ec:	00001317          	auipc	t1,0x1
    800021f0:	9f430067          	jr	-1548(t1) # 80002be0 <uartputc_sync>
    800021f4:	ff010113          	addi	sp,sp,-16
    800021f8:	00113423          	sd	ra,8(sp)
    800021fc:	00813023          	sd	s0,0(sp)
    80002200:	01010413          	addi	s0,sp,16
    80002204:	00800513          	li	a0,8
    80002208:	00001097          	auipc	ra,0x1
    8000220c:	9d8080e7          	jalr	-1576(ra) # 80002be0 <uartputc_sync>
    80002210:	02000513          	li	a0,32
    80002214:	00001097          	auipc	ra,0x1
    80002218:	9cc080e7          	jalr	-1588(ra) # 80002be0 <uartputc_sync>
    8000221c:	00013403          	ld	s0,0(sp)
    80002220:	00813083          	ld	ra,8(sp)
    80002224:	00800513          	li	a0,8
    80002228:	01010113          	addi	sp,sp,16
    8000222c:	00001317          	auipc	t1,0x1
    80002230:	9b430067          	jr	-1612(t1) # 80002be0 <uartputc_sync>

0000000080002234 <consoleintr>:
    80002234:	fe010113          	addi	sp,sp,-32
    80002238:	00813823          	sd	s0,16(sp)
    8000223c:	00913423          	sd	s1,8(sp)
    80002240:	01213023          	sd	s2,0(sp)
    80002244:	00113c23          	sd	ra,24(sp)
    80002248:	02010413          	addi	s0,sp,32
    8000224c:	00003917          	auipc	s2,0x3
    80002250:	4bc90913          	addi	s2,s2,1212 # 80005708 <cons>
    80002254:	00050493          	mv	s1,a0
    80002258:	00090513          	mv	a0,s2
    8000225c:	00001097          	auipc	ra,0x1
    80002260:	e40080e7          	jalr	-448(ra) # 8000309c <acquire>
    80002264:	02048c63          	beqz	s1,8000229c <consoleintr+0x68>
    80002268:	0a092783          	lw	a5,160(s2)
    8000226c:	09892703          	lw	a4,152(s2)
    80002270:	07f00693          	li	a3,127
    80002274:	40e7873b          	subw	a4,a5,a4
    80002278:	02e6e263          	bltu	a3,a4,8000229c <consoleintr+0x68>
    8000227c:	00d00713          	li	a4,13
    80002280:	04e48063          	beq	s1,a4,800022c0 <consoleintr+0x8c>
    80002284:	07f7f713          	andi	a4,a5,127
    80002288:	00e90733          	add	a4,s2,a4
    8000228c:	0017879b          	addiw	a5,a5,1
    80002290:	0af92023          	sw	a5,160(s2)
    80002294:	00970c23          	sb	s1,24(a4)
    80002298:	08f92e23          	sw	a5,156(s2)
    8000229c:	01013403          	ld	s0,16(sp)
    800022a0:	01813083          	ld	ra,24(sp)
    800022a4:	00813483          	ld	s1,8(sp)
    800022a8:	00013903          	ld	s2,0(sp)
    800022ac:	00003517          	auipc	a0,0x3
    800022b0:	45c50513          	addi	a0,a0,1116 # 80005708 <cons>
    800022b4:	02010113          	addi	sp,sp,32
    800022b8:	00001317          	auipc	t1,0x1
    800022bc:	eb030067          	jr	-336(t1) # 80003168 <release>
    800022c0:	00a00493          	li	s1,10
    800022c4:	fc1ff06f          	j	80002284 <consoleintr+0x50>

00000000800022c8 <consoleinit>:
    800022c8:	fe010113          	addi	sp,sp,-32
    800022cc:	00113c23          	sd	ra,24(sp)
    800022d0:	00813823          	sd	s0,16(sp)
    800022d4:	00913423          	sd	s1,8(sp)
    800022d8:	02010413          	addi	s0,sp,32
    800022dc:	00003497          	auipc	s1,0x3
    800022e0:	42c48493          	addi	s1,s1,1068 # 80005708 <cons>
    800022e4:	00048513          	mv	a0,s1
    800022e8:	00002597          	auipc	a1,0x2
    800022ec:	ff858593          	addi	a1,a1,-8 # 800042e0 <CONSOLE_STATUS+0x2d0>
    800022f0:	00001097          	auipc	ra,0x1
    800022f4:	d88080e7          	jalr	-632(ra) # 80003078 <initlock>
    800022f8:	00000097          	auipc	ra,0x0
    800022fc:	7ac080e7          	jalr	1964(ra) # 80002aa4 <uartinit>
    80002300:	01813083          	ld	ra,24(sp)
    80002304:	01013403          	ld	s0,16(sp)
    80002308:	00000797          	auipc	a5,0x0
    8000230c:	d9c78793          	addi	a5,a5,-612 # 800020a4 <consoleread>
    80002310:	0af4bc23          	sd	a5,184(s1)
    80002314:	00000797          	auipc	a5,0x0
    80002318:	cec78793          	addi	a5,a5,-788 # 80002000 <consolewrite>
    8000231c:	0cf4b023          	sd	a5,192(s1)
    80002320:	00813483          	ld	s1,8(sp)
    80002324:	02010113          	addi	sp,sp,32
    80002328:	00008067          	ret

000000008000232c <console_read>:
    8000232c:	ff010113          	addi	sp,sp,-16
    80002330:	00813423          	sd	s0,8(sp)
    80002334:	01010413          	addi	s0,sp,16
    80002338:	00813403          	ld	s0,8(sp)
    8000233c:	00003317          	auipc	t1,0x3
    80002340:	48433303          	ld	t1,1156(t1) # 800057c0 <devsw+0x10>
    80002344:	01010113          	addi	sp,sp,16
    80002348:	00030067          	jr	t1

000000008000234c <console_write>:
    8000234c:	ff010113          	addi	sp,sp,-16
    80002350:	00813423          	sd	s0,8(sp)
    80002354:	01010413          	addi	s0,sp,16
    80002358:	00813403          	ld	s0,8(sp)
    8000235c:	00003317          	auipc	t1,0x3
    80002360:	46c33303          	ld	t1,1132(t1) # 800057c8 <devsw+0x18>
    80002364:	01010113          	addi	sp,sp,16
    80002368:	00030067          	jr	t1

000000008000236c <panic>:
    8000236c:	fe010113          	addi	sp,sp,-32
    80002370:	00113c23          	sd	ra,24(sp)
    80002374:	00813823          	sd	s0,16(sp)
    80002378:	00913423          	sd	s1,8(sp)
    8000237c:	02010413          	addi	s0,sp,32
    80002380:	00050493          	mv	s1,a0
    80002384:	00002517          	auipc	a0,0x2
    80002388:	f6450513          	addi	a0,a0,-156 # 800042e8 <CONSOLE_STATUS+0x2d8>
    8000238c:	00003797          	auipc	a5,0x3
    80002390:	4c07ae23          	sw	zero,1244(a5) # 80005868 <pr+0x18>
    80002394:	00000097          	auipc	ra,0x0
    80002398:	034080e7          	jalr	52(ra) # 800023c8 <__printf>
    8000239c:	00048513          	mv	a0,s1
    800023a0:	00000097          	auipc	ra,0x0
    800023a4:	028080e7          	jalr	40(ra) # 800023c8 <__printf>
    800023a8:	00002517          	auipc	a0,0x2
    800023ac:	dc050513          	addi	a0,a0,-576 # 80004168 <CONSOLE_STATUS+0x158>
    800023b0:	00000097          	auipc	ra,0x0
    800023b4:	018080e7          	jalr	24(ra) # 800023c8 <__printf>
    800023b8:	00100793          	li	a5,1
    800023bc:	00002717          	auipc	a4,0x2
    800023c0:	24f72623          	sw	a5,588(a4) # 80004608 <panicked>
    800023c4:	0000006f          	j	800023c4 <panic+0x58>

00000000800023c8 <__printf>:
    800023c8:	f3010113          	addi	sp,sp,-208
    800023cc:	08813023          	sd	s0,128(sp)
    800023d0:	07313423          	sd	s3,104(sp)
    800023d4:	09010413          	addi	s0,sp,144
    800023d8:	05813023          	sd	s8,64(sp)
    800023dc:	08113423          	sd	ra,136(sp)
    800023e0:	06913c23          	sd	s1,120(sp)
    800023e4:	07213823          	sd	s2,112(sp)
    800023e8:	07413023          	sd	s4,96(sp)
    800023ec:	05513c23          	sd	s5,88(sp)
    800023f0:	05613823          	sd	s6,80(sp)
    800023f4:	05713423          	sd	s7,72(sp)
    800023f8:	03913c23          	sd	s9,56(sp)
    800023fc:	03a13823          	sd	s10,48(sp)
    80002400:	03b13423          	sd	s11,40(sp)
    80002404:	00003317          	auipc	t1,0x3
    80002408:	44c30313          	addi	t1,t1,1100 # 80005850 <pr>
    8000240c:	01832c03          	lw	s8,24(t1)
    80002410:	00b43423          	sd	a1,8(s0)
    80002414:	00c43823          	sd	a2,16(s0)
    80002418:	00d43c23          	sd	a3,24(s0)
    8000241c:	02e43023          	sd	a4,32(s0)
    80002420:	02f43423          	sd	a5,40(s0)
    80002424:	03043823          	sd	a6,48(s0)
    80002428:	03143c23          	sd	a7,56(s0)
    8000242c:	00050993          	mv	s3,a0
    80002430:	4a0c1663          	bnez	s8,800028dc <__printf+0x514>
    80002434:	60098c63          	beqz	s3,80002a4c <__printf+0x684>
    80002438:	0009c503          	lbu	a0,0(s3)
    8000243c:	00840793          	addi	a5,s0,8
    80002440:	f6f43c23          	sd	a5,-136(s0)
    80002444:	00000493          	li	s1,0
    80002448:	22050063          	beqz	a0,80002668 <__printf+0x2a0>
    8000244c:	00002a37          	lui	s4,0x2
    80002450:	00018ab7          	lui	s5,0x18
    80002454:	000f4b37          	lui	s6,0xf4
    80002458:	00989bb7          	lui	s7,0x989
    8000245c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80002460:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80002464:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80002468:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000246c:	00148c9b          	addiw	s9,s1,1
    80002470:	02500793          	li	a5,37
    80002474:	01998933          	add	s2,s3,s9
    80002478:	38f51263          	bne	a0,a5,800027fc <__printf+0x434>
    8000247c:	00094783          	lbu	a5,0(s2)
    80002480:	00078c9b          	sext.w	s9,a5
    80002484:	1e078263          	beqz	a5,80002668 <__printf+0x2a0>
    80002488:	0024849b          	addiw	s1,s1,2
    8000248c:	07000713          	li	a4,112
    80002490:	00998933          	add	s2,s3,s1
    80002494:	38e78a63          	beq	a5,a4,80002828 <__printf+0x460>
    80002498:	20f76863          	bltu	a4,a5,800026a8 <__printf+0x2e0>
    8000249c:	42a78863          	beq	a5,a0,800028cc <__printf+0x504>
    800024a0:	06400713          	li	a4,100
    800024a4:	40e79663          	bne	a5,a4,800028b0 <__printf+0x4e8>
    800024a8:	f7843783          	ld	a5,-136(s0)
    800024ac:	0007a603          	lw	a2,0(a5)
    800024b0:	00878793          	addi	a5,a5,8
    800024b4:	f6f43c23          	sd	a5,-136(s0)
    800024b8:	42064a63          	bltz	a2,800028ec <__printf+0x524>
    800024bc:	00a00713          	li	a4,10
    800024c0:	02e677bb          	remuw	a5,a2,a4
    800024c4:	00002d97          	auipc	s11,0x2
    800024c8:	e4cd8d93          	addi	s11,s11,-436 # 80004310 <digits>
    800024cc:	00900593          	li	a1,9
    800024d0:	0006051b          	sext.w	a0,a2
    800024d4:	00000c93          	li	s9,0
    800024d8:	02079793          	slli	a5,a5,0x20
    800024dc:	0207d793          	srli	a5,a5,0x20
    800024e0:	00fd87b3          	add	a5,s11,a5
    800024e4:	0007c783          	lbu	a5,0(a5)
    800024e8:	02e656bb          	divuw	a3,a2,a4
    800024ec:	f8f40023          	sb	a5,-128(s0)
    800024f0:	14c5d863          	bge	a1,a2,80002640 <__printf+0x278>
    800024f4:	06300593          	li	a1,99
    800024f8:	00100c93          	li	s9,1
    800024fc:	02e6f7bb          	remuw	a5,a3,a4
    80002500:	02079793          	slli	a5,a5,0x20
    80002504:	0207d793          	srli	a5,a5,0x20
    80002508:	00fd87b3          	add	a5,s11,a5
    8000250c:	0007c783          	lbu	a5,0(a5)
    80002510:	02e6d73b          	divuw	a4,a3,a4
    80002514:	f8f400a3          	sb	a5,-127(s0)
    80002518:	12a5f463          	bgeu	a1,a0,80002640 <__printf+0x278>
    8000251c:	00a00693          	li	a3,10
    80002520:	00900593          	li	a1,9
    80002524:	02d777bb          	remuw	a5,a4,a3
    80002528:	02079793          	slli	a5,a5,0x20
    8000252c:	0207d793          	srli	a5,a5,0x20
    80002530:	00fd87b3          	add	a5,s11,a5
    80002534:	0007c503          	lbu	a0,0(a5)
    80002538:	02d757bb          	divuw	a5,a4,a3
    8000253c:	f8a40123          	sb	a0,-126(s0)
    80002540:	48e5f263          	bgeu	a1,a4,800029c4 <__printf+0x5fc>
    80002544:	06300513          	li	a0,99
    80002548:	02d7f5bb          	remuw	a1,a5,a3
    8000254c:	02059593          	slli	a1,a1,0x20
    80002550:	0205d593          	srli	a1,a1,0x20
    80002554:	00bd85b3          	add	a1,s11,a1
    80002558:	0005c583          	lbu	a1,0(a1)
    8000255c:	02d7d7bb          	divuw	a5,a5,a3
    80002560:	f8b401a3          	sb	a1,-125(s0)
    80002564:	48e57263          	bgeu	a0,a4,800029e8 <__printf+0x620>
    80002568:	3e700513          	li	a0,999
    8000256c:	02d7f5bb          	remuw	a1,a5,a3
    80002570:	02059593          	slli	a1,a1,0x20
    80002574:	0205d593          	srli	a1,a1,0x20
    80002578:	00bd85b3          	add	a1,s11,a1
    8000257c:	0005c583          	lbu	a1,0(a1)
    80002580:	02d7d7bb          	divuw	a5,a5,a3
    80002584:	f8b40223          	sb	a1,-124(s0)
    80002588:	46e57663          	bgeu	a0,a4,800029f4 <__printf+0x62c>
    8000258c:	02d7f5bb          	remuw	a1,a5,a3
    80002590:	02059593          	slli	a1,a1,0x20
    80002594:	0205d593          	srli	a1,a1,0x20
    80002598:	00bd85b3          	add	a1,s11,a1
    8000259c:	0005c583          	lbu	a1,0(a1)
    800025a0:	02d7d7bb          	divuw	a5,a5,a3
    800025a4:	f8b402a3          	sb	a1,-123(s0)
    800025a8:	46ea7863          	bgeu	s4,a4,80002a18 <__printf+0x650>
    800025ac:	02d7f5bb          	remuw	a1,a5,a3
    800025b0:	02059593          	slli	a1,a1,0x20
    800025b4:	0205d593          	srli	a1,a1,0x20
    800025b8:	00bd85b3          	add	a1,s11,a1
    800025bc:	0005c583          	lbu	a1,0(a1)
    800025c0:	02d7d7bb          	divuw	a5,a5,a3
    800025c4:	f8b40323          	sb	a1,-122(s0)
    800025c8:	3eeaf863          	bgeu	s5,a4,800029b8 <__printf+0x5f0>
    800025cc:	02d7f5bb          	remuw	a1,a5,a3
    800025d0:	02059593          	slli	a1,a1,0x20
    800025d4:	0205d593          	srli	a1,a1,0x20
    800025d8:	00bd85b3          	add	a1,s11,a1
    800025dc:	0005c583          	lbu	a1,0(a1)
    800025e0:	02d7d7bb          	divuw	a5,a5,a3
    800025e4:	f8b403a3          	sb	a1,-121(s0)
    800025e8:	42eb7e63          	bgeu	s6,a4,80002a24 <__printf+0x65c>
    800025ec:	02d7f5bb          	remuw	a1,a5,a3
    800025f0:	02059593          	slli	a1,a1,0x20
    800025f4:	0205d593          	srli	a1,a1,0x20
    800025f8:	00bd85b3          	add	a1,s11,a1
    800025fc:	0005c583          	lbu	a1,0(a1)
    80002600:	02d7d7bb          	divuw	a5,a5,a3
    80002604:	f8b40423          	sb	a1,-120(s0)
    80002608:	42ebfc63          	bgeu	s7,a4,80002a40 <__printf+0x678>
    8000260c:	02079793          	slli	a5,a5,0x20
    80002610:	0207d793          	srli	a5,a5,0x20
    80002614:	00fd8db3          	add	s11,s11,a5
    80002618:	000dc703          	lbu	a4,0(s11)
    8000261c:	00a00793          	li	a5,10
    80002620:	00900c93          	li	s9,9
    80002624:	f8e404a3          	sb	a4,-119(s0)
    80002628:	00065c63          	bgez	a2,80002640 <__printf+0x278>
    8000262c:	f9040713          	addi	a4,s0,-112
    80002630:	00f70733          	add	a4,a4,a5
    80002634:	02d00693          	li	a3,45
    80002638:	fed70823          	sb	a3,-16(a4)
    8000263c:	00078c93          	mv	s9,a5
    80002640:	f8040793          	addi	a5,s0,-128
    80002644:	01978cb3          	add	s9,a5,s9
    80002648:	f7f40d13          	addi	s10,s0,-129
    8000264c:	000cc503          	lbu	a0,0(s9)
    80002650:	fffc8c93          	addi	s9,s9,-1
    80002654:	00000097          	auipc	ra,0x0
    80002658:	b90080e7          	jalr	-1136(ra) # 800021e4 <consputc>
    8000265c:	ffac98e3          	bne	s9,s10,8000264c <__printf+0x284>
    80002660:	00094503          	lbu	a0,0(s2)
    80002664:	e00514e3          	bnez	a0,8000246c <__printf+0xa4>
    80002668:	1a0c1663          	bnez	s8,80002814 <__printf+0x44c>
    8000266c:	08813083          	ld	ra,136(sp)
    80002670:	08013403          	ld	s0,128(sp)
    80002674:	07813483          	ld	s1,120(sp)
    80002678:	07013903          	ld	s2,112(sp)
    8000267c:	06813983          	ld	s3,104(sp)
    80002680:	06013a03          	ld	s4,96(sp)
    80002684:	05813a83          	ld	s5,88(sp)
    80002688:	05013b03          	ld	s6,80(sp)
    8000268c:	04813b83          	ld	s7,72(sp)
    80002690:	04013c03          	ld	s8,64(sp)
    80002694:	03813c83          	ld	s9,56(sp)
    80002698:	03013d03          	ld	s10,48(sp)
    8000269c:	02813d83          	ld	s11,40(sp)
    800026a0:	0d010113          	addi	sp,sp,208
    800026a4:	00008067          	ret
    800026a8:	07300713          	li	a4,115
    800026ac:	1ce78a63          	beq	a5,a4,80002880 <__printf+0x4b8>
    800026b0:	07800713          	li	a4,120
    800026b4:	1ee79e63          	bne	a5,a4,800028b0 <__printf+0x4e8>
    800026b8:	f7843783          	ld	a5,-136(s0)
    800026bc:	0007a703          	lw	a4,0(a5)
    800026c0:	00878793          	addi	a5,a5,8
    800026c4:	f6f43c23          	sd	a5,-136(s0)
    800026c8:	28074263          	bltz	a4,8000294c <__printf+0x584>
    800026cc:	00002d97          	auipc	s11,0x2
    800026d0:	c44d8d93          	addi	s11,s11,-956 # 80004310 <digits>
    800026d4:	00f77793          	andi	a5,a4,15
    800026d8:	00fd87b3          	add	a5,s11,a5
    800026dc:	0007c683          	lbu	a3,0(a5)
    800026e0:	00f00613          	li	a2,15
    800026e4:	0007079b          	sext.w	a5,a4
    800026e8:	f8d40023          	sb	a3,-128(s0)
    800026ec:	0047559b          	srliw	a1,a4,0x4
    800026f0:	0047569b          	srliw	a3,a4,0x4
    800026f4:	00000c93          	li	s9,0
    800026f8:	0ee65063          	bge	a2,a4,800027d8 <__printf+0x410>
    800026fc:	00f6f693          	andi	a3,a3,15
    80002700:	00dd86b3          	add	a3,s11,a3
    80002704:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002708:	0087d79b          	srliw	a5,a5,0x8
    8000270c:	00100c93          	li	s9,1
    80002710:	f8d400a3          	sb	a3,-127(s0)
    80002714:	0cb67263          	bgeu	a2,a1,800027d8 <__printf+0x410>
    80002718:	00f7f693          	andi	a3,a5,15
    8000271c:	00dd86b3          	add	a3,s11,a3
    80002720:	0006c583          	lbu	a1,0(a3)
    80002724:	00f00613          	li	a2,15
    80002728:	0047d69b          	srliw	a3,a5,0x4
    8000272c:	f8b40123          	sb	a1,-126(s0)
    80002730:	0047d593          	srli	a1,a5,0x4
    80002734:	28f67e63          	bgeu	a2,a5,800029d0 <__printf+0x608>
    80002738:	00f6f693          	andi	a3,a3,15
    8000273c:	00dd86b3          	add	a3,s11,a3
    80002740:	0006c503          	lbu	a0,0(a3)
    80002744:	0087d813          	srli	a6,a5,0x8
    80002748:	0087d69b          	srliw	a3,a5,0x8
    8000274c:	f8a401a3          	sb	a0,-125(s0)
    80002750:	28b67663          	bgeu	a2,a1,800029dc <__printf+0x614>
    80002754:	00f6f693          	andi	a3,a3,15
    80002758:	00dd86b3          	add	a3,s11,a3
    8000275c:	0006c583          	lbu	a1,0(a3)
    80002760:	00c7d513          	srli	a0,a5,0xc
    80002764:	00c7d69b          	srliw	a3,a5,0xc
    80002768:	f8b40223          	sb	a1,-124(s0)
    8000276c:	29067a63          	bgeu	a2,a6,80002a00 <__printf+0x638>
    80002770:	00f6f693          	andi	a3,a3,15
    80002774:	00dd86b3          	add	a3,s11,a3
    80002778:	0006c583          	lbu	a1,0(a3)
    8000277c:	0107d813          	srli	a6,a5,0x10
    80002780:	0107d69b          	srliw	a3,a5,0x10
    80002784:	f8b402a3          	sb	a1,-123(s0)
    80002788:	28a67263          	bgeu	a2,a0,80002a0c <__printf+0x644>
    8000278c:	00f6f693          	andi	a3,a3,15
    80002790:	00dd86b3          	add	a3,s11,a3
    80002794:	0006c683          	lbu	a3,0(a3)
    80002798:	0147d79b          	srliw	a5,a5,0x14
    8000279c:	f8d40323          	sb	a3,-122(s0)
    800027a0:	21067663          	bgeu	a2,a6,800029ac <__printf+0x5e4>
    800027a4:	02079793          	slli	a5,a5,0x20
    800027a8:	0207d793          	srli	a5,a5,0x20
    800027ac:	00fd8db3          	add	s11,s11,a5
    800027b0:	000dc683          	lbu	a3,0(s11)
    800027b4:	00800793          	li	a5,8
    800027b8:	00700c93          	li	s9,7
    800027bc:	f8d403a3          	sb	a3,-121(s0)
    800027c0:	00075c63          	bgez	a4,800027d8 <__printf+0x410>
    800027c4:	f9040713          	addi	a4,s0,-112
    800027c8:	00f70733          	add	a4,a4,a5
    800027cc:	02d00693          	li	a3,45
    800027d0:	fed70823          	sb	a3,-16(a4)
    800027d4:	00078c93          	mv	s9,a5
    800027d8:	f8040793          	addi	a5,s0,-128
    800027dc:	01978cb3          	add	s9,a5,s9
    800027e0:	f7f40d13          	addi	s10,s0,-129
    800027e4:	000cc503          	lbu	a0,0(s9)
    800027e8:	fffc8c93          	addi	s9,s9,-1
    800027ec:	00000097          	auipc	ra,0x0
    800027f0:	9f8080e7          	jalr	-1544(ra) # 800021e4 <consputc>
    800027f4:	ff9d18e3          	bne	s10,s9,800027e4 <__printf+0x41c>
    800027f8:	0100006f          	j	80002808 <__printf+0x440>
    800027fc:	00000097          	auipc	ra,0x0
    80002800:	9e8080e7          	jalr	-1560(ra) # 800021e4 <consputc>
    80002804:	000c8493          	mv	s1,s9
    80002808:	00094503          	lbu	a0,0(s2)
    8000280c:	c60510e3          	bnez	a0,8000246c <__printf+0xa4>
    80002810:	e40c0ee3          	beqz	s8,8000266c <__printf+0x2a4>
    80002814:	00003517          	auipc	a0,0x3
    80002818:	03c50513          	addi	a0,a0,60 # 80005850 <pr>
    8000281c:	00001097          	auipc	ra,0x1
    80002820:	94c080e7          	jalr	-1716(ra) # 80003168 <release>
    80002824:	e49ff06f          	j	8000266c <__printf+0x2a4>
    80002828:	f7843783          	ld	a5,-136(s0)
    8000282c:	03000513          	li	a0,48
    80002830:	01000d13          	li	s10,16
    80002834:	00878713          	addi	a4,a5,8
    80002838:	0007bc83          	ld	s9,0(a5)
    8000283c:	f6e43c23          	sd	a4,-136(s0)
    80002840:	00000097          	auipc	ra,0x0
    80002844:	9a4080e7          	jalr	-1628(ra) # 800021e4 <consputc>
    80002848:	07800513          	li	a0,120
    8000284c:	00000097          	auipc	ra,0x0
    80002850:	998080e7          	jalr	-1640(ra) # 800021e4 <consputc>
    80002854:	00002d97          	auipc	s11,0x2
    80002858:	abcd8d93          	addi	s11,s11,-1348 # 80004310 <digits>
    8000285c:	03ccd793          	srli	a5,s9,0x3c
    80002860:	00fd87b3          	add	a5,s11,a5
    80002864:	0007c503          	lbu	a0,0(a5)
    80002868:	fffd0d1b          	addiw	s10,s10,-1
    8000286c:	004c9c93          	slli	s9,s9,0x4
    80002870:	00000097          	auipc	ra,0x0
    80002874:	974080e7          	jalr	-1676(ra) # 800021e4 <consputc>
    80002878:	fe0d12e3          	bnez	s10,8000285c <__printf+0x494>
    8000287c:	f8dff06f          	j	80002808 <__printf+0x440>
    80002880:	f7843783          	ld	a5,-136(s0)
    80002884:	0007bc83          	ld	s9,0(a5)
    80002888:	00878793          	addi	a5,a5,8
    8000288c:	f6f43c23          	sd	a5,-136(s0)
    80002890:	000c9a63          	bnez	s9,800028a4 <__printf+0x4dc>
    80002894:	1080006f          	j	8000299c <__printf+0x5d4>
    80002898:	001c8c93          	addi	s9,s9,1
    8000289c:	00000097          	auipc	ra,0x0
    800028a0:	948080e7          	jalr	-1720(ra) # 800021e4 <consputc>
    800028a4:	000cc503          	lbu	a0,0(s9)
    800028a8:	fe0518e3          	bnez	a0,80002898 <__printf+0x4d0>
    800028ac:	f5dff06f          	j	80002808 <__printf+0x440>
    800028b0:	02500513          	li	a0,37
    800028b4:	00000097          	auipc	ra,0x0
    800028b8:	930080e7          	jalr	-1744(ra) # 800021e4 <consputc>
    800028bc:	000c8513          	mv	a0,s9
    800028c0:	00000097          	auipc	ra,0x0
    800028c4:	924080e7          	jalr	-1756(ra) # 800021e4 <consputc>
    800028c8:	f41ff06f          	j	80002808 <__printf+0x440>
    800028cc:	02500513          	li	a0,37
    800028d0:	00000097          	auipc	ra,0x0
    800028d4:	914080e7          	jalr	-1772(ra) # 800021e4 <consputc>
    800028d8:	f31ff06f          	j	80002808 <__printf+0x440>
    800028dc:	00030513          	mv	a0,t1
    800028e0:	00000097          	auipc	ra,0x0
    800028e4:	7bc080e7          	jalr	1980(ra) # 8000309c <acquire>
    800028e8:	b4dff06f          	j	80002434 <__printf+0x6c>
    800028ec:	40c0053b          	negw	a0,a2
    800028f0:	00a00713          	li	a4,10
    800028f4:	02e576bb          	remuw	a3,a0,a4
    800028f8:	00002d97          	auipc	s11,0x2
    800028fc:	a18d8d93          	addi	s11,s11,-1512 # 80004310 <digits>
    80002900:	ff700593          	li	a1,-9
    80002904:	02069693          	slli	a3,a3,0x20
    80002908:	0206d693          	srli	a3,a3,0x20
    8000290c:	00dd86b3          	add	a3,s11,a3
    80002910:	0006c683          	lbu	a3,0(a3)
    80002914:	02e557bb          	divuw	a5,a0,a4
    80002918:	f8d40023          	sb	a3,-128(s0)
    8000291c:	10b65e63          	bge	a2,a1,80002a38 <__printf+0x670>
    80002920:	06300593          	li	a1,99
    80002924:	02e7f6bb          	remuw	a3,a5,a4
    80002928:	02069693          	slli	a3,a3,0x20
    8000292c:	0206d693          	srli	a3,a3,0x20
    80002930:	00dd86b3          	add	a3,s11,a3
    80002934:	0006c683          	lbu	a3,0(a3)
    80002938:	02e7d73b          	divuw	a4,a5,a4
    8000293c:	00200793          	li	a5,2
    80002940:	f8d400a3          	sb	a3,-127(s0)
    80002944:	bca5ece3          	bltu	a1,a0,8000251c <__printf+0x154>
    80002948:	ce5ff06f          	j	8000262c <__printf+0x264>
    8000294c:	40e007bb          	negw	a5,a4
    80002950:	00002d97          	auipc	s11,0x2
    80002954:	9c0d8d93          	addi	s11,s11,-1600 # 80004310 <digits>
    80002958:	00f7f693          	andi	a3,a5,15
    8000295c:	00dd86b3          	add	a3,s11,a3
    80002960:	0006c583          	lbu	a1,0(a3)
    80002964:	ff100613          	li	a2,-15
    80002968:	0047d69b          	srliw	a3,a5,0x4
    8000296c:	f8b40023          	sb	a1,-128(s0)
    80002970:	0047d59b          	srliw	a1,a5,0x4
    80002974:	0ac75e63          	bge	a4,a2,80002a30 <__printf+0x668>
    80002978:	00f6f693          	andi	a3,a3,15
    8000297c:	00dd86b3          	add	a3,s11,a3
    80002980:	0006c603          	lbu	a2,0(a3)
    80002984:	00f00693          	li	a3,15
    80002988:	0087d79b          	srliw	a5,a5,0x8
    8000298c:	f8c400a3          	sb	a2,-127(s0)
    80002990:	d8b6e4e3          	bltu	a3,a1,80002718 <__printf+0x350>
    80002994:	00200793          	li	a5,2
    80002998:	e2dff06f          	j	800027c4 <__printf+0x3fc>
    8000299c:	00002c97          	auipc	s9,0x2
    800029a0:	954c8c93          	addi	s9,s9,-1708 # 800042f0 <CONSOLE_STATUS+0x2e0>
    800029a4:	02800513          	li	a0,40
    800029a8:	ef1ff06f          	j	80002898 <__printf+0x4d0>
    800029ac:	00700793          	li	a5,7
    800029b0:	00600c93          	li	s9,6
    800029b4:	e0dff06f          	j	800027c0 <__printf+0x3f8>
    800029b8:	00700793          	li	a5,7
    800029bc:	00600c93          	li	s9,6
    800029c0:	c69ff06f          	j	80002628 <__printf+0x260>
    800029c4:	00300793          	li	a5,3
    800029c8:	00200c93          	li	s9,2
    800029cc:	c5dff06f          	j	80002628 <__printf+0x260>
    800029d0:	00300793          	li	a5,3
    800029d4:	00200c93          	li	s9,2
    800029d8:	de9ff06f          	j	800027c0 <__printf+0x3f8>
    800029dc:	00400793          	li	a5,4
    800029e0:	00300c93          	li	s9,3
    800029e4:	dddff06f          	j	800027c0 <__printf+0x3f8>
    800029e8:	00400793          	li	a5,4
    800029ec:	00300c93          	li	s9,3
    800029f0:	c39ff06f          	j	80002628 <__printf+0x260>
    800029f4:	00500793          	li	a5,5
    800029f8:	00400c93          	li	s9,4
    800029fc:	c2dff06f          	j	80002628 <__printf+0x260>
    80002a00:	00500793          	li	a5,5
    80002a04:	00400c93          	li	s9,4
    80002a08:	db9ff06f          	j	800027c0 <__printf+0x3f8>
    80002a0c:	00600793          	li	a5,6
    80002a10:	00500c93          	li	s9,5
    80002a14:	dadff06f          	j	800027c0 <__printf+0x3f8>
    80002a18:	00600793          	li	a5,6
    80002a1c:	00500c93          	li	s9,5
    80002a20:	c09ff06f          	j	80002628 <__printf+0x260>
    80002a24:	00800793          	li	a5,8
    80002a28:	00700c93          	li	s9,7
    80002a2c:	bfdff06f          	j	80002628 <__printf+0x260>
    80002a30:	00100793          	li	a5,1
    80002a34:	d91ff06f          	j	800027c4 <__printf+0x3fc>
    80002a38:	00100793          	li	a5,1
    80002a3c:	bf1ff06f          	j	8000262c <__printf+0x264>
    80002a40:	00900793          	li	a5,9
    80002a44:	00800c93          	li	s9,8
    80002a48:	be1ff06f          	j	80002628 <__printf+0x260>
    80002a4c:	00002517          	auipc	a0,0x2
    80002a50:	8ac50513          	addi	a0,a0,-1876 # 800042f8 <CONSOLE_STATUS+0x2e8>
    80002a54:	00000097          	auipc	ra,0x0
    80002a58:	918080e7          	jalr	-1768(ra) # 8000236c <panic>

0000000080002a5c <printfinit>:
    80002a5c:	fe010113          	addi	sp,sp,-32
    80002a60:	00813823          	sd	s0,16(sp)
    80002a64:	00913423          	sd	s1,8(sp)
    80002a68:	00113c23          	sd	ra,24(sp)
    80002a6c:	02010413          	addi	s0,sp,32
    80002a70:	00003497          	auipc	s1,0x3
    80002a74:	de048493          	addi	s1,s1,-544 # 80005850 <pr>
    80002a78:	00048513          	mv	a0,s1
    80002a7c:	00002597          	auipc	a1,0x2
    80002a80:	88c58593          	addi	a1,a1,-1908 # 80004308 <CONSOLE_STATUS+0x2f8>
    80002a84:	00000097          	auipc	ra,0x0
    80002a88:	5f4080e7          	jalr	1524(ra) # 80003078 <initlock>
    80002a8c:	01813083          	ld	ra,24(sp)
    80002a90:	01013403          	ld	s0,16(sp)
    80002a94:	0004ac23          	sw	zero,24(s1)
    80002a98:	00813483          	ld	s1,8(sp)
    80002a9c:	02010113          	addi	sp,sp,32
    80002aa0:	00008067          	ret

0000000080002aa4 <uartinit>:
    80002aa4:	ff010113          	addi	sp,sp,-16
    80002aa8:	00813423          	sd	s0,8(sp)
    80002aac:	01010413          	addi	s0,sp,16
    80002ab0:	100007b7          	lui	a5,0x10000
    80002ab4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80002ab8:	f8000713          	li	a4,-128
    80002abc:	00e781a3          	sb	a4,3(a5)
    80002ac0:	00300713          	li	a4,3
    80002ac4:	00e78023          	sb	a4,0(a5)
    80002ac8:	000780a3          	sb	zero,1(a5)
    80002acc:	00e781a3          	sb	a4,3(a5)
    80002ad0:	00700693          	li	a3,7
    80002ad4:	00d78123          	sb	a3,2(a5)
    80002ad8:	00e780a3          	sb	a4,1(a5)
    80002adc:	00813403          	ld	s0,8(sp)
    80002ae0:	01010113          	addi	sp,sp,16
    80002ae4:	00008067          	ret

0000000080002ae8 <uartputc>:
    80002ae8:	00002797          	auipc	a5,0x2
    80002aec:	b207a783          	lw	a5,-1248(a5) # 80004608 <panicked>
    80002af0:	00078463          	beqz	a5,80002af8 <uartputc+0x10>
    80002af4:	0000006f          	j	80002af4 <uartputc+0xc>
    80002af8:	fd010113          	addi	sp,sp,-48
    80002afc:	02813023          	sd	s0,32(sp)
    80002b00:	00913c23          	sd	s1,24(sp)
    80002b04:	01213823          	sd	s2,16(sp)
    80002b08:	01313423          	sd	s3,8(sp)
    80002b0c:	02113423          	sd	ra,40(sp)
    80002b10:	03010413          	addi	s0,sp,48
    80002b14:	00002917          	auipc	s2,0x2
    80002b18:	afc90913          	addi	s2,s2,-1284 # 80004610 <uart_tx_r>
    80002b1c:	00093783          	ld	a5,0(s2)
    80002b20:	00002497          	auipc	s1,0x2
    80002b24:	af848493          	addi	s1,s1,-1288 # 80004618 <uart_tx_w>
    80002b28:	0004b703          	ld	a4,0(s1)
    80002b2c:	02078693          	addi	a3,a5,32
    80002b30:	00050993          	mv	s3,a0
    80002b34:	02e69c63          	bne	a3,a4,80002b6c <uartputc+0x84>
    80002b38:	00001097          	auipc	ra,0x1
    80002b3c:	834080e7          	jalr	-1996(ra) # 8000336c <push_on>
    80002b40:	00093783          	ld	a5,0(s2)
    80002b44:	0004b703          	ld	a4,0(s1)
    80002b48:	02078793          	addi	a5,a5,32
    80002b4c:	00e79463          	bne	a5,a4,80002b54 <uartputc+0x6c>
    80002b50:	0000006f          	j	80002b50 <uartputc+0x68>
    80002b54:	00001097          	auipc	ra,0x1
    80002b58:	88c080e7          	jalr	-1908(ra) # 800033e0 <pop_on>
    80002b5c:	00093783          	ld	a5,0(s2)
    80002b60:	0004b703          	ld	a4,0(s1)
    80002b64:	02078693          	addi	a3,a5,32
    80002b68:	fce688e3          	beq	a3,a4,80002b38 <uartputc+0x50>
    80002b6c:	01f77693          	andi	a3,a4,31
    80002b70:	00003597          	auipc	a1,0x3
    80002b74:	d0058593          	addi	a1,a1,-768 # 80005870 <uart_tx_buf>
    80002b78:	00d586b3          	add	a3,a1,a3
    80002b7c:	00170713          	addi	a4,a4,1
    80002b80:	01368023          	sb	s3,0(a3)
    80002b84:	00e4b023          	sd	a4,0(s1)
    80002b88:	10000637          	lui	a2,0x10000
    80002b8c:	02f71063          	bne	a4,a5,80002bac <uartputc+0xc4>
    80002b90:	0340006f          	j	80002bc4 <uartputc+0xdc>
    80002b94:	00074703          	lbu	a4,0(a4)
    80002b98:	00f93023          	sd	a5,0(s2)
    80002b9c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002ba0:	00093783          	ld	a5,0(s2)
    80002ba4:	0004b703          	ld	a4,0(s1)
    80002ba8:	00f70e63          	beq	a4,a5,80002bc4 <uartputc+0xdc>
    80002bac:	00564683          	lbu	a3,5(a2)
    80002bb0:	01f7f713          	andi	a4,a5,31
    80002bb4:	00e58733          	add	a4,a1,a4
    80002bb8:	0206f693          	andi	a3,a3,32
    80002bbc:	00178793          	addi	a5,a5,1
    80002bc0:	fc069ae3          	bnez	a3,80002b94 <uartputc+0xac>
    80002bc4:	02813083          	ld	ra,40(sp)
    80002bc8:	02013403          	ld	s0,32(sp)
    80002bcc:	01813483          	ld	s1,24(sp)
    80002bd0:	01013903          	ld	s2,16(sp)
    80002bd4:	00813983          	ld	s3,8(sp)
    80002bd8:	03010113          	addi	sp,sp,48
    80002bdc:	00008067          	ret

0000000080002be0 <uartputc_sync>:
    80002be0:	ff010113          	addi	sp,sp,-16
    80002be4:	00813423          	sd	s0,8(sp)
    80002be8:	01010413          	addi	s0,sp,16
    80002bec:	00002717          	auipc	a4,0x2
    80002bf0:	a1c72703          	lw	a4,-1508(a4) # 80004608 <panicked>
    80002bf4:	02071663          	bnez	a4,80002c20 <uartputc_sync+0x40>
    80002bf8:	00050793          	mv	a5,a0
    80002bfc:	100006b7          	lui	a3,0x10000
    80002c00:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002c04:	02077713          	andi	a4,a4,32
    80002c08:	fe070ce3          	beqz	a4,80002c00 <uartputc_sync+0x20>
    80002c0c:	0ff7f793          	andi	a5,a5,255
    80002c10:	00f68023          	sb	a5,0(a3)
    80002c14:	00813403          	ld	s0,8(sp)
    80002c18:	01010113          	addi	sp,sp,16
    80002c1c:	00008067          	ret
    80002c20:	0000006f          	j	80002c20 <uartputc_sync+0x40>

0000000080002c24 <uartstart>:
    80002c24:	ff010113          	addi	sp,sp,-16
    80002c28:	00813423          	sd	s0,8(sp)
    80002c2c:	01010413          	addi	s0,sp,16
    80002c30:	00002617          	auipc	a2,0x2
    80002c34:	9e060613          	addi	a2,a2,-1568 # 80004610 <uart_tx_r>
    80002c38:	00002517          	auipc	a0,0x2
    80002c3c:	9e050513          	addi	a0,a0,-1568 # 80004618 <uart_tx_w>
    80002c40:	00063783          	ld	a5,0(a2)
    80002c44:	00053703          	ld	a4,0(a0)
    80002c48:	04f70263          	beq	a4,a5,80002c8c <uartstart+0x68>
    80002c4c:	100005b7          	lui	a1,0x10000
    80002c50:	00003817          	auipc	a6,0x3
    80002c54:	c2080813          	addi	a6,a6,-992 # 80005870 <uart_tx_buf>
    80002c58:	01c0006f          	j	80002c74 <uartstart+0x50>
    80002c5c:	0006c703          	lbu	a4,0(a3)
    80002c60:	00f63023          	sd	a5,0(a2)
    80002c64:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002c68:	00063783          	ld	a5,0(a2)
    80002c6c:	00053703          	ld	a4,0(a0)
    80002c70:	00f70e63          	beq	a4,a5,80002c8c <uartstart+0x68>
    80002c74:	01f7f713          	andi	a4,a5,31
    80002c78:	00e806b3          	add	a3,a6,a4
    80002c7c:	0055c703          	lbu	a4,5(a1)
    80002c80:	00178793          	addi	a5,a5,1
    80002c84:	02077713          	andi	a4,a4,32
    80002c88:	fc071ae3          	bnez	a4,80002c5c <uartstart+0x38>
    80002c8c:	00813403          	ld	s0,8(sp)
    80002c90:	01010113          	addi	sp,sp,16
    80002c94:	00008067          	ret

0000000080002c98 <uartgetc>:
    80002c98:	ff010113          	addi	sp,sp,-16
    80002c9c:	00813423          	sd	s0,8(sp)
    80002ca0:	01010413          	addi	s0,sp,16
    80002ca4:	10000737          	lui	a4,0x10000
    80002ca8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002cac:	0017f793          	andi	a5,a5,1
    80002cb0:	00078c63          	beqz	a5,80002cc8 <uartgetc+0x30>
    80002cb4:	00074503          	lbu	a0,0(a4)
    80002cb8:	0ff57513          	andi	a0,a0,255
    80002cbc:	00813403          	ld	s0,8(sp)
    80002cc0:	01010113          	addi	sp,sp,16
    80002cc4:	00008067          	ret
    80002cc8:	fff00513          	li	a0,-1
    80002ccc:	ff1ff06f          	j	80002cbc <uartgetc+0x24>

0000000080002cd0 <uartintr>:
    80002cd0:	100007b7          	lui	a5,0x10000
    80002cd4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80002cd8:	0017f793          	andi	a5,a5,1
    80002cdc:	0a078463          	beqz	a5,80002d84 <uartintr+0xb4>
    80002ce0:	fe010113          	addi	sp,sp,-32
    80002ce4:	00813823          	sd	s0,16(sp)
    80002ce8:	00913423          	sd	s1,8(sp)
    80002cec:	00113c23          	sd	ra,24(sp)
    80002cf0:	02010413          	addi	s0,sp,32
    80002cf4:	100004b7          	lui	s1,0x10000
    80002cf8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80002cfc:	0ff57513          	andi	a0,a0,255
    80002d00:	fffff097          	auipc	ra,0xfffff
    80002d04:	534080e7          	jalr	1332(ra) # 80002234 <consoleintr>
    80002d08:	0054c783          	lbu	a5,5(s1)
    80002d0c:	0017f793          	andi	a5,a5,1
    80002d10:	fe0794e3          	bnez	a5,80002cf8 <uartintr+0x28>
    80002d14:	00002617          	auipc	a2,0x2
    80002d18:	8fc60613          	addi	a2,a2,-1796 # 80004610 <uart_tx_r>
    80002d1c:	00002517          	auipc	a0,0x2
    80002d20:	8fc50513          	addi	a0,a0,-1796 # 80004618 <uart_tx_w>
    80002d24:	00063783          	ld	a5,0(a2)
    80002d28:	00053703          	ld	a4,0(a0)
    80002d2c:	04f70263          	beq	a4,a5,80002d70 <uartintr+0xa0>
    80002d30:	100005b7          	lui	a1,0x10000
    80002d34:	00003817          	auipc	a6,0x3
    80002d38:	b3c80813          	addi	a6,a6,-1220 # 80005870 <uart_tx_buf>
    80002d3c:	01c0006f          	j	80002d58 <uartintr+0x88>
    80002d40:	0006c703          	lbu	a4,0(a3)
    80002d44:	00f63023          	sd	a5,0(a2)
    80002d48:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002d4c:	00063783          	ld	a5,0(a2)
    80002d50:	00053703          	ld	a4,0(a0)
    80002d54:	00f70e63          	beq	a4,a5,80002d70 <uartintr+0xa0>
    80002d58:	01f7f713          	andi	a4,a5,31
    80002d5c:	00e806b3          	add	a3,a6,a4
    80002d60:	0055c703          	lbu	a4,5(a1)
    80002d64:	00178793          	addi	a5,a5,1
    80002d68:	02077713          	andi	a4,a4,32
    80002d6c:	fc071ae3          	bnez	a4,80002d40 <uartintr+0x70>
    80002d70:	01813083          	ld	ra,24(sp)
    80002d74:	01013403          	ld	s0,16(sp)
    80002d78:	00813483          	ld	s1,8(sp)
    80002d7c:	02010113          	addi	sp,sp,32
    80002d80:	00008067          	ret
    80002d84:	00002617          	auipc	a2,0x2
    80002d88:	88c60613          	addi	a2,a2,-1908 # 80004610 <uart_tx_r>
    80002d8c:	00002517          	auipc	a0,0x2
    80002d90:	88c50513          	addi	a0,a0,-1908 # 80004618 <uart_tx_w>
    80002d94:	00063783          	ld	a5,0(a2)
    80002d98:	00053703          	ld	a4,0(a0)
    80002d9c:	04f70263          	beq	a4,a5,80002de0 <uartintr+0x110>
    80002da0:	100005b7          	lui	a1,0x10000
    80002da4:	00003817          	auipc	a6,0x3
    80002da8:	acc80813          	addi	a6,a6,-1332 # 80005870 <uart_tx_buf>
    80002dac:	01c0006f          	j	80002dc8 <uartintr+0xf8>
    80002db0:	0006c703          	lbu	a4,0(a3)
    80002db4:	00f63023          	sd	a5,0(a2)
    80002db8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002dbc:	00063783          	ld	a5,0(a2)
    80002dc0:	00053703          	ld	a4,0(a0)
    80002dc4:	02f70063          	beq	a4,a5,80002de4 <uartintr+0x114>
    80002dc8:	01f7f713          	andi	a4,a5,31
    80002dcc:	00e806b3          	add	a3,a6,a4
    80002dd0:	0055c703          	lbu	a4,5(a1)
    80002dd4:	00178793          	addi	a5,a5,1
    80002dd8:	02077713          	andi	a4,a4,32
    80002ddc:	fc071ae3          	bnez	a4,80002db0 <uartintr+0xe0>
    80002de0:	00008067          	ret
    80002de4:	00008067          	ret

0000000080002de8 <kinit>:
    80002de8:	fc010113          	addi	sp,sp,-64
    80002dec:	02913423          	sd	s1,40(sp)
    80002df0:	fffff7b7          	lui	a5,0xfffff
    80002df4:	00004497          	auipc	s1,0x4
    80002df8:	a9b48493          	addi	s1,s1,-1381 # 8000688f <end+0xfff>
    80002dfc:	02813823          	sd	s0,48(sp)
    80002e00:	01313c23          	sd	s3,24(sp)
    80002e04:	00f4f4b3          	and	s1,s1,a5
    80002e08:	02113c23          	sd	ra,56(sp)
    80002e0c:	03213023          	sd	s2,32(sp)
    80002e10:	01413823          	sd	s4,16(sp)
    80002e14:	01513423          	sd	s5,8(sp)
    80002e18:	04010413          	addi	s0,sp,64
    80002e1c:	000017b7          	lui	a5,0x1
    80002e20:	01100993          	li	s3,17
    80002e24:	00f487b3          	add	a5,s1,a5
    80002e28:	01b99993          	slli	s3,s3,0x1b
    80002e2c:	06f9e063          	bltu	s3,a5,80002e8c <kinit+0xa4>
    80002e30:	00003a97          	auipc	s5,0x3
    80002e34:	a60a8a93          	addi	s5,s5,-1440 # 80005890 <end>
    80002e38:	0754ec63          	bltu	s1,s5,80002eb0 <kinit+0xc8>
    80002e3c:	0734fa63          	bgeu	s1,s3,80002eb0 <kinit+0xc8>
    80002e40:	00088a37          	lui	s4,0x88
    80002e44:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80002e48:	00001917          	auipc	s2,0x1
    80002e4c:	7d890913          	addi	s2,s2,2008 # 80004620 <kmem>
    80002e50:	00ca1a13          	slli	s4,s4,0xc
    80002e54:	0140006f          	j	80002e68 <kinit+0x80>
    80002e58:	000017b7          	lui	a5,0x1
    80002e5c:	00f484b3          	add	s1,s1,a5
    80002e60:	0554e863          	bltu	s1,s5,80002eb0 <kinit+0xc8>
    80002e64:	0534f663          	bgeu	s1,s3,80002eb0 <kinit+0xc8>
    80002e68:	00001637          	lui	a2,0x1
    80002e6c:	00100593          	li	a1,1
    80002e70:	00048513          	mv	a0,s1
    80002e74:	00000097          	auipc	ra,0x0
    80002e78:	5e4080e7          	jalr	1508(ra) # 80003458 <__memset>
    80002e7c:	00093783          	ld	a5,0(s2)
    80002e80:	00f4b023          	sd	a5,0(s1)
    80002e84:	00993023          	sd	s1,0(s2)
    80002e88:	fd4498e3          	bne	s1,s4,80002e58 <kinit+0x70>
    80002e8c:	03813083          	ld	ra,56(sp)
    80002e90:	03013403          	ld	s0,48(sp)
    80002e94:	02813483          	ld	s1,40(sp)
    80002e98:	02013903          	ld	s2,32(sp)
    80002e9c:	01813983          	ld	s3,24(sp)
    80002ea0:	01013a03          	ld	s4,16(sp)
    80002ea4:	00813a83          	ld	s5,8(sp)
    80002ea8:	04010113          	addi	sp,sp,64
    80002eac:	00008067          	ret
    80002eb0:	00001517          	auipc	a0,0x1
    80002eb4:	47850513          	addi	a0,a0,1144 # 80004328 <digits+0x18>
    80002eb8:	fffff097          	auipc	ra,0xfffff
    80002ebc:	4b4080e7          	jalr	1204(ra) # 8000236c <panic>

0000000080002ec0 <freerange>:
    80002ec0:	fc010113          	addi	sp,sp,-64
    80002ec4:	000017b7          	lui	a5,0x1
    80002ec8:	02913423          	sd	s1,40(sp)
    80002ecc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80002ed0:	009504b3          	add	s1,a0,s1
    80002ed4:	fffff537          	lui	a0,0xfffff
    80002ed8:	02813823          	sd	s0,48(sp)
    80002edc:	02113c23          	sd	ra,56(sp)
    80002ee0:	03213023          	sd	s2,32(sp)
    80002ee4:	01313c23          	sd	s3,24(sp)
    80002ee8:	01413823          	sd	s4,16(sp)
    80002eec:	01513423          	sd	s5,8(sp)
    80002ef0:	01613023          	sd	s6,0(sp)
    80002ef4:	04010413          	addi	s0,sp,64
    80002ef8:	00a4f4b3          	and	s1,s1,a0
    80002efc:	00f487b3          	add	a5,s1,a5
    80002f00:	06f5e463          	bltu	a1,a5,80002f68 <freerange+0xa8>
    80002f04:	00003a97          	auipc	s5,0x3
    80002f08:	98ca8a93          	addi	s5,s5,-1652 # 80005890 <end>
    80002f0c:	0954e263          	bltu	s1,s5,80002f90 <freerange+0xd0>
    80002f10:	01100993          	li	s3,17
    80002f14:	01b99993          	slli	s3,s3,0x1b
    80002f18:	0734fc63          	bgeu	s1,s3,80002f90 <freerange+0xd0>
    80002f1c:	00058a13          	mv	s4,a1
    80002f20:	00001917          	auipc	s2,0x1
    80002f24:	70090913          	addi	s2,s2,1792 # 80004620 <kmem>
    80002f28:	00002b37          	lui	s6,0x2
    80002f2c:	0140006f          	j	80002f40 <freerange+0x80>
    80002f30:	000017b7          	lui	a5,0x1
    80002f34:	00f484b3          	add	s1,s1,a5
    80002f38:	0554ec63          	bltu	s1,s5,80002f90 <freerange+0xd0>
    80002f3c:	0534fa63          	bgeu	s1,s3,80002f90 <freerange+0xd0>
    80002f40:	00001637          	lui	a2,0x1
    80002f44:	00100593          	li	a1,1
    80002f48:	00048513          	mv	a0,s1
    80002f4c:	00000097          	auipc	ra,0x0
    80002f50:	50c080e7          	jalr	1292(ra) # 80003458 <__memset>
    80002f54:	00093703          	ld	a4,0(s2)
    80002f58:	016487b3          	add	a5,s1,s6
    80002f5c:	00e4b023          	sd	a4,0(s1)
    80002f60:	00993023          	sd	s1,0(s2)
    80002f64:	fcfa76e3          	bgeu	s4,a5,80002f30 <freerange+0x70>
    80002f68:	03813083          	ld	ra,56(sp)
    80002f6c:	03013403          	ld	s0,48(sp)
    80002f70:	02813483          	ld	s1,40(sp)
    80002f74:	02013903          	ld	s2,32(sp)
    80002f78:	01813983          	ld	s3,24(sp)
    80002f7c:	01013a03          	ld	s4,16(sp)
    80002f80:	00813a83          	ld	s5,8(sp)
    80002f84:	00013b03          	ld	s6,0(sp)
    80002f88:	04010113          	addi	sp,sp,64
    80002f8c:	00008067          	ret
    80002f90:	00001517          	auipc	a0,0x1
    80002f94:	39850513          	addi	a0,a0,920 # 80004328 <digits+0x18>
    80002f98:	fffff097          	auipc	ra,0xfffff
    80002f9c:	3d4080e7          	jalr	980(ra) # 8000236c <panic>

0000000080002fa0 <kfree>:
    80002fa0:	fe010113          	addi	sp,sp,-32
    80002fa4:	00813823          	sd	s0,16(sp)
    80002fa8:	00113c23          	sd	ra,24(sp)
    80002fac:	00913423          	sd	s1,8(sp)
    80002fb0:	02010413          	addi	s0,sp,32
    80002fb4:	03451793          	slli	a5,a0,0x34
    80002fb8:	04079c63          	bnez	a5,80003010 <kfree+0x70>
    80002fbc:	00003797          	auipc	a5,0x3
    80002fc0:	8d478793          	addi	a5,a5,-1836 # 80005890 <end>
    80002fc4:	00050493          	mv	s1,a0
    80002fc8:	04f56463          	bltu	a0,a5,80003010 <kfree+0x70>
    80002fcc:	01100793          	li	a5,17
    80002fd0:	01b79793          	slli	a5,a5,0x1b
    80002fd4:	02f57e63          	bgeu	a0,a5,80003010 <kfree+0x70>
    80002fd8:	00001637          	lui	a2,0x1
    80002fdc:	00100593          	li	a1,1
    80002fe0:	00000097          	auipc	ra,0x0
    80002fe4:	478080e7          	jalr	1144(ra) # 80003458 <__memset>
    80002fe8:	00001797          	auipc	a5,0x1
    80002fec:	63878793          	addi	a5,a5,1592 # 80004620 <kmem>
    80002ff0:	0007b703          	ld	a4,0(a5)
    80002ff4:	01813083          	ld	ra,24(sp)
    80002ff8:	01013403          	ld	s0,16(sp)
    80002ffc:	00e4b023          	sd	a4,0(s1)
    80003000:	0097b023          	sd	s1,0(a5)
    80003004:	00813483          	ld	s1,8(sp)
    80003008:	02010113          	addi	sp,sp,32
    8000300c:	00008067          	ret
    80003010:	00001517          	auipc	a0,0x1
    80003014:	31850513          	addi	a0,a0,792 # 80004328 <digits+0x18>
    80003018:	fffff097          	auipc	ra,0xfffff
    8000301c:	354080e7          	jalr	852(ra) # 8000236c <panic>

0000000080003020 <kalloc>:
    80003020:	fe010113          	addi	sp,sp,-32
    80003024:	00813823          	sd	s0,16(sp)
    80003028:	00913423          	sd	s1,8(sp)
    8000302c:	00113c23          	sd	ra,24(sp)
    80003030:	02010413          	addi	s0,sp,32
    80003034:	00001797          	auipc	a5,0x1
    80003038:	5ec78793          	addi	a5,a5,1516 # 80004620 <kmem>
    8000303c:	0007b483          	ld	s1,0(a5)
    80003040:	02048063          	beqz	s1,80003060 <kalloc+0x40>
    80003044:	0004b703          	ld	a4,0(s1)
    80003048:	00001637          	lui	a2,0x1
    8000304c:	00500593          	li	a1,5
    80003050:	00048513          	mv	a0,s1
    80003054:	00e7b023          	sd	a4,0(a5)
    80003058:	00000097          	auipc	ra,0x0
    8000305c:	400080e7          	jalr	1024(ra) # 80003458 <__memset>
    80003060:	01813083          	ld	ra,24(sp)
    80003064:	01013403          	ld	s0,16(sp)
    80003068:	00048513          	mv	a0,s1
    8000306c:	00813483          	ld	s1,8(sp)
    80003070:	02010113          	addi	sp,sp,32
    80003074:	00008067          	ret

0000000080003078 <initlock>:
    80003078:	ff010113          	addi	sp,sp,-16
    8000307c:	00813423          	sd	s0,8(sp)
    80003080:	01010413          	addi	s0,sp,16
    80003084:	00813403          	ld	s0,8(sp)
    80003088:	00b53423          	sd	a1,8(a0)
    8000308c:	00052023          	sw	zero,0(a0)
    80003090:	00053823          	sd	zero,16(a0)
    80003094:	01010113          	addi	sp,sp,16
    80003098:	00008067          	ret

000000008000309c <acquire>:
    8000309c:	fe010113          	addi	sp,sp,-32
    800030a0:	00813823          	sd	s0,16(sp)
    800030a4:	00913423          	sd	s1,8(sp)
    800030a8:	00113c23          	sd	ra,24(sp)
    800030ac:	01213023          	sd	s2,0(sp)
    800030b0:	02010413          	addi	s0,sp,32
    800030b4:	00050493          	mv	s1,a0
    800030b8:	10002973          	csrr	s2,sstatus
    800030bc:	100027f3          	csrr	a5,sstatus
    800030c0:	ffd7f793          	andi	a5,a5,-3
    800030c4:	10079073          	csrw	sstatus,a5
    800030c8:	fffff097          	auipc	ra,0xfffff
    800030cc:	8e0080e7          	jalr	-1824(ra) # 800019a8 <mycpu>
    800030d0:	07852783          	lw	a5,120(a0)
    800030d4:	06078e63          	beqz	a5,80003150 <acquire+0xb4>
    800030d8:	fffff097          	auipc	ra,0xfffff
    800030dc:	8d0080e7          	jalr	-1840(ra) # 800019a8 <mycpu>
    800030e0:	07852783          	lw	a5,120(a0)
    800030e4:	0004a703          	lw	a4,0(s1)
    800030e8:	0017879b          	addiw	a5,a5,1
    800030ec:	06f52c23          	sw	a5,120(a0)
    800030f0:	04071063          	bnez	a4,80003130 <acquire+0x94>
    800030f4:	00100713          	li	a4,1
    800030f8:	00070793          	mv	a5,a4
    800030fc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003100:	0007879b          	sext.w	a5,a5
    80003104:	fe079ae3          	bnez	a5,800030f8 <acquire+0x5c>
    80003108:	0ff0000f          	fence
    8000310c:	fffff097          	auipc	ra,0xfffff
    80003110:	89c080e7          	jalr	-1892(ra) # 800019a8 <mycpu>
    80003114:	01813083          	ld	ra,24(sp)
    80003118:	01013403          	ld	s0,16(sp)
    8000311c:	00a4b823          	sd	a0,16(s1)
    80003120:	00013903          	ld	s2,0(sp)
    80003124:	00813483          	ld	s1,8(sp)
    80003128:	02010113          	addi	sp,sp,32
    8000312c:	00008067          	ret
    80003130:	0104b903          	ld	s2,16(s1)
    80003134:	fffff097          	auipc	ra,0xfffff
    80003138:	874080e7          	jalr	-1932(ra) # 800019a8 <mycpu>
    8000313c:	faa91ce3          	bne	s2,a0,800030f4 <acquire+0x58>
    80003140:	00001517          	auipc	a0,0x1
    80003144:	1f050513          	addi	a0,a0,496 # 80004330 <digits+0x20>
    80003148:	fffff097          	auipc	ra,0xfffff
    8000314c:	224080e7          	jalr	548(ra) # 8000236c <panic>
    80003150:	00195913          	srli	s2,s2,0x1
    80003154:	fffff097          	auipc	ra,0xfffff
    80003158:	854080e7          	jalr	-1964(ra) # 800019a8 <mycpu>
    8000315c:	00197913          	andi	s2,s2,1
    80003160:	07252e23          	sw	s2,124(a0)
    80003164:	f75ff06f          	j	800030d8 <acquire+0x3c>

0000000080003168 <release>:
    80003168:	fe010113          	addi	sp,sp,-32
    8000316c:	00813823          	sd	s0,16(sp)
    80003170:	00113c23          	sd	ra,24(sp)
    80003174:	00913423          	sd	s1,8(sp)
    80003178:	01213023          	sd	s2,0(sp)
    8000317c:	02010413          	addi	s0,sp,32
    80003180:	00052783          	lw	a5,0(a0)
    80003184:	00079a63          	bnez	a5,80003198 <release+0x30>
    80003188:	00001517          	auipc	a0,0x1
    8000318c:	1b050513          	addi	a0,a0,432 # 80004338 <digits+0x28>
    80003190:	fffff097          	auipc	ra,0xfffff
    80003194:	1dc080e7          	jalr	476(ra) # 8000236c <panic>
    80003198:	01053903          	ld	s2,16(a0)
    8000319c:	00050493          	mv	s1,a0
    800031a0:	fffff097          	auipc	ra,0xfffff
    800031a4:	808080e7          	jalr	-2040(ra) # 800019a8 <mycpu>
    800031a8:	fea910e3          	bne	s2,a0,80003188 <release+0x20>
    800031ac:	0004b823          	sd	zero,16(s1)
    800031b0:	0ff0000f          	fence
    800031b4:	0f50000f          	fence	iorw,ow
    800031b8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800031bc:	ffffe097          	auipc	ra,0xffffe
    800031c0:	7ec080e7          	jalr	2028(ra) # 800019a8 <mycpu>
    800031c4:	100027f3          	csrr	a5,sstatus
    800031c8:	0027f793          	andi	a5,a5,2
    800031cc:	04079a63          	bnez	a5,80003220 <release+0xb8>
    800031d0:	07852783          	lw	a5,120(a0)
    800031d4:	02f05e63          	blez	a5,80003210 <release+0xa8>
    800031d8:	fff7871b          	addiw	a4,a5,-1
    800031dc:	06e52c23          	sw	a4,120(a0)
    800031e0:	00071c63          	bnez	a4,800031f8 <release+0x90>
    800031e4:	07c52783          	lw	a5,124(a0)
    800031e8:	00078863          	beqz	a5,800031f8 <release+0x90>
    800031ec:	100027f3          	csrr	a5,sstatus
    800031f0:	0027e793          	ori	a5,a5,2
    800031f4:	10079073          	csrw	sstatus,a5
    800031f8:	01813083          	ld	ra,24(sp)
    800031fc:	01013403          	ld	s0,16(sp)
    80003200:	00813483          	ld	s1,8(sp)
    80003204:	00013903          	ld	s2,0(sp)
    80003208:	02010113          	addi	sp,sp,32
    8000320c:	00008067          	ret
    80003210:	00001517          	auipc	a0,0x1
    80003214:	14850513          	addi	a0,a0,328 # 80004358 <digits+0x48>
    80003218:	fffff097          	auipc	ra,0xfffff
    8000321c:	154080e7          	jalr	340(ra) # 8000236c <panic>
    80003220:	00001517          	auipc	a0,0x1
    80003224:	12050513          	addi	a0,a0,288 # 80004340 <digits+0x30>
    80003228:	fffff097          	auipc	ra,0xfffff
    8000322c:	144080e7          	jalr	324(ra) # 8000236c <panic>

0000000080003230 <holding>:
    80003230:	00052783          	lw	a5,0(a0)
    80003234:	00079663          	bnez	a5,80003240 <holding+0x10>
    80003238:	00000513          	li	a0,0
    8000323c:	00008067          	ret
    80003240:	fe010113          	addi	sp,sp,-32
    80003244:	00813823          	sd	s0,16(sp)
    80003248:	00913423          	sd	s1,8(sp)
    8000324c:	00113c23          	sd	ra,24(sp)
    80003250:	02010413          	addi	s0,sp,32
    80003254:	01053483          	ld	s1,16(a0)
    80003258:	ffffe097          	auipc	ra,0xffffe
    8000325c:	750080e7          	jalr	1872(ra) # 800019a8 <mycpu>
    80003260:	01813083          	ld	ra,24(sp)
    80003264:	01013403          	ld	s0,16(sp)
    80003268:	40a48533          	sub	a0,s1,a0
    8000326c:	00153513          	seqz	a0,a0
    80003270:	00813483          	ld	s1,8(sp)
    80003274:	02010113          	addi	sp,sp,32
    80003278:	00008067          	ret

000000008000327c <push_off>:
    8000327c:	fe010113          	addi	sp,sp,-32
    80003280:	00813823          	sd	s0,16(sp)
    80003284:	00113c23          	sd	ra,24(sp)
    80003288:	00913423          	sd	s1,8(sp)
    8000328c:	02010413          	addi	s0,sp,32
    80003290:	100024f3          	csrr	s1,sstatus
    80003294:	100027f3          	csrr	a5,sstatus
    80003298:	ffd7f793          	andi	a5,a5,-3
    8000329c:	10079073          	csrw	sstatus,a5
    800032a0:	ffffe097          	auipc	ra,0xffffe
    800032a4:	708080e7          	jalr	1800(ra) # 800019a8 <mycpu>
    800032a8:	07852783          	lw	a5,120(a0)
    800032ac:	02078663          	beqz	a5,800032d8 <push_off+0x5c>
    800032b0:	ffffe097          	auipc	ra,0xffffe
    800032b4:	6f8080e7          	jalr	1784(ra) # 800019a8 <mycpu>
    800032b8:	07852783          	lw	a5,120(a0)
    800032bc:	01813083          	ld	ra,24(sp)
    800032c0:	01013403          	ld	s0,16(sp)
    800032c4:	0017879b          	addiw	a5,a5,1
    800032c8:	06f52c23          	sw	a5,120(a0)
    800032cc:	00813483          	ld	s1,8(sp)
    800032d0:	02010113          	addi	sp,sp,32
    800032d4:	00008067          	ret
    800032d8:	0014d493          	srli	s1,s1,0x1
    800032dc:	ffffe097          	auipc	ra,0xffffe
    800032e0:	6cc080e7          	jalr	1740(ra) # 800019a8 <mycpu>
    800032e4:	0014f493          	andi	s1,s1,1
    800032e8:	06952e23          	sw	s1,124(a0)
    800032ec:	fc5ff06f          	j	800032b0 <push_off+0x34>

00000000800032f0 <pop_off>:
    800032f0:	ff010113          	addi	sp,sp,-16
    800032f4:	00813023          	sd	s0,0(sp)
    800032f8:	00113423          	sd	ra,8(sp)
    800032fc:	01010413          	addi	s0,sp,16
    80003300:	ffffe097          	auipc	ra,0xffffe
    80003304:	6a8080e7          	jalr	1704(ra) # 800019a8 <mycpu>
    80003308:	100027f3          	csrr	a5,sstatus
    8000330c:	0027f793          	andi	a5,a5,2
    80003310:	04079663          	bnez	a5,8000335c <pop_off+0x6c>
    80003314:	07852783          	lw	a5,120(a0)
    80003318:	02f05a63          	blez	a5,8000334c <pop_off+0x5c>
    8000331c:	fff7871b          	addiw	a4,a5,-1
    80003320:	06e52c23          	sw	a4,120(a0)
    80003324:	00071c63          	bnez	a4,8000333c <pop_off+0x4c>
    80003328:	07c52783          	lw	a5,124(a0)
    8000332c:	00078863          	beqz	a5,8000333c <pop_off+0x4c>
    80003330:	100027f3          	csrr	a5,sstatus
    80003334:	0027e793          	ori	a5,a5,2
    80003338:	10079073          	csrw	sstatus,a5
    8000333c:	00813083          	ld	ra,8(sp)
    80003340:	00013403          	ld	s0,0(sp)
    80003344:	01010113          	addi	sp,sp,16
    80003348:	00008067          	ret
    8000334c:	00001517          	auipc	a0,0x1
    80003350:	00c50513          	addi	a0,a0,12 # 80004358 <digits+0x48>
    80003354:	fffff097          	auipc	ra,0xfffff
    80003358:	018080e7          	jalr	24(ra) # 8000236c <panic>
    8000335c:	00001517          	auipc	a0,0x1
    80003360:	fe450513          	addi	a0,a0,-28 # 80004340 <digits+0x30>
    80003364:	fffff097          	auipc	ra,0xfffff
    80003368:	008080e7          	jalr	8(ra) # 8000236c <panic>

000000008000336c <push_on>:
    8000336c:	fe010113          	addi	sp,sp,-32
    80003370:	00813823          	sd	s0,16(sp)
    80003374:	00113c23          	sd	ra,24(sp)
    80003378:	00913423          	sd	s1,8(sp)
    8000337c:	02010413          	addi	s0,sp,32
    80003380:	100024f3          	csrr	s1,sstatus
    80003384:	100027f3          	csrr	a5,sstatus
    80003388:	0027e793          	ori	a5,a5,2
    8000338c:	10079073          	csrw	sstatus,a5
    80003390:	ffffe097          	auipc	ra,0xffffe
    80003394:	618080e7          	jalr	1560(ra) # 800019a8 <mycpu>
    80003398:	07852783          	lw	a5,120(a0)
    8000339c:	02078663          	beqz	a5,800033c8 <push_on+0x5c>
    800033a0:	ffffe097          	auipc	ra,0xffffe
    800033a4:	608080e7          	jalr	1544(ra) # 800019a8 <mycpu>
    800033a8:	07852783          	lw	a5,120(a0)
    800033ac:	01813083          	ld	ra,24(sp)
    800033b0:	01013403          	ld	s0,16(sp)
    800033b4:	0017879b          	addiw	a5,a5,1
    800033b8:	06f52c23          	sw	a5,120(a0)
    800033bc:	00813483          	ld	s1,8(sp)
    800033c0:	02010113          	addi	sp,sp,32
    800033c4:	00008067          	ret
    800033c8:	0014d493          	srli	s1,s1,0x1
    800033cc:	ffffe097          	auipc	ra,0xffffe
    800033d0:	5dc080e7          	jalr	1500(ra) # 800019a8 <mycpu>
    800033d4:	0014f493          	andi	s1,s1,1
    800033d8:	06952e23          	sw	s1,124(a0)
    800033dc:	fc5ff06f          	j	800033a0 <push_on+0x34>

00000000800033e0 <pop_on>:
    800033e0:	ff010113          	addi	sp,sp,-16
    800033e4:	00813023          	sd	s0,0(sp)
    800033e8:	00113423          	sd	ra,8(sp)
    800033ec:	01010413          	addi	s0,sp,16
    800033f0:	ffffe097          	auipc	ra,0xffffe
    800033f4:	5b8080e7          	jalr	1464(ra) # 800019a8 <mycpu>
    800033f8:	100027f3          	csrr	a5,sstatus
    800033fc:	0027f793          	andi	a5,a5,2
    80003400:	04078463          	beqz	a5,80003448 <pop_on+0x68>
    80003404:	07852783          	lw	a5,120(a0)
    80003408:	02f05863          	blez	a5,80003438 <pop_on+0x58>
    8000340c:	fff7879b          	addiw	a5,a5,-1
    80003410:	06f52c23          	sw	a5,120(a0)
    80003414:	07853783          	ld	a5,120(a0)
    80003418:	00079863          	bnez	a5,80003428 <pop_on+0x48>
    8000341c:	100027f3          	csrr	a5,sstatus
    80003420:	ffd7f793          	andi	a5,a5,-3
    80003424:	10079073          	csrw	sstatus,a5
    80003428:	00813083          	ld	ra,8(sp)
    8000342c:	00013403          	ld	s0,0(sp)
    80003430:	01010113          	addi	sp,sp,16
    80003434:	00008067          	ret
    80003438:	00001517          	auipc	a0,0x1
    8000343c:	f4850513          	addi	a0,a0,-184 # 80004380 <digits+0x70>
    80003440:	fffff097          	auipc	ra,0xfffff
    80003444:	f2c080e7          	jalr	-212(ra) # 8000236c <panic>
    80003448:	00001517          	auipc	a0,0x1
    8000344c:	f1850513          	addi	a0,a0,-232 # 80004360 <digits+0x50>
    80003450:	fffff097          	auipc	ra,0xfffff
    80003454:	f1c080e7          	jalr	-228(ra) # 8000236c <panic>

0000000080003458 <__memset>:
    80003458:	ff010113          	addi	sp,sp,-16
    8000345c:	00813423          	sd	s0,8(sp)
    80003460:	01010413          	addi	s0,sp,16
    80003464:	1a060e63          	beqz	a2,80003620 <__memset+0x1c8>
    80003468:	40a007b3          	neg	a5,a0
    8000346c:	0077f793          	andi	a5,a5,7
    80003470:	00778693          	addi	a3,a5,7
    80003474:	00b00813          	li	a6,11
    80003478:	0ff5f593          	andi	a1,a1,255
    8000347c:	fff6071b          	addiw	a4,a2,-1
    80003480:	1b06e663          	bltu	a3,a6,8000362c <__memset+0x1d4>
    80003484:	1cd76463          	bltu	a4,a3,8000364c <__memset+0x1f4>
    80003488:	1a078e63          	beqz	a5,80003644 <__memset+0x1ec>
    8000348c:	00b50023          	sb	a1,0(a0)
    80003490:	00100713          	li	a4,1
    80003494:	1ae78463          	beq	a5,a4,8000363c <__memset+0x1e4>
    80003498:	00b500a3          	sb	a1,1(a0)
    8000349c:	00200713          	li	a4,2
    800034a0:	1ae78a63          	beq	a5,a4,80003654 <__memset+0x1fc>
    800034a4:	00b50123          	sb	a1,2(a0)
    800034a8:	00300713          	li	a4,3
    800034ac:	18e78463          	beq	a5,a4,80003634 <__memset+0x1dc>
    800034b0:	00b501a3          	sb	a1,3(a0)
    800034b4:	00400713          	li	a4,4
    800034b8:	1ae78263          	beq	a5,a4,8000365c <__memset+0x204>
    800034bc:	00b50223          	sb	a1,4(a0)
    800034c0:	00500713          	li	a4,5
    800034c4:	1ae78063          	beq	a5,a4,80003664 <__memset+0x20c>
    800034c8:	00b502a3          	sb	a1,5(a0)
    800034cc:	00700713          	li	a4,7
    800034d0:	18e79e63          	bne	a5,a4,8000366c <__memset+0x214>
    800034d4:	00b50323          	sb	a1,6(a0)
    800034d8:	00700e93          	li	t4,7
    800034dc:	00859713          	slli	a4,a1,0x8
    800034e0:	00e5e733          	or	a4,a1,a4
    800034e4:	01059e13          	slli	t3,a1,0x10
    800034e8:	01c76e33          	or	t3,a4,t3
    800034ec:	01859313          	slli	t1,a1,0x18
    800034f0:	006e6333          	or	t1,t3,t1
    800034f4:	02059893          	slli	a7,a1,0x20
    800034f8:	40f60e3b          	subw	t3,a2,a5
    800034fc:	011368b3          	or	a7,t1,a7
    80003500:	02859813          	slli	a6,a1,0x28
    80003504:	0108e833          	or	a6,a7,a6
    80003508:	03059693          	slli	a3,a1,0x30
    8000350c:	003e589b          	srliw	a7,t3,0x3
    80003510:	00d866b3          	or	a3,a6,a3
    80003514:	03859713          	slli	a4,a1,0x38
    80003518:	00389813          	slli	a6,a7,0x3
    8000351c:	00f507b3          	add	a5,a0,a5
    80003520:	00e6e733          	or	a4,a3,a4
    80003524:	000e089b          	sext.w	a7,t3
    80003528:	00f806b3          	add	a3,a6,a5
    8000352c:	00e7b023          	sd	a4,0(a5)
    80003530:	00878793          	addi	a5,a5,8
    80003534:	fed79ce3          	bne	a5,a3,8000352c <__memset+0xd4>
    80003538:	ff8e7793          	andi	a5,t3,-8
    8000353c:	0007871b          	sext.w	a4,a5
    80003540:	01d787bb          	addw	a5,a5,t4
    80003544:	0ce88e63          	beq	a7,a4,80003620 <__memset+0x1c8>
    80003548:	00f50733          	add	a4,a0,a5
    8000354c:	00b70023          	sb	a1,0(a4)
    80003550:	0017871b          	addiw	a4,a5,1
    80003554:	0cc77663          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    80003558:	00e50733          	add	a4,a0,a4
    8000355c:	00b70023          	sb	a1,0(a4)
    80003560:	0027871b          	addiw	a4,a5,2
    80003564:	0ac77e63          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    80003568:	00e50733          	add	a4,a0,a4
    8000356c:	00b70023          	sb	a1,0(a4)
    80003570:	0037871b          	addiw	a4,a5,3
    80003574:	0ac77663          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    80003578:	00e50733          	add	a4,a0,a4
    8000357c:	00b70023          	sb	a1,0(a4)
    80003580:	0047871b          	addiw	a4,a5,4
    80003584:	08c77e63          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    80003588:	00e50733          	add	a4,a0,a4
    8000358c:	00b70023          	sb	a1,0(a4)
    80003590:	0057871b          	addiw	a4,a5,5
    80003594:	08c77663          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    80003598:	00e50733          	add	a4,a0,a4
    8000359c:	00b70023          	sb	a1,0(a4)
    800035a0:	0067871b          	addiw	a4,a5,6
    800035a4:	06c77e63          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    800035a8:	00e50733          	add	a4,a0,a4
    800035ac:	00b70023          	sb	a1,0(a4)
    800035b0:	0077871b          	addiw	a4,a5,7
    800035b4:	06c77663          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    800035b8:	00e50733          	add	a4,a0,a4
    800035bc:	00b70023          	sb	a1,0(a4)
    800035c0:	0087871b          	addiw	a4,a5,8
    800035c4:	04c77e63          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    800035c8:	00e50733          	add	a4,a0,a4
    800035cc:	00b70023          	sb	a1,0(a4)
    800035d0:	0097871b          	addiw	a4,a5,9
    800035d4:	04c77663          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    800035d8:	00e50733          	add	a4,a0,a4
    800035dc:	00b70023          	sb	a1,0(a4)
    800035e0:	00a7871b          	addiw	a4,a5,10
    800035e4:	02c77e63          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    800035e8:	00e50733          	add	a4,a0,a4
    800035ec:	00b70023          	sb	a1,0(a4)
    800035f0:	00b7871b          	addiw	a4,a5,11
    800035f4:	02c77663          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    800035f8:	00e50733          	add	a4,a0,a4
    800035fc:	00b70023          	sb	a1,0(a4)
    80003600:	00c7871b          	addiw	a4,a5,12
    80003604:	00c77e63          	bgeu	a4,a2,80003620 <__memset+0x1c8>
    80003608:	00e50733          	add	a4,a0,a4
    8000360c:	00b70023          	sb	a1,0(a4)
    80003610:	00d7879b          	addiw	a5,a5,13
    80003614:	00c7f663          	bgeu	a5,a2,80003620 <__memset+0x1c8>
    80003618:	00f507b3          	add	a5,a0,a5
    8000361c:	00b78023          	sb	a1,0(a5)
    80003620:	00813403          	ld	s0,8(sp)
    80003624:	01010113          	addi	sp,sp,16
    80003628:	00008067          	ret
    8000362c:	00b00693          	li	a3,11
    80003630:	e55ff06f          	j	80003484 <__memset+0x2c>
    80003634:	00300e93          	li	t4,3
    80003638:	ea5ff06f          	j	800034dc <__memset+0x84>
    8000363c:	00100e93          	li	t4,1
    80003640:	e9dff06f          	j	800034dc <__memset+0x84>
    80003644:	00000e93          	li	t4,0
    80003648:	e95ff06f          	j	800034dc <__memset+0x84>
    8000364c:	00000793          	li	a5,0
    80003650:	ef9ff06f          	j	80003548 <__memset+0xf0>
    80003654:	00200e93          	li	t4,2
    80003658:	e85ff06f          	j	800034dc <__memset+0x84>
    8000365c:	00400e93          	li	t4,4
    80003660:	e7dff06f          	j	800034dc <__memset+0x84>
    80003664:	00500e93          	li	t4,5
    80003668:	e75ff06f          	j	800034dc <__memset+0x84>
    8000366c:	00600e93          	li	t4,6
    80003670:	e6dff06f          	j	800034dc <__memset+0x84>

0000000080003674 <__memmove>:
    80003674:	ff010113          	addi	sp,sp,-16
    80003678:	00813423          	sd	s0,8(sp)
    8000367c:	01010413          	addi	s0,sp,16
    80003680:	0e060863          	beqz	a2,80003770 <__memmove+0xfc>
    80003684:	fff6069b          	addiw	a3,a2,-1
    80003688:	0006881b          	sext.w	a6,a3
    8000368c:	0ea5e863          	bltu	a1,a0,8000377c <__memmove+0x108>
    80003690:	00758713          	addi	a4,a1,7
    80003694:	00a5e7b3          	or	a5,a1,a0
    80003698:	40a70733          	sub	a4,a4,a0
    8000369c:	0077f793          	andi	a5,a5,7
    800036a0:	00f73713          	sltiu	a4,a4,15
    800036a4:	00174713          	xori	a4,a4,1
    800036a8:	0017b793          	seqz	a5,a5
    800036ac:	00e7f7b3          	and	a5,a5,a4
    800036b0:	10078863          	beqz	a5,800037c0 <__memmove+0x14c>
    800036b4:	00900793          	li	a5,9
    800036b8:	1107f463          	bgeu	a5,a6,800037c0 <__memmove+0x14c>
    800036bc:	0036581b          	srliw	a6,a2,0x3
    800036c0:	fff8081b          	addiw	a6,a6,-1
    800036c4:	02081813          	slli	a6,a6,0x20
    800036c8:	01d85893          	srli	a7,a6,0x1d
    800036cc:	00858813          	addi	a6,a1,8
    800036d0:	00058793          	mv	a5,a1
    800036d4:	00050713          	mv	a4,a0
    800036d8:	01088833          	add	a6,a7,a6
    800036dc:	0007b883          	ld	a7,0(a5)
    800036e0:	00878793          	addi	a5,a5,8
    800036e4:	00870713          	addi	a4,a4,8
    800036e8:	ff173c23          	sd	a7,-8(a4)
    800036ec:	ff0798e3          	bne	a5,a6,800036dc <__memmove+0x68>
    800036f0:	ff867713          	andi	a4,a2,-8
    800036f4:	02071793          	slli	a5,a4,0x20
    800036f8:	0207d793          	srli	a5,a5,0x20
    800036fc:	00f585b3          	add	a1,a1,a5
    80003700:	40e686bb          	subw	a3,a3,a4
    80003704:	00f507b3          	add	a5,a0,a5
    80003708:	06e60463          	beq	a2,a4,80003770 <__memmove+0xfc>
    8000370c:	0005c703          	lbu	a4,0(a1)
    80003710:	00e78023          	sb	a4,0(a5)
    80003714:	04068e63          	beqz	a3,80003770 <__memmove+0xfc>
    80003718:	0015c603          	lbu	a2,1(a1)
    8000371c:	00100713          	li	a4,1
    80003720:	00c780a3          	sb	a2,1(a5)
    80003724:	04e68663          	beq	a3,a4,80003770 <__memmove+0xfc>
    80003728:	0025c603          	lbu	a2,2(a1)
    8000372c:	00200713          	li	a4,2
    80003730:	00c78123          	sb	a2,2(a5)
    80003734:	02e68e63          	beq	a3,a4,80003770 <__memmove+0xfc>
    80003738:	0035c603          	lbu	a2,3(a1)
    8000373c:	00300713          	li	a4,3
    80003740:	00c781a3          	sb	a2,3(a5)
    80003744:	02e68663          	beq	a3,a4,80003770 <__memmove+0xfc>
    80003748:	0045c603          	lbu	a2,4(a1)
    8000374c:	00400713          	li	a4,4
    80003750:	00c78223          	sb	a2,4(a5)
    80003754:	00e68e63          	beq	a3,a4,80003770 <__memmove+0xfc>
    80003758:	0055c603          	lbu	a2,5(a1)
    8000375c:	00500713          	li	a4,5
    80003760:	00c782a3          	sb	a2,5(a5)
    80003764:	00e68663          	beq	a3,a4,80003770 <__memmove+0xfc>
    80003768:	0065c703          	lbu	a4,6(a1)
    8000376c:	00e78323          	sb	a4,6(a5)
    80003770:	00813403          	ld	s0,8(sp)
    80003774:	01010113          	addi	sp,sp,16
    80003778:	00008067          	ret
    8000377c:	02061713          	slli	a4,a2,0x20
    80003780:	02075713          	srli	a4,a4,0x20
    80003784:	00e587b3          	add	a5,a1,a4
    80003788:	f0f574e3          	bgeu	a0,a5,80003690 <__memmove+0x1c>
    8000378c:	02069613          	slli	a2,a3,0x20
    80003790:	02065613          	srli	a2,a2,0x20
    80003794:	fff64613          	not	a2,a2
    80003798:	00e50733          	add	a4,a0,a4
    8000379c:	00c78633          	add	a2,a5,a2
    800037a0:	fff7c683          	lbu	a3,-1(a5)
    800037a4:	fff78793          	addi	a5,a5,-1
    800037a8:	fff70713          	addi	a4,a4,-1
    800037ac:	00d70023          	sb	a3,0(a4)
    800037b0:	fec798e3          	bne	a5,a2,800037a0 <__memmove+0x12c>
    800037b4:	00813403          	ld	s0,8(sp)
    800037b8:	01010113          	addi	sp,sp,16
    800037bc:	00008067          	ret
    800037c0:	02069713          	slli	a4,a3,0x20
    800037c4:	02075713          	srli	a4,a4,0x20
    800037c8:	00170713          	addi	a4,a4,1
    800037cc:	00e50733          	add	a4,a0,a4
    800037d0:	00050793          	mv	a5,a0
    800037d4:	0005c683          	lbu	a3,0(a1)
    800037d8:	00178793          	addi	a5,a5,1
    800037dc:	00158593          	addi	a1,a1,1
    800037e0:	fed78fa3          	sb	a3,-1(a5)
    800037e4:	fee798e3          	bne	a5,a4,800037d4 <__memmove+0x160>
    800037e8:	f89ff06f          	j	80003770 <__memmove+0xfc>

00000000800037ec <__putc>:
    800037ec:	fe010113          	addi	sp,sp,-32
    800037f0:	00813823          	sd	s0,16(sp)
    800037f4:	00113c23          	sd	ra,24(sp)
    800037f8:	02010413          	addi	s0,sp,32
    800037fc:	00050793          	mv	a5,a0
    80003800:	fef40593          	addi	a1,s0,-17
    80003804:	00100613          	li	a2,1
    80003808:	00000513          	li	a0,0
    8000380c:	fef407a3          	sb	a5,-17(s0)
    80003810:	fffff097          	auipc	ra,0xfffff
    80003814:	b3c080e7          	jalr	-1220(ra) # 8000234c <console_write>
    80003818:	01813083          	ld	ra,24(sp)
    8000381c:	01013403          	ld	s0,16(sp)
    80003820:	02010113          	addi	sp,sp,32
    80003824:	00008067          	ret

0000000080003828 <__getc>:
    80003828:	fe010113          	addi	sp,sp,-32
    8000382c:	00813823          	sd	s0,16(sp)
    80003830:	00113c23          	sd	ra,24(sp)
    80003834:	02010413          	addi	s0,sp,32
    80003838:	fe840593          	addi	a1,s0,-24
    8000383c:	00100613          	li	a2,1
    80003840:	00000513          	li	a0,0
    80003844:	fffff097          	auipc	ra,0xfffff
    80003848:	ae8080e7          	jalr	-1304(ra) # 8000232c <console_read>
    8000384c:	fe844503          	lbu	a0,-24(s0)
    80003850:	01813083          	ld	ra,24(sp)
    80003854:	01013403          	ld	s0,16(sp)
    80003858:	02010113          	addi	sp,sp,32
    8000385c:	00008067          	ret

0000000080003860 <console_handler>:
    80003860:	fe010113          	addi	sp,sp,-32
    80003864:	00813823          	sd	s0,16(sp)
    80003868:	00113c23          	sd	ra,24(sp)
    8000386c:	00913423          	sd	s1,8(sp)
    80003870:	02010413          	addi	s0,sp,32
    80003874:	14202773          	csrr	a4,scause
    80003878:	100027f3          	csrr	a5,sstatus
    8000387c:	0027f793          	andi	a5,a5,2
    80003880:	06079e63          	bnez	a5,800038fc <console_handler+0x9c>
    80003884:	00074c63          	bltz	a4,8000389c <console_handler+0x3c>
    80003888:	01813083          	ld	ra,24(sp)
    8000388c:	01013403          	ld	s0,16(sp)
    80003890:	00813483          	ld	s1,8(sp)
    80003894:	02010113          	addi	sp,sp,32
    80003898:	00008067          	ret
    8000389c:	0ff77713          	andi	a4,a4,255
    800038a0:	00900793          	li	a5,9
    800038a4:	fef712e3          	bne	a4,a5,80003888 <console_handler+0x28>
    800038a8:	ffffe097          	auipc	ra,0xffffe
    800038ac:	6dc080e7          	jalr	1756(ra) # 80001f84 <plic_claim>
    800038b0:	00a00793          	li	a5,10
    800038b4:	00050493          	mv	s1,a0
    800038b8:	02f50c63          	beq	a0,a5,800038f0 <console_handler+0x90>
    800038bc:	fc0506e3          	beqz	a0,80003888 <console_handler+0x28>
    800038c0:	00050593          	mv	a1,a0
    800038c4:	00001517          	auipc	a0,0x1
    800038c8:	9c450513          	addi	a0,a0,-1596 # 80004288 <CONSOLE_STATUS+0x278>
    800038cc:	fffff097          	auipc	ra,0xfffff
    800038d0:	afc080e7          	jalr	-1284(ra) # 800023c8 <__printf>
    800038d4:	01013403          	ld	s0,16(sp)
    800038d8:	01813083          	ld	ra,24(sp)
    800038dc:	00048513          	mv	a0,s1
    800038e0:	00813483          	ld	s1,8(sp)
    800038e4:	02010113          	addi	sp,sp,32
    800038e8:	ffffe317          	auipc	t1,0xffffe
    800038ec:	6d430067          	jr	1748(t1) # 80001fbc <plic_complete>
    800038f0:	fffff097          	auipc	ra,0xfffff
    800038f4:	3e0080e7          	jalr	992(ra) # 80002cd0 <uartintr>
    800038f8:	fddff06f          	j	800038d4 <console_handler+0x74>
    800038fc:	00001517          	auipc	a0,0x1
    80003900:	a8c50513          	addi	a0,a0,-1396 # 80004388 <digits+0x78>
    80003904:	fffff097          	auipc	ra,0xfffff
    80003908:	a68080e7          	jalr	-1432(ra) # 8000236c <panic>
	...
