
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	5c813103          	ld	sp,1480(sp) # 800045c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	189010ef          	jal	ra,800019a4 <start>

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
    80001084:	45c000ef          	jal	ra,800014e0 <_Z12ecallHandlerv>

    # pop all registers from stack
    .irp index, 0,1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
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
    800010b0:	05813583          	ld	a1,88(sp)
    800010b4:	06013603          	ld	a2,96(sp)
    800010b8:	06813683          	ld	a3,104(sp)
    800010bc:	07013703          	ld	a4,112(sp)
    800010c0:	07813783          	ld	a5,120(sp)
    800010c4:	08013803          	ld	a6,128(sp)
    800010c8:	08813883          	ld	a7,136(sp)
    800010cc:	09013903          	ld	s2,144(sp)
    800010d0:	09813983          	ld	s3,152(sp)
    800010d4:	0a013a03          	ld	s4,160(sp)
    800010d8:	0a813a83          	ld	s5,168(sp)
    800010dc:	0b013b03          	ld	s6,176(sp)
    800010e0:	0b813b83          	ld	s7,184(sp)
    800010e4:	0c013c03          	ld	s8,192(sp)
    800010e8:	0c813c83          	ld	s9,200(sp)
    800010ec:	0d013d03          	ld	s10,208(sp)
    800010f0:	0d813d83          	ld	s11,216(sp)
    800010f4:	0e013e03          	ld	t3,224(sp)
    800010f8:	0e813e83          	ld	t4,232(sp)
    800010fc:	0f013f03          	ld	t5,240(sp)
    80001100:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001104:	10010113          	addi	sp,sp,256
    80001108:	10200073          	sret
    8000110c:	0000                	unimp
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
        "li a0, 0x02;": : "r"(pointer));
    80001170:	00050593          	mv	a1,a0
    80001174:	00200513          	li	a0,2
    asm("ecall;");
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
    80001198:	f9010113          	addi	sp,sp,-112
    8000119c:	06113423          	sd	ra,104(sp)
    800011a0:	06813023          	sd	s0,96(sp)
    800011a4:	04913c23          	sd	s1,88(sp)
    800011a8:	05213823          	sd	s2,80(sp)
    800011ac:	07010413          	addi	s0,sp,112
    //initialize system data structures and register values
    initializeSystemRegisters();
    800011b0:	00000097          	auipc	ra,0x0
    800011b4:	180080e7          	jalr	384(ra) # 80001330 <_Z25initializeSystemRegistersv>
    MemoryAllocator::initialize();
    800011b8:	00000097          	auipc	ra,0x0
    800011bc:	504080e7          	jalr	1284(ra) # 800016bc <_ZN15MemoryAllocator10initializeEv>

    //start user main
    int* ptr1 = (int*)mem_alloc(10);
    800011c0:	00a00513          	li	a0,10
    800011c4:	00000097          	auipc	ra,0x0
    800011c8:	f4c080e7          	jalr	-180(ra) # 80001110 <_Z9mem_allocm>
    800011cc:	00050913          	mv	s2,a0
    printUint((uint64)ptr1);
    800011d0:	00050793          	mv	a5,a0
    return;
}

inline void printUint(uint64 number){
    int digits[20];
    int digitNum = 0;
    800011d4:	00000493          	li	s1,0
    while(number > 0){
    800011d8:	02078463          	beqz	a5,80001200 <main+0x68>
        digits[digitNum] = number%10;
    800011dc:	00a00693          	li	a3,10
    800011e0:	02d7f633          	remu	a2,a5,a3
    800011e4:	00249713          	slli	a4,s1,0x2
    800011e8:	fe040593          	addi	a1,s0,-32
    800011ec:	00e58733          	add	a4,a1,a4
    800011f0:	fac72823          	sw	a2,-80(a4)
        number/=10;
    800011f4:	02d7d7b3          	divu	a5,a5,a3
        digitNum++;
    800011f8:	0014849b          	addiw	s1,s1,1
    while(number > 0){
    800011fc:	fddff06f          	j	800011d8 <main+0x40>
    }

    digitNum--;
    80001200:	fff4849b          	addiw	s1,s1,-1

    while(digitNum>-1){
    80001204:	0204c663          	bltz	s1,80001230 <main+0x98>
        __putc((char)(48+digits[digitNum]));
    80001208:	00249793          	slli	a5,s1,0x2
    8000120c:	fe040713          	addi	a4,s0,-32
    80001210:	00f707b3          	add	a5,a4,a5
    80001214:	fb07a503          	lw	a0,-80(a5)
    80001218:	0305051b          	addiw	a0,a0,48
    8000121c:	0ff57513          	andi	a0,a0,255
    80001220:	00003097          	auipc	ra,0x3
    80001224:	84c080e7          	jalr	-1972(ra) # 80003a6c <__putc>
        digitNum--;
    80001228:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    8000122c:	fd9ff06f          	j	80001204 <main+0x6c>
    int status = mem_free(ptr1);
    80001230:	00090513          	mv	a0,s2
    80001234:	00000097          	auipc	ra,0x0
    80001238:	f2c080e7          	jalr	-212(ra) # 80001160 <_Z8mem_freePv>
    8000123c:	00050913          	mv	s2,a0
    80001240:	00003497          	auipc	s1,0x3
    80001244:	de048493          	addi	s1,s1,-544 # 80004020 <CONSOLE_STATUS+0x10>
    while (*str != '\0'){
    80001248:	0004c503          	lbu	a0,0(s1)
    8000124c:	00050a63          	beqz	a0,80001260 <main+0xc8>
        __putc(*str);
    80001250:	00003097          	auipc	ra,0x3
    80001254:	81c080e7          	jalr	-2020(ra) # 80003a6c <__putc>
        str++;
    80001258:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    8000125c:	fedff06f          	j	80001248 <main+0xb0>
    if(number==0){
    80001260:	02090a63          	beqz	s2,80001294 <main+0xfc>
    if(number < 0){
    80001264:	06094463          	bltz	s2,800012cc <main+0x134>
    80001268:	00000493          	li	s1,0
    while(number > 0){
    8000126c:	07205863          	blez	s2,800012dc <main+0x144>
        digits[digitNum] = number%10;
    80001270:	00a00713          	li	a4,10
    80001274:	02e966bb          	remw	a3,s2,a4
    80001278:	00249793          	slli	a5,s1,0x2
    8000127c:	fe040613          	addi	a2,s0,-32
    80001280:	00f607b3          	add	a5,a2,a5
    80001284:	fad7a823          	sw	a3,-80(a5)
        number/=10;
    80001288:	02e9493b          	divw	s2,s2,a4
        digitNum++;
    8000128c:	0014849b          	addiw	s1,s1,1
    while(number > 0){
    80001290:	fddff06f          	j	8000126c <main+0xd4>
        __putc('0');
    80001294:	03000513          	li	a0,48
    80001298:	00002097          	auipc	ra,0x2
    8000129c:	7d4080e7          	jalr	2004(ra) # 80003a6c <__putc>
        __putc('\n');
    800012a0:	00a00513          	li	a0,10
    800012a4:	00002097          	auipc	ra,0x2
    800012a8:	7c8080e7          	jalr	1992(ra) # 80003a6c <__putc>
        return;
    800012ac:	00003497          	auipc	s1,0x3
    800012b0:	d7448493          	addi	s1,s1,-652 # 80004020 <CONSOLE_STATUS+0x10>
    while (*str != '\0'){
    800012b4:	0004c503          	lbu	a0,0(s1)
    800012b8:	04050a63          	beqz	a0,8000130c <main+0x174>
        __putc(*str);
    800012bc:	00002097          	auipc	ra,0x2
    800012c0:	7b0080e7          	jalr	1968(ra) # 80003a6c <__putc>
        str++;
    800012c4:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    800012c8:	fedff06f          	j	800012b4 <main+0x11c>
        __putc('-');
    800012cc:	02d00513          	li	a0,45
    800012d0:	00002097          	auipc	ra,0x2
    800012d4:	79c080e7          	jalr	1948(ra) # 80003a6c <__putc>
    800012d8:	f91ff06f          	j	80001268 <main+0xd0>
    digitNum--;
    800012dc:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    800012e0:	fc04c6e3          	bltz	s1,800012ac <main+0x114>
        __putc((char)(48+digits[digitNum]));
    800012e4:	00249793          	slli	a5,s1,0x2
    800012e8:	fe040713          	addi	a4,s0,-32
    800012ec:	00f707b3          	add	a5,a4,a5
    800012f0:	fb07a503          	lw	a0,-80(a5)
    800012f4:	0305051b          	addiw	a0,a0,48
    800012f8:	0ff57513          	andi	a0,a0,255
    800012fc:	00002097          	auipc	ra,0x2
    80001300:	770080e7          	jalr	1904(ra) # 80003a6c <__putc>
        digitNum--;
    80001304:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    80001308:	fd9ff06f          	j	800012e0 <main+0x148>
    printString("\n\n");
    printInt(status);
    printString("\n\n");
    //end user main

    stopEmulator();
    8000130c:	00000097          	auipc	ra,0x0
    80001310:	048080e7          	jalr	72(ra) # 80001354 <_Z12stopEmulatorv>
    return 0;
    80001314:	00000513          	li	a0,0
    80001318:	06813083          	ld	ra,104(sp)
    8000131c:	06013403          	ld	s0,96(sp)
    80001320:	05813483          	ld	s1,88(sp)
    80001324:	05013903          	ld	s2,80(sp)
    80001328:	07010113          	addi	sp,sp,112
    8000132c:	00008067          	ret

0000000080001330 <_Z25initializeSystemRegistersv>:
//

#include "../h/riscv.hpp"
#include "../h/mem.hpp"

void initializeSystemRegisters(){
    80001330:	ff010113          	addi	sp,sp,-16
    80001334:	00813423          	sd	s0,8(sp)
    80001338:	01010413          	addi	s0,sp,16
    writeStvec((uint64)&ecallWrapper);
    8000133c:	00003797          	auipc	a5,0x3
    80001340:	2947b783          	ld	a5,660(a5) # 800045d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    asm("csrw stvec, %0;": :"r"(value));
    80001344:	10579073          	csrw	stvec,a5
    //asm("la t0, _Z12ecallWrapperv;"
    //"csrw stvec, t0;");
}
    80001348:	00813403          	ld	s0,8(sp)
    8000134c:	01010113          	addi	sp,sp,16
    80001350:	00008067          	ret

0000000080001354 <_Z12stopEmulatorv>:

void stopEmulator(){
    80001354:	ff010113          	addi	sp,sp,-16
    80001358:	00813423          	sd	s0,8(sp)
    8000135c:	01010413          	addi	s0,sp,16
    //defined in project file
    asm("la t0, 0x100000;" //adress
        "la t1, 0x5555;" //value
        "sw t1, 0(t0);");
    80001360:	001002b7          	lui	t0,0x100
    80001364:	00005337          	lui	t1,0x5
    80001368:	5553031b          	addiw	t1,t1,1365
    8000136c:	0062a023          	sw	t1,0(t0) # 100000 <_entry-0x7ff00000>
}
    80001370:	00813403          	ld	s0,8(sp)
    80001374:	01010113          	addi	sp,sp,16
    80001378:	00008067          	ret

000000008000137c <_Z12timerHandlermm>:

void timerHandler(uint64 sepc, uint64 sstatus){
    8000137c:	fe010113          	addi	sp,sp,-32
    80001380:	00113c23          	sd	ra,24(sp)
    80001384:	00813823          	sd	s0,16(sp)
    80001388:	00913423          	sd	s1,8(sp)
    8000138c:	01213023          	sd	s2,0(sp)
    80001390:	02010413          	addi	s0,sp,32
    80001394:	00050913          	mv	s2,a0
    80001398:	00003497          	auipc	s1,0x3
    8000139c:	c9048493          	addi	s1,s1,-880 # 80004028 <CONSOLE_STATUS+0x18>
    while (*str != '\0'){
    800013a0:	0004c503          	lbu	a0,0(s1)
    800013a4:	00050a63          	beqz	a0,800013b8 <_Z12timerHandlermm+0x3c>
        __putc(*str);
    800013a8:	00002097          	auipc	ra,0x2
    800013ac:	6c4080e7          	jalr	1732(ra) # 80003a6c <__putc>
        str++;
    800013b0:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    800013b4:	fedff06f          	j	800013a0 <_Z12timerHandlermm+0x24>
    asm("csrw sepc, %0;": : "r"(value));
    800013b8:	14191073          	csrw	sepc,s2
    //trigger context switch or something
    printString("TIMER SIGNAL");
    writeSepc(sepc);
    writeSstatus(sstatus);
}
    800013bc:	01813083          	ld	ra,24(sp)
    800013c0:	01013403          	ld	s0,16(sp)
    800013c4:	00813483          	ld	s1,8(sp)
    800013c8:	00013903          	ld	s2,0(sp)
    800013cc:	02010113          	addi	sp,sp,32
    800013d0:	00008067          	ret

00000000800013d4 <_Z17systemCallHandlermm>:

void systemCallHandler(uint64 a0, uint64 a1){
    800013d4:	f9010113          	addi	sp,sp,-112
    800013d8:	06113423          	sd	ra,104(sp)
    800013dc:	06813023          	sd	s0,96(sp)
    800013e0:	04913c23          	sd	s1,88(sp)
    800013e4:	05213823          	sd	s2,80(sp)
    800013e8:	07010413          	addi	s0,sp,112
    800013ec:	00050913          	mv	s2,a0
    800013f0:	00058513          	mv	a0,a1
    uint64 opCode = a0;
    uint64 arg = a1;
    uint64 retValue;

    switch (opCode) {
    800013f4:	00100793          	li	a5,1
    800013f8:	02f90663          	beq	s2,a5,80001424 <_Z17systemCallHandlermm+0x50>
    800013fc:	00200793          	li	a5,2
    80001400:	02f90a63          	beq	s2,a5,80001434 <_Z17systemCallHandlermm+0x60>
    80001404:	00003497          	auipc	s1,0x3
    80001408:	c3448493          	addi	s1,s1,-972 # 80004038 <CONSOLE_STATUS+0x28>
    while (*str != '\0'){
    8000140c:	0004c503          	lbu	a0,0(s1)
    80001410:	02050a63          	beqz	a0,80001444 <_Z17systemCallHandlermm+0x70>
        __putc(*str);
    80001414:	00002097          	auipc	ra,0x2
    80001418:	658080e7          	jalr	1624(ra) # 80003a6c <__putc>
        str++;
    8000141c:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001420:	fedff06f          	j	8000140c <_Z17systemCallHandlermm+0x38>
        case 0x01: //mem_alloc
            retValue = (uint64)MemoryAllocator::mem_allocate(arg);
    80001424:	00000097          	auipc	ra,0x0
    80001428:	2f4080e7          	jalr	756(ra) # 80001718 <_ZN15MemoryAllocator12mem_allocateEm>
    asm("mv a0, %0;": : "r"(value));
    8000142c:	00050513          	mv	a0,a0
}
    80001430:	0980006f          	j	800014c8 <_Z17systemCallHandlermm+0xf4>
            writeA0(retValue);
            break;
        case 0x02: //mem_free
            retValue = (uint64)MemoryAllocator::mem_free((void*)arg);
    80001434:	00000097          	auipc	ra,0x0
    80001438:	41c080e7          	jalr	1052(ra) # 80001850 <_ZN15MemoryAllocator8mem_freeEPv>
    asm("mv a0, %0;": : "r"(value));
    8000143c:	00050513          	mv	a0,a0
}
    80001440:	0880006f          	j	800014c8 <_Z17systemCallHandlermm+0xf4>
    int digitNum = 0;
    80001444:	00000493          	li	s1,0
    while(number > 0){
    80001448:	02090463          	beqz	s2,80001470 <_Z17systemCallHandlermm+0x9c>
        digits[digitNum] = number%10;
    8000144c:	00a00713          	li	a4,10
    80001450:	02e976b3          	remu	a3,s2,a4
    80001454:	00249793          	slli	a5,s1,0x2
    80001458:	fe040613          	addi	a2,s0,-32
    8000145c:	00f607b3          	add	a5,a2,a5
    80001460:	fad7a823          	sw	a3,-80(a5)
        number/=10;
    80001464:	02e95933          	divu	s2,s2,a4
        digitNum++;
    80001468:	0014849b          	addiw	s1,s1,1
    while(number > 0){
    8000146c:	fddff06f          	j	80001448 <_Z17systemCallHandlermm+0x74>
    digitNum--;
    80001470:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    80001474:	0204c663          	bltz	s1,800014a0 <_Z17systemCallHandlermm+0xcc>
        __putc((char)(48+digits[digitNum]));
    80001478:	00249793          	slli	a5,s1,0x2
    8000147c:	fe040713          	addi	a4,s0,-32
    80001480:	00f707b3          	add	a5,a4,a5
    80001484:	fb07a503          	lw	a0,-80(a5)
    80001488:	0305051b          	addiw	a0,a0,48
    8000148c:	0ff57513          	andi	a0,a0,255
    80001490:	00002097          	auipc	ra,0x2
    80001494:	5dc080e7          	jalr	1500(ra) # 80003a6c <__putc>
        digitNum--;
    80001498:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    8000149c:	fd9ff06f          	j	80001474 <_Z17systemCallHandlermm+0xa0>
    }

    return;
    800014a0:	00003497          	auipc	s1,0x3
    800014a4:	bd848493          	addi	s1,s1,-1064 # 80004078 <CONSOLE_STATUS+0x68>
    800014a8:	0100006f          	j	800014b8 <_Z17systemCallHandlermm+0xe4>
        __putc(*str);
    800014ac:	00002097          	auipc	ra,0x2
    800014b0:	5c0080e7          	jalr	1472(ra) # 80003a6c <__putc>
        str++;
    800014b4:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    800014b8:	0004c503          	lbu	a0,0(s1)
    800014bc:	fe0518e3          	bnez	a0,800014ac <_Z17systemCallHandlermm+0xd8>
        default: //some random code, that should be handler as error
            //this is error case, because no other case should go here, print something
            printString("OS DETECTED ERROR: Unhandled opCode value for system call: '");
            printUint(opCode);
            printString("' ,shutting down...\n");
            stopEmulator();
    800014c0:	00000097          	auipc	ra,0x0
    800014c4:	e94080e7          	jalr	-364(ra) # 80001354 <_Z12stopEmulatorv>
            break;
    };
}
    800014c8:	06813083          	ld	ra,104(sp)
    800014cc:	06013403          	ld	s0,96(sp)
    800014d0:	05813483          	ld	s1,88(sp)
    800014d4:	05013903          	ld	s2,80(sp)
    800014d8:	07010113          	addi	sp,sp,112
    800014dc:	00008067          	ret

00000000800014e0 <_Z12ecallHandlerv>:

void ecallHandler(){
    800014e0:	f8010113          	addi	sp,sp,-128
    800014e4:	06113c23          	sd	ra,120(sp)
    800014e8:	06813823          	sd	s0,112(sp)
    800014ec:	06913423          	sd	s1,104(sp)
    800014f0:	07213023          	sd	s2,96(sp)
    800014f4:	05313c23          	sd	s3,88(sp)
    800014f8:	08010413          	addi	s0,sp,128
    asm("mv %0, a0;": "=r"(value));
    800014fc:	00050513          	mv	a0,a0
    asm("mv %0, a1;": "=r"(value));
    80001500:	00058713          	mv	a4,a1
    asm("csrr %0, scause;": "=r"(value));
    80001504:	142024f3          	csrr	s1,scause
    asm("csrr %0, sepc;": "=r"(value));
    80001508:	14102973          	csrr	s2,sepc
    uint64 a0 = readA0();
    uint64 a1 = readA1();
    uint64 scause = readScause();
    uint64 sepc = readSepc()+4;
    8000150c:	00490913          	addi	s2,s2,4
    asm("csrr %0, sstatus;": "=r"(value));
    80001510:	100025f3          	csrr	a1,sstatus
    uint64 sstatus = readSstatus();

    switch (scause) {
    80001514:	00700793          	li	a5,7
    80001518:	0cf48463          	beq	s1,a5,800015e0 <_Z12ecallHandlerv+0x100>
    8000151c:	0297f663          	bgeu	a5,s1,80001548 <_Z12ecallHandlerv+0x68>
    80001520:	00900793          	li	a5,9
    80001524:	06f48a63          	beq	s1,a5,80001598 <_Z12ecallHandlerv+0xb8>
    80001528:	fff00793          	li	a5,-1
    8000152c:	03f79793          	slli	a5,a5,0x3f
    80001530:	00178793          	addi	a5,a5,1
    80001534:	0cf49c63          	bne	s1,a5,8000160c <_Z12ecallHandlerv+0x12c>
        case 0x8000000000000001UL:
            timerHandler(sepc, sstatus);
    80001538:	00090513          	mv	a0,s2
    8000153c:	00000097          	auipc	ra,0x0
    80001540:	e40080e7          	jalr	-448(ra) # 8000137c <_Z12timerHandlermm>
            break;
    80001544:	1580006f          	j	8000169c <_Z12ecallHandlerv+0x1bc>
    switch (scause) {
    80001548:	00200793          	li	a5,2
    8000154c:	04f48e63          	beq	s1,a5,800015a8 <_Z12ecallHandlerv+0xc8>
    80001550:	00500793          	li	a5,5
    80001554:	02f49263          	bne	s1,a5,80001578 <_Z12ecallHandlerv+0x98>
    80001558:	00003497          	auipc	s1,0x3
    8000155c:	b7848493          	addi	s1,s1,-1160 # 800040d0 <CONSOLE_STATUS+0xc0>
    while (*str != '\0'){
    80001560:	0004c503          	lbu	a0,0(s1)
    80001564:	06050863          	beqz	a0,800015d4 <_Z12ecallHandlerv+0xf4>
        __putc(*str);
    80001568:	00002097          	auipc	ra,0x2
    8000156c:	504080e7          	jalr	1284(ra) # 80003a6c <__putc>
        str++;
    80001570:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001574:	fedff06f          	j	80001560 <_Z12ecallHandlerv+0x80>
    80001578:	00003997          	auipc	s3,0x3
    8000157c:	be898993          	addi	s3,s3,-1048 # 80004160 <CONSOLE_STATUS+0x150>
    80001580:	0009c503          	lbu	a0,0(s3)
    80001584:	08050a63          	beqz	a0,80001618 <_Z12ecallHandlerv+0x138>
        __putc(*str);
    80001588:	00002097          	auipc	ra,0x2
    8000158c:	4e4080e7          	jalr	1252(ra) # 80003a6c <__putc>
        str++;
    80001590:	00198993          	addi	s3,s3,1
    while (*str != '\0'){
    80001594:	fedff06f          	j	80001580 <_Z12ecallHandlerv+0xa0>
        case 0x0000000000000008UL | 0x0000000000000009UL:
            systemCallHandler(a0,a1);
    80001598:	00070593          	mv	a1,a4
    8000159c:	00000097          	auipc	ra,0x0
    800015a0:	e38080e7          	jalr	-456(ra) # 800013d4 <_Z17systemCallHandlermm>
            break;
    800015a4:	0f80006f          	j	8000169c <_Z12ecallHandlerv+0x1bc>
    switch (scause) {
    800015a8:	00003497          	auipc	s1,0x3
    800015ac:	ae848493          	addi	s1,s1,-1304 # 80004090 <CONSOLE_STATUS+0x80>
    800015b0:	0004c503          	lbu	a0,0(s1)
    800015b4:	00050a63          	beqz	a0,800015c8 <_Z12ecallHandlerv+0xe8>
        __putc(*str);
    800015b8:	00002097          	auipc	ra,0x2
    800015bc:	4b4080e7          	jalr	1204(ra) # 80003a6c <__putc>
        str++;
    800015c0:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    800015c4:	fedff06f          	j	800015b0 <_Z12ecallHandlerv+0xd0>
        case 0x0000000000000002UL:
            printString("OS DETECTED ERROR: Illegal instruction\nShutting down...\n");
            stopEmulator();
    800015c8:	00000097          	auipc	ra,0x0
    800015cc:	d8c080e7          	jalr	-628(ra) # 80001354 <_Z12stopEmulatorv>
            break;
    800015d0:	0cc0006f          	j	8000169c <_Z12ecallHandlerv+0x1bc>
        case 0x0000000000000005UL:
            printString("OS DETECTED ERROR: reading from forbidden address\nShutting down...\n");
            stopEmulator();
    800015d4:	00000097          	auipc	ra,0x0
    800015d8:	d80080e7          	jalr	-640(ra) # 80001354 <_Z12stopEmulatorv>
            break;
    800015dc:	0c00006f          	j	8000169c <_Z12ecallHandlerv+0x1bc>
    switch (scause) {
    800015e0:	00003497          	auipc	s1,0x3
    800015e4:	b3848493          	addi	s1,s1,-1224 # 80004118 <CONSOLE_STATUS+0x108>
    800015e8:	0004c503          	lbu	a0,0(s1)
    800015ec:	00050a63          	beqz	a0,80001600 <_Z12ecallHandlerv+0x120>
        __putc(*str);
    800015f0:	00002097          	auipc	ra,0x2
    800015f4:	47c080e7          	jalr	1148(ra) # 80003a6c <__putc>
        str++;
    800015f8:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    800015fc:	fedff06f          	j	800015e8 <_Z12ecallHandlerv+0x108>
        case 0x0000000000000007UL:
            printString("OS DETECTED ERROR: writing to forbidden address\nShutting down...\n");
            stopEmulator();
    80001600:	00000097          	auipc	ra,0x0
    80001604:	d54080e7          	jalr	-684(ra) # 80001354 <_Z12stopEmulatorv>
            break;
    80001608:	0940006f          	j	8000169c <_Z12ecallHandlerv+0x1bc>
    switch (scause) {
    8000160c:	00003997          	auipc	s3,0x3
    80001610:	b5498993          	addi	s3,s3,-1196 # 80004160 <CONSOLE_STATUS+0x150>
    80001614:	f6dff06f          	j	80001580 <_Z12ecallHandlerv+0xa0>
    int digitNum = 0;
    80001618:	00000793          	li	a5,0
    while(number > 0){
    8000161c:	02048463          	beqz	s1,80001644 <_Z12ecallHandlerv+0x164>
        digits[digitNum] = number%10;
    80001620:	00a00693          	li	a3,10
    80001624:	02d4f633          	remu	a2,s1,a3
    80001628:	00279713          	slli	a4,a5,0x2
    8000162c:	fd040593          	addi	a1,s0,-48
    80001630:	00e58733          	add	a4,a1,a4
    80001634:	fac72823          	sw	a2,-80(a4)
        number/=10;
    80001638:	02d4d4b3          	divu	s1,s1,a3
        digitNum++;
    8000163c:	0017879b          	addiw	a5,a5,1
    while(number > 0){
    80001640:	fddff06f          	j	8000161c <_Z12ecallHandlerv+0x13c>
    digitNum--;
    80001644:	fff7849b          	addiw	s1,a5,-1
    while(digitNum>-1){
    80001648:	0204c663          	bltz	s1,80001674 <_Z12ecallHandlerv+0x194>
        __putc((char)(48+digits[digitNum]));
    8000164c:	00249793          	slli	a5,s1,0x2
    80001650:	fd040713          	addi	a4,s0,-48
    80001654:	00f707b3          	add	a5,a4,a5
    80001658:	fb07a503          	lw	a0,-80(a5)
    8000165c:	0305051b          	addiw	a0,a0,48
    80001660:	0ff57513          	andi	a0,a0,255
    80001664:	00002097          	auipc	ra,0x2
    80001668:	408080e7          	jalr	1032(ra) # 80003a6c <__putc>
        digitNum--;
    8000166c:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    80001670:	fd9ff06f          	j	80001648 <_Z12ecallHandlerv+0x168>
    return;
    80001674:	00003497          	auipc	s1,0x3
    80001678:	b1c48493          	addi	s1,s1,-1252 # 80004190 <CONSOLE_STATUS+0x180>
    while (*str != '\0'){
    8000167c:	0004c503          	lbu	a0,0(s1)
    80001680:	00050a63          	beqz	a0,80001694 <_Z12ecallHandlerv+0x1b4>
        __putc(*str);
    80001684:	00002097          	auipc	ra,0x2
    80001688:	3e8080e7          	jalr	1000(ra) # 80003a6c <__putc>
        str++;
    8000168c:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001690:	fedff06f          	j	8000167c <_Z12ecallHandlerv+0x19c>
        default:
            //this is error case, because no other case should go here, print something
            printString("OS DETECTED ERROR: Unhandled scause value: '");
            printUint(scause);
            printString("'\nShutting down...\n");
            stopEmulator();
    80001694:	00000097          	auipc	ra,0x0
    80001698:	cc0080e7          	jalr	-832(ra) # 80001354 <_Z12stopEmulatorv>
    asm("csrw sepc, %0;": : "r"(value));
    8000169c:	14191073          	csrw	sepc,s2
    }

    writeSepc(sepc);
    writeSstatus(sstatus);
    return;
    800016a0:	07813083          	ld	ra,120(sp)
    800016a4:	07013403          	ld	s0,112(sp)
    800016a8:	06813483          	ld	s1,104(sp)
    800016ac:	06013903          	ld	s2,96(sp)
    800016b0:	05813983          	ld	s3,88(sp)
    800016b4:	08010113          	addi	sp,sp,128
    800016b8:	00008067          	ret

00000000800016bc <_ZN15MemoryAllocator10initializeEv>:

MemSegment* MemoryAllocator::segmentsHead = nullptr;
uint32 MemoryAllocator::totalSize = 0;
uint32 MemoryAllocator::segmentsNumber = 1;

void MemoryAllocator::initialize(){
    800016bc:	ff010113          	addi	sp,sp,-16
    800016c0:	00813423          	sd	s0,8(sp)
    800016c4:	01010413          	addi	s0,sp,16
    MemoryAllocator::segmentsHead = (MemSegment*)(HEAP_START_ADDR);
    800016c8:	00003617          	auipc	a2,0x3
    800016cc:	ef863603          	ld	a2,-264(a2) # 800045c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800016d0:	00063783          	ld	a5,0(a2)
    800016d4:	00003717          	auipc	a4,0x3
    800016d8:	f4c70713          	addi	a4,a4,-180 # 80004620 <_ZN15MemoryAllocator12segmentsHeadE>
    800016dc:	00f73023          	sd	a5,0(a4)
    segmentsHead->left = nullptr;
    800016e0:	0007b023          	sd	zero,0(a5)
    segmentsHead->right = nullptr;
    800016e4:	00073683          	ld	a3,0(a4)
    800016e8:	0006b423          	sd	zero,8(a3)
    //size of every block is in number of memory blocks, not bytes
    segmentsHead->size = size_t(uint64(HEAP_END_ADDR) - uint64(HEAP_START_ADDR))/MEM_BLOCK_SIZE;
    800016ec:	00003797          	auipc	a5,0x3
    800016f0:	eec7b783          	ld	a5,-276(a5) # 800045d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800016f4:	0007b783          	ld	a5,0(a5)
    800016f8:	00063603          	ld	a2,0(a2)
    800016fc:	40c787b3          	sub	a5,a5,a2
    80001700:	0067d793          	srli	a5,a5,0x6
    80001704:	00f6b823          	sd	a5,16(a3)
    totalSize = MemoryAllocator::segmentsHead->size;
    80001708:	00f72423          	sw	a5,8(a4)
}
    8000170c:	00813403          	ld	s0,8(sp)
    80001710:	01010113          	addi	sp,sp,16
    80001714:	00008067          	ret

0000000080001718 <_ZN15MemoryAllocator12mem_allocateEm>:

// TODO TEST: check for bugs in this implementation - mem_allocate
void* MemoryAllocator::mem_allocate(size_t size) {
    80001718:	ff010113          	addi	sp,sp,-16
    8000171c:	00813423          	sd	s0,8(sp)
    80001720:	01010413          	addi	s0,sp,16
    //doing some checks if it should even try to allocate space
    if(segmentsNumber == 0 || size > totalSize) return nullptr;
    80001724:	00003697          	auipc	a3,0x3
    80001728:	e8c6a683          	lw	a3,-372(a3) # 800045b0 <_ZN15MemoryAllocator14segmentsNumberE>
    8000172c:	10068a63          	beqz	a3,80001840 <_ZN15MemoryAllocator12mem_allocateEm+0x128>
    80001730:	00050713          	mv	a4,a0
    80001734:	00003617          	auipc	a2,0x3
    80001738:	ef462603          	lw	a2,-268(a2) # 80004628 <_ZN15MemoryAllocator9totalSizeE>
    8000173c:	02061793          	slli	a5,a2,0x20
    80001740:	0207d793          	srli	a5,a5,0x20
    80001744:	10a7e263          	bltu	a5,a0,80001848 <_ZN15MemoryAllocator12mem_allocateEm+0x130>

    //first fit algorithm -- TODO in the future, upgrade this to some exotic algorithm with binary tree

    MemSegment* temp = segmentsHead;
    80001748:	00003517          	auipc	a0,0x3
    8000174c:	ed853503          	ld	a0,-296(a0) # 80004620 <_ZN15MemoryAllocator12segmentsHeadE>
    80001750:	0640006f          	j	800017b4 <_ZN15MemoryAllocator12mem_allocateEm+0x9c>
    while(temp){
        if(size == temp->size){
            totalSize-=size; segmentsNumber--;
    80001754:	40e6063b          	subw	a2,a2,a4
    80001758:	00003797          	auipc	a5,0x3
    8000175c:	ecc7a823          	sw	a2,-304(a5) # 80004628 <_ZN15MemoryAllocator9totalSizeE>
    80001760:	fff6869b          	addiw	a3,a3,-1
    80001764:	00003797          	auipc	a5,0x3
    80001768:	e4d7a623          	sw	a3,-436(a5) # 800045b0 <_ZN15MemoryAllocator14segmentsNumberE>

            if(temp->left) temp->left->right = temp->right;
    8000176c:	00053783          	ld	a5,0(a0)
    80001770:	00078663          	beqz	a5,8000177c <_ZN15MemoryAllocator12mem_allocateEm+0x64>
    80001774:	00853683          	ld	a3,8(a0)
    80001778:	00d7b423          	sd	a3,8(a5)
            if(temp->right) temp->right->left = temp->left;
    8000177c:	00853783          	ld	a5,8(a0)
    80001780:	00078663          	beqz	a5,8000178c <_ZN15MemoryAllocator12mem_allocateEm+0x74>
    80001784:	00053683          	ld	a3,0(a0)
    80001788:	00d7b023          	sd	a3,0(a5)

            *((size_t*)temp) = size; //this is size in segments stored in metadata
    8000178c:	00e53023          	sd	a4,0(a0)
            temp += sizeof(size_t); //shift pointer to account for metadata
    80001790:	0c050513          	addi	a0,a0,192
        temp = temp->right;
    }

    //segment of sufficient size wasn't found, thus returning null for failed allocation
    return nullptr;
}
    80001794:	00813403          	ld	s0,8(sp)
    80001798:	01010113          	addi	sp,sp,16
    8000179c:	00008067          	ret
            if(temp == segmentsHead) segmentsHead += offset;
    800017a0:	00f687b3          	add	a5,a3,a5
    800017a4:	00003697          	auipc	a3,0x3
    800017a8:	e6f6be23          	sd	a5,-388(a3) # 80004620 <_ZN15MemoryAllocator12segmentsHeadE>
    800017ac:	0880006f          	j	80001834 <_ZN15MemoryAllocator12mem_allocateEm+0x11c>
        temp = temp->right;
    800017b0:	00853503          	ld	a0,8(a0)
    while(temp){
    800017b4:	fe0500e3          	beqz	a0,80001794 <_ZN15MemoryAllocator12mem_allocateEm+0x7c>
        if(size == temp->size){
    800017b8:	01053783          	ld	a5,16(a0)
    800017bc:	f8e78ce3          	beq	a5,a4,80001754 <_ZN15MemoryAllocator12mem_allocateEm+0x3c>
        if(size < temp->size){
    800017c0:	fef778e3          	bgeu	a4,a5,800017b0 <_ZN15MemoryAllocator12mem_allocateEm+0x98>
            if(temp->left) temp->left->right = temp + offset;
    800017c4:	00053683          	ld	a3,0(a0)
    800017c8:	00068c63          	beqz	a3,800017e0 <_ZN15MemoryAllocator12mem_allocateEm+0xc8>
    800017cc:	00171793          	slli	a5,a4,0x1
    800017d0:	00e787b3          	add	a5,a5,a4
    800017d4:	00979793          	slli	a5,a5,0x9
    800017d8:	00f507b3          	add	a5,a0,a5
    800017dc:	00f6b423          	sd	a5,8(a3)
            if(temp->right) temp->right->left = temp + offset;
    800017e0:	00853683          	ld	a3,8(a0)
    800017e4:	00068c63          	beqz	a3,800017fc <_ZN15MemoryAllocator12mem_allocateEm+0xe4>
    800017e8:	00171793          	slli	a5,a4,0x1
    800017ec:	00e787b3          	add	a5,a5,a4
    800017f0:	00979793          	slli	a5,a5,0x9
    800017f4:	00f507b3          	add	a5,a0,a5
    800017f8:	00f6b023          	sd	a5,0(a3)
            (temp + offset)->left = temp->left;
    800017fc:	00171793          	slli	a5,a4,0x1
    80001800:	00e787b3          	add	a5,a5,a4
    80001804:	00979793          	slli	a5,a5,0x9
    80001808:	00f506b3          	add	a3,a0,a5
    8000180c:	00053603          	ld	a2,0(a0)
    80001810:	00c6b023          	sd	a2,0(a3)
            (temp + offset)->right = temp->right;
    80001814:	00853603          	ld	a2,8(a0)
    80001818:	00c6b423          	sd	a2,8(a3)
            (temp + offset)->size = temp->size-size;
    8000181c:	01053603          	ld	a2,16(a0)
    80001820:	40e60633          	sub	a2,a2,a4
    80001824:	00c6b823          	sd	a2,16(a3)
            if(temp == segmentsHead) segmentsHead += offset;
    80001828:	00003697          	auipc	a3,0x3
    8000182c:	df86b683          	ld	a3,-520(a3) # 80004620 <_ZN15MemoryAllocator12segmentsHeadE>
    80001830:	f6a688e3          	beq	a3,a0,800017a0 <_ZN15MemoryAllocator12mem_allocateEm+0x88>
            *((size_t*)tempMeta) = size; //this is size segments stored in metadata
    80001834:	00e53023          	sd	a4,0(a0)
            tempMeta += sizeof(size_t); //shift pointer to account for metadata
    80001838:	04050513          	addi	a0,a0,64
            return (void*)tempMeta;
    8000183c:	f59ff06f          	j	80001794 <_ZN15MemoryAllocator12mem_allocateEm+0x7c>
    if(segmentsNumber == 0 || size > totalSize) return nullptr;
    80001840:	00000513          	li	a0,0
    80001844:	f51ff06f          	j	80001794 <_ZN15MemoryAllocator12mem_allocateEm+0x7c>
    80001848:	00000513          	li	a0,0
    8000184c:	f49ff06f          	j	80001794 <_ZN15MemoryAllocator12mem_allocateEm+0x7c>

0000000080001850 <_ZN15MemoryAllocator8mem_freeEPv>:

// TODO TEST: check for bugs in this implementation - mem_free
int MemoryAllocator::mem_free(void* ptr) {
    80001850:	ff010113          	addi	sp,sp,-16
    80001854:	00813423          	sd	s0,8(sp)
    80001858:	01010413          	addi	s0,sp,16
    size_t size = *((size_t*)(ptr)-sizeof(size_t)); //TODO maybe optimize these 4 lines
    8000185c:	fc053603          	ld	a2,-64(a0)
    MemSegment* pointer = (MemSegment*)ptr-sizeof(size_t);
    80001860:	f4050693          	addi	a3,a0,-192
    totalSize += size;
    80001864:	00003797          	auipc	a5,0x3
    80001868:	dbc78793          	addi	a5,a5,-580 # 80004620 <_ZN15MemoryAllocator12segmentsHeadE>
    8000186c:	0087a703          	lw	a4,8(a5)
    80001870:	00c7073b          	addw	a4,a4,a2
    80001874:	00e7a423          	sw	a4,8(a5)
    pointer->size = size;
    80001878:	f4c53823          	sd	a2,-176(a0)

    //5,6
    size_t offset = size*MEM_BLOCK_SIZE;

    if(pointer > segmentsHead){
    8000187c:	0007b783          	ld	a5,0(a5)
    80001880:	06d7f463          	bgeu	a5,a3,800018e8 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
        pointer->left = nullptr;
    80001884:	f4053023          	sd	zero,-192(a0)

        if(pointer+offset == segmentsHead){ //5 try join from the right
    80001888:	00161793          	slli	a5,a2,0x1
    8000188c:	00c787b3          	add	a5,a5,a2
    80001890:	00979793          	slli	a5,a5,0x9
    80001894:	00f687b3          	add	a5,a3,a5
    80001898:	00003717          	auipc	a4,0x3
    8000189c:	d8873703          	ld	a4,-632(a4) # 80004620 <_ZN15MemoryAllocator12segmentsHeadE>
    800018a0:	02e78263          	beq	a5,a4,800018c4 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
            pointer->right = segmentsHead->right;
            pointer->size+=segmentsHead->size;
        }else{ //6 couldn't do join :(
            pointer->right = segmentsHead;
    800018a4:	f4e53423          	sd	a4,-184(a0)
            segmentsHead->left = pointer;
    800018a8:	00d73023          	sd	a3,0(a4)
        }

        segmentsHead = pointer;
    800018ac:	00003797          	auipc	a5,0x3
    800018b0:	d6d7ba23          	sd	a3,-652(a5) # 80004620 <_ZN15MemoryAllocator12segmentsHeadE>
            return 0;
        }
    }

    return 0;
    800018b4:	00000513          	li	a0,0
    800018b8:	00813403          	ld	s0,8(sp)
    800018bc:	01010113          	addi	sp,sp,16
    800018c0:	00008067          	ret
            pointer->right = segmentsHead->right;
    800018c4:	00873783          	ld	a5,8(a4)
    800018c8:	f4f53423          	sd	a5,-184(a0)
            pointer->size+=segmentsHead->size;
    800018cc:	00003797          	auipc	a5,0x3
    800018d0:	d547b783          	ld	a5,-684(a5) # 80004620 <_ZN15MemoryAllocator12segmentsHeadE>
    800018d4:	0107b783          	ld	a5,16(a5)
    800018d8:	00c78633          	add	a2,a5,a2
    800018dc:	f4c53823          	sd	a2,-176(a0)
    800018e0:	fcdff06f          	j	800018ac <_ZN15MemoryAllocator8mem_freeEPv+0x5c>
    800018e4:	00070793          	mv	a5,a4
    while(temp){ //TODO tidy this entire while loop up
    800018e8:	fc0786e3          	beqz	a5,800018b4 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
        if(temp->right){ //1, 2, 3, 4
    800018ec:	0087b703          	ld	a4,8(a5)
    800018f0:	08070263          	beqz	a4,80001974 <_ZN15MemoryAllocator8mem_freeEPv+0x124>
            if(temp < pointer && pointer < temp->right){
    800018f4:	fed7f8e3          	bgeu	a5,a3,800018e4 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
    800018f8:	00e6e663          	bltu	a3,a4,80001904 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
    800018fc:	00070793          	mv	a5,a4
    80001900:	fe9ff06f          	j	800018e8 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
                if(pointer + offset == temp->right){ //3 or 4
    80001904:	00161593          	slli	a1,a2,0x1
    80001908:	00c585b3          	add	a1,a1,a2
    8000190c:	00959593          	slli	a1,a1,0x9
    80001910:	00b685b3          	add	a1,a3,a1
    80001914:	02b70e63          	beq	a4,a1,80001950 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
                if(temp + temp->size*MEM_BLOCK_SIZE == pointer){ //2 or 4
    80001918:	0107b603          	ld	a2,16(a5)
    8000191c:	00161713          	slli	a4,a2,0x1
    80001920:	00c70733          	add	a4,a4,a2
    80001924:	00971713          	slli	a4,a4,0x9
    80001928:	00e78733          	add	a4,a5,a4
    8000192c:	f8d714e3          	bne	a4,a3,800018b4 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
                    temp->size += pointer->size;
    80001930:	f5053703          	ld	a4,-176(a0)
    80001934:	00e60633          	add	a2,a2,a4
    80001938:	00c7b823          	sd	a2,16(a5)
                    if(pointer->left == temp){
    8000193c:	f4053703          	ld	a4,-192(a0)
    80001940:	f6f71ae3          	bne	a4,a5,800018b4 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
                        temp->right = pointer->right;
    80001944:	f4853703          	ld	a4,-184(a0)
    80001948:	00e7b423          	sd	a4,8(a5)
                return 0;
    8000194c:	f69ff06f          	j	800018b4 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
                    pointer->size += temp->right->size;
    80001950:	01073703          	ld	a4,16(a4)
    80001954:	00c70633          	add	a2,a4,a2
    80001958:	f4c53823          	sd	a2,-176(a0)
                    pointer->right = temp->right->right;
    8000195c:	0087b703          	ld	a4,8(a5)
    80001960:	00873703          	ld	a4,8(a4)
    80001964:	f4e53423          	sd	a4,-184(a0)
                    pointer->left = temp->left;
    80001968:	0007b703          	ld	a4,0(a5)
    8000196c:	f4e53023          	sd	a4,-192(a0)
    80001970:	fa9ff06f          	j	80001918 <_ZN15MemoryAllocator8mem_freeEPv+0xc8>
            if(temp + temp->size*MEM_BLOCK_SIZE == pointer){ //8
    80001974:	0107b583          	ld	a1,16(a5)
    80001978:	00159713          	slli	a4,a1,0x1
    8000197c:	00b70733          	add	a4,a4,a1
    80001980:	00971713          	slli	a4,a4,0x9
    80001984:	00e78733          	add	a4,a5,a4
    80001988:	00d70863          	beq	a4,a3,80001998 <_ZN15MemoryAllocator8mem_freeEPv+0x148>
                temp->right = pointer;
    8000198c:	00d7b423          	sd	a3,8(a5)
                pointer->left = temp;
    80001990:	f4f53023          	sd	a5,-192(a0)
            return 0;
    80001994:	f21ff06f          	j	800018b4 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
                temp->size += pointer->size;
    80001998:	00c58633          	add	a2,a1,a2
    8000199c:	00c7b823          	sd	a2,16(a5)
    800019a0:	f15ff06f          	j	800018b4 <_ZN15MemoryAllocator8mem_freeEPv+0x64>

00000000800019a4 <start>:
    800019a4:	ff010113          	addi	sp,sp,-16
    800019a8:	00813423          	sd	s0,8(sp)
    800019ac:	01010413          	addi	s0,sp,16
    800019b0:	300027f3          	csrr	a5,mstatus
    800019b4:	ffffe737          	lui	a4,0xffffe
    800019b8:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff8f7f>
    800019bc:	00e7f7b3          	and	a5,a5,a4
    800019c0:	00001737          	lui	a4,0x1
    800019c4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800019c8:	00e7e7b3          	or	a5,a5,a4
    800019cc:	30079073          	csrw	mstatus,a5
    800019d0:	00000797          	auipc	a5,0x0
    800019d4:	16078793          	addi	a5,a5,352 # 80001b30 <system_main>
    800019d8:	34179073          	csrw	mepc,a5
    800019dc:	00000793          	li	a5,0
    800019e0:	18079073          	csrw	satp,a5
    800019e4:	000107b7          	lui	a5,0x10
    800019e8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800019ec:	30279073          	csrw	medeleg,a5
    800019f0:	30379073          	csrw	mideleg,a5
    800019f4:	104027f3          	csrr	a5,sie
    800019f8:	2227e793          	ori	a5,a5,546
    800019fc:	10479073          	csrw	sie,a5
    80001a00:	fff00793          	li	a5,-1
    80001a04:	00a7d793          	srli	a5,a5,0xa
    80001a08:	3b079073          	csrw	pmpaddr0,a5
    80001a0c:	00f00793          	li	a5,15
    80001a10:	3a079073          	csrw	pmpcfg0,a5
    80001a14:	f14027f3          	csrr	a5,mhartid
    80001a18:	0200c737          	lui	a4,0x200c
    80001a1c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001a20:	0007869b          	sext.w	a3,a5
    80001a24:	00269713          	slli	a4,a3,0x2
    80001a28:	000f4637          	lui	a2,0xf4
    80001a2c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001a30:	00d70733          	add	a4,a4,a3
    80001a34:	0037979b          	slliw	a5,a5,0x3
    80001a38:	020046b7          	lui	a3,0x2004
    80001a3c:	00d787b3          	add	a5,a5,a3
    80001a40:	00c585b3          	add	a1,a1,a2
    80001a44:	00371693          	slli	a3,a4,0x3
    80001a48:	00003717          	auipc	a4,0x3
    80001a4c:	be870713          	addi	a4,a4,-1048 # 80004630 <timer_scratch>
    80001a50:	00b7b023          	sd	a1,0(a5)
    80001a54:	00d70733          	add	a4,a4,a3
    80001a58:	00f73c23          	sd	a5,24(a4)
    80001a5c:	02c73023          	sd	a2,32(a4)
    80001a60:	34071073          	csrw	mscratch,a4
    80001a64:	00000797          	auipc	a5,0x0
    80001a68:	6ec78793          	addi	a5,a5,1772 # 80002150 <timervec>
    80001a6c:	30579073          	csrw	mtvec,a5
    80001a70:	300027f3          	csrr	a5,mstatus
    80001a74:	0087e793          	ori	a5,a5,8
    80001a78:	30079073          	csrw	mstatus,a5
    80001a7c:	304027f3          	csrr	a5,mie
    80001a80:	0807e793          	ori	a5,a5,128
    80001a84:	30479073          	csrw	mie,a5
    80001a88:	f14027f3          	csrr	a5,mhartid
    80001a8c:	0007879b          	sext.w	a5,a5
    80001a90:	00078213          	mv	tp,a5
    80001a94:	30200073          	mret
    80001a98:	00813403          	ld	s0,8(sp)
    80001a9c:	01010113          	addi	sp,sp,16
    80001aa0:	00008067          	ret

0000000080001aa4 <timerinit>:
    80001aa4:	ff010113          	addi	sp,sp,-16
    80001aa8:	00813423          	sd	s0,8(sp)
    80001aac:	01010413          	addi	s0,sp,16
    80001ab0:	f14027f3          	csrr	a5,mhartid
    80001ab4:	0200c737          	lui	a4,0x200c
    80001ab8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001abc:	0007869b          	sext.w	a3,a5
    80001ac0:	00269713          	slli	a4,a3,0x2
    80001ac4:	000f4637          	lui	a2,0xf4
    80001ac8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001acc:	00d70733          	add	a4,a4,a3
    80001ad0:	0037979b          	slliw	a5,a5,0x3
    80001ad4:	020046b7          	lui	a3,0x2004
    80001ad8:	00d787b3          	add	a5,a5,a3
    80001adc:	00c585b3          	add	a1,a1,a2
    80001ae0:	00371693          	slli	a3,a4,0x3
    80001ae4:	00003717          	auipc	a4,0x3
    80001ae8:	b4c70713          	addi	a4,a4,-1204 # 80004630 <timer_scratch>
    80001aec:	00b7b023          	sd	a1,0(a5)
    80001af0:	00d70733          	add	a4,a4,a3
    80001af4:	00f73c23          	sd	a5,24(a4)
    80001af8:	02c73023          	sd	a2,32(a4)
    80001afc:	34071073          	csrw	mscratch,a4
    80001b00:	00000797          	auipc	a5,0x0
    80001b04:	65078793          	addi	a5,a5,1616 # 80002150 <timervec>
    80001b08:	30579073          	csrw	mtvec,a5
    80001b0c:	300027f3          	csrr	a5,mstatus
    80001b10:	0087e793          	ori	a5,a5,8
    80001b14:	30079073          	csrw	mstatus,a5
    80001b18:	304027f3          	csrr	a5,mie
    80001b1c:	0807e793          	ori	a5,a5,128
    80001b20:	30479073          	csrw	mie,a5
    80001b24:	00813403          	ld	s0,8(sp)
    80001b28:	01010113          	addi	sp,sp,16
    80001b2c:	00008067          	ret

0000000080001b30 <system_main>:
    80001b30:	fe010113          	addi	sp,sp,-32
    80001b34:	00813823          	sd	s0,16(sp)
    80001b38:	00913423          	sd	s1,8(sp)
    80001b3c:	00113c23          	sd	ra,24(sp)
    80001b40:	02010413          	addi	s0,sp,32
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	0c4080e7          	jalr	196(ra) # 80001c08 <cpuid>
    80001b4c:	00003497          	auipc	s1,0x3
    80001b50:	aa448493          	addi	s1,s1,-1372 # 800045f0 <started>
    80001b54:	02050263          	beqz	a0,80001b78 <system_main+0x48>
    80001b58:	0004a783          	lw	a5,0(s1)
    80001b5c:	0007879b          	sext.w	a5,a5
    80001b60:	fe078ce3          	beqz	a5,80001b58 <system_main+0x28>
    80001b64:	0ff0000f          	fence
    80001b68:	00002517          	auipc	a0,0x2
    80001b6c:	67050513          	addi	a0,a0,1648 # 800041d8 <CONSOLE_STATUS+0x1c8>
    80001b70:	00001097          	auipc	ra,0x1
    80001b74:	a7c080e7          	jalr	-1412(ra) # 800025ec <panic>
    80001b78:	00001097          	auipc	ra,0x1
    80001b7c:	9d0080e7          	jalr	-1584(ra) # 80002548 <consoleinit>
    80001b80:	00001097          	auipc	ra,0x1
    80001b84:	15c080e7          	jalr	348(ra) # 80002cdc <printfinit>
    80001b88:	00002517          	auipc	a0,0x2
    80001b8c:	5d050513          	addi	a0,a0,1488 # 80004158 <CONSOLE_STATUS+0x148>
    80001b90:	00001097          	auipc	ra,0x1
    80001b94:	ab8080e7          	jalr	-1352(ra) # 80002648 <__printf>
    80001b98:	00002517          	auipc	a0,0x2
    80001b9c:	61050513          	addi	a0,a0,1552 # 800041a8 <CONSOLE_STATUS+0x198>
    80001ba0:	00001097          	auipc	ra,0x1
    80001ba4:	aa8080e7          	jalr	-1368(ra) # 80002648 <__printf>
    80001ba8:	00002517          	auipc	a0,0x2
    80001bac:	5b050513          	addi	a0,a0,1456 # 80004158 <CONSOLE_STATUS+0x148>
    80001bb0:	00001097          	auipc	ra,0x1
    80001bb4:	a98080e7          	jalr	-1384(ra) # 80002648 <__printf>
    80001bb8:	00001097          	auipc	ra,0x1
    80001bbc:	4b0080e7          	jalr	1200(ra) # 80003068 <kinit>
    80001bc0:	00000097          	auipc	ra,0x0
    80001bc4:	148080e7          	jalr	328(ra) # 80001d08 <trapinit>
    80001bc8:	00000097          	auipc	ra,0x0
    80001bcc:	16c080e7          	jalr	364(ra) # 80001d34 <trapinithart>
    80001bd0:	00000097          	auipc	ra,0x0
    80001bd4:	5c0080e7          	jalr	1472(ra) # 80002190 <plicinit>
    80001bd8:	00000097          	auipc	ra,0x0
    80001bdc:	5e0080e7          	jalr	1504(ra) # 800021b8 <plicinithart>
    80001be0:	00000097          	auipc	ra,0x0
    80001be4:	078080e7          	jalr	120(ra) # 80001c58 <userinit>
    80001be8:	0ff0000f          	fence
    80001bec:	00100793          	li	a5,1
    80001bf0:	00002517          	auipc	a0,0x2
    80001bf4:	5d050513          	addi	a0,a0,1488 # 800041c0 <CONSOLE_STATUS+0x1b0>
    80001bf8:	00f4a023          	sw	a5,0(s1)
    80001bfc:	00001097          	auipc	ra,0x1
    80001c00:	a4c080e7          	jalr	-1460(ra) # 80002648 <__printf>
    80001c04:	0000006f          	j	80001c04 <system_main+0xd4>

0000000080001c08 <cpuid>:
    80001c08:	ff010113          	addi	sp,sp,-16
    80001c0c:	00813423          	sd	s0,8(sp)
    80001c10:	01010413          	addi	s0,sp,16
    80001c14:	00020513          	mv	a0,tp
    80001c18:	00813403          	ld	s0,8(sp)
    80001c1c:	0005051b          	sext.w	a0,a0
    80001c20:	01010113          	addi	sp,sp,16
    80001c24:	00008067          	ret

0000000080001c28 <mycpu>:
    80001c28:	ff010113          	addi	sp,sp,-16
    80001c2c:	00813423          	sd	s0,8(sp)
    80001c30:	01010413          	addi	s0,sp,16
    80001c34:	00020793          	mv	a5,tp
    80001c38:	00813403          	ld	s0,8(sp)
    80001c3c:	0007879b          	sext.w	a5,a5
    80001c40:	00779793          	slli	a5,a5,0x7
    80001c44:	00004517          	auipc	a0,0x4
    80001c48:	a1c50513          	addi	a0,a0,-1508 # 80005660 <cpus>
    80001c4c:	00f50533          	add	a0,a0,a5
    80001c50:	01010113          	addi	sp,sp,16
    80001c54:	00008067          	ret

0000000080001c58 <userinit>:
    80001c58:	ff010113          	addi	sp,sp,-16
    80001c5c:	00813423          	sd	s0,8(sp)
    80001c60:	01010413          	addi	s0,sp,16
    80001c64:	00813403          	ld	s0,8(sp)
    80001c68:	01010113          	addi	sp,sp,16
    80001c6c:	fffff317          	auipc	t1,0xfffff
    80001c70:	52c30067          	jr	1324(t1) # 80001198 <main>

0000000080001c74 <either_copyout>:
    80001c74:	ff010113          	addi	sp,sp,-16
    80001c78:	00813023          	sd	s0,0(sp)
    80001c7c:	00113423          	sd	ra,8(sp)
    80001c80:	01010413          	addi	s0,sp,16
    80001c84:	02051663          	bnez	a0,80001cb0 <either_copyout+0x3c>
    80001c88:	00058513          	mv	a0,a1
    80001c8c:	00060593          	mv	a1,a2
    80001c90:	0006861b          	sext.w	a2,a3
    80001c94:	00002097          	auipc	ra,0x2
    80001c98:	c60080e7          	jalr	-928(ra) # 800038f4 <__memmove>
    80001c9c:	00813083          	ld	ra,8(sp)
    80001ca0:	00013403          	ld	s0,0(sp)
    80001ca4:	00000513          	li	a0,0
    80001ca8:	01010113          	addi	sp,sp,16
    80001cac:	00008067          	ret
    80001cb0:	00002517          	auipc	a0,0x2
    80001cb4:	55050513          	addi	a0,a0,1360 # 80004200 <CONSOLE_STATUS+0x1f0>
    80001cb8:	00001097          	auipc	ra,0x1
    80001cbc:	934080e7          	jalr	-1740(ra) # 800025ec <panic>

0000000080001cc0 <either_copyin>:
    80001cc0:	ff010113          	addi	sp,sp,-16
    80001cc4:	00813023          	sd	s0,0(sp)
    80001cc8:	00113423          	sd	ra,8(sp)
    80001ccc:	01010413          	addi	s0,sp,16
    80001cd0:	02059463          	bnez	a1,80001cf8 <either_copyin+0x38>
    80001cd4:	00060593          	mv	a1,a2
    80001cd8:	0006861b          	sext.w	a2,a3
    80001cdc:	00002097          	auipc	ra,0x2
    80001ce0:	c18080e7          	jalr	-1000(ra) # 800038f4 <__memmove>
    80001ce4:	00813083          	ld	ra,8(sp)
    80001ce8:	00013403          	ld	s0,0(sp)
    80001cec:	00000513          	li	a0,0
    80001cf0:	01010113          	addi	sp,sp,16
    80001cf4:	00008067          	ret
    80001cf8:	00002517          	auipc	a0,0x2
    80001cfc:	53050513          	addi	a0,a0,1328 # 80004228 <CONSOLE_STATUS+0x218>
    80001d00:	00001097          	auipc	ra,0x1
    80001d04:	8ec080e7          	jalr	-1812(ra) # 800025ec <panic>

0000000080001d08 <trapinit>:
    80001d08:	ff010113          	addi	sp,sp,-16
    80001d0c:	00813423          	sd	s0,8(sp)
    80001d10:	01010413          	addi	s0,sp,16
    80001d14:	00813403          	ld	s0,8(sp)
    80001d18:	00002597          	auipc	a1,0x2
    80001d1c:	53858593          	addi	a1,a1,1336 # 80004250 <CONSOLE_STATUS+0x240>
    80001d20:	00004517          	auipc	a0,0x4
    80001d24:	9c050513          	addi	a0,a0,-1600 # 800056e0 <tickslock>
    80001d28:	01010113          	addi	sp,sp,16
    80001d2c:	00001317          	auipc	t1,0x1
    80001d30:	5cc30067          	jr	1484(t1) # 800032f8 <initlock>

0000000080001d34 <trapinithart>:
    80001d34:	ff010113          	addi	sp,sp,-16
    80001d38:	00813423          	sd	s0,8(sp)
    80001d3c:	01010413          	addi	s0,sp,16
    80001d40:	00000797          	auipc	a5,0x0
    80001d44:	30078793          	addi	a5,a5,768 # 80002040 <kernelvec>
    80001d48:	10579073          	csrw	stvec,a5
    80001d4c:	00813403          	ld	s0,8(sp)
    80001d50:	01010113          	addi	sp,sp,16
    80001d54:	00008067          	ret

0000000080001d58 <usertrap>:
    80001d58:	ff010113          	addi	sp,sp,-16
    80001d5c:	00813423          	sd	s0,8(sp)
    80001d60:	01010413          	addi	s0,sp,16
    80001d64:	00813403          	ld	s0,8(sp)
    80001d68:	01010113          	addi	sp,sp,16
    80001d6c:	00008067          	ret

0000000080001d70 <usertrapret>:
    80001d70:	ff010113          	addi	sp,sp,-16
    80001d74:	00813423          	sd	s0,8(sp)
    80001d78:	01010413          	addi	s0,sp,16
    80001d7c:	00813403          	ld	s0,8(sp)
    80001d80:	01010113          	addi	sp,sp,16
    80001d84:	00008067          	ret

0000000080001d88 <kerneltrap>:
    80001d88:	fe010113          	addi	sp,sp,-32
    80001d8c:	00813823          	sd	s0,16(sp)
    80001d90:	00113c23          	sd	ra,24(sp)
    80001d94:	00913423          	sd	s1,8(sp)
    80001d98:	02010413          	addi	s0,sp,32
    80001d9c:	142025f3          	csrr	a1,scause
    80001da0:	100027f3          	csrr	a5,sstatus
    80001da4:	0027f793          	andi	a5,a5,2
    80001da8:	10079c63          	bnez	a5,80001ec0 <kerneltrap+0x138>
    80001dac:	142027f3          	csrr	a5,scause
    80001db0:	0207ce63          	bltz	a5,80001dec <kerneltrap+0x64>
    80001db4:	00002517          	auipc	a0,0x2
    80001db8:	4e450513          	addi	a0,a0,1252 # 80004298 <CONSOLE_STATUS+0x288>
    80001dbc:	00001097          	auipc	ra,0x1
    80001dc0:	88c080e7          	jalr	-1908(ra) # 80002648 <__printf>
    80001dc4:	141025f3          	csrr	a1,sepc
    80001dc8:	14302673          	csrr	a2,stval
    80001dcc:	00002517          	auipc	a0,0x2
    80001dd0:	4dc50513          	addi	a0,a0,1244 # 800042a8 <CONSOLE_STATUS+0x298>
    80001dd4:	00001097          	auipc	ra,0x1
    80001dd8:	874080e7          	jalr	-1932(ra) # 80002648 <__printf>
    80001ddc:	00002517          	auipc	a0,0x2
    80001de0:	4e450513          	addi	a0,a0,1252 # 800042c0 <CONSOLE_STATUS+0x2b0>
    80001de4:	00001097          	auipc	ra,0x1
    80001de8:	808080e7          	jalr	-2040(ra) # 800025ec <panic>
    80001dec:	0ff7f713          	andi	a4,a5,255
    80001df0:	00900693          	li	a3,9
    80001df4:	04d70063          	beq	a4,a3,80001e34 <kerneltrap+0xac>
    80001df8:	fff00713          	li	a4,-1
    80001dfc:	03f71713          	slli	a4,a4,0x3f
    80001e00:	00170713          	addi	a4,a4,1
    80001e04:	fae798e3          	bne	a5,a4,80001db4 <kerneltrap+0x2c>
    80001e08:	00000097          	auipc	ra,0x0
    80001e0c:	e00080e7          	jalr	-512(ra) # 80001c08 <cpuid>
    80001e10:	06050663          	beqz	a0,80001e7c <kerneltrap+0xf4>
    80001e14:	144027f3          	csrr	a5,sip
    80001e18:	ffd7f793          	andi	a5,a5,-3
    80001e1c:	14479073          	csrw	sip,a5
    80001e20:	01813083          	ld	ra,24(sp)
    80001e24:	01013403          	ld	s0,16(sp)
    80001e28:	00813483          	ld	s1,8(sp)
    80001e2c:	02010113          	addi	sp,sp,32
    80001e30:	00008067          	ret
    80001e34:	00000097          	auipc	ra,0x0
    80001e38:	3d0080e7          	jalr	976(ra) # 80002204 <plic_claim>
    80001e3c:	00a00793          	li	a5,10
    80001e40:	00050493          	mv	s1,a0
    80001e44:	06f50863          	beq	a0,a5,80001eb4 <kerneltrap+0x12c>
    80001e48:	fc050ce3          	beqz	a0,80001e20 <kerneltrap+0x98>
    80001e4c:	00050593          	mv	a1,a0
    80001e50:	00002517          	auipc	a0,0x2
    80001e54:	42850513          	addi	a0,a0,1064 # 80004278 <CONSOLE_STATUS+0x268>
    80001e58:	00000097          	auipc	ra,0x0
    80001e5c:	7f0080e7          	jalr	2032(ra) # 80002648 <__printf>
    80001e60:	01013403          	ld	s0,16(sp)
    80001e64:	01813083          	ld	ra,24(sp)
    80001e68:	00048513          	mv	a0,s1
    80001e6c:	00813483          	ld	s1,8(sp)
    80001e70:	02010113          	addi	sp,sp,32
    80001e74:	00000317          	auipc	t1,0x0
    80001e78:	3c830067          	jr	968(t1) # 8000223c <plic_complete>
    80001e7c:	00004517          	auipc	a0,0x4
    80001e80:	86450513          	addi	a0,a0,-1948 # 800056e0 <tickslock>
    80001e84:	00001097          	auipc	ra,0x1
    80001e88:	498080e7          	jalr	1176(ra) # 8000331c <acquire>
    80001e8c:	00002717          	auipc	a4,0x2
    80001e90:	76870713          	addi	a4,a4,1896 # 800045f4 <ticks>
    80001e94:	00072783          	lw	a5,0(a4)
    80001e98:	00004517          	auipc	a0,0x4
    80001e9c:	84850513          	addi	a0,a0,-1976 # 800056e0 <tickslock>
    80001ea0:	0017879b          	addiw	a5,a5,1
    80001ea4:	00f72023          	sw	a5,0(a4)
    80001ea8:	00001097          	auipc	ra,0x1
    80001eac:	540080e7          	jalr	1344(ra) # 800033e8 <release>
    80001eb0:	f65ff06f          	j	80001e14 <kerneltrap+0x8c>
    80001eb4:	00001097          	auipc	ra,0x1
    80001eb8:	09c080e7          	jalr	156(ra) # 80002f50 <uartintr>
    80001ebc:	fa5ff06f          	j	80001e60 <kerneltrap+0xd8>
    80001ec0:	00002517          	auipc	a0,0x2
    80001ec4:	39850513          	addi	a0,a0,920 # 80004258 <CONSOLE_STATUS+0x248>
    80001ec8:	00000097          	auipc	ra,0x0
    80001ecc:	724080e7          	jalr	1828(ra) # 800025ec <panic>

0000000080001ed0 <clockintr>:
    80001ed0:	fe010113          	addi	sp,sp,-32
    80001ed4:	00813823          	sd	s0,16(sp)
    80001ed8:	00913423          	sd	s1,8(sp)
    80001edc:	00113c23          	sd	ra,24(sp)
    80001ee0:	02010413          	addi	s0,sp,32
    80001ee4:	00003497          	auipc	s1,0x3
    80001ee8:	7fc48493          	addi	s1,s1,2044 # 800056e0 <tickslock>
    80001eec:	00048513          	mv	a0,s1
    80001ef0:	00001097          	auipc	ra,0x1
    80001ef4:	42c080e7          	jalr	1068(ra) # 8000331c <acquire>
    80001ef8:	00002717          	auipc	a4,0x2
    80001efc:	6fc70713          	addi	a4,a4,1788 # 800045f4 <ticks>
    80001f00:	00072783          	lw	a5,0(a4)
    80001f04:	01013403          	ld	s0,16(sp)
    80001f08:	01813083          	ld	ra,24(sp)
    80001f0c:	00048513          	mv	a0,s1
    80001f10:	0017879b          	addiw	a5,a5,1
    80001f14:	00813483          	ld	s1,8(sp)
    80001f18:	00f72023          	sw	a5,0(a4)
    80001f1c:	02010113          	addi	sp,sp,32
    80001f20:	00001317          	auipc	t1,0x1
    80001f24:	4c830067          	jr	1224(t1) # 800033e8 <release>

0000000080001f28 <devintr>:
    80001f28:	142027f3          	csrr	a5,scause
    80001f2c:	00000513          	li	a0,0
    80001f30:	0007c463          	bltz	a5,80001f38 <devintr+0x10>
    80001f34:	00008067          	ret
    80001f38:	fe010113          	addi	sp,sp,-32
    80001f3c:	00813823          	sd	s0,16(sp)
    80001f40:	00113c23          	sd	ra,24(sp)
    80001f44:	00913423          	sd	s1,8(sp)
    80001f48:	02010413          	addi	s0,sp,32
    80001f4c:	0ff7f713          	andi	a4,a5,255
    80001f50:	00900693          	li	a3,9
    80001f54:	04d70c63          	beq	a4,a3,80001fac <devintr+0x84>
    80001f58:	fff00713          	li	a4,-1
    80001f5c:	03f71713          	slli	a4,a4,0x3f
    80001f60:	00170713          	addi	a4,a4,1
    80001f64:	00e78c63          	beq	a5,a4,80001f7c <devintr+0x54>
    80001f68:	01813083          	ld	ra,24(sp)
    80001f6c:	01013403          	ld	s0,16(sp)
    80001f70:	00813483          	ld	s1,8(sp)
    80001f74:	02010113          	addi	sp,sp,32
    80001f78:	00008067          	ret
    80001f7c:	00000097          	auipc	ra,0x0
    80001f80:	c8c080e7          	jalr	-884(ra) # 80001c08 <cpuid>
    80001f84:	06050663          	beqz	a0,80001ff0 <devintr+0xc8>
    80001f88:	144027f3          	csrr	a5,sip
    80001f8c:	ffd7f793          	andi	a5,a5,-3
    80001f90:	14479073          	csrw	sip,a5
    80001f94:	01813083          	ld	ra,24(sp)
    80001f98:	01013403          	ld	s0,16(sp)
    80001f9c:	00813483          	ld	s1,8(sp)
    80001fa0:	00200513          	li	a0,2
    80001fa4:	02010113          	addi	sp,sp,32
    80001fa8:	00008067          	ret
    80001fac:	00000097          	auipc	ra,0x0
    80001fb0:	258080e7          	jalr	600(ra) # 80002204 <plic_claim>
    80001fb4:	00a00793          	li	a5,10
    80001fb8:	00050493          	mv	s1,a0
    80001fbc:	06f50663          	beq	a0,a5,80002028 <devintr+0x100>
    80001fc0:	00100513          	li	a0,1
    80001fc4:	fa0482e3          	beqz	s1,80001f68 <devintr+0x40>
    80001fc8:	00048593          	mv	a1,s1
    80001fcc:	00002517          	auipc	a0,0x2
    80001fd0:	2ac50513          	addi	a0,a0,684 # 80004278 <CONSOLE_STATUS+0x268>
    80001fd4:	00000097          	auipc	ra,0x0
    80001fd8:	674080e7          	jalr	1652(ra) # 80002648 <__printf>
    80001fdc:	00048513          	mv	a0,s1
    80001fe0:	00000097          	auipc	ra,0x0
    80001fe4:	25c080e7          	jalr	604(ra) # 8000223c <plic_complete>
    80001fe8:	00100513          	li	a0,1
    80001fec:	f7dff06f          	j	80001f68 <devintr+0x40>
    80001ff0:	00003517          	auipc	a0,0x3
    80001ff4:	6f050513          	addi	a0,a0,1776 # 800056e0 <tickslock>
    80001ff8:	00001097          	auipc	ra,0x1
    80001ffc:	324080e7          	jalr	804(ra) # 8000331c <acquire>
    80002000:	00002717          	auipc	a4,0x2
    80002004:	5f470713          	addi	a4,a4,1524 # 800045f4 <ticks>
    80002008:	00072783          	lw	a5,0(a4)
    8000200c:	00003517          	auipc	a0,0x3
    80002010:	6d450513          	addi	a0,a0,1748 # 800056e0 <tickslock>
    80002014:	0017879b          	addiw	a5,a5,1
    80002018:	00f72023          	sw	a5,0(a4)
    8000201c:	00001097          	auipc	ra,0x1
    80002020:	3cc080e7          	jalr	972(ra) # 800033e8 <release>
    80002024:	f65ff06f          	j	80001f88 <devintr+0x60>
    80002028:	00001097          	auipc	ra,0x1
    8000202c:	f28080e7          	jalr	-216(ra) # 80002f50 <uartintr>
    80002030:	fadff06f          	j	80001fdc <devintr+0xb4>
	...

0000000080002040 <kernelvec>:
    80002040:	f0010113          	addi	sp,sp,-256
    80002044:	00113023          	sd	ra,0(sp)
    80002048:	00213423          	sd	sp,8(sp)
    8000204c:	00313823          	sd	gp,16(sp)
    80002050:	00413c23          	sd	tp,24(sp)
    80002054:	02513023          	sd	t0,32(sp)
    80002058:	02613423          	sd	t1,40(sp)
    8000205c:	02713823          	sd	t2,48(sp)
    80002060:	02813c23          	sd	s0,56(sp)
    80002064:	04913023          	sd	s1,64(sp)
    80002068:	04a13423          	sd	a0,72(sp)
    8000206c:	04b13823          	sd	a1,80(sp)
    80002070:	04c13c23          	sd	a2,88(sp)
    80002074:	06d13023          	sd	a3,96(sp)
    80002078:	06e13423          	sd	a4,104(sp)
    8000207c:	06f13823          	sd	a5,112(sp)
    80002080:	07013c23          	sd	a6,120(sp)
    80002084:	09113023          	sd	a7,128(sp)
    80002088:	09213423          	sd	s2,136(sp)
    8000208c:	09313823          	sd	s3,144(sp)
    80002090:	09413c23          	sd	s4,152(sp)
    80002094:	0b513023          	sd	s5,160(sp)
    80002098:	0b613423          	sd	s6,168(sp)
    8000209c:	0b713823          	sd	s7,176(sp)
    800020a0:	0b813c23          	sd	s8,184(sp)
    800020a4:	0d913023          	sd	s9,192(sp)
    800020a8:	0da13423          	sd	s10,200(sp)
    800020ac:	0db13823          	sd	s11,208(sp)
    800020b0:	0dc13c23          	sd	t3,216(sp)
    800020b4:	0fd13023          	sd	t4,224(sp)
    800020b8:	0fe13423          	sd	t5,232(sp)
    800020bc:	0ff13823          	sd	t6,240(sp)
    800020c0:	cc9ff0ef          	jal	ra,80001d88 <kerneltrap>
    800020c4:	00013083          	ld	ra,0(sp)
    800020c8:	00813103          	ld	sp,8(sp)
    800020cc:	01013183          	ld	gp,16(sp)
    800020d0:	02013283          	ld	t0,32(sp)
    800020d4:	02813303          	ld	t1,40(sp)
    800020d8:	03013383          	ld	t2,48(sp)
    800020dc:	03813403          	ld	s0,56(sp)
    800020e0:	04013483          	ld	s1,64(sp)
    800020e4:	04813503          	ld	a0,72(sp)
    800020e8:	05013583          	ld	a1,80(sp)
    800020ec:	05813603          	ld	a2,88(sp)
    800020f0:	06013683          	ld	a3,96(sp)
    800020f4:	06813703          	ld	a4,104(sp)
    800020f8:	07013783          	ld	a5,112(sp)
    800020fc:	07813803          	ld	a6,120(sp)
    80002100:	08013883          	ld	a7,128(sp)
    80002104:	08813903          	ld	s2,136(sp)
    80002108:	09013983          	ld	s3,144(sp)
    8000210c:	09813a03          	ld	s4,152(sp)
    80002110:	0a013a83          	ld	s5,160(sp)
    80002114:	0a813b03          	ld	s6,168(sp)
    80002118:	0b013b83          	ld	s7,176(sp)
    8000211c:	0b813c03          	ld	s8,184(sp)
    80002120:	0c013c83          	ld	s9,192(sp)
    80002124:	0c813d03          	ld	s10,200(sp)
    80002128:	0d013d83          	ld	s11,208(sp)
    8000212c:	0d813e03          	ld	t3,216(sp)
    80002130:	0e013e83          	ld	t4,224(sp)
    80002134:	0e813f03          	ld	t5,232(sp)
    80002138:	0f013f83          	ld	t6,240(sp)
    8000213c:	10010113          	addi	sp,sp,256
    80002140:	10200073          	sret
    80002144:	00000013          	nop
    80002148:	00000013          	nop
    8000214c:	00000013          	nop

0000000080002150 <timervec>:
    80002150:	34051573          	csrrw	a0,mscratch,a0
    80002154:	00b53023          	sd	a1,0(a0)
    80002158:	00c53423          	sd	a2,8(a0)
    8000215c:	00d53823          	sd	a3,16(a0)
    80002160:	01853583          	ld	a1,24(a0)
    80002164:	02053603          	ld	a2,32(a0)
    80002168:	0005b683          	ld	a3,0(a1)
    8000216c:	00c686b3          	add	a3,a3,a2
    80002170:	00d5b023          	sd	a3,0(a1)
    80002174:	00200593          	li	a1,2
    80002178:	14459073          	csrw	sip,a1
    8000217c:	01053683          	ld	a3,16(a0)
    80002180:	00853603          	ld	a2,8(a0)
    80002184:	00053583          	ld	a1,0(a0)
    80002188:	34051573          	csrrw	a0,mscratch,a0
    8000218c:	30200073          	mret

0000000080002190 <plicinit>:
    80002190:	ff010113          	addi	sp,sp,-16
    80002194:	00813423          	sd	s0,8(sp)
    80002198:	01010413          	addi	s0,sp,16
    8000219c:	00813403          	ld	s0,8(sp)
    800021a0:	0c0007b7          	lui	a5,0xc000
    800021a4:	00100713          	li	a4,1
    800021a8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800021ac:	00e7a223          	sw	a4,4(a5)
    800021b0:	01010113          	addi	sp,sp,16
    800021b4:	00008067          	ret

00000000800021b8 <plicinithart>:
    800021b8:	ff010113          	addi	sp,sp,-16
    800021bc:	00813023          	sd	s0,0(sp)
    800021c0:	00113423          	sd	ra,8(sp)
    800021c4:	01010413          	addi	s0,sp,16
    800021c8:	00000097          	auipc	ra,0x0
    800021cc:	a40080e7          	jalr	-1472(ra) # 80001c08 <cpuid>
    800021d0:	0085171b          	slliw	a4,a0,0x8
    800021d4:	0c0027b7          	lui	a5,0xc002
    800021d8:	00e787b3          	add	a5,a5,a4
    800021dc:	40200713          	li	a4,1026
    800021e0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800021e4:	00813083          	ld	ra,8(sp)
    800021e8:	00013403          	ld	s0,0(sp)
    800021ec:	00d5151b          	slliw	a0,a0,0xd
    800021f0:	0c2017b7          	lui	a5,0xc201
    800021f4:	00a78533          	add	a0,a5,a0
    800021f8:	00052023          	sw	zero,0(a0)
    800021fc:	01010113          	addi	sp,sp,16
    80002200:	00008067          	ret

0000000080002204 <plic_claim>:
    80002204:	ff010113          	addi	sp,sp,-16
    80002208:	00813023          	sd	s0,0(sp)
    8000220c:	00113423          	sd	ra,8(sp)
    80002210:	01010413          	addi	s0,sp,16
    80002214:	00000097          	auipc	ra,0x0
    80002218:	9f4080e7          	jalr	-1548(ra) # 80001c08 <cpuid>
    8000221c:	00813083          	ld	ra,8(sp)
    80002220:	00013403          	ld	s0,0(sp)
    80002224:	00d5151b          	slliw	a0,a0,0xd
    80002228:	0c2017b7          	lui	a5,0xc201
    8000222c:	00a78533          	add	a0,a5,a0
    80002230:	00452503          	lw	a0,4(a0)
    80002234:	01010113          	addi	sp,sp,16
    80002238:	00008067          	ret

000000008000223c <plic_complete>:
    8000223c:	fe010113          	addi	sp,sp,-32
    80002240:	00813823          	sd	s0,16(sp)
    80002244:	00913423          	sd	s1,8(sp)
    80002248:	00113c23          	sd	ra,24(sp)
    8000224c:	02010413          	addi	s0,sp,32
    80002250:	00050493          	mv	s1,a0
    80002254:	00000097          	auipc	ra,0x0
    80002258:	9b4080e7          	jalr	-1612(ra) # 80001c08 <cpuid>
    8000225c:	01813083          	ld	ra,24(sp)
    80002260:	01013403          	ld	s0,16(sp)
    80002264:	00d5179b          	slliw	a5,a0,0xd
    80002268:	0c201737          	lui	a4,0xc201
    8000226c:	00f707b3          	add	a5,a4,a5
    80002270:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002274:	00813483          	ld	s1,8(sp)
    80002278:	02010113          	addi	sp,sp,32
    8000227c:	00008067          	ret

0000000080002280 <consolewrite>:
    80002280:	fb010113          	addi	sp,sp,-80
    80002284:	04813023          	sd	s0,64(sp)
    80002288:	04113423          	sd	ra,72(sp)
    8000228c:	02913c23          	sd	s1,56(sp)
    80002290:	03213823          	sd	s2,48(sp)
    80002294:	03313423          	sd	s3,40(sp)
    80002298:	03413023          	sd	s4,32(sp)
    8000229c:	01513c23          	sd	s5,24(sp)
    800022a0:	05010413          	addi	s0,sp,80
    800022a4:	06c05c63          	blez	a2,8000231c <consolewrite+0x9c>
    800022a8:	00060993          	mv	s3,a2
    800022ac:	00050a13          	mv	s4,a0
    800022b0:	00058493          	mv	s1,a1
    800022b4:	00000913          	li	s2,0
    800022b8:	fff00a93          	li	s5,-1
    800022bc:	01c0006f          	j	800022d8 <consolewrite+0x58>
    800022c0:	fbf44503          	lbu	a0,-65(s0)
    800022c4:	0019091b          	addiw	s2,s2,1
    800022c8:	00148493          	addi	s1,s1,1
    800022cc:	00001097          	auipc	ra,0x1
    800022d0:	a9c080e7          	jalr	-1380(ra) # 80002d68 <uartputc>
    800022d4:	03298063          	beq	s3,s2,800022f4 <consolewrite+0x74>
    800022d8:	00048613          	mv	a2,s1
    800022dc:	00100693          	li	a3,1
    800022e0:	000a0593          	mv	a1,s4
    800022e4:	fbf40513          	addi	a0,s0,-65
    800022e8:	00000097          	auipc	ra,0x0
    800022ec:	9d8080e7          	jalr	-1576(ra) # 80001cc0 <either_copyin>
    800022f0:	fd5518e3          	bne	a0,s5,800022c0 <consolewrite+0x40>
    800022f4:	04813083          	ld	ra,72(sp)
    800022f8:	04013403          	ld	s0,64(sp)
    800022fc:	03813483          	ld	s1,56(sp)
    80002300:	02813983          	ld	s3,40(sp)
    80002304:	02013a03          	ld	s4,32(sp)
    80002308:	01813a83          	ld	s5,24(sp)
    8000230c:	00090513          	mv	a0,s2
    80002310:	03013903          	ld	s2,48(sp)
    80002314:	05010113          	addi	sp,sp,80
    80002318:	00008067          	ret
    8000231c:	00000913          	li	s2,0
    80002320:	fd5ff06f          	j	800022f4 <consolewrite+0x74>

0000000080002324 <consoleread>:
    80002324:	f9010113          	addi	sp,sp,-112
    80002328:	06813023          	sd	s0,96(sp)
    8000232c:	04913c23          	sd	s1,88(sp)
    80002330:	05213823          	sd	s2,80(sp)
    80002334:	05313423          	sd	s3,72(sp)
    80002338:	05413023          	sd	s4,64(sp)
    8000233c:	03513c23          	sd	s5,56(sp)
    80002340:	03613823          	sd	s6,48(sp)
    80002344:	03713423          	sd	s7,40(sp)
    80002348:	03813023          	sd	s8,32(sp)
    8000234c:	06113423          	sd	ra,104(sp)
    80002350:	01913c23          	sd	s9,24(sp)
    80002354:	07010413          	addi	s0,sp,112
    80002358:	00060b93          	mv	s7,a2
    8000235c:	00050913          	mv	s2,a0
    80002360:	00058c13          	mv	s8,a1
    80002364:	00060b1b          	sext.w	s6,a2
    80002368:	00003497          	auipc	s1,0x3
    8000236c:	39048493          	addi	s1,s1,912 # 800056f8 <cons>
    80002370:	00400993          	li	s3,4
    80002374:	fff00a13          	li	s4,-1
    80002378:	00a00a93          	li	s5,10
    8000237c:	05705e63          	blez	s7,800023d8 <consoleread+0xb4>
    80002380:	09c4a703          	lw	a4,156(s1)
    80002384:	0984a783          	lw	a5,152(s1)
    80002388:	0007071b          	sext.w	a4,a4
    8000238c:	08e78463          	beq	a5,a4,80002414 <consoleread+0xf0>
    80002390:	07f7f713          	andi	a4,a5,127
    80002394:	00e48733          	add	a4,s1,a4
    80002398:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000239c:	0017869b          	addiw	a3,a5,1
    800023a0:	08d4ac23          	sw	a3,152(s1)
    800023a4:	00070c9b          	sext.w	s9,a4
    800023a8:	0b370663          	beq	a4,s3,80002454 <consoleread+0x130>
    800023ac:	00100693          	li	a3,1
    800023b0:	f9f40613          	addi	a2,s0,-97
    800023b4:	000c0593          	mv	a1,s8
    800023b8:	00090513          	mv	a0,s2
    800023bc:	f8e40fa3          	sb	a4,-97(s0)
    800023c0:	00000097          	auipc	ra,0x0
    800023c4:	8b4080e7          	jalr	-1868(ra) # 80001c74 <either_copyout>
    800023c8:	01450863          	beq	a0,s4,800023d8 <consoleread+0xb4>
    800023cc:	001c0c13          	addi	s8,s8,1
    800023d0:	fffb8b9b          	addiw	s7,s7,-1
    800023d4:	fb5c94e3          	bne	s9,s5,8000237c <consoleread+0x58>
    800023d8:	000b851b          	sext.w	a0,s7
    800023dc:	06813083          	ld	ra,104(sp)
    800023e0:	06013403          	ld	s0,96(sp)
    800023e4:	05813483          	ld	s1,88(sp)
    800023e8:	05013903          	ld	s2,80(sp)
    800023ec:	04813983          	ld	s3,72(sp)
    800023f0:	04013a03          	ld	s4,64(sp)
    800023f4:	03813a83          	ld	s5,56(sp)
    800023f8:	02813b83          	ld	s7,40(sp)
    800023fc:	02013c03          	ld	s8,32(sp)
    80002400:	01813c83          	ld	s9,24(sp)
    80002404:	40ab053b          	subw	a0,s6,a0
    80002408:	03013b03          	ld	s6,48(sp)
    8000240c:	07010113          	addi	sp,sp,112
    80002410:	00008067          	ret
    80002414:	00001097          	auipc	ra,0x1
    80002418:	1d8080e7          	jalr	472(ra) # 800035ec <push_on>
    8000241c:	0984a703          	lw	a4,152(s1)
    80002420:	09c4a783          	lw	a5,156(s1)
    80002424:	0007879b          	sext.w	a5,a5
    80002428:	fef70ce3          	beq	a4,a5,80002420 <consoleread+0xfc>
    8000242c:	00001097          	auipc	ra,0x1
    80002430:	234080e7          	jalr	564(ra) # 80003660 <pop_on>
    80002434:	0984a783          	lw	a5,152(s1)
    80002438:	07f7f713          	andi	a4,a5,127
    8000243c:	00e48733          	add	a4,s1,a4
    80002440:	01874703          	lbu	a4,24(a4)
    80002444:	0017869b          	addiw	a3,a5,1
    80002448:	08d4ac23          	sw	a3,152(s1)
    8000244c:	00070c9b          	sext.w	s9,a4
    80002450:	f5371ee3          	bne	a4,s3,800023ac <consoleread+0x88>
    80002454:	000b851b          	sext.w	a0,s7
    80002458:	f96bf2e3          	bgeu	s7,s6,800023dc <consoleread+0xb8>
    8000245c:	08f4ac23          	sw	a5,152(s1)
    80002460:	f7dff06f          	j	800023dc <consoleread+0xb8>

0000000080002464 <consputc>:
    80002464:	10000793          	li	a5,256
    80002468:	00f50663          	beq	a0,a5,80002474 <consputc+0x10>
    8000246c:	00001317          	auipc	t1,0x1
    80002470:	9f430067          	jr	-1548(t1) # 80002e60 <uartputc_sync>
    80002474:	ff010113          	addi	sp,sp,-16
    80002478:	00113423          	sd	ra,8(sp)
    8000247c:	00813023          	sd	s0,0(sp)
    80002480:	01010413          	addi	s0,sp,16
    80002484:	00800513          	li	a0,8
    80002488:	00001097          	auipc	ra,0x1
    8000248c:	9d8080e7          	jalr	-1576(ra) # 80002e60 <uartputc_sync>
    80002490:	02000513          	li	a0,32
    80002494:	00001097          	auipc	ra,0x1
    80002498:	9cc080e7          	jalr	-1588(ra) # 80002e60 <uartputc_sync>
    8000249c:	00013403          	ld	s0,0(sp)
    800024a0:	00813083          	ld	ra,8(sp)
    800024a4:	00800513          	li	a0,8
    800024a8:	01010113          	addi	sp,sp,16
    800024ac:	00001317          	auipc	t1,0x1
    800024b0:	9b430067          	jr	-1612(t1) # 80002e60 <uartputc_sync>

00000000800024b4 <consoleintr>:
    800024b4:	fe010113          	addi	sp,sp,-32
    800024b8:	00813823          	sd	s0,16(sp)
    800024bc:	00913423          	sd	s1,8(sp)
    800024c0:	01213023          	sd	s2,0(sp)
    800024c4:	00113c23          	sd	ra,24(sp)
    800024c8:	02010413          	addi	s0,sp,32
    800024cc:	00003917          	auipc	s2,0x3
    800024d0:	22c90913          	addi	s2,s2,556 # 800056f8 <cons>
    800024d4:	00050493          	mv	s1,a0
    800024d8:	00090513          	mv	a0,s2
    800024dc:	00001097          	auipc	ra,0x1
    800024e0:	e40080e7          	jalr	-448(ra) # 8000331c <acquire>
    800024e4:	02048c63          	beqz	s1,8000251c <consoleintr+0x68>
    800024e8:	0a092783          	lw	a5,160(s2)
    800024ec:	09892703          	lw	a4,152(s2)
    800024f0:	07f00693          	li	a3,127
    800024f4:	40e7873b          	subw	a4,a5,a4
    800024f8:	02e6e263          	bltu	a3,a4,8000251c <consoleintr+0x68>
    800024fc:	00d00713          	li	a4,13
    80002500:	04e48063          	beq	s1,a4,80002540 <consoleintr+0x8c>
    80002504:	07f7f713          	andi	a4,a5,127
    80002508:	00e90733          	add	a4,s2,a4
    8000250c:	0017879b          	addiw	a5,a5,1
    80002510:	0af92023          	sw	a5,160(s2)
    80002514:	00970c23          	sb	s1,24(a4)
    80002518:	08f92e23          	sw	a5,156(s2)
    8000251c:	01013403          	ld	s0,16(sp)
    80002520:	01813083          	ld	ra,24(sp)
    80002524:	00813483          	ld	s1,8(sp)
    80002528:	00013903          	ld	s2,0(sp)
    8000252c:	00003517          	auipc	a0,0x3
    80002530:	1cc50513          	addi	a0,a0,460 # 800056f8 <cons>
    80002534:	02010113          	addi	sp,sp,32
    80002538:	00001317          	auipc	t1,0x1
    8000253c:	eb030067          	jr	-336(t1) # 800033e8 <release>
    80002540:	00a00493          	li	s1,10
    80002544:	fc1ff06f          	j	80002504 <consoleintr+0x50>

0000000080002548 <consoleinit>:
    80002548:	fe010113          	addi	sp,sp,-32
    8000254c:	00113c23          	sd	ra,24(sp)
    80002550:	00813823          	sd	s0,16(sp)
    80002554:	00913423          	sd	s1,8(sp)
    80002558:	02010413          	addi	s0,sp,32
    8000255c:	00003497          	auipc	s1,0x3
    80002560:	19c48493          	addi	s1,s1,412 # 800056f8 <cons>
    80002564:	00048513          	mv	a0,s1
    80002568:	00002597          	auipc	a1,0x2
    8000256c:	d6858593          	addi	a1,a1,-664 # 800042d0 <CONSOLE_STATUS+0x2c0>
    80002570:	00001097          	auipc	ra,0x1
    80002574:	d88080e7          	jalr	-632(ra) # 800032f8 <initlock>
    80002578:	00000097          	auipc	ra,0x0
    8000257c:	7ac080e7          	jalr	1964(ra) # 80002d24 <uartinit>
    80002580:	01813083          	ld	ra,24(sp)
    80002584:	01013403          	ld	s0,16(sp)
    80002588:	00000797          	auipc	a5,0x0
    8000258c:	d9c78793          	addi	a5,a5,-612 # 80002324 <consoleread>
    80002590:	0af4bc23          	sd	a5,184(s1)
    80002594:	00000797          	auipc	a5,0x0
    80002598:	cec78793          	addi	a5,a5,-788 # 80002280 <consolewrite>
    8000259c:	0cf4b023          	sd	a5,192(s1)
    800025a0:	00813483          	ld	s1,8(sp)
    800025a4:	02010113          	addi	sp,sp,32
    800025a8:	00008067          	ret

00000000800025ac <console_read>:
    800025ac:	ff010113          	addi	sp,sp,-16
    800025b0:	00813423          	sd	s0,8(sp)
    800025b4:	01010413          	addi	s0,sp,16
    800025b8:	00813403          	ld	s0,8(sp)
    800025bc:	00003317          	auipc	t1,0x3
    800025c0:	1f433303          	ld	t1,500(t1) # 800057b0 <devsw+0x10>
    800025c4:	01010113          	addi	sp,sp,16
    800025c8:	00030067          	jr	t1

00000000800025cc <console_write>:
    800025cc:	ff010113          	addi	sp,sp,-16
    800025d0:	00813423          	sd	s0,8(sp)
    800025d4:	01010413          	addi	s0,sp,16
    800025d8:	00813403          	ld	s0,8(sp)
    800025dc:	00003317          	auipc	t1,0x3
    800025e0:	1dc33303          	ld	t1,476(t1) # 800057b8 <devsw+0x18>
    800025e4:	01010113          	addi	sp,sp,16
    800025e8:	00030067          	jr	t1

00000000800025ec <panic>:
    800025ec:	fe010113          	addi	sp,sp,-32
    800025f0:	00113c23          	sd	ra,24(sp)
    800025f4:	00813823          	sd	s0,16(sp)
    800025f8:	00913423          	sd	s1,8(sp)
    800025fc:	02010413          	addi	s0,sp,32
    80002600:	00050493          	mv	s1,a0
    80002604:	00002517          	auipc	a0,0x2
    80002608:	cd450513          	addi	a0,a0,-812 # 800042d8 <CONSOLE_STATUS+0x2c8>
    8000260c:	00003797          	auipc	a5,0x3
    80002610:	2407a623          	sw	zero,588(a5) # 80005858 <pr+0x18>
    80002614:	00000097          	auipc	ra,0x0
    80002618:	034080e7          	jalr	52(ra) # 80002648 <__printf>
    8000261c:	00048513          	mv	a0,s1
    80002620:	00000097          	auipc	ra,0x0
    80002624:	028080e7          	jalr	40(ra) # 80002648 <__printf>
    80002628:	00002517          	auipc	a0,0x2
    8000262c:	b3050513          	addi	a0,a0,-1232 # 80004158 <CONSOLE_STATUS+0x148>
    80002630:	00000097          	auipc	ra,0x0
    80002634:	018080e7          	jalr	24(ra) # 80002648 <__printf>
    80002638:	00100793          	li	a5,1
    8000263c:	00002717          	auipc	a4,0x2
    80002640:	faf72e23          	sw	a5,-68(a4) # 800045f8 <panicked>
    80002644:	0000006f          	j	80002644 <panic+0x58>

0000000080002648 <__printf>:
    80002648:	f3010113          	addi	sp,sp,-208
    8000264c:	08813023          	sd	s0,128(sp)
    80002650:	07313423          	sd	s3,104(sp)
    80002654:	09010413          	addi	s0,sp,144
    80002658:	05813023          	sd	s8,64(sp)
    8000265c:	08113423          	sd	ra,136(sp)
    80002660:	06913c23          	sd	s1,120(sp)
    80002664:	07213823          	sd	s2,112(sp)
    80002668:	07413023          	sd	s4,96(sp)
    8000266c:	05513c23          	sd	s5,88(sp)
    80002670:	05613823          	sd	s6,80(sp)
    80002674:	05713423          	sd	s7,72(sp)
    80002678:	03913c23          	sd	s9,56(sp)
    8000267c:	03a13823          	sd	s10,48(sp)
    80002680:	03b13423          	sd	s11,40(sp)
    80002684:	00003317          	auipc	t1,0x3
    80002688:	1bc30313          	addi	t1,t1,444 # 80005840 <pr>
    8000268c:	01832c03          	lw	s8,24(t1)
    80002690:	00b43423          	sd	a1,8(s0)
    80002694:	00c43823          	sd	a2,16(s0)
    80002698:	00d43c23          	sd	a3,24(s0)
    8000269c:	02e43023          	sd	a4,32(s0)
    800026a0:	02f43423          	sd	a5,40(s0)
    800026a4:	03043823          	sd	a6,48(s0)
    800026a8:	03143c23          	sd	a7,56(s0)
    800026ac:	00050993          	mv	s3,a0
    800026b0:	4a0c1663          	bnez	s8,80002b5c <__printf+0x514>
    800026b4:	60098c63          	beqz	s3,80002ccc <__printf+0x684>
    800026b8:	0009c503          	lbu	a0,0(s3)
    800026bc:	00840793          	addi	a5,s0,8
    800026c0:	f6f43c23          	sd	a5,-136(s0)
    800026c4:	00000493          	li	s1,0
    800026c8:	22050063          	beqz	a0,800028e8 <__printf+0x2a0>
    800026cc:	00002a37          	lui	s4,0x2
    800026d0:	00018ab7          	lui	s5,0x18
    800026d4:	000f4b37          	lui	s6,0xf4
    800026d8:	00989bb7          	lui	s7,0x989
    800026dc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800026e0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800026e4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800026e8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800026ec:	00148c9b          	addiw	s9,s1,1
    800026f0:	02500793          	li	a5,37
    800026f4:	01998933          	add	s2,s3,s9
    800026f8:	38f51263          	bne	a0,a5,80002a7c <__printf+0x434>
    800026fc:	00094783          	lbu	a5,0(s2)
    80002700:	00078c9b          	sext.w	s9,a5
    80002704:	1e078263          	beqz	a5,800028e8 <__printf+0x2a0>
    80002708:	0024849b          	addiw	s1,s1,2
    8000270c:	07000713          	li	a4,112
    80002710:	00998933          	add	s2,s3,s1
    80002714:	38e78a63          	beq	a5,a4,80002aa8 <__printf+0x460>
    80002718:	20f76863          	bltu	a4,a5,80002928 <__printf+0x2e0>
    8000271c:	42a78863          	beq	a5,a0,80002b4c <__printf+0x504>
    80002720:	06400713          	li	a4,100
    80002724:	40e79663          	bne	a5,a4,80002b30 <__printf+0x4e8>
    80002728:	f7843783          	ld	a5,-136(s0)
    8000272c:	0007a603          	lw	a2,0(a5)
    80002730:	00878793          	addi	a5,a5,8
    80002734:	f6f43c23          	sd	a5,-136(s0)
    80002738:	42064a63          	bltz	a2,80002b6c <__printf+0x524>
    8000273c:	00a00713          	li	a4,10
    80002740:	02e677bb          	remuw	a5,a2,a4
    80002744:	00002d97          	auipc	s11,0x2
    80002748:	bbcd8d93          	addi	s11,s11,-1092 # 80004300 <digits>
    8000274c:	00900593          	li	a1,9
    80002750:	0006051b          	sext.w	a0,a2
    80002754:	00000c93          	li	s9,0
    80002758:	02079793          	slli	a5,a5,0x20
    8000275c:	0207d793          	srli	a5,a5,0x20
    80002760:	00fd87b3          	add	a5,s11,a5
    80002764:	0007c783          	lbu	a5,0(a5)
    80002768:	02e656bb          	divuw	a3,a2,a4
    8000276c:	f8f40023          	sb	a5,-128(s0)
    80002770:	14c5d863          	bge	a1,a2,800028c0 <__printf+0x278>
    80002774:	06300593          	li	a1,99
    80002778:	00100c93          	li	s9,1
    8000277c:	02e6f7bb          	remuw	a5,a3,a4
    80002780:	02079793          	slli	a5,a5,0x20
    80002784:	0207d793          	srli	a5,a5,0x20
    80002788:	00fd87b3          	add	a5,s11,a5
    8000278c:	0007c783          	lbu	a5,0(a5)
    80002790:	02e6d73b          	divuw	a4,a3,a4
    80002794:	f8f400a3          	sb	a5,-127(s0)
    80002798:	12a5f463          	bgeu	a1,a0,800028c0 <__printf+0x278>
    8000279c:	00a00693          	li	a3,10
    800027a0:	00900593          	li	a1,9
    800027a4:	02d777bb          	remuw	a5,a4,a3
    800027a8:	02079793          	slli	a5,a5,0x20
    800027ac:	0207d793          	srli	a5,a5,0x20
    800027b0:	00fd87b3          	add	a5,s11,a5
    800027b4:	0007c503          	lbu	a0,0(a5)
    800027b8:	02d757bb          	divuw	a5,a4,a3
    800027bc:	f8a40123          	sb	a0,-126(s0)
    800027c0:	48e5f263          	bgeu	a1,a4,80002c44 <__printf+0x5fc>
    800027c4:	06300513          	li	a0,99
    800027c8:	02d7f5bb          	remuw	a1,a5,a3
    800027cc:	02059593          	slli	a1,a1,0x20
    800027d0:	0205d593          	srli	a1,a1,0x20
    800027d4:	00bd85b3          	add	a1,s11,a1
    800027d8:	0005c583          	lbu	a1,0(a1)
    800027dc:	02d7d7bb          	divuw	a5,a5,a3
    800027e0:	f8b401a3          	sb	a1,-125(s0)
    800027e4:	48e57263          	bgeu	a0,a4,80002c68 <__printf+0x620>
    800027e8:	3e700513          	li	a0,999
    800027ec:	02d7f5bb          	remuw	a1,a5,a3
    800027f0:	02059593          	slli	a1,a1,0x20
    800027f4:	0205d593          	srli	a1,a1,0x20
    800027f8:	00bd85b3          	add	a1,s11,a1
    800027fc:	0005c583          	lbu	a1,0(a1)
    80002800:	02d7d7bb          	divuw	a5,a5,a3
    80002804:	f8b40223          	sb	a1,-124(s0)
    80002808:	46e57663          	bgeu	a0,a4,80002c74 <__printf+0x62c>
    8000280c:	02d7f5bb          	remuw	a1,a5,a3
    80002810:	02059593          	slli	a1,a1,0x20
    80002814:	0205d593          	srli	a1,a1,0x20
    80002818:	00bd85b3          	add	a1,s11,a1
    8000281c:	0005c583          	lbu	a1,0(a1)
    80002820:	02d7d7bb          	divuw	a5,a5,a3
    80002824:	f8b402a3          	sb	a1,-123(s0)
    80002828:	46ea7863          	bgeu	s4,a4,80002c98 <__printf+0x650>
    8000282c:	02d7f5bb          	remuw	a1,a5,a3
    80002830:	02059593          	slli	a1,a1,0x20
    80002834:	0205d593          	srli	a1,a1,0x20
    80002838:	00bd85b3          	add	a1,s11,a1
    8000283c:	0005c583          	lbu	a1,0(a1)
    80002840:	02d7d7bb          	divuw	a5,a5,a3
    80002844:	f8b40323          	sb	a1,-122(s0)
    80002848:	3eeaf863          	bgeu	s5,a4,80002c38 <__printf+0x5f0>
    8000284c:	02d7f5bb          	remuw	a1,a5,a3
    80002850:	02059593          	slli	a1,a1,0x20
    80002854:	0205d593          	srli	a1,a1,0x20
    80002858:	00bd85b3          	add	a1,s11,a1
    8000285c:	0005c583          	lbu	a1,0(a1)
    80002860:	02d7d7bb          	divuw	a5,a5,a3
    80002864:	f8b403a3          	sb	a1,-121(s0)
    80002868:	42eb7e63          	bgeu	s6,a4,80002ca4 <__printf+0x65c>
    8000286c:	02d7f5bb          	remuw	a1,a5,a3
    80002870:	02059593          	slli	a1,a1,0x20
    80002874:	0205d593          	srli	a1,a1,0x20
    80002878:	00bd85b3          	add	a1,s11,a1
    8000287c:	0005c583          	lbu	a1,0(a1)
    80002880:	02d7d7bb          	divuw	a5,a5,a3
    80002884:	f8b40423          	sb	a1,-120(s0)
    80002888:	42ebfc63          	bgeu	s7,a4,80002cc0 <__printf+0x678>
    8000288c:	02079793          	slli	a5,a5,0x20
    80002890:	0207d793          	srli	a5,a5,0x20
    80002894:	00fd8db3          	add	s11,s11,a5
    80002898:	000dc703          	lbu	a4,0(s11)
    8000289c:	00a00793          	li	a5,10
    800028a0:	00900c93          	li	s9,9
    800028a4:	f8e404a3          	sb	a4,-119(s0)
    800028a8:	00065c63          	bgez	a2,800028c0 <__printf+0x278>
    800028ac:	f9040713          	addi	a4,s0,-112
    800028b0:	00f70733          	add	a4,a4,a5
    800028b4:	02d00693          	li	a3,45
    800028b8:	fed70823          	sb	a3,-16(a4)
    800028bc:	00078c93          	mv	s9,a5
    800028c0:	f8040793          	addi	a5,s0,-128
    800028c4:	01978cb3          	add	s9,a5,s9
    800028c8:	f7f40d13          	addi	s10,s0,-129
    800028cc:	000cc503          	lbu	a0,0(s9)
    800028d0:	fffc8c93          	addi	s9,s9,-1
    800028d4:	00000097          	auipc	ra,0x0
    800028d8:	b90080e7          	jalr	-1136(ra) # 80002464 <consputc>
    800028dc:	ffac98e3          	bne	s9,s10,800028cc <__printf+0x284>
    800028e0:	00094503          	lbu	a0,0(s2)
    800028e4:	e00514e3          	bnez	a0,800026ec <__printf+0xa4>
    800028e8:	1a0c1663          	bnez	s8,80002a94 <__printf+0x44c>
    800028ec:	08813083          	ld	ra,136(sp)
    800028f0:	08013403          	ld	s0,128(sp)
    800028f4:	07813483          	ld	s1,120(sp)
    800028f8:	07013903          	ld	s2,112(sp)
    800028fc:	06813983          	ld	s3,104(sp)
    80002900:	06013a03          	ld	s4,96(sp)
    80002904:	05813a83          	ld	s5,88(sp)
    80002908:	05013b03          	ld	s6,80(sp)
    8000290c:	04813b83          	ld	s7,72(sp)
    80002910:	04013c03          	ld	s8,64(sp)
    80002914:	03813c83          	ld	s9,56(sp)
    80002918:	03013d03          	ld	s10,48(sp)
    8000291c:	02813d83          	ld	s11,40(sp)
    80002920:	0d010113          	addi	sp,sp,208
    80002924:	00008067          	ret
    80002928:	07300713          	li	a4,115
    8000292c:	1ce78a63          	beq	a5,a4,80002b00 <__printf+0x4b8>
    80002930:	07800713          	li	a4,120
    80002934:	1ee79e63          	bne	a5,a4,80002b30 <__printf+0x4e8>
    80002938:	f7843783          	ld	a5,-136(s0)
    8000293c:	0007a703          	lw	a4,0(a5)
    80002940:	00878793          	addi	a5,a5,8
    80002944:	f6f43c23          	sd	a5,-136(s0)
    80002948:	28074263          	bltz	a4,80002bcc <__printf+0x584>
    8000294c:	00002d97          	auipc	s11,0x2
    80002950:	9b4d8d93          	addi	s11,s11,-1612 # 80004300 <digits>
    80002954:	00f77793          	andi	a5,a4,15
    80002958:	00fd87b3          	add	a5,s11,a5
    8000295c:	0007c683          	lbu	a3,0(a5)
    80002960:	00f00613          	li	a2,15
    80002964:	0007079b          	sext.w	a5,a4
    80002968:	f8d40023          	sb	a3,-128(s0)
    8000296c:	0047559b          	srliw	a1,a4,0x4
    80002970:	0047569b          	srliw	a3,a4,0x4
    80002974:	00000c93          	li	s9,0
    80002978:	0ee65063          	bge	a2,a4,80002a58 <__printf+0x410>
    8000297c:	00f6f693          	andi	a3,a3,15
    80002980:	00dd86b3          	add	a3,s11,a3
    80002984:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002988:	0087d79b          	srliw	a5,a5,0x8
    8000298c:	00100c93          	li	s9,1
    80002990:	f8d400a3          	sb	a3,-127(s0)
    80002994:	0cb67263          	bgeu	a2,a1,80002a58 <__printf+0x410>
    80002998:	00f7f693          	andi	a3,a5,15
    8000299c:	00dd86b3          	add	a3,s11,a3
    800029a0:	0006c583          	lbu	a1,0(a3)
    800029a4:	00f00613          	li	a2,15
    800029a8:	0047d69b          	srliw	a3,a5,0x4
    800029ac:	f8b40123          	sb	a1,-126(s0)
    800029b0:	0047d593          	srli	a1,a5,0x4
    800029b4:	28f67e63          	bgeu	a2,a5,80002c50 <__printf+0x608>
    800029b8:	00f6f693          	andi	a3,a3,15
    800029bc:	00dd86b3          	add	a3,s11,a3
    800029c0:	0006c503          	lbu	a0,0(a3)
    800029c4:	0087d813          	srli	a6,a5,0x8
    800029c8:	0087d69b          	srliw	a3,a5,0x8
    800029cc:	f8a401a3          	sb	a0,-125(s0)
    800029d0:	28b67663          	bgeu	a2,a1,80002c5c <__printf+0x614>
    800029d4:	00f6f693          	andi	a3,a3,15
    800029d8:	00dd86b3          	add	a3,s11,a3
    800029dc:	0006c583          	lbu	a1,0(a3)
    800029e0:	00c7d513          	srli	a0,a5,0xc
    800029e4:	00c7d69b          	srliw	a3,a5,0xc
    800029e8:	f8b40223          	sb	a1,-124(s0)
    800029ec:	29067a63          	bgeu	a2,a6,80002c80 <__printf+0x638>
    800029f0:	00f6f693          	andi	a3,a3,15
    800029f4:	00dd86b3          	add	a3,s11,a3
    800029f8:	0006c583          	lbu	a1,0(a3)
    800029fc:	0107d813          	srli	a6,a5,0x10
    80002a00:	0107d69b          	srliw	a3,a5,0x10
    80002a04:	f8b402a3          	sb	a1,-123(s0)
    80002a08:	28a67263          	bgeu	a2,a0,80002c8c <__printf+0x644>
    80002a0c:	00f6f693          	andi	a3,a3,15
    80002a10:	00dd86b3          	add	a3,s11,a3
    80002a14:	0006c683          	lbu	a3,0(a3)
    80002a18:	0147d79b          	srliw	a5,a5,0x14
    80002a1c:	f8d40323          	sb	a3,-122(s0)
    80002a20:	21067663          	bgeu	a2,a6,80002c2c <__printf+0x5e4>
    80002a24:	02079793          	slli	a5,a5,0x20
    80002a28:	0207d793          	srli	a5,a5,0x20
    80002a2c:	00fd8db3          	add	s11,s11,a5
    80002a30:	000dc683          	lbu	a3,0(s11)
    80002a34:	00800793          	li	a5,8
    80002a38:	00700c93          	li	s9,7
    80002a3c:	f8d403a3          	sb	a3,-121(s0)
    80002a40:	00075c63          	bgez	a4,80002a58 <__printf+0x410>
    80002a44:	f9040713          	addi	a4,s0,-112
    80002a48:	00f70733          	add	a4,a4,a5
    80002a4c:	02d00693          	li	a3,45
    80002a50:	fed70823          	sb	a3,-16(a4)
    80002a54:	00078c93          	mv	s9,a5
    80002a58:	f8040793          	addi	a5,s0,-128
    80002a5c:	01978cb3          	add	s9,a5,s9
    80002a60:	f7f40d13          	addi	s10,s0,-129
    80002a64:	000cc503          	lbu	a0,0(s9)
    80002a68:	fffc8c93          	addi	s9,s9,-1
    80002a6c:	00000097          	auipc	ra,0x0
    80002a70:	9f8080e7          	jalr	-1544(ra) # 80002464 <consputc>
    80002a74:	ff9d18e3          	bne	s10,s9,80002a64 <__printf+0x41c>
    80002a78:	0100006f          	j	80002a88 <__printf+0x440>
    80002a7c:	00000097          	auipc	ra,0x0
    80002a80:	9e8080e7          	jalr	-1560(ra) # 80002464 <consputc>
    80002a84:	000c8493          	mv	s1,s9
    80002a88:	00094503          	lbu	a0,0(s2)
    80002a8c:	c60510e3          	bnez	a0,800026ec <__printf+0xa4>
    80002a90:	e40c0ee3          	beqz	s8,800028ec <__printf+0x2a4>
    80002a94:	00003517          	auipc	a0,0x3
    80002a98:	dac50513          	addi	a0,a0,-596 # 80005840 <pr>
    80002a9c:	00001097          	auipc	ra,0x1
    80002aa0:	94c080e7          	jalr	-1716(ra) # 800033e8 <release>
    80002aa4:	e49ff06f          	j	800028ec <__printf+0x2a4>
    80002aa8:	f7843783          	ld	a5,-136(s0)
    80002aac:	03000513          	li	a0,48
    80002ab0:	01000d13          	li	s10,16
    80002ab4:	00878713          	addi	a4,a5,8
    80002ab8:	0007bc83          	ld	s9,0(a5)
    80002abc:	f6e43c23          	sd	a4,-136(s0)
    80002ac0:	00000097          	auipc	ra,0x0
    80002ac4:	9a4080e7          	jalr	-1628(ra) # 80002464 <consputc>
    80002ac8:	07800513          	li	a0,120
    80002acc:	00000097          	auipc	ra,0x0
    80002ad0:	998080e7          	jalr	-1640(ra) # 80002464 <consputc>
    80002ad4:	00002d97          	auipc	s11,0x2
    80002ad8:	82cd8d93          	addi	s11,s11,-2004 # 80004300 <digits>
    80002adc:	03ccd793          	srli	a5,s9,0x3c
    80002ae0:	00fd87b3          	add	a5,s11,a5
    80002ae4:	0007c503          	lbu	a0,0(a5)
    80002ae8:	fffd0d1b          	addiw	s10,s10,-1
    80002aec:	004c9c93          	slli	s9,s9,0x4
    80002af0:	00000097          	auipc	ra,0x0
    80002af4:	974080e7          	jalr	-1676(ra) # 80002464 <consputc>
    80002af8:	fe0d12e3          	bnez	s10,80002adc <__printf+0x494>
    80002afc:	f8dff06f          	j	80002a88 <__printf+0x440>
    80002b00:	f7843783          	ld	a5,-136(s0)
    80002b04:	0007bc83          	ld	s9,0(a5)
    80002b08:	00878793          	addi	a5,a5,8
    80002b0c:	f6f43c23          	sd	a5,-136(s0)
    80002b10:	000c9a63          	bnez	s9,80002b24 <__printf+0x4dc>
    80002b14:	1080006f          	j	80002c1c <__printf+0x5d4>
    80002b18:	001c8c93          	addi	s9,s9,1
    80002b1c:	00000097          	auipc	ra,0x0
    80002b20:	948080e7          	jalr	-1720(ra) # 80002464 <consputc>
    80002b24:	000cc503          	lbu	a0,0(s9)
    80002b28:	fe0518e3          	bnez	a0,80002b18 <__printf+0x4d0>
    80002b2c:	f5dff06f          	j	80002a88 <__printf+0x440>
    80002b30:	02500513          	li	a0,37
    80002b34:	00000097          	auipc	ra,0x0
    80002b38:	930080e7          	jalr	-1744(ra) # 80002464 <consputc>
    80002b3c:	000c8513          	mv	a0,s9
    80002b40:	00000097          	auipc	ra,0x0
    80002b44:	924080e7          	jalr	-1756(ra) # 80002464 <consputc>
    80002b48:	f41ff06f          	j	80002a88 <__printf+0x440>
    80002b4c:	02500513          	li	a0,37
    80002b50:	00000097          	auipc	ra,0x0
    80002b54:	914080e7          	jalr	-1772(ra) # 80002464 <consputc>
    80002b58:	f31ff06f          	j	80002a88 <__printf+0x440>
    80002b5c:	00030513          	mv	a0,t1
    80002b60:	00000097          	auipc	ra,0x0
    80002b64:	7bc080e7          	jalr	1980(ra) # 8000331c <acquire>
    80002b68:	b4dff06f          	j	800026b4 <__printf+0x6c>
    80002b6c:	40c0053b          	negw	a0,a2
    80002b70:	00a00713          	li	a4,10
    80002b74:	02e576bb          	remuw	a3,a0,a4
    80002b78:	00001d97          	auipc	s11,0x1
    80002b7c:	788d8d93          	addi	s11,s11,1928 # 80004300 <digits>
    80002b80:	ff700593          	li	a1,-9
    80002b84:	02069693          	slli	a3,a3,0x20
    80002b88:	0206d693          	srli	a3,a3,0x20
    80002b8c:	00dd86b3          	add	a3,s11,a3
    80002b90:	0006c683          	lbu	a3,0(a3)
    80002b94:	02e557bb          	divuw	a5,a0,a4
    80002b98:	f8d40023          	sb	a3,-128(s0)
    80002b9c:	10b65e63          	bge	a2,a1,80002cb8 <__printf+0x670>
    80002ba0:	06300593          	li	a1,99
    80002ba4:	02e7f6bb          	remuw	a3,a5,a4
    80002ba8:	02069693          	slli	a3,a3,0x20
    80002bac:	0206d693          	srli	a3,a3,0x20
    80002bb0:	00dd86b3          	add	a3,s11,a3
    80002bb4:	0006c683          	lbu	a3,0(a3)
    80002bb8:	02e7d73b          	divuw	a4,a5,a4
    80002bbc:	00200793          	li	a5,2
    80002bc0:	f8d400a3          	sb	a3,-127(s0)
    80002bc4:	bca5ece3          	bltu	a1,a0,8000279c <__printf+0x154>
    80002bc8:	ce5ff06f          	j	800028ac <__printf+0x264>
    80002bcc:	40e007bb          	negw	a5,a4
    80002bd0:	00001d97          	auipc	s11,0x1
    80002bd4:	730d8d93          	addi	s11,s11,1840 # 80004300 <digits>
    80002bd8:	00f7f693          	andi	a3,a5,15
    80002bdc:	00dd86b3          	add	a3,s11,a3
    80002be0:	0006c583          	lbu	a1,0(a3)
    80002be4:	ff100613          	li	a2,-15
    80002be8:	0047d69b          	srliw	a3,a5,0x4
    80002bec:	f8b40023          	sb	a1,-128(s0)
    80002bf0:	0047d59b          	srliw	a1,a5,0x4
    80002bf4:	0ac75e63          	bge	a4,a2,80002cb0 <__printf+0x668>
    80002bf8:	00f6f693          	andi	a3,a3,15
    80002bfc:	00dd86b3          	add	a3,s11,a3
    80002c00:	0006c603          	lbu	a2,0(a3)
    80002c04:	00f00693          	li	a3,15
    80002c08:	0087d79b          	srliw	a5,a5,0x8
    80002c0c:	f8c400a3          	sb	a2,-127(s0)
    80002c10:	d8b6e4e3          	bltu	a3,a1,80002998 <__printf+0x350>
    80002c14:	00200793          	li	a5,2
    80002c18:	e2dff06f          	j	80002a44 <__printf+0x3fc>
    80002c1c:	00001c97          	auipc	s9,0x1
    80002c20:	6c4c8c93          	addi	s9,s9,1732 # 800042e0 <CONSOLE_STATUS+0x2d0>
    80002c24:	02800513          	li	a0,40
    80002c28:	ef1ff06f          	j	80002b18 <__printf+0x4d0>
    80002c2c:	00700793          	li	a5,7
    80002c30:	00600c93          	li	s9,6
    80002c34:	e0dff06f          	j	80002a40 <__printf+0x3f8>
    80002c38:	00700793          	li	a5,7
    80002c3c:	00600c93          	li	s9,6
    80002c40:	c69ff06f          	j	800028a8 <__printf+0x260>
    80002c44:	00300793          	li	a5,3
    80002c48:	00200c93          	li	s9,2
    80002c4c:	c5dff06f          	j	800028a8 <__printf+0x260>
    80002c50:	00300793          	li	a5,3
    80002c54:	00200c93          	li	s9,2
    80002c58:	de9ff06f          	j	80002a40 <__printf+0x3f8>
    80002c5c:	00400793          	li	a5,4
    80002c60:	00300c93          	li	s9,3
    80002c64:	dddff06f          	j	80002a40 <__printf+0x3f8>
    80002c68:	00400793          	li	a5,4
    80002c6c:	00300c93          	li	s9,3
    80002c70:	c39ff06f          	j	800028a8 <__printf+0x260>
    80002c74:	00500793          	li	a5,5
    80002c78:	00400c93          	li	s9,4
    80002c7c:	c2dff06f          	j	800028a8 <__printf+0x260>
    80002c80:	00500793          	li	a5,5
    80002c84:	00400c93          	li	s9,4
    80002c88:	db9ff06f          	j	80002a40 <__printf+0x3f8>
    80002c8c:	00600793          	li	a5,6
    80002c90:	00500c93          	li	s9,5
    80002c94:	dadff06f          	j	80002a40 <__printf+0x3f8>
    80002c98:	00600793          	li	a5,6
    80002c9c:	00500c93          	li	s9,5
    80002ca0:	c09ff06f          	j	800028a8 <__printf+0x260>
    80002ca4:	00800793          	li	a5,8
    80002ca8:	00700c93          	li	s9,7
    80002cac:	bfdff06f          	j	800028a8 <__printf+0x260>
    80002cb0:	00100793          	li	a5,1
    80002cb4:	d91ff06f          	j	80002a44 <__printf+0x3fc>
    80002cb8:	00100793          	li	a5,1
    80002cbc:	bf1ff06f          	j	800028ac <__printf+0x264>
    80002cc0:	00900793          	li	a5,9
    80002cc4:	00800c93          	li	s9,8
    80002cc8:	be1ff06f          	j	800028a8 <__printf+0x260>
    80002ccc:	00001517          	auipc	a0,0x1
    80002cd0:	61c50513          	addi	a0,a0,1564 # 800042e8 <CONSOLE_STATUS+0x2d8>
    80002cd4:	00000097          	auipc	ra,0x0
    80002cd8:	918080e7          	jalr	-1768(ra) # 800025ec <panic>

0000000080002cdc <printfinit>:
    80002cdc:	fe010113          	addi	sp,sp,-32
    80002ce0:	00813823          	sd	s0,16(sp)
    80002ce4:	00913423          	sd	s1,8(sp)
    80002ce8:	00113c23          	sd	ra,24(sp)
    80002cec:	02010413          	addi	s0,sp,32
    80002cf0:	00003497          	auipc	s1,0x3
    80002cf4:	b5048493          	addi	s1,s1,-1200 # 80005840 <pr>
    80002cf8:	00048513          	mv	a0,s1
    80002cfc:	00001597          	auipc	a1,0x1
    80002d00:	5fc58593          	addi	a1,a1,1532 # 800042f8 <CONSOLE_STATUS+0x2e8>
    80002d04:	00000097          	auipc	ra,0x0
    80002d08:	5f4080e7          	jalr	1524(ra) # 800032f8 <initlock>
    80002d0c:	01813083          	ld	ra,24(sp)
    80002d10:	01013403          	ld	s0,16(sp)
    80002d14:	0004ac23          	sw	zero,24(s1)
    80002d18:	00813483          	ld	s1,8(sp)
    80002d1c:	02010113          	addi	sp,sp,32
    80002d20:	00008067          	ret

0000000080002d24 <uartinit>:
    80002d24:	ff010113          	addi	sp,sp,-16
    80002d28:	00813423          	sd	s0,8(sp)
    80002d2c:	01010413          	addi	s0,sp,16
    80002d30:	100007b7          	lui	a5,0x10000
    80002d34:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80002d38:	f8000713          	li	a4,-128
    80002d3c:	00e781a3          	sb	a4,3(a5)
    80002d40:	00300713          	li	a4,3
    80002d44:	00e78023          	sb	a4,0(a5)
    80002d48:	000780a3          	sb	zero,1(a5)
    80002d4c:	00e781a3          	sb	a4,3(a5)
    80002d50:	00700693          	li	a3,7
    80002d54:	00d78123          	sb	a3,2(a5)
    80002d58:	00e780a3          	sb	a4,1(a5)
    80002d5c:	00813403          	ld	s0,8(sp)
    80002d60:	01010113          	addi	sp,sp,16
    80002d64:	00008067          	ret

0000000080002d68 <uartputc>:
    80002d68:	00002797          	auipc	a5,0x2
    80002d6c:	8907a783          	lw	a5,-1904(a5) # 800045f8 <panicked>
    80002d70:	00078463          	beqz	a5,80002d78 <uartputc+0x10>
    80002d74:	0000006f          	j	80002d74 <uartputc+0xc>
    80002d78:	fd010113          	addi	sp,sp,-48
    80002d7c:	02813023          	sd	s0,32(sp)
    80002d80:	00913c23          	sd	s1,24(sp)
    80002d84:	01213823          	sd	s2,16(sp)
    80002d88:	01313423          	sd	s3,8(sp)
    80002d8c:	02113423          	sd	ra,40(sp)
    80002d90:	03010413          	addi	s0,sp,48
    80002d94:	00002917          	auipc	s2,0x2
    80002d98:	86c90913          	addi	s2,s2,-1940 # 80004600 <uart_tx_r>
    80002d9c:	00093783          	ld	a5,0(s2)
    80002da0:	00002497          	auipc	s1,0x2
    80002da4:	86848493          	addi	s1,s1,-1944 # 80004608 <uart_tx_w>
    80002da8:	0004b703          	ld	a4,0(s1)
    80002dac:	02078693          	addi	a3,a5,32
    80002db0:	00050993          	mv	s3,a0
    80002db4:	02e69c63          	bne	a3,a4,80002dec <uartputc+0x84>
    80002db8:	00001097          	auipc	ra,0x1
    80002dbc:	834080e7          	jalr	-1996(ra) # 800035ec <push_on>
    80002dc0:	00093783          	ld	a5,0(s2)
    80002dc4:	0004b703          	ld	a4,0(s1)
    80002dc8:	02078793          	addi	a5,a5,32
    80002dcc:	00e79463          	bne	a5,a4,80002dd4 <uartputc+0x6c>
    80002dd0:	0000006f          	j	80002dd0 <uartputc+0x68>
    80002dd4:	00001097          	auipc	ra,0x1
    80002dd8:	88c080e7          	jalr	-1908(ra) # 80003660 <pop_on>
    80002ddc:	00093783          	ld	a5,0(s2)
    80002de0:	0004b703          	ld	a4,0(s1)
    80002de4:	02078693          	addi	a3,a5,32
    80002de8:	fce688e3          	beq	a3,a4,80002db8 <uartputc+0x50>
    80002dec:	01f77693          	andi	a3,a4,31
    80002df0:	00003597          	auipc	a1,0x3
    80002df4:	a7058593          	addi	a1,a1,-1424 # 80005860 <uart_tx_buf>
    80002df8:	00d586b3          	add	a3,a1,a3
    80002dfc:	00170713          	addi	a4,a4,1
    80002e00:	01368023          	sb	s3,0(a3)
    80002e04:	00e4b023          	sd	a4,0(s1)
    80002e08:	10000637          	lui	a2,0x10000
    80002e0c:	02f71063          	bne	a4,a5,80002e2c <uartputc+0xc4>
    80002e10:	0340006f          	j	80002e44 <uartputc+0xdc>
    80002e14:	00074703          	lbu	a4,0(a4)
    80002e18:	00f93023          	sd	a5,0(s2)
    80002e1c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002e20:	00093783          	ld	a5,0(s2)
    80002e24:	0004b703          	ld	a4,0(s1)
    80002e28:	00f70e63          	beq	a4,a5,80002e44 <uartputc+0xdc>
    80002e2c:	00564683          	lbu	a3,5(a2)
    80002e30:	01f7f713          	andi	a4,a5,31
    80002e34:	00e58733          	add	a4,a1,a4
    80002e38:	0206f693          	andi	a3,a3,32
    80002e3c:	00178793          	addi	a5,a5,1
    80002e40:	fc069ae3          	bnez	a3,80002e14 <uartputc+0xac>
    80002e44:	02813083          	ld	ra,40(sp)
    80002e48:	02013403          	ld	s0,32(sp)
    80002e4c:	01813483          	ld	s1,24(sp)
    80002e50:	01013903          	ld	s2,16(sp)
    80002e54:	00813983          	ld	s3,8(sp)
    80002e58:	03010113          	addi	sp,sp,48
    80002e5c:	00008067          	ret

0000000080002e60 <uartputc_sync>:
    80002e60:	ff010113          	addi	sp,sp,-16
    80002e64:	00813423          	sd	s0,8(sp)
    80002e68:	01010413          	addi	s0,sp,16
    80002e6c:	00001717          	auipc	a4,0x1
    80002e70:	78c72703          	lw	a4,1932(a4) # 800045f8 <panicked>
    80002e74:	02071663          	bnez	a4,80002ea0 <uartputc_sync+0x40>
    80002e78:	00050793          	mv	a5,a0
    80002e7c:	100006b7          	lui	a3,0x10000
    80002e80:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002e84:	02077713          	andi	a4,a4,32
    80002e88:	fe070ce3          	beqz	a4,80002e80 <uartputc_sync+0x20>
    80002e8c:	0ff7f793          	andi	a5,a5,255
    80002e90:	00f68023          	sb	a5,0(a3)
    80002e94:	00813403          	ld	s0,8(sp)
    80002e98:	01010113          	addi	sp,sp,16
    80002e9c:	00008067          	ret
    80002ea0:	0000006f          	j	80002ea0 <uartputc_sync+0x40>

0000000080002ea4 <uartstart>:
    80002ea4:	ff010113          	addi	sp,sp,-16
    80002ea8:	00813423          	sd	s0,8(sp)
    80002eac:	01010413          	addi	s0,sp,16
    80002eb0:	00001617          	auipc	a2,0x1
    80002eb4:	75060613          	addi	a2,a2,1872 # 80004600 <uart_tx_r>
    80002eb8:	00001517          	auipc	a0,0x1
    80002ebc:	75050513          	addi	a0,a0,1872 # 80004608 <uart_tx_w>
    80002ec0:	00063783          	ld	a5,0(a2)
    80002ec4:	00053703          	ld	a4,0(a0)
    80002ec8:	04f70263          	beq	a4,a5,80002f0c <uartstart+0x68>
    80002ecc:	100005b7          	lui	a1,0x10000
    80002ed0:	00003817          	auipc	a6,0x3
    80002ed4:	99080813          	addi	a6,a6,-1648 # 80005860 <uart_tx_buf>
    80002ed8:	01c0006f          	j	80002ef4 <uartstart+0x50>
    80002edc:	0006c703          	lbu	a4,0(a3)
    80002ee0:	00f63023          	sd	a5,0(a2)
    80002ee4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002ee8:	00063783          	ld	a5,0(a2)
    80002eec:	00053703          	ld	a4,0(a0)
    80002ef0:	00f70e63          	beq	a4,a5,80002f0c <uartstart+0x68>
    80002ef4:	01f7f713          	andi	a4,a5,31
    80002ef8:	00e806b3          	add	a3,a6,a4
    80002efc:	0055c703          	lbu	a4,5(a1)
    80002f00:	00178793          	addi	a5,a5,1
    80002f04:	02077713          	andi	a4,a4,32
    80002f08:	fc071ae3          	bnez	a4,80002edc <uartstart+0x38>
    80002f0c:	00813403          	ld	s0,8(sp)
    80002f10:	01010113          	addi	sp,sp,16
    80002f14:	00008067          	ret

0000000080002f18 <uartgetc>:
    80002f18:	ff010113          	addi	sp,sp,-16
    80002f1c:	00813423          	sd	s0,8(sp)
    80002f20:	01010413          	addi	s0,sp,16
    80002f24:	10000737          	lui	a4,0x10000
    80002f28:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002f2c:	0017f793          	andi	a5,a5,1
    80002f30:	00078c63          	beqz	a5,80002f48 <uartgetc+0x30>
    80002f34:	00074503          	lbu	a0,0(a4)
    80002f38:	0ff57513          	andi	a0,a0,255
    80002f3c:	00813403          	ld	s0,8(sp)
    80002f40:	01010113          	addi	sp,sp,16
    80002f44:	00008067          	ret
    80002f48:	fff00513          	li	a0,-1
    80002f4c:	ff1ff06f          	j	80002f3c <uartgetc+0x24>

0000000080002f50 <uartintr>:
    80002f50:	100007b7          	lui	a5,0x10000
    80002f54:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80002f58:	0017f793          	andi	a5,a5,1
    80002f5c:	0a078463          	beqz	a5,80003004 <uartintr+0xb4>
    80002f60:	fe010113          	addi	sp,sp,-32
    80002f64:	00813823          	sd	s0,16(sp)
    80002f68:	00913423          	sd	s1,8(sp)
    80002f6c:	00113c23          	sd	ra,24(sp)
    80002f70:	02010413          	addi	s0,sp,32
    80002f74:	100004b7          	lui	s1,0x10000
    80002f78:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80002f7c:	0ff57513          	andi	a0,a0,255
    80002f80:	fffff097          	auipc	ra,0xfffff
    80002f84:	534080e7          	jalr	1332(ra) # 800024b4 <consoleintr>
    80002f88:	0054c783          	lbu	a5,5(s1)
    80002f8c:	0017f793          	andi	a5,a5,1
    80002f90:	fe0794e3          	bnez	a5,80002f78 <uartintr+0x28>
    80002f94:	00001617          	auipc	a2,0x1
    80002f98:	66c60613          	addi	a2,a2,1644 # 80004600 <uart_tx_r>
    80002f9c:	00001517          	auipc	a0,0x1
    80002fa0:	66c50513          	addi	a0,a0,1644 # 80004608 <uart_tx_w>
    80002fa4:	00063783          	ld	a5,0(a2)
    80002fa8:	00053703          	ld	a4,0(a0)
    80002fac:	04f70263          	beq	a4,a5,80002ff0 <uartintr+0xa0>
    80002fb0:	100005b7          	lui	a1,0x10000
    80002fb4:	00003817          	auipc	a6,0x3
    80002fb8:	8ac80813          	addi	a6,a6,-1876 # 80005860 <uart_tx_buf>
    80002fbc:	01c0006f          	j	80002fd8 <uartintr+0x88>
    80002fc0:	0006c703          	lbu	a4,0(a3)
    80002fc4:	00f63023          	sd	a5,0(a2)
    80002fc8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002fcc:	00063783          	ld	a5,0(a2)
    80002fd0:	00053703          	ld	a4,0(a0)
    80002fd4:	00f70e63          	beq	a4,a5,80002ff0 <uartintr+0xa0>
    80002fd8:	01f7f713          	andi	a4,a5,31
    80002fdc:	00e806b3          	add	a3,a6,a4
    80002fe0:	0055c703          	lbu	a4,5(a1)
    80002fe4:	00178793          	addi	a5,a5,1
    80002fe8:	02077713          	andi	a4,a4,32
    80002fec:	fc071ae3          	bnez	a4,80002fc0 <uartintr+0x70>
    80002ff0:	01813083          	ld	ra,24(sp)
    80002ff4:	01013403          	ld	s0,16(sp)
    80002ff8:	00813483          	ld	s1,8(sp)
    80002ffc:	02010113          	addi	sp,sp,32
    80003000:	00008067          	ret
    80003004:	00001617          	auipc	a2,0x1
    80003008:	5fc60613          	addi	a2,a2,1532 # 80004600 <uart_tx_r>
    8000300c:	00001517          	auipc	a0,0x1
    80003010:	5fc50513          	addi	a0,a0,1532 # 80004608 <uart_tx_w>
    80003014:	00063783          	ld	a5,0(a2)
    80003018:	00053703          	ld	a4,0(a0)
    8000301c:	04f70263          	beq	a4,a5,80003060 <uartintr+0x110>
    80003020:	100005b7          	lui	a1,0x10000
    80003024:	00003817          	auipc	a6,0x3
    80003028:	83c80813          	addi	a6,a6,-1988 # 80005860 <uart_tx_buf>
    8000302c:	01c0006f          	j	80003048 <uartintr+0xf8>
    80003030:	0006c703          	lbu	a4,0(a3)
    80003034:	00f63023          	sd	a5,0(a2)
    80003038:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000303c:	00063783          	ld	a5,0(a2)
    80003040:	00053703          	ld	a4,0(a0)
    80003044:	02f70063          	beq	a4,a5,80003064 <uartintr+0x114>
    80003048:	01f7f713          	andi	a4,a5,31
    8000304c:	00e806b3          	add	a3,a6,a4
    80003050:	0055c703          	lbu	a4,5(a1)
    80003054:	00178793          	addi	a5,a5,1
    80003058:	02077713          	andi	a4,a4,32
    8000305c:	fc071ae3          	bnez	a4,80003030 <uartintr+0xe0>
    80003060:	00008067          	ret
    80003064:	00008067          	ret

0000000080003068 <kinit>:
    80003068:	fc010113          	addi	sp,sp,-64
    8000306c:	02913423          	sd	s1,40(sp)
    80003070:	fffff7b7          	lui	a5,0xfffff
    80003074:	00004497          	auipc	s1,0x4
    80003078:	80b48493          	addi	s1,s1,-2037 # 8000687f <end+0xfff>
    8000307c:	02813823          	sd	s0,48(sp)
    80003080:	01313c23          	sd	s3,24(sp)
    80003084:	00f4f4b3          	and	s1,s1,a5
    80003088:	02113c23          	sd	ra,56(sp)
    8000308c:	03213023          	sd	s2,32(sp)
    80003090:	01413823          	sd	s4,16(sp)
    80003094:	01513423          	sd	s5,8(sp)
    80003098:	04010413          	addi	s0,sp,64
    8000309c:	000017b7          	lui	a5,0x1
    800030a0:	01100993          	li	s3,17
    800030a4:	00f487b3          	add	a5,s1,a5
    800030a8:	01b99993          	slli	s3,s3,0x1b
    800030ac:	06f9e063          	bltu	s3,a5,8000310c <kinit+0xa4>
    800030b0:	00002a97          	auipc	s5,0x2
    800030b4:	7d0a8a93          	addi	s5,s5,2000 # 80005880 <end>
    800030b8:	0754ec63          	bltu	s1,s5,80003130 <kinit+0xc8>
    800030bc:	0734fa63          	bgeu	s1,s3,80003130 <kinit+0xc8>
    800030c0:	00088a37          	lui	s4,0x88
    800030c4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800030c8:	00001917          	auipc	s2,0x1
    800030cc:	54890913          	addi	s2,s2,1352 # 80004610 <kmem>
    800030d0:	00ca1a13          	slli	s4,s4,0xc
    800030d4:	0140006f          	j	800030e8 <kinit+0x80>
    800030d8:	000017b7          	lui	a5,0x1
    800030dc:	00f484b3          	add	s1,s1,a5
    800030e0:	0554e863          	bltu	s1,s5,80003130 <kinit+0xc8>
    800030e4:	0534f663          	bgeu	s1,s3,80003130 <kinit+0xc8>
    800030e8:	00001637          	lui	a2,0x1
    800030ec:	00100593          	li	a1,1
    800030f0:	00048513          	mv	a0,s1
    800030f4:	00000097          	auipc	ra,0x0
    800030f8:	5e4080e7          	jalr	1508(ra) # 800036d8 <__memset>
    800030fc:	00093783          	ld	a5,0(s2)
    80003100:	00f4b023          	sd	a5,0(s1)
    80003104:	00993023          	sd	s1,0(s2)
    80003108:	fd4498e3          	bne	s1,s4,800030d8 <kinit+0x70>
    8000310c:	03813083          	ld	ra,56(sp)
    80003110:	03013403          	ld	s0,48(sp)
    80003114:	02813483          	ld	s1,40(sp)
    80003118:	02013903          	ld	s2,32(sp)
    8000311c:	01813983          	ld	s3,24(sp)
    80003120:	01013a03          	ld	s4,16(sp)
    80003124:	00813a83          	ld	s5,8(sp)
    80003128:	04010113          	addi	sp,sp,64
    8000312c:	00008067          	ret
    80003130:	00001517          	auipc	a0,0x1
    80003134:	1e850513          	addi	a0,a0,488 # 80004318 <digits+0x18>
    80003138:	fffff097          	auipc	ra,0xfffff
    8000313c:	4b4080e7          	jalr	1204(ra) # 800025ec <panic>

0000000080003140 <freerange>:
    80003140:	fc010113          	addi	sp,sp,-64
    80003144:	000017b7          	lui	a5,0x1
    80003148:	02913423          	sd	s1,40(sp)
    8000314c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003150:	009504b3          	add	s1,a0,s1
    80003154:	fffff537          	lui	a0,0xfffff
    80003158:	02813823          	sd	s0,48(sp)
    8000315c:	02113c23          	sd	ra,56(sp)
    80003160:	03213023          	sd	s2,32(sp)
    80003164:	01313c23          	sd	s3,24(sp)
    80003168:	01413823          	sd	s4,16(sp)
    8000316c:	01513423          	sd	s5,8(sp)
    80003170:	01613023          	sd	s6,0(sp)
    80003174:	04010413          	addi	s0,sp,64
    80003178:	00a4f4b3          	and	s1,s1,a0
    8000317c:	00f487b3          	add	a5,s1,a5
    80003180:	06f5e463          	bltu	a1,a5,800031e8 <freerange+0xa8>
    80003184:	00002a97          	auipc	s5,0x2
    80003188:	6fca8a93          	addi	s5,s5,1788 # 80005880 <end>
    8000318c:	0954e263          	bltu	s1,s5,80003210 <freerange+0xd0>
    80003190:	01100993          	li	s3,17
    80003194:	01b99993          	slli	s3,s3,0x1b
    80003198:	0734fc63          	bgeu	s1,s3,80003210 <freerange+0xd0>
    8000319c:	00058a13          	mv	s4,a1
    800031a0:	00001917          	auipc	s2,0x1
    800031a4:	47090913          	addi	s2,s2,1136 # 80004610 <kmem>
    800031a8:	00002b37          	lui	s6,0x2
    800031ac:	0140006f          	j	800031c0 <freerange+0x80>
    800031b0:	000017b7          	lui	a5,0x1
    800031b4:	00f484b3          	add	s1,s1,a5
    800031b8:	0554ec63          	bltu	s1,s5,80003210 <freerange+0xd0>
    800031bc:	0534fa63          	bgeu	s1,s3,80003210 <freerange+0xd0>
    800031c0:	00001637          	lui	a2,0x1
    800031c4:	00100593          	li	a1,1
    800031c8:	00048513          	mv	a0,s1
    800031cc:	00000097          	auipc	ra,0x0
    800031d0:	50c080e7          	jalr	1292(ra) # 800036d8 <__memset>
    800031d4:	00093703          	ld	a4,0(s2)
    800031d8:	016487b3          	add	a5,s1,s6
    800031dc:	00e4b023          	sd	a4,0(s1)
    800031e0:	00993023          	sd	s1,0(s2)
    800031e4:	fcfa76e3          	bgeu	s4,a5,800031b0 <freerange+0x70>
    800031e8:	03813083          	ld	ra,56(sp)
    800031ec:	03013403          	ld	s0,48(sp)
    800031f0:	02813483          	ld	s1,40(sp)
    800031f4:	02013903          	ld	s2,32(sp)
    800031f8:	01813983          	ld	s3,24(sp)
    800031fc:	01013a03          	ld	s4,16(sp)
    80003200:	00813a83          	ld	s5,8(sp)
    80003204:	00013b03          	ld	s6,0(sp)
    80003208:	04010113          	addi	sp,sp,64
    8000320c:	00008067          	ret
    80003210:	00001517          	auipc	a0,0x1
    80003214:	10850513          	addi	a0,a0,264 # 80004318 <digits+0x18>
    80003218:	fffff097          	auipc	ra,0xfffff
    8000321c:	3d4080e7          	jalr	980(ra) # 800025ec <panic>

0000000080003220 <kfree>:
    80003220:	fe010113          	addi	sp,sp,-32
    80003224:	00813823          	sd	s0,16(sp)
    80003228:	00113c23          	sd	ra,24(sp)
    8000322c:	00913423          	sd	s1,8(sp)
    80003230:	02010413          	addi	s0,sp,32
    80003234:	03451793          	slli	a5,a0,0x34
    80003238:	04079c63          	bnez	a5,80003290 <kfree+0x70>
    8000323c:	00002797          	auipc	a5,0x2
    80003240:	64478793          	addi	a5,a5,1604 # 80005880 <end>
    80003244:	00050493          	mv	s1,a0
    80003248:	04f56463          	bltu	a0,a5,80003290 <kfree+0x70>
    8000324c:	01100793          	li	a5,17
    80003250:	01b79793          	slli	a5,a5,0x1b
    80003254:	02f57e63          	bgeu	a0,a5,80003290 <kfree+0x70>
    80003258:	00001637          	lui	a2,0x1
    8000325c:	00100593          	li	a1,1
    80003260:	00000097          	auipc	ra,0x0
    80003264:	478080e7          	jalr	1144(ra) # 800036d8 <__memset>
    80003268:	00001797          	auipc	a5,0x1
    8000326c:	3a878793          	addi	a5,a5,936 # 80004610 <kmem>
    80003270:	0007b703          	ld	a4,0(a5)
    80003274:	01813083          	ld	ra,24(sp)
    80003278:	01013403          	ld	s0,16(sp)
    8000327c:	00e4b023          	sd	a4,0(s1)
    80003280:	0097b023          	sd	s1,0(a5)
    80003284:	00813483          	ld	s1,8(sp)
    80003288:	02010113          	addi	sp,sp,32
    8000328c:	00008067          	ret
    80003290:	00001517          	auipc	a0,0x1
    80003294:	08850513          	addi	a0,a0,136 # 80004318 <digits+0x18>
    80003298:	fffff097          	auipc	ra,0xfffff
    8000329c:	354080e7          	jalr	852(ra) # 800025ec <panic>

00000000800032a0 <kalloc>:
    800032a0:	fe010113          	addi	sp,sp,-32
    800032a4:	00813823          	sd	s0,16(sp)
    800032a8:	00913423          	sd	s1,8(sp)
    800032ac:	00113c23          	sd	ra,24(sp)
    800032b0:	02010413          	addi	s0,sp,32
    800032b4:	00001797          	auipc	a5,0x1
    800032b8:	35c78793          	addi	a5,a5,860 # 80004610 <kmem>
    800032bc:	0007b483          	ld	s1,0(a5)
    800032c0:	02048063          	beqz	s1,800032e0 <kalloc+0x40>
    800032c4:	0004b703          	ld	a4,0(s1)
    800032c8:	00001637          	lui	a2,0x1
    800032cc:	00500593          	li	a1,5
    800032d0:	00048513          	mv	a0,s1
    800032d4:	00e7b023          	sd	a4,0(a5)
    800032d8:	00000097          	auipc	ra,0x0
    800032dc:	400080e7          	jalr	1024(ra) # 800036d8 <__memset>
    800032e0:	01813083          	ld	ra,24(sp)
    800032e4:	01013403          	ld	s0,16(sp)
    800032e8:	00048513          	mv	a0,s1
    800032ec:	00813483          	ld	s1,8(sp)
    800032f0:	02010113          	addi	sp,sp,32
    800032f4:	00008067          	ret

00000000800032f8 <initlock>:
    800032f8:	ff010113          	addi	sp,sp,-16
    800032fc:	00813423          	sd	s0,8(sp)
    80003300:	01010413          	addi	s0,sp,16
    80003304:	00813403          	ld	s0,8(sp)
    80003308:	00b53423          	sd	a1,8(a0)
    8000330c:	00052023          	sw	zero,0(a0)
    80003310:	00053823          	sd	zero,16(a0)
    80003314:	01010113          	addi	sp,sp,16
    80003318:	00008067          	ret

000000008000331c <acquire>:
    8000331c:	fe010113          	addi	sp,sp,-32
    80003320:	00813823          	sd	s0,16(sp)
    80003324:	00913423          	sd	s1,8(sp)
    80003328:	00113c23          	sd	ra,24(sp)
    8000332c:	01213023          	sd	s2,0(sp)
    80003330:	02010413          	addi	s0,sp,32
    80003334:	00050493          	mv	s1,a0
    80003338:	10002973          	csrr	s2,sstatus
    8000333c:	100027f3          	csrr	a5,sstatus
    80003340:	ffd7f793          	andi	a5,a5,-3
    80003344:	10079073          	csrw	sstatus,a5
    80003348:	fffff097          	auipc	ra,0xfffff
    8000334c:	8e0080e7          	jalr	-1824(ra) # 80001c28 <mycpu>
    80003350:	07852783          	lw	a5,120(a0)
    80003354:	06078e63          	beqz	a5,800033d0 <acquire+0xb4>
    80003358:	fffff097          	auipc	ra,0xfffff
    8000335c:	8d0080e7          	jalr	-1840(ra) # 80001c28 <mycpu>
    80003360:	07852783          	lw	a5,120(a0)
    80003364:	0004a703          	lw	a4,0(s1)
    80003368:	0017879b          	addiw	a5,a5,1
    8000336c:	06f52c23          	sw	a5,120(a0)
    80003370:	04071063          	bnez	a4,800033b0 <acquire+0x94>
    80003374:	00100713          	li	a4,1
    80003378:	00070793          	mv	a5,a4
    8000337c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003380:	0007879b          	sext.w	a5,a5
    80003384:	fe079ae3          	bnez	a5,80003378 <acquire+0x5c>
    80003388:	0ff0000f          	fence
    8000338c:	fffff097          	auipc	ra,0xfffff
    80003390:	89c080e7          	jalr	-1892(ra) # 80001c28 <mycpu>
    80003394:	01813083          	ld	ra,24(sp)
    80003398:	01013403          	ld	s0,16(sp)
    8000339c:	00a4b823          	sd	a0,16(s1)
    800033a0:	00013903          	ld	s2,0(sp)
    800033a4:	00813483          	ld	s1,8(sp)
    800033a8:	02010113          	addi	sp,sp,32
    800033ac:	00008067          	ret
    800033b0:	0104b903          	ld	s2,16(s1)
    800033b4:	fffff097          	auipc	ra,0xfffff
    800033b8:	874080e7          	jalr	-1932(ra) # 80001c28 <mycpu>
    800033bc:	faa91ce3          	bne	s2,a0,80003374 <acquire+0x58>
    800033c0:	00001517          	auipc	a0,0x1
    800033c4:	f6050513          	addi	a0,a0,-160 # 80004320 <digits+0x20>
    800033c8:	fffff097          	auipc	ra,0xfffff
    800033cc:	224080e7          	jalr	548(ra) # 800025ec <panic>
    800033d0:	00195913          	srli	s2,s2,0x1
    800033d4:	fffff097          	auipc	ra,0xfffff
    800033d8:	854080e7          	jalr	-1964(ra) # 80001c28 <mycpu>
    800033dc:	00197913          	andi	s2,s2,1
    800033e0:	07252e23          	sw	s2,124(a0)
    800033e4:	f75ff06f          	j	80003358 <acquire+0x3c>

00000000800033e8 <release>:
    800033e8:	fe010113          	addi	sp,sp,-32
    800033ec:	00813823          	sd	s0,16(sp)
    800033f0:	00113c23          	sd	ra,24(sp)
    800033f4:	00913423          	sd	s1,8(sp)
    800033f8:	01213023          	sd	s2,0(sp)
    800033fc:	02010413          	addi	s0,sp,32
    80003400:	00052783          	lw	a5,0(a0)
    80003404:	00079a63          	bnez	a5,80003418 <release+0x30>
    80003408:	00001517          	auipc	a0,0x1
    8000340c:	f2050513          	addi	a0,a0,-224 # 80004328 <digits+0x28>
    80003410:	fffff097          	auipc	ra,0xfffff
    80003414:	1dc080e7          	jalr	476(ra) # 800025ec <panic>
    80003418:	01053903          	ld	s2,16(a0)
    8000341c:	00050493          	mv	s1,a0
    80003420:	fffff097          	auipc	ra,0xfffff
    80003424:	808080e7          	jalr	-2040(ra) # 80001c28 <mycpu>
    80003428:	fea910e3          	bne	s2,a0,80003408 <release+0x20>
    8000342c:	0004b823          	sd	zero,16(s1)
    80003430:	0ff0000f          	fence
    80003434:	0f50000f          	fence	iorw,ow
    80003438:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000343c:	ffffe097          	auipc	ra,0xffffe
    80003440:	7ec080e7          	jalr	2028(ra) # 80001c28 <mycpu>
    80003444:	100027f3          	csrr	a5,sstatus
    80003448:	0027f793          	andi	a5,a5,2
    8000344c:	04079a63          	bnez	a5,800034a0 <release+0xb8>
    80003450:	07852783          	lw	a5,120(a0)
    80003454:	02f05e63          	blez	a5,80003490 <release+0xa8>
    80003458:	fff7871b          	addiw	a4,a5,-1
    8000345c:	06e52c23          	sw	a4,120(a0)
    80003460:	00071c63          	bnez	a4,80003478 <release+0x90>
    80003464:	07c52783          	lw	a5,124(a0)
    80003468:	00078863          	beqz	a5,80003478 <release+0x90>
    8000346c:	100027f3          	csrr	a5,sstatus
    80003470:	0027e793          	ori	a5,a5,2
    80003474:	10079073          	csrw	sstatus,a5
    80003478:	01813083          	ld	ra,24(sp)
    8000347c:	01013403          	ld	s0,16(sp)
    80003480:	00813483          	ld	s1,8(sp)
    80003484:	00013903          	ld	s2,0(sp)
    80003488:	02010113          	addi	sp,sp,32
    8000348c:	00008067          	ret
    80003490:	00001517          	auipc	a0,0x1
    80003494:	eb850513          	addi	a0,a0,-328 # 80004348 <digits+0x48>
    80003498:	fffff097          	auipc	ra,0xfffff
    8000349c:	154080e7          	jalr	340(ra) # 800025ec <panic>
    800034a0:	00001517          	auipc	a0,0x1
    800034a4:	e9050513          	addi	a0,a0,-368 # 80004330 <digits+0x30>
    800034a8:	fffff097          	auipc	ra,0xfffff
    800034ac:	144080e7          	jalr	324(ra) # 800025ec <panic>

00000000800034b0 <holding>:
    800034b0:	00052783          	lw	a5,0(a0)
    800034b4:	00079663          	bnez	a5,800034c0 <holding+0x10>
    800034b8:	00000513          	li	a0,0
    800034bc:	00008067          	ret
    800034c0:	fe010113          	addi	sp,sp,-32
    800034c4:	00813823          	sd	s0,16(sp)
    800034c8:	00913423          	sd	s1,8(sp)
    800034cc:	00113c23          	sd	ra,24(sp)
    800034d0:	02010413          	addi	s0,sp,32
    800034d4:	01053483          	ld	s1,16(a0)
    800034d8:	ffffe097          	auipc	ra,0xffffe
    800034dc:	750080e7          	jalr	1872(ra) # 80001c28 <mycpu>
    800034e0:	01813083          	ld	ra,24(sp)
    800034e4:	01013403          	ld	s0,16(sp)
    800034e8:	40a48533          	sub	a0,s1,a0
    800034ec:	00153513          	seqz	a0,a0
    800034f0:	00813483          	ld	s1,8(sp)
    800034f4:	02010113          	addi	sp,sp,32
    800034f8:	00008067          	ret

00000000800034fc <push_off>:
    800034fc:	fe010113          	addi	sp,sp,-32
    80003500:	00813823          	sd	s0,16(sp)
    80003504:	00113c23          	sd	ra,24(sp)
    80003508:	00913423          	sd	s1,8(sp)
    8000350c:	02010413          	addi	s0,sp,32
    80003510:	100024f3          	csrr	s1,sstatus
    80003514:	100027f3          	csrr	a5,sstatus
    80003518:	ffd7f793          	andi	a5,a5,-3
    8000351c:	10079073          	csrw	sstatus,a5
    80003520:	ffffe097          	auipc	ra,0xffffe
    80003524:	708080e7          	jalr	1800(ra) # 80001c28 <mycpu>
    80003528:	07852783          	lw	a5,120(a0)
    8000352c:	02078663          	beqz	a5,80003558 <push_off+0x5c>
    80003530:	ffffe097          	auipc	ra,0xffffe
    80003534:	6f8080e7          	jalr	1784(ra) # 80001c28 <mycpu>
    80003538:	07852783          	lw	a5,120(a0)
    8000353c:	01813083          	ld	ra,24(sp)
    80003540:	01013403          	ld	s0,16(sp)
    80003544:	0017879b          	addiw	a5,a5,1
    80003548:	06f52c23          	sw	a5,120(a0)
    8000354c:	00813483          	ld	s1,8(sp)
    80003550:	02010113          	addi	sp,sp,32
    80003554:	00008067          	ret
    80003558:	0014d493          	srli	s1,s1,0x1
    8000355c:	ffffe097          	auipc	ra,0xffffe
    80003560:	6cc080e7          	jalr	1740(ra) # 80001c28 <mycpu>
    80003564:	0014f493          	andi	s1,s1,1
    80003568:	06952e23          	sw	s1,124(a0)
    8000356c:	fc5ff06f          	j	80003530 <push_off+0x34>

0000000080003570 <pop_off>:
    80003570:	ff010113          	addi	sp,sp,-16
    80003574:	00813023          	sd	s0,0(sp)
    80003578:	00113423          	sd	ra,8(sp)
    8000357c:	01010413          	addi	s0,sp,16
    80003580:	ffffe097          	auipc	ra,0xffffe
    80003584:	6a8080e7          	jalr	1704(ra) # 80001c28 <mycpu>
    80003588:	100027f3          	csrr	a5,sstatus
    8000358c:	0027f793          	andi	a5,a5,2
    80003590:	04079663          	bnez	a5,800035dc <pop_off+0x6c>
    80003594:	07852783          	lw	a5,120(a0)
    80003598:	02f05a63          	blez	a5,800035cc <pop_off+0x5c>
    8000359c:	fff7871b          	addiw	a4,a5,-1
    800035a0:	06e52c23          	sw	a4,120(a0)
    800035a4:	00071c63          	bnez	a4,800035bc <pop_off+0x4c>
    800035a8:	07c52783          	lw	a5,124(a0)
    800035ac:	00078863          	beqz	a5,800035bc <pop_off+0x4c>
    800035b0:	100027f3          	csrr	a5,sstatus
    800035b4:	0027e793          	ori	a5,a5,2
    800035b8:	10079073          	csrw	sstatus,a5
    800035bc:	00813083          	ld	ra,8(sp)
    800035c0:	00013403          	ld	s0,0(sp)
    800035c4:	01010113          	addi	sp,sp,16
    800035c8:	00008067          	ret
    800035cc:	00001517          	auipc	a0,0x1
    800035d0:	d7c50513          	addi	a0,a0,-644 # 80004348 <digits+0x48>
    800035d4:	fffff097          	auipc	ra,0xfffff
    800035d8:	018080e7          	jalr	24(ra) # 800025ec <panic>
    800035dc:	00001517          	auipc	a0,0x1
    800035e0:	d5450513          	addi	a0,a0,-684 # 80004330 <digits+0x30>
    800035e4:	fffff097          	auipc	ra,0xfffff
    800035e8:	008080e7          	jalr	8(ra) # 800025ec <panic>

00000000800035ec <push_on>:
    800035ec:	fe010113          	addi	sp,sp,-32
    800035f0:	00813823          	sd	s0,16(sp)
    800035f4:	00113c23          	sd	ra,24(sp)
    800035f8:	00913423          	sd	s1,8(sp)
    800035fc:	02010413          	addi	s0,sp,32
    80003600:	100024f3          	csrr	s1,sstatus
    80003604:	100027f3          	csrr	a5,sstatus
    80003608:	0027e793          	ori	a5,a5,2
    8000360c:	10079073          	csrw	sstatus,a5
    80003610:	ffffe097          	auipc	ra,0xffffe
    80003614:	618080e7          	jalr	1560(ra) # 80001c28 <mycpu>
    80003618:	07852783          	lw	a5,120(a0)
    8000361c:	02078663          	beqz	a5,80003648 <push_on+0x5c>
    80003620:	ffffe097          	auipc	ra,0xffffe
    80003624:	608080e7          	jalr	1544(ra) # 80001c28 <mycpu>
    80003628:	07852783          	lw	a5,120(a0)
    8000362c:	01813083          	ld	ra,24(sp)
    80003630:	01013403          	ld	s0,16(sp)
    80003634:	0017879b          	addiw	a5,a5,1
    80003638:	06f52c23          	sw	a5,120(a0)
    8000363c:	00813483          	ld	s1,8(sp)
    80003640:	02010113          	addi	sp,sp,32
    80003644:	00008067          	ret
    80003648:	0014d493          	srli	s1,s1,0x1
    8000364c:	ffffe097          	auipc	ra,0xffffe
    80003650:	5dc080e7          	jalr	1500(ra) # 80001c28 <mycpu>
    80003654:	0014f493          	andi	s1,s1,1
    80003658:	06952e23          	sw	s1,124(a0)
    8000365c:	fc5ff06f          	j	80003620 <push_on+0x34>

0000000080003660 <pop_on>:
    80003660:	ff010113          	addi	sp,sp,-16
    80003664:	00813023          	sd	s0,0(sp)
    80003668:	00113423          	sd	ra,8(sp)
    8000366c:	01010413          	addi	s0,sp,16
    80003670:	ffffe097          	auipc	ra,0xffffe
    80003674:	5b8080e7          	jalr	1464(ra) # 80001c28 <mycpu>
    80003678:	100027f3          	csrr	a5,sstatus
    8000367c:	0027f793          	andi	a5,a5,2
    80003680:	04078463          	beqz	a5,800036c8 <pop_on+0x68>
    80003684:	07852783          	lw	a5,120(a0)
    80003688:	02f05863          	blez	a5,800036b8 <pop_on+0x58>
    8000368c:	fff7879b          	addiw	a5,a5,-1
    80003690:	06f52c23          	sw	a5,120(a0)
    80003694:	07853783          	ld	a5,120(a0)
    80003698:	00079863          	bnez	a5,800036a8 <pop_on+0x48>
    8000369c:	100027f3          	csrr	a5,sstatus
    800036a0:	ffd7f793          	andi	a5,a5,-3
    800036a4:	10079073          	csrw	sstatus,a5
    800036a8:	00813083          	ld	ra,8(sp)
    800036ac:	00013403          	ld	s0,0(sp)
    800036b0:	01010113          	addi	sp,sp,16
    800036b4:	00008067          	ret
    800036b8:	00001517          	auipc	a0,0x1
    800036bc:	cb850513          	addi	a0,a0,-840 # 80004370 <digits+0x70>
    800036c0:	fffff097          	auipc	ra,0xfffff
    800036c4:	f2c080e7          	jalr	-212(ra) # 800025ec <panic>
    800036c8:	00001517          	auipc	a0,0x1
    800036cc:	c8850513          	addi	a0,a0,-888 # 80004350 <digits+0x50>
    800036d0:	fffff097          	auipc	ra,0xfffff
    800036d4:	f1c080e7          	jalr	-228(ra) # 800025ec <panic>

00000000800036d8 <__memset>:
    800036d8:	ff010113          	addi	sp,sp,-16
    800036dc:	00813423          	sd	s0,8(sp)
    800036e0:	01010413          	addi	s0,sp,16
    800036e4:	1a060e63          	beqz	a2,800038a0 <__memset+0x1c8>
    800036e8:	40a007b3          	neg	a5,a0
    800036ec:	0077f793          	andi	a5,a5,7
    800036f0:	00778693          	addi	a3,a5,7
    800036f4:	00b00813          	li	a6,11
    800036f8:	0ff5f593          	andi	a1,a1,255
    800036fc:	fff6071b          	addiw	a4,a2,-1
    80003700:	1b06e663          	bltu	a3,a6,800038ac <__memset+0x1d4>
    80003704:	1cd76463          	bltu	a4,a3,800038cc <__memset+0x1f4>
    80003708:	1a078e63          	beqz	a5,800038c4 <__memset+0x1ec>
    8000370c:	00b50023          	sb	a1,0(a0)
    80003710:	00100713          	li	a4,1
    80003714:	1ae78463          	beq	a5,a4,800038bc <__memset+0x1e4>
    80003718:	00b500a3          	sb	a1,1(a0)
    8000371c:	00200713          	li	a4,2
    80003720:	1ae78a63          	beq	a5,a4,800038d4 <__memset+0x1fc>
    80003724:	00b50123          	sb	a1,2(a0)
    80003728:	00300713          	li	a4,3
    8000372c:	18e78463          	beq	a5,a4,800038b4 <__memset+0x1dc>
    80003730:	00b501a3          	sb	a1,3(a0)
    80003734:	00400713          	li	a4,4
    80003738:	1ae78263          	beq	a5,a4,800038dc <__memset+0x204>
    8000373c:	00b50223          	sb	a1,4(a0)
    80003740:	00500713          	li	a4,5
    80003744:	1ae78063          	beq	a5,a4,800038e4 <__memset+0x20c>
    80003748:	00b502a3          	sb	a1,5(a0)
    8000374c:	00700713          	li	a4,7
    80003750:	18e79e63          	bne	a5,a4,800038ec <__memset+0x214>
    80003754:	00b50323          	sb	a1,6(a0)
    80003758:	00700e93          	li	t4,7
    8000375c:	00859713          	slli	a4,a1,0x8
    80003760:	00e5e733          	or	a4,a1,a4
    80003764:	01059e13          	slli	t3,a1,0x10
    80003768:	01c76e33          	or	t3,a4,t3
    8000376c:	01859313          	slli	t1,a1,0x18
    80003770:	006e6333          	or	t1,t3,t1
    80003774:	02059893          	slli	a7,a1,0x20
    80003778:	40f60e3b          	subw	t3,a2,a5
    8000377c:	011368b3          	or	a7,t1,a7
    80003780:	02859813          	slli	a6,a1,0x28
    80003784:	0108e833          	or	a6,a7,a6
    80003788:	03059693          	slli	a3,a1,0x30
    8000378c:	003e589b          	srliw	a7,t3,0x3
    80003790:	00d866b3          	or	a3,a6,a3
    80003794:	03859713          	slli	a4,a1,0x38
    80003798:	00389813          	slli	a6,a7,0x3
    8000379c:	00f507b3          	add	a5,a0,a5
    800037a0:	00e6e733          	or	a4,a3,a4
    800037a4:	000e089b          	sext.w	a7,t3
    800037a8:	00f806b3          	add	a3,a6,a5
    800037ac:	00e7b023          	sd	a4,0(a5)
    800037b0:	00878793          	addi	a5,a5,8
    800037b4:	fed79ce3          	bne	a5,a3,800037ac <__memset+0xd4>
    800037b8:	ff8e7793          	andi	a5,t3,-8
    800037bc:	0007871b          	sext.w	a4,a5
    800037c0:	01d787bb          	addw	a5,a5,t4
    800037c4:	0ce88e63          	beq	a7,a4,800038a0 <__memset+0x1c8>
    800037c8:	00f50733          	add	a4,a0,a5
    800037cc:	00b70023          	sb	a1,0(a4)
    800037d0:	0017871b          	addiw	a4,a5,1
    800037d4:	0cc77663          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    800037d8:	00e50733          	add	a4,a0,a4
    800037dc:	00b70023          	sb	a1,0(a4)
    800037e0:	0027871b          	addiw	a4,a5,2
    800037e4:	0ac77e63          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    800037e8:	00e50733          	add	a4,a0,a4
    800037ec:	00b70023          	sb	a1,0(a4)
    800037f0:	0037871b          	addiw	a4,a5,3
    800037f4:	0ac77663          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    800037f8:	00e50733          	add	a4,a0,a4
    800037fc:	00b70023          	sb	a1,0(a4)
    80003800:	0047871b          	addiw	a4,a5,4
    80003804:	08c77e63          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    80003808:	00e50733          	add	a4,a0,a4
    8000380c:	00b70023          	sb	a1,0(a4)
    80003810:	0057871b          	addiw	a4,a5,5
    80003814:	08c77663          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    80003818:	00e50733          	add	a4,a0,a4
    8000381c:	00b70023          	sb	a1,0(a4)
    80003820:	0067871b          	addiw	a4,a5,6
    80003824:	06c77e63          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    80003828:	00e50733          	add	a4,a0,a4
    8000382c:	00b70023          	sb	a1,0(a4)
    80003830:	0077871b          	addiw	a4,a5,7
    80003834:	06c77663          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    80003838:	00e50733          	add	a4,a0,a4
    8000383c:	00b70023          	sb	a1,0(a4)
    80003840:	0087871b          	addiw	a4,a5,8
    80003844:	04c77e63          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    80003848:	00e50733          	add	a4,a0,a4
    8000384c:	00b70023          	sb	a1,0(a4)
    80003850:	0097871b          	addiw	a4,a5,9
    80003854:	04c77663          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    80003858:	00e50733          	add	a4,a0,a4
    8000385c:	00b70023          	sb	a1,0(a4)
    80003860:	00a7871b          	addiw	a4,a5,10
    80003864:	02c77e63          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    80003868:	00e50733          	add	a4,a0,a4
    8000386c:	00b70023          	sb	a1,0(a4)
    80003870:	00b7871b          	addiw	a4,a5,11
    80003874:	02c77663          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    80003878:	00e50733          	add	a4,a0,a4
    8000387c:	00b70023          	sb	a1,0(a4)
    80003880:	00c7871b          	addiw	a4,a5,12
    80003884:	00c77e63          	bgeu	a4,a2,800038a0 <__memset+0x1c8>
    80003888:	00e50733          	add	a4,a0,a4
    8000388c:	00b70023          	sb	a1,0(a4)
    80003890:	00d7879b          	addiw	a5,a5,13
    80003894:	00c7f663          	bgeu	a5,a2,800038a0 <__memset+0x1c8>
    80003898:	00f507b3          	add	a5,a0,a5
    8000389c:	00b78023          	sb	a1,0(a5)
    800038a0:	00813403          	ld	s0,8(sp)
    800038a4:	01010113          	addi	sp,sp,16
    800038a8:	00008067          	ret
    800038ac:	00b00693          	li	a3,11
    800038b0:	e55ff06f          	j	80003704 <__memset+0x2c>
    800038b4:	00300e93          	li	t4,3
    800038b8:	ea5ff06f          	j	8000375c <__memset+0x84>
    800038bc:	00100e93          	li	t4,1
    800038c0:	e9dff06f          	j	8000375c <__memset+0x84>
    800038c4:	00000e93          	li	t4,0
    800038c8:	e95ff06f          	j	8000375c <__memset+0x84>
    800038cc:	00000793          	li	a5,0
    800038d0:	ef9ff06f          	j	800037c8 <__memset+0xf0>
    800038d4:	00200e93          	li	t4,2
    800038d8:	e85ff06f          	j	8000375c <__memset+0x84>
    800038dc:	00400e93          	li	t4,4
    800038e0:	e7dff06f          	j	8000375c <__memset+0x84>
    800038e4:	00500e93          	li	t4,5
    800038e8:	e75ff06f          	j	8000375c <__memset+0x84>
    800038ec:	00600e93          	li	t4,6
    800038f0:	e6dff06f          	j	8000375c <__memset+0x84>

00000000800038f4 <__memmove>:
    800038f4:	ff010113          	addi	sp,sp,-16
    800038f8:	00813423          	sd	s0,8(sp)
    800038fc:	01010413          	addi	s0,sp,16
    80003900:	0e060863          	beqz	a2,800039f0 <__memmove+0xfc>
    80003904:	fff6069b          	addiw	a3,a2,-1
    80003908:	0006881b          	sext.w	a6,a3
    8000390c:	0ea5e863          	bltu	a1,a0,800039fc <__memmove+0x108>
    80003910:	00758713          	addi	a4,a1,7
    80003914:	00a5e7b3          	or	a5,a1,a0
    80003918:	40a70733          	sub	a4,a4,a0
    8000391c:	0077f793          	andi	a5,a5,7
    80003920:	00f73713          	sltiu	a4,a4,15
    80003924:	00174713          	xori	a4,a4,1
    80003928:	0017b793          	seqz	a5,a5
    8000392c:	00e7f7b3          	and	a5,a5,a4
    80003930:	10078863          	beqz	a5,80003a40 <__memmove+0x14c>
    80003934:	00900793          	li	a5,9
    80003938:	1107f463          	bgeu	a5,a6,80003a40 <__memmove+0x14c>
    8000393c:	0036581b          	srliw	a6,a2,0x3
    80003940:	fff8081b          	addiw	a6,a6,-1
    80003944:	02081813          	slli	a6,a6,0x20
    80003948:	01d85893          	srli	a7,a6,0x1d
    8000394c:	00858813          	addi	a6,a1,8
    80003950:	00058793          	mv	a5,a1
    80003954:	00050713          	mv	a4,a0
    80003958:	01088833          	add	a6,a7,a6
    8000395c:	0007b883          	ld	a7,0(a5)
    80003960:	00878793          	addi	a5,a5,8
    80003964:	00870713          	addi	a4,a4,8
    80003968:	ff173c23          	sd	a7,-8(a4)
    8000396c:	ff0798e3          	bne	a5,a6,8000395c <__memmove+0x68>
    80003970:	ff867713          	andi	a4,a2,-8
    80003974:	02071793          	slli	a5,a4,0x20
    80003978:	0207d793          	srli	a5,a5,0x20
    8000397c:	00f585b3          	add	a1,a1,a5
    80003980:	40e686bb          	subw	a3,a3,a4
    80003984:	00f507b3          	add	a5,a0,a5
    80003988:	06e60463          	beq	a2,a4,800039f0 <__memmove+0xfc>
    8000398c:	0005c703          	lbu	a4,0(a1)
    80003990:	00e78023          	sb	a4,0(a5)
    80003994:	04068e63          	beqz	a3,800039f0 <__memmove+0xfc>
    80003998:	0015c603          	lbu	a2,1(a1)
    8000399c:	00100713          	li	a4,1
    800039a0:	00c780a3          	sb	a2,1(a5)
    800039a4:	04e68663          	beq	a3,a4,800039f0 <__memmove+0xfc>
    800039a8:	0025c603          	lbu	a2,2(a1)
    800039ac:	00200713          	li	a4,2
    800039b0:	00c78123          	sb	a2,2(a5)
    800039b4:	02e68e63          	beq	a3,a4,800039f0 <__memmove+0xfc>
    800039b8:	0035c603          	lbu	a2,3(a1)
    800039bc:	00300713          	li	a4,3
    800039c0:	00c781a3          	sb	a2,3(a5)
    800039c4:	02e68663          	beq	a3,a4,800039f0 <__memmove+0xfc>
    800039c8:	0045c603          	lbu	a2,4(a1)
    800039cc:	00400713          	li	a4,4
    800039d0:	00c78223          	sb	a2,4(a5)
    800039d4:	00e68e63          	beq	a3,a4,800039f0 <__memmove+0xfc>
    800039d8:	0055c603          	lbu	a2,5(a1)
    800039dc:	00500713          	li	a4,5
    800039e0:	00c782a3          	sb	a2,5(a5)
    800039e4:	00e68663          	beq	a3,a4,800039f0 <__memmove+0xfc>
    800039e8:	0065c703          	lbu	a4,6(a1)
    800039ec:	00e78323          	sb	a4,6(a5)
    800039f0:	00813403          	ld	s0,8(sp)
    800039f4:	01010113          	addi	sp,sp,16
    800039f8:	00008067          	ret
    800039fc:	02061713          	slli	a4,a2,0x20
    80003a00:	02075713          	srli	a4,a4,0x20
    80003a04:	00e587b3          	add	a5,a1,a4
    80003a08:	f0f574e3          	bgeu	a0,a5,80003910 <__memmove+0x1c>
    80003a0c:	02069613          	slli	a2,a3,0x20
    80003a10:	02065613          	srli	a2,a2,0x20
    80003a14:	fff64613          	not	a2,a2
    80003a18:	00e50733          	add	a4,a0,a4
    80003a1c:	00c78633          	add	a2,a5,a2
    80003a20:	fff7c683          	lbu	a3,-1(a5)
    80003a24:	fff78793          	addi	a5,a5,-1
    80003a28:	fff70713          	addi	a4,a4,-1
    80003a2c:	00d70023          	sb	a3,0(a4)
    80003a30:	fec798e3          	bne	a5,a2,80003a20 <__memmove+0x12c>
    80003a34:	00813403          	ld	s0,8(sp)
    80003a38:	01010113          	addi	sp,sp,16
    80003a3c:	00008067          	ret
    80003a40:	02069713          	slli	a4,a3,0x20
    80003a44:	02075713          	srli	a4,a4,0x20
    80003a48:	00170713          	addi	a4,a4,1
    80003a4c:	00e50733          	add	a4,a0,a4
    80003a50:	00050793          	mv	a5,a0
    80003a54:	0005c683          	lbu	a3,0(a1)
    80003a58:	00178793          	addi	a5,a5,1
    80003a5c:	00158593          	addi	a1,a1,1
    80003a60:	fed78fa3          	sb	a3,-1(a5)
    80003a64:	fee798e3          	bne	a5,a4,80003a54 <__memmove+0x160>
    80003a68:	f89ff06f          	j	800039f0 <__memmove+0xfc>

0000000080003a6c <__putc>:
    80003a6c:	fe010113          	addi	sp,sp,-32
    80003a70:	00813823          	sd	s0,16(sp)
    80003a74:	00113c23          	sd	ra,24(sp)
    80003a78:	02010413          	addi	s0,sp,32
    80003a7c:	00050793          	mv	a5,a0
    80003a80:	fef40593          	addi	a1,s0,-17
    80003a84:	00100613          	li	a2,1
    80003a88:	00000513          	li	a0,0
    80003a8c:	fef407a3          	sb	a5,-17(s0)
    80003a90:	fffff097          	auipc	ra,0xfffff
    80003a94:	b3c080e7          	jalr	-1220(ra) # 800025cc <console_write>
    80003a98:	01813083          	ld	ra,24(sp)
    80003a9c:	01013403          	ld	s0,16(sp)
    80003aa0:	02010113          	addi	sp,sp,32
    80003aa4:	00008067          	ret

0000000080003aa8 <__getc>:
    80003aa8:	fe010113          	addi	sp,sp,-32
    80003aac:	00813823          	sd	s0,16(sp)
    80003ab0:	00113c23          	sd	ra,24(sp)
    80003ab4:	02010413          	addi	s0,sp,32
    80003ab8:	fe840593          	addi	a1,s0,-24
    80003abc:	00100613          	li	a2,1
    80003ac0:	00000513          	li	a0,0
    80003ac4:	fffff097          	auipc	ra,0xfffff
    80003ac8:	ae8080e7          	jalr	-1304(ra) # 800025ac <console_read>
    80003acc:	fe844503          	lbu	a0,-24(s0)
    80003ad0:	01813083          	ld	ra,24(sp)
    80003ad4:	01013403          	ld	s0,16(sp)
    80003ad8:	02010113          	addi	sp,sp,32
    80003adc:	00008067          	ret

0000000080003ae0 <console_handler>:
    80003ae0:	fe010113          	addi	sp,sp,-32
    80003ae4:	00813823          	sd	s0,16(sp)
    80003ae8:	00113c23          	sd	ra,24(sp)
    80003aec:	00913423          	sd	s1,8(sp)
    80003af0:	02010413          	addi	s0,sp,32
    80003af4:	14202773          	csrr	a4,scause
    80003af8:	100027f3          	csrr	a5,sstatus
    80003afc:	0027f793          	andi	a5,a5,2
    80003b00:	06079e63          	bnez	a5,80003b7c <console_handler+0x9c>
    80003b04:	00074c63          	bltz	a4,80003b1c <console_handler+0x3c>
    80003b08:	01813083          	ld	ra,24(sp)
    80003b0c:	01013403          	ld	s0,16(sp)
    80003b10:	00813483          	ld	s1,8(sp)
    80003b14:	02010113          	addi	sp,sp,32
    80003b18:	00008067          	ret
    80003b1c:	0ff77713          	andi	a4,a4,255
    80003b20:	00900793          	li	a5,9
    80003b24:	fef712e3          	bne	a4,a5,80003b08 <console_handler+0x28>
    80003b28:	ffffe097          	auipc	ra,0xffffe
    80003b2c:	6dc080e7          	jalr	1756(ra) # 80002204 <plic_claim>
    80003b30:	00a00793          	li	a5,10
    80003b34:	00050493          	mv	s1,a0
    80003b38:	02f50c63          	beq	a0,a5,80003b70 <console_handler+0x90>
    80003b3c:	fc0506e3          	beqz	a0,80003b08 <console_handler+0x28>
    80003b40:	00050593          	mv	a1,a0
    80003b44:	00000517          	auipc	a0,0x0
    80003b48:	73450513          	addi	a0,a0,1844 # 80004278 <CONSOLE_STATUS+0x268>
    80003b4c:	fffff097          	auipc	ra,0xfffff
    80003b50:	afc080e7          	jalr	-1284(ra) # 80002648 <__printf>
    80003b54:	01013403          	ld	s0,16(sp)
    80003b58:	01813083          	ld	ra,24(sp)
    80003b5c:	00048513          	mv	a0,s1
    80003b60:	00813483          	ld	s1,8(sp)
    80003b64:	02010113          	addi	sp,sp,32
    80003b68:	ffffe317          	auipc	t1,0xffffe
    80003b6c:	6d430067          	jr	1748(t1) # 8000223c <plic_complete>
    80003b70:	fffff097          	auipc	ra,0xfffff
    80003b74:	3e0080e7          	jalr	992(ra) # 80002f50 <uartintr>
    80003b78:	fddff06f          	j	80003b54 <console_handler+0x74>
    80003b7c:	00000517          	auipc	a0,0x0
    80003b80:	7fc50513          	addi	a0,a0,2044 # 80004378 <digits+0x78>
    80003b84:	fffff097          	auipc	ra,0xfffff
    80003b88:	a68080e7          	jalr	-1432(ra) # 800025ec <panic>
	...
