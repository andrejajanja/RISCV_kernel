
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	5f813103          	ld	sp,1528(sp) # 800045f8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	255010ef          	jal	ra,80001a70 <start>

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
    80001084:	528000ef          	jal	ra,800015ac <_Z12ecallHandlerv>

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
    if(size == 0) return nullptr; //allocating memory chunks of 0 bytes isn't allowed
    8000111c:	02050e63          	beqz	a0,80001158 <_Z9mem_allocm+0x48>
    size += sizeof(size_t); //this is to account for metadata for size of allocated segment
    80001120:	00850513          	addi	a0,a0,8 # 1008 <_entry-0x7fffeff8>

    if(size < MEM_BLOCK_SIZE){ //recalculating size to be number of memory blocks, instead of bytes
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
    if(size == 0) return nullptr; //allocating memory chunks of 0 bytes isn't allowed
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

0000000080001198 <_Z8userMainv>:
#include "../h/riscv.hpp"
#include "../h/mem.hpp"
#include "../h/syscall_c.hpp"
#include "../h/printing.hpp"

void userMain(){
    80001198:	f7010113          	addi	sp,sp,-144
    8000119c:	08113423          	sd	ra,136(sp)
    800011a0:	08813023          	sd	s0,128(sp)
    800011a4:	06913c23          	sd	s1,120(sp)
    800011a8:	07213823          	sd	s2,112(sp)
    800011ac:	07313423          	sd	s3,104(sp)
    800011b0:	09010413          	addi	s0,sp,144

    printf("Tvoja %s ima %d godina\n", "keva", 16);
    800011b4:	00003797          	auipc	a5,0x3
    800011b8:	e6c78793          	addi	a5,a5,-404 # 80004020 <CONSOLE_STATUS+0x10>
    800011bc:	f6f43c23          	sd	a5,-136(s0)
    char char_arg;
};

//TODO handle if invalid number of arguments in a list is provided
inline void printf(const char* str, ...){
    union Argument* arg_ptr = (union Argument*)&str + 1;
    800011c0:	f8040993          	addi	s3,s0,-128
    800011c4:	0580006f          	j	8000121c <_Z8userMainv+0x84>

    while(*str != '\0'){
        if(*str == '%'){
            str++;
            switch (*str) {
    800011c8:	07500713          	li	a4,117
    800011cc:	04e79063          	bne	a5,a4,8000120c <_Z8userMainv+0x74>
                    break;
                case 'c': //just char
                    printType(arg_ptr->char_arg);
                    break;
                case 'u': //unsigned number - uint64
                    printType(arg_ptr->uint_arg);
    800011d0:	0009b783          	ld	a5,0(s3)
    int digitNum = 0;
    800011d4:	00000493          	li	s1,0
    while(number > 0){
    800011d8:	18078463          	beqz	a5,80001360 <_Z8userMainv+0x1c8>
        digits[digitNum] = number%10;
    800011dc:	00a00693          	li	a3,10
    800011e0:	02d7f633          	remu	a2,a5,a3
    800011e4:	00249713          	slli	a4,s1,0x2
    800011e8:	fd040593          	addi	a1,s0,-48
    800011ec:	00e58733          	add	a4,a1,a4
    800011f0:	fac72823          	sw	a2,-80(a4)
        number/=10;
    800011f4:	02d7d7b3          	divu	a5,a5,a3
        digitNum++;
    800011f8:	0014849b          	addiw	s1,s1,1
    while(number > 0){
    800011fc:	fddff06f          	j	800011d8 <_Z8userMainv+0x40>
        __putc('0');
    80001200:	03000513          	li	a0,48
    80001204:	00003097          	auipc	ra,0x3
    80001208:	928080e7          	jalr	-1752(ra) # 80003b2c <__putc>
                    break;
                default:
                    //TODO Handle errors that can stem from wrong argument type
                    break;
            }
            arg_ptr++;
    8000120c:	00898993          	addi	s3,s3,8
        }else{
            __putc(*str);
        }
        str++;
    80001210:	f7843783          	ld	a5,-136(s0)
    80001214:	00178793          	addi	a5,a5,1
    80001218:	f6f43c23          	sd	a5,-136(s0)
    while(*str != '\0'){
    8000121c:	f7843783          	ld	a5,-136(s0)
    80001220:	0007c503          	lbu	a0,0(a5)
    80001224:	16050c63          	beqz	a0,8000139c <_Z8userMainv+0x204>
        if(*str == '%'){
    80001228:	02500713          	li	a4,37
    8000122c:	16e51263          	bne	a0,a4,80001390 <_Z8userMainv+0x1f8>
            str++;
    80001230:	00178713          	addi	a4,a5,1
    80001234:	f6e43c23          	sd	a4,-136(s0)
            switch (*str) {
    80001238:	0017c783          	lbu	a5,1(a5)
    8000123c:	07300713          	li	a4,115
    80001240:	08e78863          	beq	a5,a4,800012d0 <_Z8userMainv+0x138>
    80001244:	f8f762e3          	bltu	a4,a5,800011c8 <_Z8userMainv+0x30>
    80001248:	06300713          	li	a4,99
    8000124c:	0ae78063          	beq	a5,a4,800012ec <_Z8userMainv+0x154>
    80001250:	06400713          	li	a4,100
    80001254:	fae79ce3          	bne	a5,a4,8000120c <_Z8userMainv+0x74>
                    printType(arg_ptr->int_arg);
    80001258:	0009a903          	lw	s2,0(s3)
    if(number==0){
    8000125c:	fa0902e3          	beqz	s2,80001200 <_Z8userMainv+0x68>
    if(number < 0){
    80001260:	02094863          	bltz	s2,80001290 <_Z8userMainv+0xf8>
    union Argument* arg_ptr = (union Argument*)&str + 1;
    80001264:	00000493          	li	s1,0
    while(number > 0){
    80001268:	03205c63          	blez	s2,800012a0 <_Z8userMainv+0x108>
        digits[digitNum] = number%10;
    8000126c:	00a00713          	li	a4,10
    80001270:	02e966bb          	remw	a3,s2,a4
    80001274:	00249793          	slli	a5,s1,0x2
    80001278:	fd040613          	addi	a2,s0,-48
    8000127c:	00f607b3          	add	a5,a2,a5
    80001280:	fad7a823          	sw	a3,-80(a5)
        number/=10;
    80001284:	02e9493b          	divw	s2,s2,a4
        digitNum++;
    80001288:	0014849b          	addiw	s1,s1,1
    while(number > 0){
    8000128c:	fddff06f          	j	80001268 <_Z8userMainv+0xd0>
        __putc('-');
    80001290:	02d00513          	li	a0,45
    80001294:	00003097          	auipc	ra,0x3
    80001298:	898080e7          	jalr	-1896(ra) # 80003b2c <__putc>
    8000129c:	fc9ff06f          	j	80001264 <_Z8userMainv+0xcc>
    digitNum--;
    800012a0:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    800012a4:	f604c4e3          	bltz	s1,8000120c <_Z8userMainv+0x74>
        __putc((char)(48+digits[digitNum]));
    800012a8:	00249793          	slli	a5,s1,0x2
    800012ac:	fd040713          	addi	a4,s0,-48
    800012b0:	00f707b3          	add	a5,a4,a5
    800012b4:	fb07a503          	lw	a0,-80(a5)
    800012b8:	0305051b          	addiw	a0,a0,48
    800012bc:	0ff57513          	andi	a0,a0,255
    800012c0:	00003097          	auipc	ra,0x3
    800012c4:	86c080e7          	jalr	-1940(ra) # 80003b2c <__putc>
        digitNum--;
    800012c8:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    800012cc:	fd9ff06f          	j	800012a4 <_Z8userMainv+0x10c>
                    printType(arg_ptr->char_arr_arg);
    800012d0:	0009b483          	ld	s1,0(s3)
    while (*str != '\0'){
    800012d4:	0004c503          	lbu	a0,0(s1)
    800012d8:	f2050ae3          	beqz	a0,8000120c <_Z8userMainv+0x74>
        __putc(*str);
    800012dc:	00003097          	auipc	ra,0x3
    800012e0:	850080e7          	jalr	-1968(ra) # 80003b2c <__putc>
        str++;
    800012e4:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    800012e8:	fedff06f          	j	800012d4 <_Z8userMainv+0x13c>
                    printType(arg_ptr->char_arg);
    800012ec:	0009c783          	lbu	a5,0(s3)
    if(number==0){
    800012f0:	02078863          	beqz	a5,80001320 <_Z8userMainv+0x188>
    800012f4:	00000493          	li	s1,0
    while(number > 0){
    800012f8:	02f05c63          	blez	a5,80001330 <_Z8userMainv+0x198>
        digits[digitNum] = number%10;
    800012fc:	00a00693          	li	a3,10
    80001300:	02d7e63b          	remw	a2,a5,a3
    80001304:	00249713          	slli	a4,s1,0x2
    80001308:	fd040593          	addi	a1,s0,-48
    8000130c:	00e58733          	add	a4,a1,a4
    80001310:	fac72823          	sw	a2,-80(a4)
        number/=10;
    80001314:	02d7c7bb          	divw	a5,a5,a3
        digitNum++;
    80001318:	0014849b          	addiw	s1,s1,1
    while(number > 0){
    8000131c:	fddff06f          	j	800012f8 <_Z8userMainv+0x160>
        __putc('0');
    80001320:	03000513          	li	a0,48
    80001324:	00003097          	auipc	ra,0x3
    80001328:	808080e7          	jalr	-2040(ra) # 80003b2c <__putc>
        return;
    8000132c:	ee1ff06f          	j	8000120c <_Z8userMainv+0x74>
    digitNum--;
    80001330:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    80001334:	ec04cce3          	bltz	s1,8000120c <_Z8userMainv+0x74>
        __putc((char)(48+digits[digitNum]));
    80001338:	00249793          	slli	a5,s1,0x2
    8000133c:	fd040713          	addi	a4,s0,-48
    80001340:	00f707b3          	add	a5,a4,a5
    80001344:	fb07a503          	lw	a0,-80(a5)
    80001348:	0305051b          	addiw	a0,a0,48
    8000134c:	0ff57513          	andi	a0,a0,255
    80001350:	00002097          	auipc	ra,0x2
    80001354:	7dc080e7          	jalr	2012(ra) # 80003b2c <__putc>
        digitNum--;
    80001358:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    8000135c:	fd9ff06f          	j	80001334 <_Z8userMainv+0x19c>
    digitNum--;
    80001360:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    80001364:	ea04c4e3          	bltz	s1,8000120c <_Z8userMainv+0x74>
        __putc((char)(48+digits[digitNum]));
    80001368:	00249793          	slli	a5,s1,0x2
    8000136c:	fd040713          	addi	a4,s0,-48
    80001370:	00f707b3          	add	a5,a4,a5
    80001374:	fb07a503          	lw	a0,-80(a5)
    80001378:	0305051b          	addiw	a0,a0,48
    8000137c:	0ff57513          	andi	a0,a0,255
    80001380:	00002097          	auipc	ra,0x2
    80001384:	7ac080e7          	jalr	1964(ra) # 80003b2c <__putc>
        digitNum--;
    80001388:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    8000138c:	fd9ff06f          	j	80001364 <_Z8userMainv+0x1cc>
            __putc(*str);
    80001390:	00002097          	auipc	ra,0x2
    80001394:	79c080e7          	jalr	1948(ra) # 80003b2c <__putc>
    80001398:	e79ff06f          	j	80001210 <_Z8userMainv+0x78>

    return;
}
    8000139c:	08813083          	ld	ra,136(sp)
    800013a0:	08013403          	ld	s0,128(sp)
    800013a4:	07813483          	ld	s1,120(sp)
    800013a8:	07013903          	ld	s2,112(sp)
    800013ac:	06813983          	ld	s3,104(sp)
    800013b0:	09010113          	addi	sp,sp,144
    800013b4:	00008067          	ret

00000000800013b8 <main>:

int main(){
    800013b8:	ff010113          	addi	sp,sp,-16
    800013bc:	00113423          	sd	ra,8(sp)
    800013c0:	00813023          	sd	s0,0(sp)
    800013c4:	01010413          	addi	s0,sp,16
    //initialize system data structures and register values
    initializeSystemRegisters();
    800013c8:	00000097          	auipc	ra,0x0
    800013cc:	034080e7          	jalr	52(ra) # 800013fc <_Z25initializeSystemRegistersv>
    MemoryAllocator::initialize();
    800013d0:	00000097          	auipc	ra,0x0
    800013d4:	3b8080e7          	jalr	952(ra) # 80001788 <_ZN15MemoryAllocator10initializeEv>

    userMain();
    800013d8:	00000097          	auipc	ra,0x0
    800013dc:	dc0080e7          	jalr	-576(ra) # 80001198 <_Z8userMainv>

    stopEmulator();
    800013e0:	00000097          	auipc	ra,0x0
    800013e4:	040080e7          	jalr	64(ra) # 80001420 <_Z12stopEmulatorv>
    return 0;
    800013e8:	00000513          	li	a0,0
    800013ec:	00813083          	ld	ra,8(sp)
    800013f0:	00013403          	ld	s0,0(sp)
    800013f4:	01010113          	addi	sp,sp,16
    800013f8:	00008067          	ret

00000000800013fc <_Z25initializeSystemRegistersv>:

#include "../h/riscv.hpp"
#include "../h/printing.hpp"
#include "../h/mem.hpp"

void initializeSystemRegisters(){
    800013fc:	ff010113          	addi	sp,sp,-16
    80001400:	00813423          	sd	s0,8(sp)
    80001404:	01010413          	addi	s0,sp,16
    writeStvec((uint64)&ecallWrapper);
    80001408:	00003797          	auipc	a5,0x3
    8000140c:	1f87b783          	ld	a5,504(a5) # 80004600 <_GLOBAL_OFFSET_TABLE_+0x18>
    return value;
}

//write ops
inline void writeStvec(uint64 value){
    asm("csrw stvec, %0;": :"r"(value));
    80001410:	10579073          	csrw	stvec,a5
    //asm("la t0, _Z12ecallWrapperv;"
    //"csrw stvec, t0;");
}
    80001414:	00813403          	ld	s0,8(sp)
    80001418:	01010113          	addi	sp,sp,16
    8000141c:	00008067          	ret

0000000080001420 <_Z12stopEmulatorv>:

void stopEmulator(){
    80001420:	ff010113          	addi	sp,sp,-16
    80001424:	00813423          	sd	s0,8(sp)
    80001428:	01010413          	addi	s0,sp,16
    //defined in project file
    asm("la t0, 0x100000;" //adress
        "la t1, 0x5555;" //value
        "sw t1, 0(t0);");
    8000142c:	001002b7          	lui	t0,0x100
    80001430:	00005337          	lui	t1,0x5
    80001434:	5553031b          	addiw	t1,t1,1365
    80001438:	0062a023          	sw	t1,0(t0) # 100000 <_entry-0x7ff00000>
}
    8000143c:	00813403          	ld	s0,8(sp)
    80001440:	01010113          	addi	sp,sp,16
    80001444:	00008067          	ret

0000000080001448 <_Z12timerHandlermm>:

void timerHandler(uint64 sepc, uint64 sstatus){
    80001448:	fe010113          	addi	sp,sp,-32
    8000144c:	00113c23          	sd	ra,24(sp)
    80001450:	00813823          	sd	s0,16(sp)
    80001454:	00913423          	sd	s1,8(sp)
    80001458:	01213023          	sd	s2,0(sp)
    8000145c:	02010413          	addi	s0,sp,32
    80001460:	00050913          	mv	s2,a0
    80001464:	00003497          	auipc	s1,0x3
    80001468:	bd448493          	addi	s1,s1,-1068 # 80004038 <CONSOLE_STATUS+0x28>
    while (*str != '\0'){
    8000146c:	0004c503          	lbu	a0,0(s1)
    80001470:	00050a63          	beqz	a0,80001484 <_Z12timerHandlermm+0x3c>
        __putc(*str);
    80001474:	00002097          	auipc	ra,0x2
    80001478:	6b8080e7          	jalr	1720(ra) # 80003b2c <__putc>
        str++;
    8000147c:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001480:	fedff06f          	j	8000146c <_Z12timerHandlermm+0x24>
inline void writeA1(uint64 value){
    asm("mv a1, %0;": : "r"(value));
}

inline void writeSepc(uint64 value){
    asm("csrw sepc, %0;": : "r"(value));
    80001484:	14191073          	csrw	sepc,s2
    //trigger context switch or something
    printType("TIMER SIGNAL");
    writeSepc(sepc);
    writeSstatus(sstatus);
}
    80001488:	01813083          	ld	ra,24(sp)
    8000148c:	01013403          	ld	s0,16(sp)
    80001490:	00813483          	ld	s1,8(sp)
    80001494:	00013903          	ld	s2,0(sp)
    80001498:	02010113          	addi	sp,sp,32
    8000149c:	00008067          	ret

00000000800014a0 <_Z17systemCallHandlermm>:

void systemCallHandler(uint64 a0, uint64 a1){
    800014a0:	f9010113          	addi	sp,sp,-112
    800014a4:	06113423          	sd	ra,104(sp)
    800014a8:	06813023          	sd	s0,96(sp)
    800014ac:	04913c23          	sd	s1,88(sp)
    800014b0:	05213823          	sd	s2,80(sp)
    800014b4:	07010413          	addi	s0,sp,112
    800014b8:	00050913          	mv	s2,a0
    800014bc:	00058513          	mv	a0,a1
    uint64 opCode = a0;
    uint64 arg = a1;
    uint64 retValue;

    switch (opCode) {
    800014c0:	00100793          	li	a5,1
    800014c4:	02f90663          	beq	s2,a5,800014f0 <_Z17systemCallHandlermm+0x50>
    800014c8:	00200793          	li	a5,2
    800014cc:	02f90a63          	beq	s2,a5,80001500 <_Z17systemCallHandlermm+0x60>
    800014d0:	00003497          	auipc	s1,0x3
    800014d4:	b7848493          	addi	s1,s1,-1160 # 80004048 <CONSOLE_STATUS+0x38>
    800014d8:	0004c503          	lbu	a0,0(s1)
    800014dc:	02050a63          	beqz	a0,80001510 <_Z17systemCallHandlermm+0x70>
        __putc(*str);
    800014e0:	00002097          	auipc	ra,0x2
    800014e4:	64c080e7          	jalr	1612(ra) # 80003b2c <__putc>
        str++;
    800014e8:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    800014ec:	fedff06f          	j	800014d8 <_Z17systemCallHandlermm+0x38>
        case 0x01: //mem_alloc
            retValue = (uint64)MemoryAllocator::mem_allocate(arg);
    800014f0:	00000097          	auipc	ra,0x0
    800014f4:	2f4080e7          	jalr	756(ra) # 800017e4 <_ZN15MemoryAllocator12mem_allocateEm>
    asm("mv a0, %0;": : "r"(value));
    800014f8:	00050513          	mv	a0,a0
}
    800014fc:	0980006f          	j	80001594 <_Z17systemCallHandlermm+0xf4>
            writeA0(retValue);
            break;
        case 0x02: //mem_free
            retValue = (uint64)MemoryAllocator::mem_free((void*)arg);
    80001500:	00000097          	auipc	ra,0x0
    80001504:	41c080e7          	jalr	1052(ra) # 8000191c <_ZN15MemoryAllocator8mem_freeEPv>
    asm("mv a0, %0;": : "r"(value));
    80001508:	00050513          	mv	a0,a0
}
    8000150c:	0880006f          	j	80001594 <_Z17systemCallHandlermm+0xf4>
    int digitNum = 0;
    80001510:	00000493          	li	s1,0
    while(number > 0){
    80001514:	02090463          	beqz	s2,8000153c <_Z17systemCallHandlermm+0x9c>
        digits[digitNum] = number%10;
    80001518:	00a00713          	li	a4,10
    8000151c:	02e976b3          	remu	a3,s2,a4
    80001520:	00249793          	slli	a5,s1,0x2
    80001524:	fe040613          	addi	a2,s0,-32
    80001528:	00f607b3          	add	a5,a2,a5
    8000152c:	fad7a823          	sw	a3,-80(a5)
        number/=10;
    80001530:	02e95933          	divu	s2,s2,a4
        digitNum++;
    80001534:	0014849b          	addiw	s1,s1,1
    while(number > 0){
    80001538:	fddff06f          	j	80001514 <_Z17systemCallHandlermm+0x74>
    digitNum--;
    8000153c:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    80001540:	0204c663          	bltz	s1,8000156c <_Z17systemCallHandlermm+0xcc>
        __putc((char)(48+digits[digitNum]));
    80001544:	00249793          	slli	a5,s1,0x2
    80001548:	fe040713          	addi	a4,s0,-32
    8000154c:	00f707b3          	add	a5,a4,a5
    80001550:	fb07a503          	lw	a0,-80(a5)
    80001554:	0305051b          	addiw	a0,a0,48
    80001558:	0ff57513          	andi	a0,a0,255
    8000155c:	00002097          	auipc	ra,0x2
    80001560:	5d0080e7          	jalr	1488(ra) # 80003b2c <__putc>
        digitNum--;
    80001564:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    80001568:	fd9ff06f          	j	80001540 <_Z17systemCallHandlermm+0xa0>
    return;
    8000156c:	00003497          	auipc	s1,0x3
    80001570:	b1c48493          	addi	s1,s1,-1252 # 80004088 <CONSOLE_STATUS+0x78>
    80001574:	0100006f          	j	80001584 <_Z17systemCallHandlermm+0xe4>
        __putc(*str);
    80001578:	00002097          	auipc	ra,0x2
    8000157c:	5b4080e7          	jalr	1460(ra) # 80003b2c <__putc>
        str++;
    80001580:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001584:	0004c503          	lbu	a0,0(s1)
    80001588:	fe0518e3          	bnez	a0,80001578 <_Z17systemCallHandlermm+0xd8>
        default: //some random code, that should be handler as error
            //this is error case, because no other case should go here, print something
            printType("OS DETECTED ERROR: Unhandled opCode value for system call: '");
            printType(opCode);
            printType("' ,shutting down...\n");
            stopEmulator();
    8000158c:	00000097          	auipc	ra,0x0
    80001590:	e94080e7          	jalr	-364(ra) # 80001420 <_Z12stopEmulatorv>
            break;
    };
}
    80001594:	06813083          	ld	ra,104(sp)
    80001598:	06013403          	ld	s0,96(sp)
    8000159c:	05813483          	ld	s1,88(sp)
    800015a0:	05013903          	ld	s2,80(sp)
    800015a4:	07010113          	addi	sp,sp,112
    800015a8:	00008067          	ret

00000000800015ac <_Z12ecallHandlerv>:

void ecallHandler(){
    800015ac:	f8010113          	addi	sp,sp,-128
    800015b0:	06113c23          	sd	ra,120(sp)
    800015b4:	06813823          	sd	s0,112(sp)
    800015b8:	06913423          	sd	s1,104(sp)
    800015bc:	07213023          	sd	s2,96(sp)
    800015c0:	05313c23          	sd	s3,88(sp)
    800015c4:	08010413          	addi	s0,sp,128
    asm("mv %0, a0;": "=r"(value));
    800015c8:	00050513          	mv	a0,a0
    asm("mv %0, a1;": "=r"(value));
    800015cc:	00058713          	mv	a4,a1
    asm("csrr %0, scause;": "=r"(value));
    800015d0:	142024f3          	csrr	s1,scause
    asm("csrr %0, sepc;": "=r"(value));
    800015d4:	14102973          	csrr	s2,sepc
    uint64 a0 = readA0();
    uint64 a1 = readA1();
    uint64 scause = readScause();
    uint64 sepc = readSepc()+4;
    800015d8:	00490913          	addi	s2,s2,4
    asm("csrr %0, sstatus;": "=r"(value));
    800015dc:	100025f3          	csrr	a1,sstatus
    uint64 sstatus = readSstatus();

    switch (scause) {
    800015e0:	00700793          	li	a5,7
    800015e4:	0cf48463          	beq	s1,a5,800016ac <_Z12ecallHandlerv+0x100>
    800015e8:	0297f663          	bgeu	a5,s1,80001614 <_Z12ecallHandlerv+0x68>
    800015ec:	00900793          	li	a5,9
    800015f0:	06f48a63          	beq	s1,a5,80001664 <_Z12ecallHandlerv+0xb8>
    800015f4:	fff00793          	li	a5,-1
    800015f8:	03f79793          	slli	a5,a5,0x3f
    800015fc:	00178793          	addi	a5,a5,1
    80001600:	0cf49c63          	bne	s1,a5,800016d8 <_Z12ecallHandlerv+0x12c>
        case 0x8000000000000001UL:
            timerHandler(sepc, sstatus);
    80001604:	00090513          	mv	a0,s2
    80001608:	00000097          	auipc	ra,0x0
    8000160c:	e40080e7          	jalr	-448(ra) # 80001448 <_Z12timerHandlermm>
            break;
    80001610:	1580006f          	j	80001768 <_Z12ecallHandlerv+0x1bc>
    switch (scause) {
    80001614:	00200793          	li	a5,2
    80001618:	04f48e63          	beq	s1,a5,80001674 <_Z12ecallHandlerv+0xc8>
    8000161c:	00500793          	li	a5,5
    80001620:	02f49263          	bne	s1,a5,80001644 <_Z12ecallHandlerv+0x98>
    80001624:	00003497          	auipc	s1,0x3
    80001628:	abc48493          	addi	s1,s1,-1348 # 800040e0 <CONSOLE_STATUS+0xd0>
    8000162c:	0004c503          	lbu	a0,0(s1)
    80001630:	06050863          	beqz	a0,800016a0 <_Z12ecallHandlerv+0xf4>
        __putc(*str);
    80001634:	00002097          	auipc	ra,0x2
    80001638:	4f8080e7          	jalr	1272(ra) # 80003b2c <__putc>
        str++;
    8000163c:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001640:	fedff06f          	j	8000162c <_Z12ecallHandlerv+0x80>
    80001644:	00003997          	auipc	s3,0x3
    80001648:	b2c98993          	addi	s3,s3,-1236 # 80004170 <CONSOLE_STATUS+0x160>
    8000164c:	0009c503          	lbu	a0,0(s3)
    80001650:	08050a63          	beqz	a0,800016e4 <_Z12ecallHandlerv+0x138>
        __putc(*str);
    80001654:	00002097          	auipc	ra,0x2
    80001658:	4d8080e7          	jalr	1240(ra) # 80003b2c <__putc>
        str++;
    8000165c:	00198993          	addi	s3,s3,1
    while (*str != '\0'){
    80001660:	fedff06f          	j	8000164c <_Z12ecallHandlerv+0xa0>
        case 0x0000000000000008UL | 0x0000000000000009UL:
            systemCallHandler(a0,a1);
    80001664:	00070593          	mv	a1,a4
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	e38080e7          	jalr	-456(ra) # 800014a0 <_Z17systemCallHandlermm>
            break;
    80001670:	0f80006f          	j	80001768 <_Z12ecallHandlerv+0x1bc>
    switch (scause) {
    80001674:	00003497          	auipc	s1,0x3
    80001678:	a2c48493          	addi	s1,s1,-1492 # 800040a0 <CONSOLE_STATUS+0x90>
    8000167c:	0004c503          	lbu	a0,0(s1)
    80001680:	00050a63          	beqz	a0,80001694 <_Z12ecallHandlerv+0xe8>
        __putc(*str);
    80001684:	00002097          	auipc	ra,0x2
    80001688:	4a8080e7          	jalr	1192(ra) # 80003b2c <__putc>
        str++;
    8000168c:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    80001690:	fedff06f          	j	8000167c <_Z12ecallHandlerv+0xd0>
        case 0x0000000000000002UL:
            printType("OS DETECTED ERROR: Illegal instruction\nShutting down...\n");
            stopEmulator();
    80001694:	00000097          	auipc	ra,0x0
    80001698:	d8c080e7          	jalr	-628(ra) # 80001420 <_Z12stopEmulatorv>
            break;
    8000169c:	0cc0006f          	j	80001768 <_Z12ecallHandlerv+0x1bc>
        case 0x0000000000000005UL:
            printType("OS DETECTED ERROR: reading from forbidden address\nShutting down...\n");
            stopEmulator();
    800016a0:	00000097          	auipc	ra,0x0
    800016a4:	d80080e7          	jalr	-640(ra) # 80001420 <_Z12stopEmulatorv>
            break;
    800016a8:	0c00006f          	j	80001768 <_Z12ecallHandlerv+0x1bc>
    switch (scause) {
    800016ac:	00003497          	auipc	s1,0x3
    800016b0:	a7c48493          	addi	s1,s1,-1412 # 80004128 <CONSOLE_STATUS+0x118>
    800016b4:	0004c503          	lbu	a0,0(s1)
    800016b8:	00050a63          	beqz	a0,800016cc <_Z12ecallHandlerv+0x120>
        __putc(*str);
    800016bc:	00002097          	auipc	ra,0x2
    800016c0:	470080e7          	jalr	1136(ra) # 80003b2c <__putc>
        str++;
    800016c4:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    800016c8:	fedff06f          	j	800016b4 <_Z12ecallHandlerv+0x108>
        case 0x0000000000000007UL:
            printType("OS DETECTED ERROR: writing to forbidden address\nShutting down...\n");
            stopEmulator();
    800016cc:	00000097          	auipc	ra,0x0
    800016d0:	d54080e7          	jalr	-684(ra) # 80001420 <_Z12stopEmulatorv>
            break;
    800016d4:	0940006f          	j	80001768 <_Z12ecallHandlerv+0x1bc>
    switch (scause) {
    800016d8:	00003997          	auipc	s3,0x3
    800016dc:	a9898993          	addi	s3,s3,-1384 # 80004170 <CONSOLE_STATUS+0x160>
    800016e0:	f6dff06f          	j	8000164c <_Z12ecallHandlerv+0xa0>
    int digitNum = 0;
    800016e4:	00000793          	li	a5,0
    while(number > 0){
    800016e8:	02048463          	beqz	s1,80001710 <_Z12ecallHandlerv+0x164>
        digits[digitNum] = number%10;
    800016ec:	00a00693          	li	a3,10
    800016f0:	02d4f633          	remu	a2,s1,a3
    800016f4:	00279713          	slli	a4,a5,0x2
    800016f8:	fd040593          	addi	a1,s0,-48
    800016fc:	00e58733          	add	a4,a1,a4
    80001700:	fac72823          	sw	a2,-80(a4)
        number/=10;
    80001704:	02d4d4b3          	divu	s1,s1,a3
        digitNum++;
    80001708:	0017879b          	addiw	a5,a5,1
    while(number > 0){
    8000170c:	fddff06f          	j	800016e8 <_Z12ecallHandlerv+0x13c>
    digitNum--;
    80001710:	fff7849b          	addiw	s1,a5,-1
    while(digitNum>-1){
    80001714:	0204c663          	bltz	s1,80001740 <_Z12ecallHandlerv+0x194>
        __putc((char)(48+digits[digitNum]));
    80001718:	00249793          	slli	a5,s1,0x2
    8000171c:	fd040713          	addi	a4,s0,-48
    80001720:	00f707b3          	add	a5,a4,a5
    80001724:	fb07a503          	lw	a0,-80(a5)
    80001728:	0305051b          	addiw	a0,a0,48
    8000172c:	0ff57513          	andi	a0,a0,255
    80001730:	00002097          	auipc	ra,0x2
    80001734:	3fc080e7          	jalr	1020(ra) # 80003b2c <__putc>
        digitNum--;
    80001738:	fff4849b          	addiw	s1,s1,-1
    while(digitNum>-1){
    8000173c:	fd9ff06f          	j	80001714 <_Z12ecallHandlerv+0x168>
    return;
    80001740:	00003497          	auipc	s1,0x3
    80001744:	a6048493          	addi	s1,s1,-1440 # 800041a0 <CONSOLE_STATUS+0x190>
    while (*str != '\0'){
    80001748:	0004c503          	lbu	a0,0(s1)
    8000174c:	00050a63          	beqz	a0,80001760 <_Z12ecallHandlerv+0x1b4>
        __putc(*str);
    80001750:	00002097          	auipc	ra,0x2
    80001754:	3dc080e7          	jalr	988(ra) # 80003b2c <__putc>
        str++;
    80001758:	00148493          	addi	s1,s1,1
    while (*str != '\0'){
    8000175c:	fedff06f          	j	80001748 <_Z12ecallHandlerv+0x19c>
        default:
            //this is error case, because no other case should go here, print something
            printType("OS DETECTED ERROR: Unhandled scause value: '");
            printType(scause);
            printType("'\nShutting down...\n");
            stopEmulator();
    80001760:	00000097          	auipc	ra,0x0
    80001764:	cc0080e7          	jalr	-832(ra) # 80001420 <_Z12stopEmulatorv>
    asm("csrw sepc, %0;": : "r"(value));
    80001768:	14191073          	csrw	sepc,s2
    }

    writeSepc(sepc);
    writeSstatus(sstatus);
    return;
    8000176c:	07813083          	ld	ra,120(sp)
    80001770:	07013403          	ld	s0,112(sp)
    80001774:	06813483          	ld	s1,104(sp)
    80001778:	06013903          	ld	s2,96(sp)
    8000177c:	05813983          	ld	s3,88(sp)
    80001780:	08010113          	addi	sp,sp,128
    80001784:	00008067          	ret

0000000080001788 <_ZN15MemoryAllocator10initializeEv>:

MemSegment* MemoryAllocator::segmentsHead = nullptr;
uint32 MemoryAllocator::totalSize = 0;
uint32 MemoryAllocator::segmentsNumber = 1;

void MemoryAllocator::initialize(){
    80001788:	ff010113          	addi	sp,sp,-16
    8000178c:	00813423          	sd	s0,8(sp)
    80001790:	01010413          	addi	s0,sp,16
    MemoryAllocator::segmentsHead = (MemSegment*)(HEAP_START_ADDR);
    80001794:	00003617          	auipc	a2,0x3
    80001798:	e5c63603          	ld	a2,-420(a2) # 800045f0 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000179c:	00063783          	ld	a5,0(a2)
    800017a0:	00003717          	auipc	a4,0x3
    800017a4:	eb070713          	addi	a4,a4,-336 # 80004650 <_ZN15MemoryAllocator12segmentsHeadE>
    800017a8:	00f73023          	sd	a5,0(a4)
    segmentsHead->left = nullptr;
    800017ac:	0007b023          	sd	zero,0(a5)
    segmentsHead->right = nullptr;
    800017b0:	00073683          	ld	a3,0(a4)
    800017b4:	0006b423          	sd	zero,8(a3)
    //size of every block is in number of memory blocks, not bytes
    segmentsHead->size = size_t(uint64(HEAP_END_ADDR) - uint64(HEAP_START_ADDR))/MEM_BLOCK_SIZE;
    800017b8:	00003797          	auipc	a5,0x3
    800017bc:	e507b783          	ld	a5,-432(a5) # 80004608 <_GLOBAL_OFFSET_TABLE_+0x20>
    800017c0:	0007b783          	ld	a5,0(a5)
    800017c4:	00063603          	ld	a2,0(a2)
    800017c8:	40c787b3          	sub	a5,a5,a2
    800017cc:	0067d793          	srli	a5,a5,0x6
    800017d0:	00f6b823          	sd	a5,16(a3)
    totalSize = MemoryAllocator::segmentsHead->size;
    800017d4:	00f72423          	sw	a5,8(a4)
}
    800017d8:	00813403          	ld	s0,8(sp)
    800017dc:	01010113          	addi	sp,sp,16
    800017e0:	00008067          	ret

00000000800017e4 <_ZN15MemoryAllocator12mem_allocateEm>:

//TODO TEST: check for bugs in this implementation - mem_allocate
void* MemoryAllocator::mem_allocate(size_t size) {
    800017e4:	ff010113          	addi	sp,sp,-16
    800017e8:	00813423          	sd	s0,8(sp)
    800017ec:	01010413          	addi	s0,sp,16
    //doing some checks if it should even try to allocate space
    if(segmentsNumber == 0 || size > totalSize) return nullptr;
    800017f0:	00003697          	auipc	a3,0x3
    800017f4:	df06a683          	lw	a3,-528(a3) # 800045e0 <_ZN15MemoryAllocator14segmentsNumberE>
    800017f8:	10068a63          	beqz	a3,8000190c <_ZN15MemoryAllocator12mem_allocateEm+0x128>
    800017fc:	00050713          	mv	a4,a0
    80001800:	00003617          	auipc	a2,0x3
    80001804:	e5862603          	lw	a2,-424(a2) # 80004658 <_ZN15MemoryAllocator9totalSizeE>
    80001808:	02061793          	slli	a5,a2,0x20
    8000180c:	0207d793          	srli	a5,a5,0x20
    80001810:	10a7e263          	bltu	a5,a0,80001914 <_ZN15MemoryAllocator12mem_allocateEm+0x130>

    //TODO in the future, upgrade 'first fit' to some exotic algorithm with binary tree

    MemSegment* temp = segmentsHead;
    80001814:	00003517          	auipc	a0,0x3
    80001818:	e3c53503          	ld	a0,-452(a0) # 80004650 <_ZN15MemoryAllocator12segmentsHeadE>
    8000181c:	0640006f          	j	80001880 <_ZN15MemoryAllocator12mem_allocateEm+0x9c>
    while(temp){
        if(size == temp->size){
            totalSize-=size; segmentsNumber--;
    80001820:	40e6063b          	subw	a2,a2,a4
    80001824:	00003797          	auipc	a5,0x3
    80001828:	e2c7aa23          	sw	a2,-460(a5) # 80004658 <_ZN15MemoryAllocator9totalSizeE>
    8000182c:	fff6869b          	addiw	a3,a3,-1
    80001830:	00003797          	auipc	a5,0x3
    80001834:	dad7a823          	sw	a3,-592(a5) # 800045e0 <_ZN15MemoryAllocator14segmentsNumberE>

            if(temp->left) temp->left->right = temp->right;
    80001838:	00053783          	ld	a5,0(a0)
    8000183c:	00078663          	beqz	a5,80001848 <_ZN15MemoryAllocator12mem_allocateEm+0x64>
    80001840:	00853683          	ld	a3,8(a0)
    80001844:	00d7b423          	sd	a3,8(a5)
            if(temp->right) temp->right->left = temp->left;
    80001848:	00853783          	ld	a5,8(a0)
    8000184c:	00078663          	beqz	a5,80001858 <_ZN15MemoryAllocator12mem_allocateEm+0x74>
    80001850:	00053683          	ld	a3,0(a0)
    80001854:	00d7b023          	sd	a3,0(a5)

            *((size_t*)temp) = size; //this is size in segments stored in metadata
    80001858:	00e53023          	sd	a4,0(a0)
            temp += sizeof(size_t); //shift pointer to account for metadata
    8000185c:	0c050513          	addi	a0,a0,192
        temp = temp->right;
    }

    //segment of sufficient size wasn't found, thus returning null for failed allocation
    return nullptr;
}
    80001860:	00813403          	ld	s0,8(sp)
    80001864:	01010113          	addi	sp,sp,16
    80001868:	00008067          	ret
            if(temp == segmentsHead) segmentsHead += offset;
    8000186c:	00f687b3          	add	a5,a3,a5
    80001870:	00003697          	auipc	a3,0x3
    80001874:	def6b023          	sd	a5,-544(a3) # 80004650 <_ZN15MemoryAllocator12segmentsHeadE>
    80001878:	0880006f          	j	80001900 <_ZN15MemoryAllocator12mem_allocateEm+0x11c>
        temp = temp->right;
    8000187c:	00853503          	ld	a0,8(a0)
    while(temp){
    80001880:	fe0500e3          	beqz	a0,80001860 <_ZN15MemoryAllocator12mem_allocateEm+0x7c>
        if(size == temp->size){
    80001884:	01053783          	ld	a5,16(a0)
    80001888:	f8e78ce3          	beq	a5,a4,80001820 <_ZN15MemoryAllocator12mem_allocateEm+0x3c>
        if(size < temp->size){
    8000188c:	fef778e3          	bgeu	a4,a5,8000187c <_ZN15MemoryAllocator12mem_allocateEm+0x98>
            if(temp->left) temp->left->right = temp + offset;
    80001890:	00053683          	ld	a3,0(a0)
    80001894:	00068c63          	beqz	a3,800018ac <_ZN15MemoryAllocator12mem_allocateEm+0xc8>
    80001898:	00171793          	slli	a5,a4,0x1
    8000189c:	00e787b3          	add	a5,a5,a4
    800018a0:	00979793          	slli	a5,a5,0x9
    800018a4:	00f507b3          	add	a5,a0,a5
    800018a8:	00f6b423          	sd	a5,8(a3)
            if(temp->right) temp->right->left = temp + offset;
    800018ac:	00853683          	ld	a3,8(a0)
    800018b0:	00068c63          	beqz	a3,800018c8 <_ZN15MemoryAllocator12mem_allocateEm+0xe4>
    800018b4:	00171793          	slli	a5,a4,0x1
    800018b8:	00e787b3          	add	a5,a5,a4
    800018bc:	00979793          	slli	a5,a5,0x9
    800018c0:	00f507b3          	add	a5,a0,a5
    800018c4:	00f6b023          	sd	a5,0(a3)
            (temp + offset)->left = temp->left;
    800018c8:	00171793          	slli	a5,a4,0x1
    800018cc:	00e787b3          	add	a5,a5,a4
    800018d0:	00979793          	slli	a5,a5,0x9
    800018d4:	00f506b3          	add	a3,a0,a5
    800018d8:	00053603          	ld	a2,0(a0)
    800018dc:	00c6b023          	sd	a2,0(a3)
            (temp + offset)->right = temp->right;
    800018e0:	00853603          	ld	a2,8(a0)
    800018e4:	00c6b423          	sd	a2,8(a3)
            (temp + offset)->size = temp->size-size;
    800018e8:	01053603          	ld	a2,16(a0)
    800018ec:	40e60633          	sub	a2,a2,a4
    800018f0:	00c6b823          	sd	a2,16(a3)
            if(temp == segmentsHead) segmentsHead += offset;
    800018f4:	00003697          	auipc	a3,0x3
    800018f8:	d5c6b683          	ld	a3,-676(a3) # 80004650 <_ZN15MemoryAllocator12segmentsHeadE>
    800018fc:	f6a688e3          	beq	a3,a0,8000186c <_ZN15MemoryAllocator12mem_allocateEm+0x88>
            *((size_t*)tempMeta) = size; //this is size segments stored in metadata
    80001900:	00e53023          	sd	a4,0(a0)
            tempMeta += sizeof(size_t); //shift pointer to account for metadata
    80001904:	04050513          	addi	a0,a0,64
            return (void*)tempMeta;
    80001908:	f59ff06f          	j	80001860 <_ZN15MemoryAllocator12mem_allocateEm+0x7c>
    if(segmentsNumber == 0 || size > totalSize) return nullptr;
    8000190c:	00000513          	li	a0,0
    80001910:	f51ff06f          	j	80001860 <_ZN15MemoryAllocator12mem_allocateEm+0x7c>
    80001914:	00000513          	li	a0,0
    80001918:	f49ff06f          	j	80001860 <_ZN15MemoryAllocator12mem_allocateEm+0x7c>

000000008000191c <_ZN15MemoryAllocator8mem_freeEPv>:

//TODO TEST: check for bugs in this implementation - mem_free
int MemoryAllocator::mem_free(void* ptr) {
    8000191c:	ff010113          	addi	sp,sp,-16
    80001920:	00813423          	sd	s0,8(sp)
    80001924:	01010413          	addi	s0,sp,16
    //TODO optimize these 4 lines
    size_t size = *((size_t*)(ptr)-sizeof(size_t));
    80001928:	fc053603          	ld	a2,-64(a0)
    MemSegment* pointer = (MemSegment*)ptr-sizeof(size_t);
    8000192c:	f4050693          	addi	a3,a0,-192
    totalSize += size;
    80001930:	00003797          	auipc	a5,0x3
    80001934:	d2078793          	addi	a5,a5,-736 # 80004650 <_ZN15MemoryAllocator12segmentsHeadE>
    80001938:	0087a703          	lw	a4,8(a5)
    8000193c:	00c7073b          	addw	a4,a4,a2
    80001940:	00e7a423          	sw	a4,8(a5)
    pointer->size = size;
    80001944:	f4c53823          	sd	a2,-176(a0)

    //5,6
    size_t offset = size*MEM_BLOCK_SIZE;

    if(pointer > segmentsHead){
    80001948:	0007b783          	ld	a5,0(a5)
    8000194c:	06d7f463          	bgeu	a5,a3,800019b4 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
        pointer->left = nullptr;
    80001950:	f4053023          	sd	zero,-192(a0)

        if(pointer+offset == segmentsHead){ //5 try join from the right
    80001954:	00161793          	slli	a5,a2,0x1
    80001958:	00c787b3          	add	a5,a5,a2
    8000195c:	00979793          	slli	a5,a5,0x9
    80001960:	00f687b3          	add	a5,a3,a5
    80001964:	00003717          	auipc	a4,0x3
    80001968:	cec73703          	ld	a4,-788(a4) # 80004650 <_ZN15MemoryAllocator12segmentsHeadE>
    8000196c:	02e78263          	beq	a5,a4,80001990 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
            pointer->right = segmentsHead->right;
            pointer->size+=segmentsHead->size;
        }else{ //6 couldn't do join :(
            pointer->right = segmentsHead;
    80001970:	f4e53423          	sd	a4,-184(a0)
            segmentsHead->left = pointer;
    80001974:	00d73023          	sd	a3,0(a4)
        }

        segmentsHead = pointer;
    80001978:	00003797          	auipc	a5,0x3
    8000197c:	ccd7bc23          	sd	a3,-808(a5) # 80004650 <_ZN15MemoryAllocator12segmentsHeadE>
            return 0;
        }
    }

    return 0;
    80001980:	00000513          	li	a0,0
    80001984:	00813403          	ld	s0,8(sp)
    80001988:	01010113          	addi	sp,sp,16
    8000198c:	00008067          	ret
            pointer->right = segmentsHead->right;
    80001990:	00873783          	ld	a5,8(a4)
    80001994:	f4f53423          	sd	a5,-184(a0)
            pointer->size+=segmentsHead->size;
    80001998:	00003797          	auipc	a5,0x3
    8000199c:	cb87b783          	ld	a5,-840(a5) # 80004650 <_ZN15MemoryAllocator12segmentsHeadE>
    800019a0:	0107b783          	ld	a5,16(a5)
    800019a4:	00c78633          	add	a2,a5,a2
    800019a8:	f4c53823          	sd	a2,-176(a0)
    800019ac:	fcdff06f          	j	80001978 <_ZN15MemoryAllocator8mem_freeEPv+0x5c>
    800019b0:	00070793          	mv	a5,a4
    while(temp){
    800019b4:	fc0786e3          	beqz	a5,80001980 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
        if(temp->right){ //1, 2, 3, 4
    800019b8:	0087b703          	ld	a4,8(a5)
    800019bc:	08070263          	beqz	a4,80001a40 <_ZN15MemoryAllocator8mem_freeEPv+0x124>
            if(temp < pointer && pointer < temp->right){
    800019c0:	fed7f8e3          	bgeu	a5,a3,800019b0 <_ZN15MemoryAllocator8mem_freeEPv+0x94>
    800019c4:	00e6e663          	bltu	a3,a4,800019d0 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
    800019c8:	00070793          	mv	a5,a4
    800019cc:	fe9ff06f          	j	800019b4 <_ZN15MemoryAllocator8mem_freeEPv+0x98>
                if(pointer + offset == temp->right){ //3 or 4
    800019d0:	00161593          	slli	a1,a2,0x1
    800019d4:	00c585b3          	add	a1,a1,a2
    800019d8:	00959593          	slli	a1,a1,0x9
    800019dc:	00b685b3          	add	a1,a3,a1
    800019e0:	02b70e63          	beq	a4,a1,80001a1c <_ZN15MemoryAllocator8mem_freeEPv+0x100>
                if(temp + temp->size*MEM_BLOCK_SIZE == pointer){ //2 or 4
    800019e4:	0107b603          	ld	a2,16(a5)
    800019e8:	00161713          	slli	a4,a2,0x1
    800019ec:	00c70733          	add	a4,a4,a2
    800019f0:	00971713          	slli	a4,a4,0x9
    800019f4:	00e78733          	add	a4,a5,a4
    800019f8:	f8d714e3          	bne	a4,a3,80001980 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
                    temp->size += pointer->size;
    800019fc:	f5053703          	ld	a4,-176(a0)
    80001a00:	00e60633          	add	a2,a2,a4
    80001a04:	00c7b823          	sd	a2,16(a5)
                    if(pointer->left == temp){
    80001a08:	f4053703          	ld	a4,-192(a0)
    80001a0c:	f6f71ae3          	bne	a4,a5,80001980 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
                        temp->right = pointer->right;
    80001a10:	f4853703          	ld	a4,-184(a0)
    80001a14:	00e7b423          	sd	a4,8(a5)
                return 0;
    80001a18:	f69ff06f          	j	80001980 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
                    pointer->size += temp->right->size;
    80001a1c:	01073703          	ld	a4,16(a4)
    80001a20:	00c70633          	add	a2,a4,a2
    80001a24:	f4c53823          	sd	a2,-176(a0)
                    pointer->right = temp->right->right;
    80001a28:	0087b703          	ld	a4,8(a5)
    80001a2c:	00873703          	ld	a4,8(a4)
    80001a30:	f4e53423          	sd	a4,-184(a0)
                    pointer->left = temp->left;
    80001a34:	0007b703          	ld	a4,0(a5)
    80001a38:	f4e53023          	sd	a4,-192(a0)
    80001a3c:	fa9ff06f          	j	800019e4 <_ZN15MemoryAllocator8mem_freeEPv+0xc8>
            if(temp + temp->size*MEM_BLOCK_SIZE == pointer){ //8
    80001a40:	0107b583          	ld	a1,16(a5)
    80001a44:	00159713          	slli	a4,a1,0x1
    80001a48:	00b70733          	add	a4,a4,a1
    80001a4c:	00971713          	slli	a4,a4,0x9
    80001a50:	00e78733          	add	a4,a5,a4
    80001a54:	00d70863          	beq	a4,a3,80001a64 <_ZN15MemoryAllocator8mem_freeEPv+0x148>
                temp->right = pointer;
    80001a58:	00d7b423          	sd	a3,8(a5)
                pointer->left = temp;
    80001a5c:	f4f53023          	sd	a5,-192(a0)
            return 0;
    80001a60:	f21ff06f          	j	80001980 <_ZN15MemoryAllocator8mem_freeEPv+0x64>
                temp->size += pointer->size;
    80001a64:	00c58633          	add	a2,a1,a2
    80001a68:	00c7b823          	sd	a2,16(a5)
    80001a6c:	f15ff06f          	j	80001980 <_ZN15MemoryAllocator8mem_freeEPv+0x64>

0000000080001a70 <start>:
    80001a70:	ff010113          	addi	sp,sp,-16
    80001a74:	00813423          	sd	s0,8(sp)
    80001a78:	01010413          	addi	s0,sp,16
    80001a7c:	300027f3          	csrr	a5,mstatus
    80001a80:	ffffe737          	lui	a4,0xffffe
    80001a84:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff8f4f>
    80001a88:	00e7f7b3          	and	a5,a5,a4
    80001a8c:	00001737          	lui	a4,0x1
    80001a90:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80001a94:	00e7e7b3          	or	a5,a5,a4
    80001a98:	30079073          	csrw	mstatus,a5
    80001a9c:	00000797          	auipc	a5,0x0
    80001aa0:	16078793          	addi	a5,a5,352 # 80001bfc <system_main>
    80001aa4:	34179073          	csrw	mepc,a5
    80001aa8:	00000793          	li	a5,0
    80001aac:	18079073          	csrw	satp,a5
    80001ab0:	000107b7          	lui	a5,0x10
    80001ab4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80001ab8:	30279073          	csrw	medeleg,a5
    80001abc:	30379073          	csrw	mideleg,a5
    80001ac0:	104027f3          	csrr	a5,sie
    80001ac4:	2227e793          	ori	a5,a5,546
    80001ac8:	10479073          	csrw	sie,a5
    80001acc:	fff00793          	li	a5,-1
    80001ad0:	00a7d793          	srli	a5,a5,0xa
    80001ad4:	3b079073          	csrw	pmpaddr0,a5
    80001ad8:	00f00793          	li	a5,15
    80001adc:	3a079073          	csrw	pmpcfg0,a5
    80001ae0:	f14027f3          	csrr	a5,mhartid
    80001ae4:	0200c737          	lui	a4,0x200c
    80001ae8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001aec:	0007869b          	sext.w	a3,a5
    80001af0:	00269713          	slli	a4,a3,0x2
    80001af4:	000f4637          	lui	a2,0xf4
    80001af8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001afc:	00d70733          	add	a4,a4,a3
    80001b00:	0037979b          	slliw	a5,a5,0x3
    80001b04:	020046b7          	lui	a3,0x2004
    80001b08:	00d787b3          	add	a5,a5,a3
    80001b0c:	00c585b3          	add	a1,a1,a2
    80001b10:	00371693          	slli	a3,a4,0x3
    80001b14:	00003717          	auipc	a4,0x3
    80001b18:	b4c70713          	addi	a4,a4,-1204 # 80004660 <timer_scratch>
    80001b1c:	00b7b023          	sd	a1,0(a5)
    80001b20:	00d70733          	add	a4,a4,a3
    80001b24:	00f73c23          	sd	a5,24(a4)
    80001b28:	02c73023          	sd	a2,32(a4)
    80001b2c:	34071073          	csrw	mscratch,a4
    80001b30:	00000797          	auipc	a5,0x0
    80001b34:	6e078793          	addi	a5,a5,1760 # 80002210 <timervec>
    80001b38:	30579073          	csrw	mtvec,a5
    80001b3c:	300027f3          	csrr	a5,mstatus
    80001b40:	0087e793          	ori	a5,a5,8
    80001b44:	30079073          	csrw	mstatus,a5
    80001b48:	304027f3          	csrr	a5,mie
    80001b4c:	0807e793          	ori	a5,a5,128
    80001b50:	30479073          	csrw	mie,a5
    80001b54:	f14027f3          	csrr	a5,mhartid
    80001b58:	0007879b          	sext.w	a5,a5
    80001b5c:	00078213          	mv	tp,a5
    80001b60:	30200073          	mret
    80001b64:	00813403          	ld	s0,8(sp)
    80001b68:	01010113          	addi	sp,sp,16
    80001b6c:	00008067          	ret

0000000080001b70 <timerinit>:
    80001b70:	ff010113          	addi	sp,sp,-16
    80001b74:	00813423          	sd	s0,8(sp)
    80001b78:	01010413          	addi	s0,sp,16
    80001b7c:	f14027f3          	csrr	a5,mhartid
    80001b80:	0200c737          	lui	a4,0x200c
    80001b84:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001b88:	0007869b          	sext.w	a3,a5
    80001b8c:	00269713          	slli	a4,a3,0x2
    80001b90:	000f4637          	lui	a2,0xf4
    80001b94:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001b98:	00d70733          	add	a4,a4,a3
    80001b9c:	0037979b          	slliw	a5,a5,0x3
    80001ba0:	020046b7          	lui	a3,0x2004
    80001ba4:	00d787b3          	add	a5,a5,a3
    80001ba8:	00c585b3          	add	a1,a1,a2
    80001bac:	00371693          	slli	a3,a4,0x3
    80001bb0:	00003717          	auipc	a4,0x3
    80001bb4:	ab070713          	addi	a4,a4,-1360 # 80004660 <timer_scratch>
    80001bb8:	00b7b023          	sd	a1,0(a5)
    80001bbc:	00d70733          	add	a4,a4,a3
    80001bc0:	00f73c23          	sd	a5,24(a4)
    80001bc4:	02c73023          	sd	a2,32(a4)
    80001bc8:	34071073          	csrw	mscratch,a4
    80001bcc:	00000797          	auipc	a5,0x0
    80001bd0:	64478793          	addi	a5,a5,1604 # 80002210 <timervec>
    80001bd4:	30579073          	csrw	mtvec,a5
    80001bd8:	300027f3          	csrr	a5,mstatus
    80001bdc:	0087e793          	ori	a5,a5,8
    80001be0:	30079073          	csrw	mstatus,a5
    80001be4:	304027f3          	csrr	a5,mie
    80001be8:	0807e793          	ori	a5,a5,128
    80001bec:	30479073          	csrw	mie,a5
    80001bf0:	00813403          	ld	s0,8(sp)
    80001bf4:	01010113          	addi	sp,sp,16
    80001bf8:	00008067          	ret

0000000080001bfc <system_main>:
    80001bfc:	fe010113          	addi	sp,sp,-32
    80001c00:	00813823          	sd	s0,16(sp)
    80001c04:	00913423          	sd	s1,8(sp)
    80001c08:	00113c23          	sd	ra,24(sp)
    80001c0c:	02010413          	addi	s0,sp,32
    80001c10:	00000097          	auipc	ra,0x0
    80001c14:	0c4080e7          	jalr	196(ra) # 80001cd4 <cpuid>
    80001c18:	00003497          	auipc	s1,0x3
    80001c1c:	a0848493          	addi	s1,s1,-1528 # 80004620 <started>
    80001c20:	02050263          	beqz	a0,80001c44 <system_main+0x48>
    80001c24:	0004a783          	lw	a5,0(s1)
    80001c28:	0007879b          	sext.w	a5,a5
    80001c2c:	fe078ce3          	beqz	a5,80001c24 <system_main+0x28>
    80001c30:	0ff0000f          	fence
    80001c34:	00002517          	auipc	a0,0x2
    80001c38:	5b450513          	addi	a0,a0,1460 # 800041e8 <CONSOLE_STATUS+0x1d8>
    80001c3c:	00001097          	auipc	ra,0x1
    80001c40:	a70080e7          	jalr	-1424(ra) # 800026ac <panic>
    80001c44:	00001097          	auipc	ra,0x1
    80001c48:	9c4080e7          	jalr	-1596(ra) # 80002608 <consoleinit>
    80001c4c:	00001097          	auipc	ra,0x1
    80001c50:	150080e7          	jalr	336(ra) # 80002d9c <printfinit>
    80001c54:	00002517          	auipc	a0,0x2
    80001c58:	51450513          	addi	a0,a0,1300 # 80004168 <CONSOLE_STATUS+0x158>
    80001c5c:	00001097          	auipc	ra,0x1
    80001c60:	aac080e7          	jalr	-1364(ra) # 80002708 <__printf>
    80001c64:	00002517          	auipc	a0,0x2
    80001c68:	55450513          	addi	a0,a0,1364 # 800041b8 <CONSOLE_STATUS+0x1a8>
    80001c6c:	00001097          	auipc	ra,0x1
    80001c70:	a9c080e7          	jalr	-1380(ra) # 80002708 <__printf>
    80001c74:	00002517          	auipc	a0,0x2
    80001c78:	4f450513          	addi	a0,a0,1268 # 80004168 <CONSOLE_STATUS+0x158>
    80001c7c:	00001097          	auipc	ra,0x1
    80001c80:	a8c080e7          	jalr	-1396(ra) # 80002708 <__printf>
    80001c84:	00001097          	auipc	ra,0x1
    80001c88:	4a4080e7          	jalr	1188(ra) # 80003128 <kinit>
    80001c8c:	00000097          	auipc	ra,0x0
    80001c90:	148080e7          	jalr	328(ra) # 80001dd4 <trapinit>
    80001c94:	00000097          	auipc	ra,0x0
    80001c98:	16c080e7          	jalr	364(ra) # 80001e00 <trapinithart>
    80001c9c:	00000097          	auipc	ra,0x0
    80001ca0:	5b4080e7          	jalr	1460(ra) # 80002250 <plicinit>
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	5d4080e7          	jalr	1492(ra) # 80002278 <plicinithart>
    80001cac:	00000097          	auipc	ra,0x0
    80001cb0:	078080e7          	jalr	120(ra) # 80001d24 <userinit>
    80001cb4:	0ff0000f          	fence
    80001cb8:	00100793          	li	a5,1
    80001cbc:	00002517          	auipc	a0,0x2
    80001cc0:	51450513          	addi	a0,a0,1300 # 800041d0 <CONSOLE_STATUS+0x1c0>
    80001cc4:	00f4a023          	sw	a5,0(s1)
    80001cc8:	00001097          	auipc	ra,0x1
    80001ccc:	a40080e7          	jalr	-1472(ra) # 80002708 <__printf>
    80001cd0:	0000006f          	j	80001cd0 <system_main+0xd4>

0000000080001cd4 <cpuid>:
    80001cd4:	ff010113          	addi	sp,sp,-16
    80001cd8:	00813423          	sd	s0,8(sp)
    80001cdc:	01010413          	addi	s0,sp,16
    80001ce0:	00020513          	mv	a0,tp
    80001ce4:	00813403          	ld	s0,8(sp)
    80001ce8:	0005051b          	sext.w	a0,a0
    80001cec:	01010113          	addi	sp,sp,16
    80001cf0:	00008067          	ret

0000000080001cf4 <mycpu>:
    80001cf4:	ff010113          	addi	sp,sp,-16
    80001cf8:	00813423          	sd	s0,8(sp)
    80001cfc:	01010413          	addi	s0,sp,16
    80001d00:	00020793          	mv	a5,tp
    80001d04:	00813403          	ld	s0,8(sp)
    80001d08:	0007879b          	sext.w	a5,a5
    80001d0c:	00779793          	slli	a5,a5,0x7
    80001d10:	00004517          	auipc	a0,0x4
    80001d14:	98050513          	addi	a0,a0,-1664 # 80005690 <cpus>
    80001d18:	00f50533          	add	a0,a0,a5
    80001d1c:	01010113          	addi	sp,sp,16
    80001d20:	00008067          	ret

0000000080001d24 <userinit>:
    80001d24:	ff010113          	addi	sp,sp,-16
    80001d28:	00813423          	sd	s0,8(sp)
    80001d2c:	01010413          	addi	s0,sp,16
    80001d30:	00813403          	ld	s0,8(sp)
    80001d34:	01010113          	addi	sp,sp,16
    80001d38:	fffff317          	auipc	t1,0xfffff
    80001d3c:	68030067          	jr	1664(t1) # 800013b8 <main>

0000000080001d40 <either_copyout>:
    80001d40:	ff010113          	addi	sp,sp,-16
    80001d44:	00813023          	sd	s0,0(sp)
    80001d48:	00113423          	sd	ra,8(sp)
    80001d4c:	01010413          	addi	s0,sp,16
    80001d50:	02051663          	bnez	a0,80001d7c <either_copyout+0x3c>
    80001d54:	00058513          	mv	a0,a1
    80001d58:	00060593          	mv	a1,a2
    80001d5c:	0006861b          	sext.w	a2,a3
    80001d60:	00002097          	auipc	ra,0x2
    80001d64:	c54080e7          	jalr	-940(ra) # 800039b4 <__memmove>
    80001d68:	00813083          	ld	ra,8(sp)
    80001d6c:	00013403          	ld	s0,0(sp)
    80001d70:	00000513          	li	a0,0
    80001d74:	01010113          	addi	sp,sp,16
    80001d78:	00008067          	ret
    80001d7c:	00002517          	auipc	a0,0x2
    80001d80:	49450513          	addi	a0,a0,1172 # 80004210 <CONSOLE_STATUS+0x200>
    80001d84:	00001097          	auipc	ra,0x1
    80001d88:	928080e7          	jalr	-1752(ra) # 800026ac <panic>

0000000080001d8c <either_copyin>:
    80001d8c:	ff010113          	addi	sp,sp,-16
    80001d90:	00813023          	sd	s0,0(sp)
    80001d94:	00113423          	sd	ra,8(sp)
    80001d98:	01010413          	addi	s0,sp,16
    80001d9c:	02059463          	bnez	a1,80001dc4 <either_copyin+0x38>
    80001da0:	00060593          	mv	a1,a2
    80001da4:	0006861b          	sext.w	a2,a3
    80001da8:	00002097          	auipc	ra,0x2
    80001dac:	c0c080e7          	jalr	-1012(ra) # 800039b4 <__memmove>
    80001db0:	00813083          	ld	ra,8(sp)
    80001db4:	00013403          	ld	s0,0(sp)
    80001db8:	00000513          	li	a0,0
    80001dbc:	01010113          	addi	sp,sp,16
    80001dc0:	00008067          	ret
    80001dc4:	00002517          	auipc	a0,0x2
    80001dc8:	47450513          	addi	a0,a0,1140 # 80004238 <CONSOLE_STATUS+0x228>
    80001dcc:	00001097          	auipc	ra,0x1
    80001dd0:	8e0080e7          	jalr	-1824(ra) # 800026ac <panic>

0000000080001dd4 <trapinit>:
    80001dd4:	ff010113          	addi	sp,sp,-16
    80001dd8:	00813423          	sd	s0,8(sp)
    80001ddc:	01010413          	addi	s0,sp,16
    80001de0:	00813403          	ld	s0,8(sp)
    80001de4:	00002597          	auipc	a1,0x2
    80001de8:	47c58593          	addi	a1,a1,1148 # 80004260 <CONSOLE_STATUS+0x250>
    80001dec:	00004517          	auipc	a0,0x4
    80001df0:	92450513          	addi	a0,a0,-1756 # 80005710 <tickslock>
    80001df4:	01010113          	addi	sp,sp,16
    80001df8:	00001317          	auipc	t1,0x1
    80001dfc:	5c030067          	jr	1472(t1) # 800033b8 <initlock>

0000000080001e00 <trapinithart>:
    80001e00:	ff010113          	addi	sp,sp,-16
    80001e04:	00813423          	sd	s0,8(sp)
    80001e08:	01010413          	addi	s0,sp,16
    80001e0c:	00000797          	auipc	a5,0x0
    80001e10:	2f478793          	addi	a5,a5,756 # 80002100 <kernelvec>
    80001e14:	10579073          	csrw	stvec,a5
    80001e18:	00813403          	ld	s0,8(sp)
    80001e1c:	01010113          	addi	sp,sp,16
    80001e20:	00008067          	ret

0000000080001e24 <usertrap>:
    80001e24:	ff010113          	addi	sp,sp,-16
    80001e28:	00813423          	sd	s0,8(sp)
    80001e2c:	01010413          	addi	s0,sp,16
    80001e30:	00813403          	ld	s0,8(sp)
    80001e34:	01010113          	addi	sp,sp,16
    80001e38:	00008067          	ret

0000000080001e3c <usertrapret>:
    80001e3c:	ff010113          	addi	sp,sp,-16
    80001e40:	00813423          	sd	s0,8(sp)
    80001e44:	01010413          	addi	s0,sp,16
    80001e48:	00813403          	ld	s0,8(sp)
    80001e4c:	01010113          	addi	sp,sp,16
    80001e50:	00008067          	ret

0000000080001e54 <kerneltrap>:
    80001e54:	fe010113          	addi	sp,sp,-32
    80001e58:	00813823          	sd	s0,16(sp)
    80001e5c:	00113c23          	sd	ra,24(sp)
    80001e60:	00913423          	sd	s1,8(sp)
    80001e64:	02010413          	addi	s0,sp,32
    80001e68:	142025f3          	csrr	a1,scause
    80001e6c:	100027f3          	csrr	a5,sstatus
    80001e70:	0027f793          	andi	a5,a5,2
    80001e74:	10079c63          	bnez	a5,80001f8c <kerneltrap+0x138>
    80001e78:	142027f3          	csrr	a5,scause
    80001e7c:	0207ce63          	bltz	a5,80001eb8 <kerneltrap+0x64>
    80001e80:	00002517          	auipc	a0,0x2
    80001e84:	42850513          	addi	a0,a0,1064 # 800042a8 <CONSOLE_STATUS+0x298>
    80001e88:	00001097          	auipc	ra,0x1
    80001e8c:	880080e7          	jalr	-1920(ra) # 80002708 <__printf>
    80001e90:	141025f3          	csrr	a1,sepc
    80001e94:	14302673          	csrr	a2,stval
    80001e98:	00002517          	auipc	a0,0x2
    80001e9c:	42050513          	addi	a0,a0,1056 # 800042b8 <CONSOLE_STATUS+0x2a8>
    80001ea0:	00001097          	auipc	ra,0x1
    80001ea4:	868080e7          	jalr	-1944(ra) # 80002708 <__printf>
    80001ea8:	00002517          	auipc	a0,0x2
    80001eac:	42850513          	addi	a0,a0,1064 # 800042d0 <CONSOLE_STATUS+0x2c0>
    80001eb0:	00000097          	auipc	ra,0x0
    80001eb4:	7fc080e7          	jalr	2044(ra) # 800026ac <panic>
    80001eb8:	0ff7f713          	andi	a4,a5,255
    80001ebc:	00900693          	li	a3,9
    80001ec0:	04d70063          	beq	a4,a3,80001f00 <kerneltrap+0xac>
    80001ec4:	fff00713          	li	a4,-1
    80001ec8:	03f71713          	slli	a4,a4,0x3f
    80001ecc:	00170713          	addi	a4,a4,1
    80001ed0:	fae798e3          	bne	a5,a4,80001e80 <kerneltrap+0x2c>
    80001ed4:	00000097          	auipc	ra,0x0
    80001ed8:	e00080e7          	jalr	-512(ra) # 80001cd4 <cpuid>
    80001edc:	06050663          	beqz	a0,80001f48 <kerneltrap+0xf4>
    80001ee0:	144027f3          	csrr	a5,sip
    80001ee4:	ffd7f793          	andi	a5,a5,-3
    80001ee8:	14479073          	csrw	sip,a5
    80001eec:	01813083          	ld	ra,24(sp)
    80001ef0:	01013403          	ld	s0,16(sp)
    80001ef4:	00813483          	ld	s1,8(sp)
    80001ef8:	02010113          	addi	sp,sp,32
    80001efc:	00008067          	ret
    80001f00:	00000097          	auipc	ra,0x0
    80001f04:	3c4080e7          	jalr	964(ra) # 800022c4 <plic_claim>
    80001f08:	00a00793          	li	a5,10
    80001f0c:	00050493          	mv	s1,a0
    80001f10:	06f50863          	beq	a0,a5,80001f80 <kerneltrap+0x12c>
    80001f14:	fc050ce3          	beqz	a0,80001eec <kerneltrap+0x98>
    80001f18:	00050593          	mv	a1,a0
    80001f1c:	00002517          	auipc	a0,0x2
    80001f20:	36c50513          	addi	a0,a0,876 # 80004288 <CONSOLE_STATUS+0x278>
    80001f24:	00000097          	auipc	ra,0x0
    80001f28:	7e4080e7          	jalr	2020(ra) # 80002708 <__printf>
    80001f2c:	01013403          	ld	s0,16(sp)
    80001f30:	01813083          	ld	ra,24(sp)
    80001f34:	00048513          	mv	a0,s1
    80001f38:	00813483          	ld	s1,8(sp)
    80001f3c:	02010113          	addi	sp,sp,32
    80001f40:	00000317          	auipc	t1,0x0
    80001f44:	3bc30067          	jr	956(t1) # 800022fc <plic_complete>
    80001f48:	00003517          	auipc	a0,0x3
    80001f4c:	7c850513          	addi	a0,a0,1992 # 80005710 <tickslock>
    80001f50:	00001097          	auipc	ra,0x1
    80001f54:	48c080e7          	jalr	1164(ra) # 800033dc <acquire>
    80001f58:	00002717          	auipc	a4,0x2
    80001f5c:	6cc70713          	addi	a4,a4,1740 # 80004624 <ticks>
    80001f60:	00072783          	lw	a5,0(a4)
    80001f64:	00003517          	auipc	a0,0x3
    80001f68:	7ac50513          	addi	a0,a0,1964 # 80005710 <tickslock>
    80001f6c:	0017879b          	addiw	a5,a5,1
    80001f70:	00f72023          	sw	a5,0(a4)
    80001f74:	00001097          	auipc	ra,0x1
    80001f78:	534080e7          	jalr	1332(ra) # 800034a8 <release>
    80001f7c:	f65ff06f          	j	80001ee0 <kerneltrap+0x8c>
    80001f80:	00001097          	auipc	ra,0x1
    80001f84:	090080e7          	jalr	144(ra) # 80003010 <uartintr>
    80001f88:	fa5ff06f          	j	80001f2c <kerneltrap+0xd8>
    80001f8c:	00002517          	auipc	a0,0x2
    80001f90:	2dc50513          	addi	a0,a0,732 # 80004268 <CONSOLE_STATUS+0x258>
    80001f94:	00000097          	auipc	ra,0x0
    80001f98:	718080e7          	jalr	1816(ra) # 800026ac <panic>

0000000080001f9c <clockintr>:
    80001f9c:	fe010113          	addi	sp,sp,-32
    80001fa0:	00813823          	sd	s0,16(sp)
    80001fa4:	00913423          	sd	s1,8(sp)
    80001fa8:	00113c23          	sd	ra,24(sp)
    80001fac:	02010413          	addi	s0,sp,32
    80001fb0:	00003497          	auipc	s1,0x3
    80001fb4:	76048493          	addi	s1,s1,1888 # 80005710 <tickslock>
    80001fb8:	00048513          	mv	a0,s1
    80001fbc:	00001097          	auipc	ra,0x1
    80001fc0:	420080e7          	jalr	1056(ra) # 800033dc <acquire>
    80001fc4:	00002717          	auipc	a4,0x2
    80001fc8:	66070713          	addi	a4,a4,1632 # 80004624 <ticks>
    80001fcc:	00072783          	lw	a5,0(a4)
    80001fd0:	01013403          	ld	s0,16(sp)
    80001fd4:	01813083          	ld	ra,24(sp)
    80001fd8:	00048513          	mv	a0,s1
    80001fdc:	0017879b          	addiw	a5,a5,1
    80001fe0:	00813483          	ld	s1,8(sp)
    80001fe4:	00f72023          	sw	a5,0(a4)
    80001fe8:	02010113          	addi	sp,sp,32
    80001fec:	00001317          	auipc	t1,0x1
    80001ff0:	4bc30067          	jr	1212(t1) # 800034a8 <release>

0000000080001ff4 <devintr>:
    80001ff4:	142027f3          	csrr	a5,scause
    80001ff8:	00000513          	li	a0,0
    80001ffc:	0007c463          	bltz	a5,80002004 <devintr+0x10>
    80002000:	00008067          	ret
    80002004:	fe010113          	addi	sp,sp,-32
    80002008:	00813823          	sd	s0,16(sp)
    8000200c:	00113c23          	sd	ra,24(sp)
    80002010:	00913423          	sd	s1,8(sp)
    80002014:	02010413          	addi	s0,sp,32
    80002018:	0ff7f713          	andi	a4,a5,255
    8000201c:	00900693          	li	a3,9
    80002020:	04d70c63          	beq	a4,a3,80002078 <devintr+0x84>
    80002024:	fff00713          	li	a4,-1
    80002028:	03f71713          	slli	a4,a4,0x3f
    8000202c:	00170713          	addi	a4,a4,1
    80002030:	00e78c63          	beq	a5,a4,80002048 <devintr+0x54>
    80002034:	01813083          	ld	ra,24(sp)
    80002038:	01013403          	ld	s0,16(sp)
    8000203c:	00813483          	ld	s1,8(sp)
    80002040:	02010113          	addi	sp,sp,32
    80002044:	00008067          	ret
    80002048:	00000097          	auipc	ra,0x0
    8000204c:	c8c080e7          	jalr	-884(ra) # 80001cd4 <cpuid>
    80002050:	06050663          	beqz	a0,800020bc <devintr+0xc8>
    80002054:	144027f3          	csrr	a5,sip
    80002058:	ffd7f793          	andi	a5,a5,-3
    8000205c:	14479073          	csrw	sip,a5
    80002060:	01813083          	ld	ra,24(sp)
    80002064:	01013403          	ld	s0,16(sp)
    80002068:	00813483          	ld	s1,8(sp)
    8000206c:	00200513          	li	a0,2
    80002070:	02010113          	addi	sp,sp,32
    80002074:	00008067          	ret
    80002078:	00000097          	auipc	ra,0x0
    8000207c:	24c080e7          	jalr	588(ra) # 800022c4 <plic_claim>
    80002080:	00a00793          	li	a5,10
    80002084:	00050493          	mv	s1,a0
    80002088:	06f50663          	beq	a0,a5,800020f4 <devintr+0x100>
    8000208c:	00100513          	li	a0,1
    80002090:	fa0482e3          	beqz	s1,80002034 <devintr+0x40>
    80002094:	00048593          	mv	a1,s1
    80002098:	00002517          	auipc	a0,0x2
    8000209c:	1f050513          	addi	a0,a0,496 # 80004288 <CONSOLE_STATUS+0x278>
    800020a0:	00000097          	auipc	ra,0x0
    800020a4:	668080e7          	jalr	1640(ra) # 80002708 <__printf>
    800020a8:	00048513          	mv	a0,s1
    800020ac:	00000097          	auipc	ra,0x0
    800020b0:	250080e7          	jalr	592(ra) # 800022fc <plic_complete>
    800020b4:	00100513          	li	a0,1
    800020b8:	f7dff06f          	j	80002034 <devintr+0x40>
    800020bc:	00003517          	auipc	a0,0x3
    800020c0:	65450513          	addi	a0,a0,1620 # 80005710 <tickslock>
    800020c4:	00001097          	auipc	ra,0x1
    800020c8:	318080e7          	jalr	792(ra) # 800033dc <acquire>
    800020cc:	00002717          	auipc	a4,0x2
    800020d0:	55870713          	addi	a4,a4,1368 # 80004624 <ticks>
    800020d4:	00072783          	lw	a5,0(a4)
    800020d8:	00003517          	auipc	a0,0x3
    800020dc:	63850513          	addi	a0,a0,1592 # 80005710 <tickslock>
    800020e0:	0017879b          	addiw	a5,a5,1
    800020e4:	00f72023          	sw	a5,0(a4)
    800020e8:	00001097          	auipc	ra,0x1
    800020ec:	3c0080e7          	jalr	960(ra) # 800034a8 <release>
    800020f0:	f65ff06f          	j	80002054 <devintr+0x60>
    800020f4:	00001097          	auipc	ra,0x1
    800020f8:	f1c080e7          	jalr	-228(ra) # 80003010 <uartintr>
    800020fc:	fadff06f          	j	800020a8 <devintr+0xb4>

0000000080002100 <kernelvec>:
    80002100:	f0010113          	addi	sp,sp,-256
    80002104:	00113023          	sd	ra,0(sp)
    80002108:	00213423          	sd	sp,8(sp)
    8000210c:	00313823          	sd	gp,16(sp)
    80002110:	00413c23          	sd	tp,24(sp)
    80002114:	02513023          	sd	t0,32(sp)
    80002118:	02613423          	sd	t1,40(sp)
    8000211c:	02713823          	sd	t2,48(sp)
    80002120:	02813c23          	sd	s0,56(sp)
    80002124:	04913023          	sd	s1,64(sp)
    80002128:	04a13423          	sd	a0,72(sp)
    8000212c:	04b13823          	sd	a1,80(sp)
    80002130:	04c13c23          	sd	a2,88(sp)
    80002134:	06d13023          	sd	a3,96(sp)
    80002138:	06e13423          	sd	a4,104(sp)
    8000213c:	06f13823          	sd	a5,112(sp)
    80002140:	07013c23          	sd	a6,120(sp)
    80002144:	09113023          	sd	a7,128(sp)
    80002148:	09213423          	sd	s2,136(sp)
    8000214c:	09313823          	sd	s3,144(sp)
    80002150:	09413c23          	sd	s4,152(sp)
    80002154:	0b513023          	sd	s5,160(sp)
    80002158:	0b613423          	sd	s6,168(sp)
    8000215c:	0b713823          	sd	s7,176(sp)
    80002160:	0b813c23          	sd	s8,184(sp)
    80002164:	0d913023          	sd	s9,192(sp)
    80002168:	0da13423          	sd	s10,200(sp)
    8000216c:	0db13823          	sd	s11,208(sp)
    80002170:	0dc13c23          	sd	t3,216(sp)
    80002174:	0fd13023          	sd	t4,224(sp)
    80002178:	0fe13423          	sd	t5,232(sp)
    8000217c:	0ff13823          	sd	t6,240(sp)
    80002180:	cd5ff0ef          	jal	ra,80001e54 <kerneltrap>
    80002184:	00013083          	ld	ra,0(sp)
    80002188:	00813103          	ld	sp,8(sp)
    8000218c:	01013183          	ld	gp,16(sp)
    80002190:	02013283          	ld	t0,32(sp)
    80002194:	02813303          	ld	t1,40(sp)
    80002198:	03013383          	ld	t2,48(sp)
    8000219c:	03813403          	ld	s0,56(sp)
    800021a0:	04013483          	ld	s1,64(sp)
    800021a4:	04813503          	ld	a0,72(sp)
    800021a8:	05013583          	ld	a1,80(sp)
    800021ac:	05813603          	ld	a2,88(sp)
    800021b0:	06013683          	ld	a3,96(sp)
    800021b4:	06813703          	ld	a4,104(sp)
    800021b8:	07013783          	ld	a5,112(sp)
    800021bc:	07813803          	ld	a6,120(sp)
    800021c0:	08013883          	ld	a7,128(sp)
    800021c4:	08813903          	ld	s2,136(sp)
    800021c8:	09013983          	ld	s3,144(sp)
    800021cc:	09813a03          	ld	s4,152(sp)
    800021d0:	0a013a83          	ld	s5,160(sp)
    800021d4:	0a813b03          	ld	s6,168(sp)
    800021d8:	0b013b83          	ld	s7,176(sp)
    800021dc:	0b813c03          	ld	s8,184(sp)
    800021e0:	0c013c83          	ld	s9,192(sp)
    800021e4:	0c813d03          	ld	s10,200(sp)
    800021e8:	0d013d83          	ld	s11,208(sp)
    800021ec:	0d813e03          	ld	t3,216(sp)
    800021f0:	0e013e83          	ld	t4,224(sp)
    800021f4:	0e813f03          	ld	t5,232(sp)
    800021f8:	0f013f83          	ld	t6,240(sp)
    800021fc:	10010113          	addi	sp,sp,256
    80002200:	10200073          	sret
    80002204:	00000013          	nop
    80002208:	00000013          	nop
    8000220c:	00000013          	nop

0000000080002210 <timervec>:
    80002210:	34051573          	csrrw	a0,mscratch,a0
    80002214:	00b53023          	sd	a1,0(a0)
    80002218:	00c53423          	sd	a2,8(a0)
    8000221c:	00d53823          	sd	a3,16(a0)
    80002220:	01853583          	ld	a1,24(a0)
    80002224:	02053603          	ld	a2,32(a0)
    80002228:	0005b683          	ld	a3,0(a1)
    8000222c:	00c686b3          	add	a3,a3,a2
    80002230:	00d5b023          	sd	a3,0(a1)
    80002234:	00200593          	li	a1,2
    80002238:	14459073          	csrw	sip,a1
    8000223c:	01053683          	ld	a3,16(a0)
    80002240:	00853603          	ld	a2,8(a0)
    80002244:	00053583          	ld	a1,0(a0)
    80002248:	34051573          	csrrw	a0,mscratch,a0
    8000224c:	30200073          	mret

0000000080002250 <plicinit>:
    80002250:	ff010113          	addi	sp,sp,-16
    80002254:	00813423          	sd	s0,8(sp)
    80002258:	01010413          	addi	s0,sp,16
    8000225c:	00813403          	ld	s0,8(sp)
    80002260:	0c0007b7          	lui	a5,0xc000
    80002264:	00100713          	li	a4,1
    80002268:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000226c:	00e7a223          	sw	a4,4(a5)
    80002270:	01010113          	addi	sp,sp,16
    80002274:	00008067          	ret

0000000080002278 <plicinithart>:
    80002278:	ff010113          	addi	sp,sp,-16
    8000227c:	00813023          	sd	s0,0(sp)
    80002280:	00113423          	sd	ra,8(sp)
    80002284:	01010413          	addi	s0,sp,16
    80002288:	00000097          	auipc	ra,0x0
    8000228c:	a4c080e7          	jalr	-1460(ra) # 80001cd4 <cpuid>
    80002290:	0085171b          	slliw	a4,a0,0x8
    80002294:	0c0027b7          	lui	a5,0xc002
    80002298:	00e787b3          	add	a5,a5,a4
    8000229c:	40200713          	li	a4,1026
    800022a0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800022a4:	00813083          	ld	ra,8(sp)
    800022a8:	00013403          	ld	s0,0(sp)
    800022ac:	00d5151b          	slliw	a0,a0,0xd
    800022b0:	0c2017b7          	lui	a5,0xc201
    800022b4:	00a78533          	add	a0,a5,a0
    800022b8:	00052023          	sw	zero,0(a0)
    800022bc:	01010113          	addi	sp,sp,16
    800022c0:	00008067          	ret

00000000800022c4 <plic_claim>:
    800022c4:	ff010113          	addi	sp,sp,-16
    800022c8:	00813023          	sd	s0,0(sp)
    800022cc:	00113423          	sd	ra,8(sp)
    800022d0:	01010413          	addi	s0,sp,16
    800022d4:	00000097          	auipc	ra,0x0
    800022d8:	a00080e7          	jalr	-1536(ra) # 80001cd4 <cpuid>
    800022dc:	00813083          	ld	ra,8(sp)
    800022e0:	00013403          	ld	s0,0(sp)
    800022e4:	00d5151b          	slliw	a0,a0,0xd
    800022e8:	0c2017b7          	lui	a5,0xc201
    800022ec:	00a78533          	add	a0,a5,a0
    800022f0:	00452503          	lw	a0,4(a0)
    800022f4:	01010113          	addi	sp,sp,16
    800022f8:	00008067          	ret

00000000800022fc <plic_complete>:
    800022fc:	fe010113          	addi	sp,sp,-32
    80002300:	00813823          	sd	s0,16(sp)
    80002304:	00913423          	sd	s1,8(sp)
    80002308:	00113c23          	sd	ra,24(sp)
    8000230c:	02010413          	addi	s0,sp,32
    80002310:	00050493          	mv	s1,a0
    80002314:	00000097          	auipc	ra,0x0
    80002318:	9c0080e7          	jalr	-1600(ra) # 80001cd4 <cpuid>
    8000231c:	01813083          	ld	ra,24(sp)
    80002320:	01013403          	ld	s0,16(sp)
    80002324:	00d5179b          	slliw	a5,a0,0xd
    80002328:	0c201737          	lui	a4,0xc201
    8000232c:	00f707b3          	add	a5,a4,a5
    80002330:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80002334:	00813483          	ld	s1,8(sp)
    80002338:	02010113          	addi	sp,sp,32
    8000233c:	00008067          	ret

0000000080002340 <consolewrite>:
    80002340:	fb010113          	addi	sp,sp,-80
    80002344:	04813023          	sd	s0,64(sp)
    80002348:	04113423          	sd	ra,72(sp)
    8000234c:	02913c23          	sd	s1,56(sp)
    80002350:	03213823          	sd	s2,48(sp)
    80002354:	03313423          	sd	s3,40(sp)
    80002358:	03413023          	sd	s4,32(sp)
    8000235c:	01513c23          	sd	s5,24(sp)
    80002360:	05010413          	addi	s0,sp,80
    80002364:	06c05c63          	blez	a2,800023dc <consolewrite+0x9c>
    80002368:	00060993          	mv	s3,a2
    8000236c:	00050a13          	mv	s4,a0
    80002370:	00058493          	mv	s1,a1
    80002374:	00000913          	li	s2,0
    80002378:	fff00a93          	li	s5,-1
    8000237c:	01c0006f          	j	80002398 <consolewrite+0x58>
    80002380:	fbf44503          	lbu	a0,-65(s0)
    80002384:	0019091b          	addiw	s2,s2,1
    80002388:	00148493          	addi	s1,s1,1
    8000238c:	00001097          	auipc	ra,0x1
    80002390:	a9c080e7          	jalr	-1380(ra) # 80002e28 <uartputc>
    80002394:	03298063          	beq	s3,s2,800023b4 <consolewrite+0x74>
    80002398:	00048613          	mv	a2,s1
    8000239c:	00100693          	li	a3,1
    800023a0:	000a0593          	mv	a1,s4
    800023a4:	fbf40513          	addi	a0,s0,-65
    800023a8:	00000097          	auipc	ra,0x0
    800023ac:	9e4080e7          	jalr	-1564(ra) # 80001d8c <either_copyin>
    800023b0:	fd5518e3          	bne	a0,s5,80002380 <consolewrite+0x40>
    800023b4:	04813083          	ld	ra,72(sp)
    800023b8:	04013403          	ld	s0,64(sp)
    800023bc:	03813483          	ld	s1,56(sp)
    800023c0:	02813983          	ld	s3,40(sp)
    800023c4:	02013a03          	ld	s4,32(sp)
    800023c8:	01813a83          	ld	s5,24(sp)
    800023cc:	00090513          	mv	a0,s2
    800023d0:	03013903          	ld	s2,48(sp)
    800023d4:	05010113          	addi	sp,sp,80
    800023d8:	00008067          	ret
    800023dc:	00000913          	li	s2,0
    800023e0:	fd5ff06f          	j	800023b4 <consolewrite+0x74>

00000000800023e4 <consoleread>:
    800023e4:	f9010113          	addi	sp,sp,-112
    800023e8:	06813023          	sd	s0,96(sp)
    800023ec:	04913c23          	sd	s1,88(sp)
    800023f0:	05213823          	sd	s2,80(sp)
    800023f4:	05313423          	sd	s3,72(sp)
    800023f8:	05413023          	sd	s4,64(sp)
    800023fc:	03513c23          	sd	s5,56(sp)
    80002400:	03613823          	sd	s6,48(sp)
    80002404:	03713423          	sd	s7,40(sp)
    80002408:	03813023          	sd	s8,32(sp)
    8000240c:	06113423          	sd	ra,104(sp)
    80002410:	01913c23          	sd	s9,24(sp)
    80002414:	07010413          	addi	s0,sp,112
    80002418:	00060b93          	mv	s7,a2
    8000241c:	00050913          	mv	s2,a0
    80002420:	00058c13          	mv	s8,a1
    80002424:	00060b1b          	sext.w	s6,a2
    80002428:	00003497          	auipc	s1,0x3
    8000242c:	30048493          	addi	s1,s1,768 # 80005728 <cons>
    80002430:	00400993          	li	s3,4
    80002434:	fff00a13          	li	s4,-1
    80002438:	00a00a93          	li	s5,10
    8000243c:	05705e63          	blez	s7,80002498 <consoleread+0xb4>
    80002440:	09c4a703          	lw	a4,156(s1)
    80002444:	0984a783          	lw	a5,152(s1)
    80002448:	0007071b          	sext.w	a4,a4
    8000244c:	08e78463          	beq	a5,a4,800024d4 <consoleread+0xf0>
    80002450:	07f7f713          	andi	a4,a5,127
    80002454:	00e48733          	add	a4,s1,a4
    80002458:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000245c:	0017869b          	addiw	a3,a5,1
    80002460:	08d4ac23          	sw	a3,152(s1)
    80002464:	00070c9b          	sext.w	s9,a4
    80002468:	0b370663          	beq	a4,s3,80002514 <consoleread+0x130>
    8000246c:	00100693          	li	a3,1
    80002470:	f9f40613          	addi	a2,s0,-97
    80002474:	000c0593          	mv	a1,s8
    80002478:	00090513          	mv	a0,s2
    8000247c:	f8e40fa3          	sb	a4,-97(s0)
    80002480:	00000097          	auipc	ra,0x0
    80002484:	8c0080e7          	jalr	-1856(ra) # 80001d40 <either_copyout>
    80002488:	01450863          	beq	a0,s4,80002498 <consoleread+0xb4>
    8000248c:	001c0c13          	addi	s8,s8,1
    80002490:	fffb8b9b          	addiw	s7,s7,-1
    80002494:	fb5c94e3          	bne	s9,s5,8000243c <consoleread+0x58>
    80002498:	000b851b          	sext.w	a0,s7
    8000249c:	06813083          	ld	ra,104(sp)
    800024a0:	06013403          	ld	s0,96(sp)
    800024a4:	05813483          	ld	s1,88(sp)
    800024a8:	05013903          	ld	s2,80(sp)
    800024ac:	04813983          	ld	s3,72(sp)
    800024b0:	04013a03          	ld	s4,64(sp)
    800024b4:	03813a83          	ld	s5,56(sp)
    800024b8:	02813b83          	ld	s7,40(sp)
    800024bc:	02013c03          	ld	s8,32(sp)
    800024c0:	01813c83          	ld	s9,24(sp)
    800024c4:	40ab053b          	subw	a0,s6,a0
    800024c8:	03013b03          	ld	s6,48(sp)
    800024cc:	07010113          	addi	sp,sp,112
    800024d0:	00008067          	ret
    800024d4:	00001097          	auipc	ra,0x1
    800024d8:	1d8080e7          	jalr	472(ra) # 800036ac <push_on>
    800024dc:	0984a703          	lw	a4,152(s1)
    800024e0:	09c4a783          	lw	a5,156(s1)
    800024e4:	0007879b          	sext.w	a5,a5
    800024e8:	fef70ce3          	beq	a4,a5,800024e0 <consoleread+0xfc>
    800024ec:	00001097          	auipc	ra,0x1
    800024f0:	234080e7          	jalr	564(ra) # 80003720 <pop_on>
    800024f4:	0984a783          	lw	a5,152(s1)
    800024f8:	07f7f713          	andi	a4,a5,127
    800024fc:	00e48733          	add	a4,s1,a4
    80002500:	01874703          	lbu	a4,24(a4)
    80002504:	0017869b          	addiw	a3,a5,1
    80002508:	08d4ac23          	sw	a3,152(s1)
    8000250c:	00070c9b          	sext.w	s9,a4
    80002510:	f5371ee3          	bne	a4,s3,8000246c <consoleread+0x88>
    80002514:	000b851b          	sext.w	a0,s7
    80002518:	f96bf2e3          	bgeu	s7,s6,8000249c <consoleread+0xb8>
    8000251c:	08f4ac23          	sw	a5,152(s1)
    80002520:	f7dff06f          	j	8000249c <consoleread+0xb8>

0000000080002524 <consputc>:
    80002524:	10000793          	li	a5,256
    80002528:	00f50663          	beq	a0,a5,80002534 <consputc+0x10>
    8000252c:	00001317          	auipc	t1,0x1
    80002530:	9f430067          	jr	-1548(t1) # 80002f20 <uartputc_sync>
    80002534:	ff010113          	addi	sp,sp,-16
    80002538:	00113423          	sd	ra,8(sp)
    8000253c:	00813023          	sd	s0,0(sp)
    80002540:	01010413          	addi	s0,sp,16
    80002544:	00800513          	li	a0,8
    80002548:	00001097          	auipc	ra,0x1
    8000254c:	9d8080e7          	jalr	-1576(ra) # 80002f20 <uartputc_sync>
    80002550:	02000513          	li	a0,32
    80002554:	00001097          	auipc	ra,0x1
    80002558:	9cc080e7          	jalr	-1588(ra) # 80002f20 <uartputc_sync>
    8000255c:	00013403          	ld	s0,0(sp)
    80002560:	00813083          	ld	ra,8(sp)
    80002564:	00800513          	li	a0,8
    80002568:	01010113          	addi	sp,sp,16
    8000256c:	00001317          	auipc	t1,0x1
    80002570:	9b430067          	jr	-1612(t1) # 80002f20 <uartputc_sync>

0000000080002574 <consoleintr>:
    80002574:	fe010113          	addi	sp,sp,-32
    80002578:	00813823          	sd	s0,16(sp)
    8000257c:	00913423          	sd	s1,8(sp)
    80002580:	01213023          	sd	s2,0(sp)
    80002584:	00113c23          	sd	ra,24(sp)
    80002588:	02010413          	addi	s0,sp,32
    8000258c:	00003917          	auipc	s2,0x3
    80002590:	19c90913          	addi	s2,s2,412 # 80005728 <cons>
    80002594:	00050493          	mv	s1,a0
    80002598:	00090513          	mv	a0,s2
    8000259c:	00001097          	auipc	ra,0x1
    800025a0:	e40080e7          	jalr	-448(ra) # 800033dc <acquire>
    800025a4:	02048c63          	beqz	s1,800025dc <consoleintr+0x68>
    800025a8:	0a092783          	lw	a5,160(s2)
    800025ac:	09892703          	lw	a4,152(s2)
    800025b0:	07f00693          	li	a3,127
    800025b4:	40e7873b          	subw	a4,a5,a4
    800025b8:	02e6e263          	bltu	a3,a4,800025dc <consoleintr+0x68>
    800025bc:	00d00713          	li	a4,13
    800025c0:	04e48063          	beq	s1,a4,80002600 <consoleintr+0x8c>
    800025c4:	07f7f713          	andi	a4,a5,127
    800025c8:	00e90733          	add	a4,s2,a4
    800025cc:	0017879b          	addiw	a5,a5,1
    800025d0:	0af92023          	sw	a5,160(s2)
    800025d4:	00970c23          	sb	s1,24(a4)
    800025d8:	08f92e23          	sw	a5,156(s2)
    800025dc:	01013403          	ld	s0,16(sp)
    800025e0:	01813083          	ld	ra,24(sp)
    800025e4:	00813483          	ld	s1,8(sp)
    800025e8:	00013903          	ld	s2,0(sp)
    800025ec:	00003517          	auipc	a0,0x3
    800025f0:	13c50513          	addi	a0,a0,316 # 80005728 <cons>
    800025f4:	02010113          	addi	sp,sp,32
    800025f8:	00001317          	auipc	t1,0x1
    800025fc:	eb030067          	jr	-336(t1) # 800034a8 <release>
    80002600:	00a00493          	li	s1,10
    80002604:	fc1ff06f          	j	800025c4 <consoleintr+0x50>

0000000080002608 <consoleinit>:
    80002608:	fe010113          	addi	sp,sp,-32
    8000260c:	00113c23          	sd	ra,24(sp)
    80002610:	00813823          	sd	s0,16(sp)
    80002614:	00913423          	sd	s1,8(sp)
    80002618:	02010413          	addi	s0,sp,32
    8000261c:	00003497          	auipc	s1,0x3
    80002620:	10c48493          	addi	s1,s1,268 # 80005728 <cons>
    80002624:	00048513          	mv	a0,s1
    80002628:	00002597          	auipc	a1,0x2
    8000262c:	cb858593          	addi	a1,a1,-840 # 800042e0 <CONSOLE_STATUS+0x2d0>
    80002630:	00001097          	auipc	ra,0x1
    80002634:	d88080e7          	jalr	-632(ra) # 800033b8 <initlock>
    80002638:	00000097          	auipc	ra,0x0
    8000263c:	7ac080e7          	jalr	1964(ra) # 80002de4 <uartinit>
    80002640:	01813083          	ld	ra,24(sp)
    80002644:	01013403          	ld	s0,16(sp)
    80002648:	00000797          	auipc	a5,0x0
    8000264c:	d9c78793          	addi	a5,a5,-612 # 800023e4 <consoleread>
    80002650:	0af4bc23          	sd	a5,184(s1)
    80002654:	00000797          	auipc	a5,0x0
    80002658:	cec78793          	addi	a5,a5,-788 # 80002340 <consolewrite>
    8000265c:	0cf4b023          	sd	a5,192(s1)
    80002660:	00813483          	ld	s1,8(sp)
    80002664:	02010113          	addi	sp,sp,32
    80002668:	00008067          	ret

000000008000266c <console_read>:
    8000266c:	ff010113          	addi	sp,sp,-16
    80002670:	00813423          	sd	s0,8(sp)
    80002674:	01010413          	addi	s0,sp,16
    80002678:	00813403          	ld	s0,8(sp)
    8000267c:	00003317          	auipc	t1,0x3
    80002680:	16433303          	ld	t1,356(t1) # 800057e0 <devsw+0x10>
    80002684:	01010113          	addi	sp,sp,16
    80002688:	00030067          	jr	t1

000000008000268c <console_write>:
    8000268c:	ff010113          	addi	sp,sp,-16
    80002690:	00813423          	sd	s0,8(sp)
    80002694:	01010413          	addi	s0,sp,16
    80002698:	00813403          	ld	s0,8(sp)
    8000269c:	00003317          	auipc	t1,0x3
    800026a0:	14c33303          	ld	t1,332(t1) # 800057e8 <devsw+0x18>
    800026a4:	01010113          	addi	sp,sp,16
    800026a8:	00030067          	jr	t1

00000000800026ac <panic>:
    800026ac:	fe010113          	addi	sp,sp,-32
    800026b0:	00113c23          	sd	ra,24(sp)
    800026b4:	00813823          	sd	s0,16(sp)
    800026b8:	00913423          	sd	s1,8(sp)
    800026bc:	02010413          	addi	s0,sp,32
    800026c0:	00050493          	mv	s1,a0
    800026c4:	00002517          	auipc	a0,0x2
    800026c8:	c2450513          	addi	a0,a0,-988 # 800042e8 <CONSOLE_STATUS+0x2d8>
    800026cc:	00003797          	auipc	a5,0x3
    800026d0:	1a07ae23          	sw	zero,444(a5) # 80005888 <pr+0x18>
    800026d4:	00000097          	auipc	ra,0x0
    800026d8:	034080e7          	jalr	52(ra) # 80002708 <__printf>
    800026dc:	00048513          	mv	a0,s1
    800026e0:	00000097          	auipc	ra,0x0
    800026e4:	028080e7          	jalr	40(ra) # 80002708 <__printf>
    800026e8:	00002517          	auipc	a0,0x2
    800026ec:	a8050513          	addi	a0,a0,-1408 # 80004168 <CONSOLE_STATUS+0x158>
    800026f0:	00000097          	auipc	ra,0x0
    800026f4:	018080e7          	jalr	24(ra) # 80002708 <__printf>
    800026f8:	00100793          	li	a5,1
    800026fc:	00002717          	auipc	a4,0x2
    80002700:	f2f72623          	sw	a5,-212(a4) # 80004628 <panicked>
    80002704:	0000006f          	j	80002704 <panic+0x58>

0000000080002708 <__printf>:
    80002708:	f3010113          	addi	sp,sp,-208
    8000270c:	08813023          	sd	s0,128(sp)
    80002710:	07313423          	sd	s3,104(sp)
    80002714:	09010413          	addi	s0,sp,144
    80002718:	05813023          	sd	s8,64(sp)
    8000271c:	08113423          	sd	ra,136(sp)
    80002720:	06913c23          	sd	s1,120(sp)
    80002724:	07213823          	sd	s2,112(sp)
    80002728:	07413023          	sd	s4,96(sp)
    8000272c:	05513c23          	sd	s5,88(sp)
    80002730:	05613823          	sd	s6,80(sp)
    80002734:	05713423          	sd	s7,72(sp)
    80002738:	03913c23          	sd	s9,56(sp)
    8000273c:	03a13823          	sd	s10,48(sp)
    80002740:	03b13423          	sd	s11,40(sp)
    80002744:	00003317          	auipc	t1,0x3
    80002748:	12c30313          	addi	t1,t1,300 # 80005870 <pr>
    8000274c:	01832c03          	lw	s8,24(t1)
    80002750:	00b43423          	sd	a1,8(s0)
    80002754:	00c43823          	sd	a2,16(s0)
    80002758:	00d43c23          	sd	a3,24(s0)
    8000275c:	02e43023          	sd	a4,32(s0)
    80002760:	02f43423          	sd	a5,40(s0)
    80002764:	03043823          	sd	a6,48(s0)
    80002768:	03143c23          	sd	a7,56(s0)
    8000276c:	00050993          	mv	s3,a0
    80002770:	4a0c1663          	bnez	s8,80002c1c <__printf+0x514>
    80002774:	60098c63          	beqz	s3,80002d8c <__printf+0x684>
    80002778:	0009c503          	lbu	a0,0(s3)
    8000277c:	00840793          	addi	a5,s0,8
    80002780:	f6f43c23          	sd	a5,-136(s0)
    80002784:	00000493          	li	s1,0
    80002788:	22050063          	beqz	a0,800029a8 <__printf+0x2a0>
    8000278c:	00002a37          	lui	s4,0x2
    80002790:	00018ab7          	lui	s5,0x18
    80002794:	000f4b37          	lui	s6,0xf4
    80002798:	00989bb7          	lui	s7,0x989
    8000279c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800027a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800027a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800027a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800027ac:	00148c9b          	addiw	s9,s1,1
    800027b0:	02500793          	li	a5,37
    800027b4:	01998933          	add	s2,s3,s9
    800027b8:	38f51263          	bne	a0,a5,80002b3c <__printf+0x434>
    800027bc:	00094783          	lbu	a5,0(s2)
    800027c0:	00078c9b          	sext.w	s9,a5
    800027c4:	1e078263          	beqz	a5,800029a8 <__printf+0x2a0>
    800027c8:	0024849b          	addiw	s1,s1,2
    800027cc:	07000713          	li	a4,112
    800027d0:	00998933          	add	s2,s3,s1
    800027d4:	38e78a63          	beq	a5,a4,80002b68 <__printf+0x460>
    800027d8:	20f76863          	bltu	a4,a5,800029e8 <__printf+0x2e0>
    800027dc:	42a78863          	beq	a5,a0,80002c0c <__printf+0x504>
    800027e0:	06400713          	li	a4,100
    800027e4:	40e79663          	bne	a5,a4,80002bf0 <__printf+0x4e8>
    800027e8:	f7843783          	ld	a5,-136(s0)
    800027ec:	0007a603          	lw	a2,0(a5)
    800027f0:	00878793          	addi	a5,a5,8
    800027f4:	f6f43c23          	sd	a5,-136(s0)
    800027f8:	42064a63          	bltz	a2,80002c2c <__printf+0x524>
    800027fc:	00a00713          	li	a4,10
    80002800:	02e677bb          	remuw	a5,a2,a4
    80002804:	00002d97          	auipc	s11,0x2
    80002808:	b0cd8d93          	addi	s11,s11,-1268 # 80004310 <digits>
    8000280c:	00900593          	li	a1,9
    80002810:	0006051b          	sext.w	a0,a2
    80002814:	00000c93          	li	s9,0
    80002818:	02079793          	slli	a5,a5,0x20
    8000281c:	0207d793          	srli	a5,a5,0x20
    80002820:	00fd87b3          	add	a5,s11,a5
    80002824:	0007c783          	lbu	a5,0(a5)
    80002828:	02e656bb          	divuw	a3,a2,a4
    8000282c:	f8f40023          	sb	a5,-128(s0)
    80002830:	14c5d863          	bge	a1,a2,80002980 <__printf+0x278>
    80002834:	06300593          	li	a1,99
    80002838:	00100c93          	li	s9,1
    8000283c:	02e6f7bb          	remuw	a5,a3,a4
    80002840:	02079793          	slli	a5,a5,0x20
    80002844:	0207d793          	srli	a5,a5,0x20
    80002848:	00fd87b3          	add	a5,s11,a5
    8000284c:	0007c783          	lbu	a5,0(a5)
    80002850:	02e6d73b          	divuw	a4,a3,a4
    80002854:	f8f400a3          	sb	a5,-127(s0)
    80002858:	12a5f463          	bgeu	a1,a0,80002980 <__printf+0x278>
    8000285c:	00a00693          	li	a3,10
    80002860:	00900593          	li	a1,9
    80002864:	02d777bb          	remuw	a5,a4,a3
    80002868:	02079793          	slli	a5,a5,0x20
    8000286c:	0207d793          	srli	a5,a5,0x20
    80002870:	00fd87b3          	add	a5,s11,a5
    80002874:	0007c503          	lbu	a0,0(a5)
    80002878:	02d757bb          	divuw	a5,a4,a3
    8000287c:	f8a40123          	sb	a0,-126(s0)
    80002880:	48e5f263          	bgeu	a1,a4,80002d04 <__printf+0x5fc>
    80002884:	06300513          	li	a0,99
    80002888:	02d7f5bb          	remuw	a1,a5,a3
    8000288c:	02059593          	slli	a1,a1,0x20
    80002890:	0205d593          	srli	a1,a1,0x20
    80002894:	00bd85b3          	add	a1,s11,a1
    80002898:	0005c583          	lbu	a1,0(a1)
    8000289c:	02d7d7bb          	divuw	a5,a5,a3
    800028a0:	f8b401a3          	sb	a1,-125(s0)
    800028a4:	48e57263          	bgeu	a0,a4,80002d28 <__printf+0x620>
    800028a8:	3e700513          	li	a0,999
    800028ac:	02d7f5bb          	remuw	a1,a5,a3
    800028b0:	02059593          	slli	a1,a1,0x20
    800028b4:	0205d593          	srli	a1,a1,0x20
    800028b8:	00bd85b3          	add	a1,s11,a1
    800028bc:	0005c583          	lbu	a1,0(a1)
    800028c0:	02d7d7bb          	divuw	a5,a5,a3
    800028c4:	f8b40223          	sb	a1,-124(s0)
    800028c8:	46e57663          	bgeu	a0,a4,80002d34 <__printf+0x62c>
    800028cc:	02d7f5bb          	remuw	a1,a5,a3
    800028d0:	02059593          	slli	a1,a1,0x20
    800028d4:	0205d593          	srli	a1,a1,0x20
    800028d8:	00bd85b3          	add	a1,s11,a1
    800028dc:	0005c583          	lbu	a1,0(a1)
    800028e0:	02d7d7bb          	divuw	a5,a5,a3
    800028e4:	f8b402a3          	sb	a1,-123(s0)
    800028e8:	46ea7863          	bgeu	s4,a4,80002d58 <__printf+0x650>
    800028ec:	02d7f5bb          	remuw	a1,a5,a3
    800028f0:	02059593          	slli	a1,a1,0x20
    800028f4:	0205d593          	srli	a1,a1,0x20
    800028f8:	00bd85b3          	add	a1,s11,a1
    800028fc:	0005c583          	lbu	a1,0(a1)
    80002900:	02d7d7bb          	divuw	a5,a5,a3
    80002904:	f8b40323          	sb	a1,-122(s0)
    80002908:	3eeaf863          	bgeu	s5,a4,80002cf8 <__printf+0x5f0>
    8000290c:	02d7f5bb          	remuw	a1,a5,a3
    80002910:	02059593          	slli	a1,a1,0x20
    80002914:	0205d593          	srli	a1,a1,0x20
    80002918:	00bd85b3          	add	a1,s11,a1
    8000291c:	0005c583          	lbu	a1,0(a1)
    80002920:	02d7d7bb          	divuw	a5,a5,a3
    80002924:	f8b403a3          	sb	a1,-121(s0)
    80002928:	42eb7e63          	bgeu	s6,a4,80002d64 <__printf+0x65c>
    8000292c:	02d7f5bb          	remuw	a1,a5,a3
    80002930:	02059593          	slli	a1,a1,0x20
    80002934:	0205d593          	srli	a1,a1,0x20
    80002938:	00bd85b3          	add	a1,s11,a1
    8000293c:	0005c583          	lbu	a1,0(a1)
    80002940:	02d7d7bb          	divuw	a5,a5,a3
    80002944:	f8b40423          	sb	a1,-120(s0)
    80002948:	42ebfc63          	bgeu	s7,a4,80002d80 <__printf+0x678>
    8000294c:	02079793          	slli	a5,a5,0x20
    80002950:	0207d793          	srli	a5,a5,0x20
    80002954:	00fd8db3          	add	s11,s11,a5
    80002958:	000dc703          	lbu	a4,0(s11)
    8000295c:	00a00793          	li	a5,10
    80002960:	00900c93          	li	s9,9
    80002964:	f8e404a3          	sb	a4,-119(s0)
    80002968:	00065c63          	bgez	a2,80002980 <__printf+0x278>
    8000296c:	f9040713          	addi	a4,s0,-112
    80002970:	00f70733          	add	a4,a4,a5
    80002974:	02d00693          	li	a3,45
    80002978:	fed70823          	sb	a3,-16(a4)
    8000297c:	00078c93          	mv	s9,a5
    80002980:	f8040793          	addi	a5,s0,-128
    80002984:	01978cb3          	add	s9,a5,s9
    80002988:	f7f40d13          	addi	s10,s0,-129
    8000298c:	000cc503          	lbu	a0,0(s9)
    80002990:	fffc8c93          	addi	s9,s9,-1
    80002994:	00000097          	auipc	ra,0x0
    80002998:	b90080e7          	jalr	-1136(ra) # 80002524 <consputc>
    8000299c:	ffac98e3          	bne	s9,s10,8000298c <__printf+0x284>
    800029a0:	00094503          	lbu	a0,0(s2)
    800029a4:	e00514e3          	bnez	a0,800027ac <__printf+0xa4>
    800029a8:	1a0c1663          	bnez	s8,80002b54 <__printf+0x44c>
    800029ac:	08813083          	ld	ra,136(sp)
    800029b0:	08013403          	ld	s0,128(sp)
    800029b4:	07813483          	ld	s1,120(sp)
    800029b8:	07013903          	ld	s2,112(sp)
    800029bc:	06813983          	ld	s3,104(sp)
    800029c0:	06013a03          	ld	s4,96(sp)
    800029c4:	05813a83          	ld	s5,88(sp)
    800029c8:	05013b03          	ld	s6,80(sp)
    800029cc:	04813b83          	ld	s7,72(sp)
    800029d0:	04013c03          	ld	s8,64(sp)
    800029d4:	03813c83          	ld	s9,56(sp)
    800029d8:	03013d03          	ld	s10,48(sp)
    800029dc:	02813d83          	ld	s11,40(sp)
    800029e0:	0d010113          	addi	sp,sp,208
    800029e4:	00008067          	ret
    800029e8:	07300713          	li	a4,115
    800029ec:	1ce78a63          	beq	a5,a4,80002bc0 <__printf+0x4b8>
    800029f0:	07800713          	li	a4,120
    800029f4:	1ee79e63          	bne	a5,a4,80002bf0 <__printf+0x4e8>
    800029f8:	f7843783          	ld	a5,-136(s0)
    800029fc:	0007a703          	lw	a4,0(a5)
    80002a00:	00878793          	addi	a5,a5,8
    80002a04:	f6f43c23          	sd	a5,-136(s0)
    80002a08:	28074263          	bltz	a4,80002c8c <__printf+0x584>
    80002a0c:	00002d97          	auipc	s11,0x2
    80002a10:	904d8d93          	addi	s11,s11,-1788 # 80004310 <digits>
    80002a14:	00f77793          	andi	a5,a4,15
    80002a18:	00fd87b3          	add	a5,s11,a5
    80002a1c:	0007c683          	lbu	a3,0(a5)
    80002a20:	00f00613          	li	a2,15
    80002a24:	0007079b          	sext.w	a5,a4
    80002a28:	f8d40023          	sb	a3,-128(s0)
    80002a2c:	0047559b          	srliw	a1,a4,0x4
    80002a30:	0047569b          	srliw	a3,a4,0x4
    80002a34:	00000c93          	li	s9,0
    80002a38:	0ee65063          	bge	a2,a4,80002b18 <__printf+0x410>
    80002a3c:	00f6f693          	andi	a3,a3,15
    80002a40:	00dd86b3          	add	a3,s11,a3
    80002a44:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002a48:	0087d79b          	srliw	a5,a5,0x8
    80002a4c:	00100c93          	li	s9,1
    80002a50:	f8d400a3          	sb	a3,-127(s0)
    80002a54:	0cb67263          	bgeu	a2,a1,80002b18 <__printf+0x410>
    80002a58:	00f7f693          	andi	a3,a5,15
    80002a5c:	00dd86b3          	add	a3,s11,a3
    80002a60:	0006c583          	lbu	a1,0(a3)
    80002a64:	00f00613          	li	a2,15
    80002a68:	0047d69b          	srliw	a3,a5,0x4
    80002a6c:	f8b40123          	sb	a1,-126(s0)
    80002a70:	0047d593          	srli	a1,a5,0x4
    80002a74:	28f67e63          	bgeu	a2,a5,80002d10 <__printf+0x608>
    80002a78:	00f6f693          	andi	a3,a3,15
    80002a7c:	00dd86b3          	add	a3,s11,a3
    80002a80:	0006c503          	lbu	a0,0(a3)
    80002a84:	0087d813          	srli	a6,a5,0x8
    80002a88:	0087d69b          	srliw	a3,a5,0x8
    80002a8c:	f8a401a3          	sb	a0,-125(s0)
    80002a90:	28b67663          	bgeu	a2,a1,80002d1c <__printf+0x614>
    80002a94:	00f6f693          	andi	a3,a3,15
    80002a98:	00dd86b3          	add	a3,s11,a3
    80002a9c:	0006c583          	lbu	a1,0(a3)
    80002aa0:	00c7d513          	srli	a0,a5,0xc
    80002aa4:	00c7d69b          	srliw	a3,a5,0xc
    80002aa8:	f8b40223          	sb	a1,-124(s0)
    80002aac:	29067a63          	bgeu	a2,a6,80002d40 <__printf+0x638>
    80002ab0:	00f6f693          	andi	a3,a3,15
    80002ab4:	00dd86b3          	add	a3,s11,a3
    80002ab8:	0006c583          	lbu	a1,0(a3)
    80002abc:	0107d813          	srli	a6,a5,0x10
    80002ac0:	0107d69b          	srliw	a3,a5,0x10
    80002ac4:	f8b402a3          	sb	a1,-123(s0)
    80002ac8:	28a67263          	bgeu	a2,a0,80002d4c <__printf+0x644>
    80002acc:	00f6f693          	andi	a3,a3,15
    80002ad0:	00dd86b3          	add	a3,s11,a3
    80002ad4:	0006c683          	lbu	a3,0(a3)
    80002ad8:	0147d79b          	srliw	a5,a5,0x14
    80002adc:	f8d40323          	sb	a3,-122(s0)
    80002ae0:	21067663          	bgeu	a2,a6,80002cec <__printf+0x5e4>
    80002ae4:	02079793          	slli	a5,a5,0x20
    80002ae8:	0207d793          	srli	a5,a5,0x20
    80002aec:	00fd8db3          	add	s11,s11,a5
    80002af0:	000dc683          	lbu	a3,0(s11)
    80002af4:	00800793          	li	a5,8
    80002af8:	00700c93          	li	s9,7
    80002afc:	f8d403a3          	sb	a3,-121(s0)
    80002b00:	00075c63          	bgez	a4,80002b18 <__printf+0x410>
    80002b04:	f9040713          	addi	a4,s0,-112
    80002b08:	00f70733          	add	a4,a4,a5
    80002b0c:	02d00693          	li	a3,45
    80002b10:	fed70823          	sb	a3,-16(a4)
    80002b14:	00078c93          	mv	s9,a5
    80002b18:	f8040793          	addi	a5,s0,-128
    80002b1c:	01978cb3          	add	s9,a5,s9
    80002b20:	f7f40d13          	addi	s10,s0,-129
    80002b24:	000cc503          	lbu	a0,0(s9)
    80002b28:	fffc8c93          	addi	s9,s9,-1
    80002b2c:	00000097          	auipc	ra,0x0
    80002b30:	9f8080e7          	jalr	-1544(ra) # 80002524 <consputc>
    80002b34:	ff9d18e3          	bne	s10,s9,80002b24 <__printf+0x41c>
    80002b38:	0100006f          	j	80002b48 <__printf+0x440>
    80002b3c:	00000097          	auipc	ra,0x0
    80002b40:	9e8080e7          	jalr	-1560(ra) # 80002524 <consputc>
    80002b44:	000c8493          	mv	s1,s9
    80002b48:	00094503          	lbu	a0,0(s2)
    80002b4c:	c60510e3          	bnez	a0,800027ac <__printf+0xa4>
    80002b50:	e40c0ee3          	beqz	s8,800029ac <__printf+0x2a4>
    80002b54:	00003517          	auipc	a0,0x3
    80002b58:	d1c50513          	addi	a0,a0,-740 # 80005870 <pr>
    80002b5c:	00001097          	auipc	ra,0x1
    80002b60:	94c080e7          	jalr	-1716(ra) # 800034a8 <release>
    80002b64:	e49ff06f          	j	800029ac <__printf+0x2a4>
    80002b68:	f7843783          	ld	a5,-136(s0)
    80002b6c:	03000513          	li	a0,48
    80002b70:	01000d13          	li	s10,16
    80002b74:	00878713          	addi	a4,a5,8
    80002b78:	0007bc83          	ld	s9,0(a5)
    80002b7c:	f6e43c23          	sd	a4,-136(s0)
    80002b80:	00000097          	auipc	ra,0x0
    80002b84:	9a4080e7          	jalr	-1628(ra) # 80002524 <consputc>
    80002b88:	07800513          	li	a0,120
    80002b8c:	00000097          	auipc	ra,0x0
    80002b90:	998080e7          	jalr	-1640(ra) # 80002524 <consputc>
    80002b94:	00001d97          	auipc	s11,0x1
    80002b98:	77cd8d93          	addi	s11,s11,1916 # 80004310 <digits>
    80002b9c:	03ccd793          	srli	a5,s9,0x3c
    80002ba0:	00fd87b3          	add	a5,s11,a5
    80002ba4:	0007c503          	lbu	a0,0(a5)
    80002ba8:	fffd0d1b          	addiw	s10,s10,-1
    80002bac:	004c9c93          	slli	s9,s9,0x4
    80002bb0:	00000097          	auipc	ra,0x0
    80002bb4:	974080e7          	jalr	-1676(ra) # 80002524 <consputc>
    80002bb8:	fe0d12e3          	bnez	s10,80002b9c <__printf+0x494>
    80002bbc:	f8dff06f          	j	80002b48 <__printf+0x440>
    80002bc0:	f7843783          	ld	a5,-136(s0)
    80002bc4:	0007bc83          	ld	s9,0(a5)
    80002bc8:	00878793          	addi	a5,a5,8
    80002bcc:	f6f43c23          	sd	a5,-136(s0)
    80002bd0:	000c9a63          	bnez	s9,80002be4 <__printf+0x4dc>
    80002bd4:	1080006f          	j	80002cdc <__printf+0x5d4>
    80002bd8:	001c8c93          	addi	s9,s9,1
    80002bdc:	00000097          	auipc	ra,0x0
    80002be0:	948080e7          	jalr	-1720(ra) # 80002524 <consputc>
    80002be4:	000cc503          	lbu	a0,0(s9)
    80002be8:	fe0518e3          	bnez	a0,80002bd8 <__printf+0x4d0>
    80002bec:	f5dff06f          	j	80002b48 <__printf+0x440>
    80002bf0:	02500513          	li	a0,37
    80002bf4:	00000097          	auipc	ra,0x0
    80002bf8:	930080e7          	jalr	-1744(ra) # 80002524 <consputc>
    80002bfc:	000c8513          	mv	a0,s9
    80002c00:	00000097          	auipc	ra,0x0
    80002c04:	924080e7          	jalr	-1756(ra) # 80002524 <consputc>
    80002c08:	f41ff06f          	j	80002b48 <__printf+0x440>
    80002c0c:	02500513          	li	a0,37
    80002c10:	00000097          	auipc	ra,0x0
    80002c14:	914080e7          	jalr	-1772(ra) # 80002524 <consputc>
    80002c18:	f31ff06f          	j	80002b48 <__printf+0x440>
    80002c1c:	00030513          	mv	a0,t1
    80002c20:	00000097          	auipc	ra,0x0
    80002c24:	7bc080e7          	jalr	1980(ra) # 800033dc <acquire>
    80002c28:	b4dff06f          	j	80002774 <__printf+0x6c>
    80002c2c:	40c0053b          	negw	a0,a2
    80002c30:	00a00713          	li	a4,10
    80002c34:	02e576bb          	remuw	a3,a0,a4
    80002c38:	00001d97          	auipc	s11,0x1
    80002c3c:	6d8d8d93          	addi	s11,s11,1752 # 80004310 <digits>
    80002c40:	ff700593          	li	a1,-9
    80002c44:	02069693          	slli	a3,a3,0x20
    80002c48:	0206d693          	srli	a3,a3,0x20
    80002c4c:	00dd86b3          	add	a3,s11,a3
    80002c50:	0006c683          	lbu	a3,0(a3)
    80002c54:	02e557bb          	divuw	a5,a0,a4
    80002c58:	f8d40023          	sb	a3,-128(s0)
    80002c5c:	10b65e63          	bge	a2,a1,80002d78 <__printf+0x670>
    80002c60:	06300593          	li	a1,99
    80002c64:	02e7f6bb          	remuw	a3,a5,a4
    80002c68:	02069693          	slli	a3,a3,0x20
    80002c6c:	0206d693          	srli	a3,a3,0x20
    80002c70:	00dd86b3          	add	a3,s11,a3
    80002c74:	0006c683          	lbu	a3,0(a3)
    80002c78:	02e7d73b          	divuw	a4,a5,a4
    80002c7c:	00200793          	li	a5,2
    80002c80:	f8d400a3          	sb	a3,-127(s0)
    80002c84:	bca5ece3          	bltu	a1,a0,8000285c <__printf+0x154>
    80002c88:	ce5ff06f          	j	8000296c <__printf+0x264>
    80002c8c:	40e007bb          	negw	a5,a4
    80002c90:	00001d97          	auipc	s11,0x1
    80002c94:	680d8d93          	addi	s11,s11,1664 # 80004310 <digits>
    80002c98:	00f7f693          	andi	a3,a5,15
    80002c9c:	00dd86b3          	add	a3,s11,a3
    80002ca0:	0006c583          	lbu	a1,0(a3)
    80002ca4:	ff100613          	li	a2,-15
    80002ca8:	0047d69b          	srliw	a3,a5,0x4
    80002cac:	f8b40023          	sb	a1,-128(s0)
    80002cb0:	0047d59b          	srliw	a1,a5,0x4
    80002cb4:	0ac75e63          	bge	a4,a2,80002d70 <__printf+0x668>
    80002cb8:	00f6f693          	andi	a3,a3,15
    80002cbc:	00dd86b3          	add	a3,s11,a3
    80002cc0:	0006c603          	lbu	a2,0(a3)
    80002cc4:	00f00693          	li	a3,15
    80002cc8:	0087d79b          	srliw	a5,a5,0x8
    80002ccc:	f8c400a3          	sb	a2,-127(s0)
    80002cd0:	d8b6e4e3          	bltu	a3,a1,80002a58 <__printf+0x350>
    80002cd4:	00200793          	li	a5,2
    80002cd8:	e2dff06f          	j	80002b04 <__printf+0x3fc>
    80002cdc:	00001c97          	auipc	s9,0x1
    80002ce0:	614c8c93          	addi	s9,s9,1556 # 800042f0 <CONSOLE_STATUS+0x2e0>
    80002ce4:	02800513          	li	a0,40
    80002ce8:	ef1ff06f          	j	80002bd8 <__printf+0x4d0>
    80002cec:	00700793          	li	a5,7
    80002cf0:	00600c93          	li	s9,6
    80002cf4:	e0dff06f          	j	80002b00 <__printf+0x3f8>
    80002cf8:	00700793          	li	a5,7
    80002cfc:	00600c93          	li	s9,6
    80002d00:	c69ff06f          	j	80002968 <__printf+0x260>
    80002d04:	00300793          	li	a5,3
    80002d08:	00200c93          	li	s9,2
    80002d0c:	c5dff06f          	j	80002968 <__printf+0x260>
    80002d10:	00300793          	li	a5,3
    80002d14:	00200c93          	li	s9,2
    80002d18:	de9ff06f          	j	80002b00 <__printf+0x3f8>
    80002d1c:	00400793          	li	a5,4
    80002d20:	00300c93          	li	s9,3
    80002d24:	dddff06f          	j	80002b00 <__printf+0x3f8>
    80002d28:	00400793          	li	a5,4
    80002d2c:	00300c93          	li	s9,3
    80002d30:	c39ff06f          	j	80002968 <__printf+0x260>
    80002d34:	00500793          	li	a5,5
    80002d38:	00400c93          	li	s9,4
    80002d3c:	c2dff06f          	j	80002968 <__printf+0x260>
    80002d40:	00500793          	li	a5,5
    80002d44:	00400c93          	li	s9,4
    80002d48:	db9ff06f          	j	80002b00 <__printf+0x3f8>
    80002d4c:	00600793          	li	a5,6
    80002d50:	00500c93          	li	s9,5
    80002d54:	dadff06f          	j	80002b00 <__printf+0x3f8>
    80002d58:	00600793          	li	a5,6
    80002d5c:	00500c93          	li	s9,5
    80002d60:	c09ff06f          	j	80002968 <__printf+0x260>
    80002d64:	00800793          	li	a5,8
    80002d68:	00700c93          	li	s9,7
    80002d6c:	bfdff06f          	j	80002968 <__printf+0x260>
    80002d70:	00100793          	li	a5,1
    80002d74:	d91ff06f          	j	80002b04 <__printf+0x3fc>
    80002d78:	00100793          	li	a5,1
    80002d7c:	bf1ff06f          	j	8000296c <__printf+0x264>
    80002d80:	00900793          	li	a5,9
    80002d84:	00800c93          	li	s9,8
    80002d88:	be1ff06f          	j	80002968 <__printf+0x260>
    80002d8c:	00001517          	auipc	a0,0x1
    80002d90:	56c50513          	addi	a0,a0,1388 # 800042f8 <CONSOLE_STATUS+0x2e8>
    80002d94:	00000097          	auipc	ra,0x0
    80002d98:	918080e7          	jalr	-1768(ra) # 800026ac <panic>

0000000080002d9c <printfinit>:
    80002d9c:	fe010113          	addi	sp,sp,-32
    80002da0:	00813823          	sd	s0,16(sp)
    80002da4:	00913423          	sd	s1,8(sp)
    80002da8:	00113c23          	sd	ra,24(sp)
    80002dac:	02010413          	addi	s0,sp,32
    80002db0:	00003497          	auipc	s1,0x3
    80002db4:	ac048493          	addi	s1,s1,-1344 # 80005870 <pr>
    80002db8:	00048513          	mv	a0,s1
    80002dbc:	00001597          	auipc	a1,0x1
    80002dc0:	54c58593          	addi	a1,a1,1356 # 80004308 <CONSOLE_STATUS+0x2f8>
    80002dc4:	00000097          	auipc	ra,0x0
    80002dc8:	5f4080e7          	jalr	1524(ra) # 800033b8 <initlock>
    80002dcc:	01813083          	ld	ra,24(sp)
    80002dd0:	01013403          	ld	s0,16(sp)
    80002dd4:	0004ac23          	sw	zero,24(s1)
    80002dd8:	00813483          	ld	s1,8(sp)
    80002ddc:	02010113          	addi	sp,sp,32
    80002de0:	00008067          	ret

0000000080002de4 <uartinit>:
    80002de4:	ff010113          	addi	sp,sp,-16
    80002de8:	00813423          	sd	s0,8(sp)
    80002dec:	01010413          	addi	s0,sp,16
    80002df0:	100007b7          	lui	a5,0x10000
    80002df4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80002df8:	f8000713          	li	a4,-128
    80002dfc:	00e781a3          	sb	a4,3(a5)
    80002e00:	00300713          	li	a4,3
    80002e04:	00e78023          	sb	a4,0(a5)
    80002e08:	000780a3          	sb	zero,1(a5)
    80002e0c:	00e781a3          	sb	a4,3(a5)
    80002e10:	00700693          	li	a3,7
    80002e14:	00d78123          	sb	a3,2(a5)
    80002e18:	00e780a3          	sb	a4,1(a5)
    80002e1c:	00813403          	ld	s0,8(sp)
    80002e20:	01010113          	addi	sp,sp,16
    80002e24:	00008067          	ret

0000000080002e28 <uartputc>:
    80002e28:	00002797          	auipc	a5,0x2
    80002e2c:	8007a783          	lw	a5,-2048(a5) # 80004628 <panicked>
    80002e30:	00078463          	beqz	a5,80002e38 <uartputc+0x10>
    80002e34:	0000006f          	j	80002e34 <uartputc+0xc>
    80002e38:	fd010113          	addi	sp,sp,-48
    80002e3c:	02813023          	sd	s0,32(sp)
    80002e40:	00913c23          	sd	s1,24(sp)
    80002e44:	01213823          	sd	s2,16(sp)
    80002e48:	01313423          	sd	s3,8(sp)
    80002e4c:	02113423          	sd	ra,40(sp)
    80002e50:	03010413          	addi	s0,sp,48
    80002e54:	00001917          	auipc	s2,0x1
    80002e58:	7dc90913          	addi	s2,s2,2012 # 80004630 <uart_tx_r>
    80002e5c:	00093783          	ld	a5,0(s2)
    80002e60:	00001497          	auipc	s1,0x1
    80002e64:	7d848493          	addi	s1,s1,2008 # 80004638 <uart_tx_w>
    80002e68:	0004b703          	ld	a4,0(s1)
    80002e6c:	02078693          	addi	a3,a5,32
    80002e70:	00050993          	mv	s3,a0
    80002e74:	02e69c63          	bne	a3,a4,80002eac <uartputc+0x84>
    80002e78:	00001097          	auipc	ra,0x1
    80002e7c:	834080e7          	jalr	-1996(ra) # 800036ac <push_on>
    80002e80:	00093783          	ld	a5,0(s2)
    80002e84:	0004b703          	ld	a4,0(s1)
    80002e88:	02078793          	addi	a5,a5,32
    80002e8c:	00e79463          	bne	a5,a4,80002e94 <uartputc+0x6c>
    80002e90:	0000006f          	j	80002e90 <uartputc+0x68>
    80002e94:	00001097          	auipc	ra,0x1
    80002e98:	88c080e7          	jalr	-1908(ra) # 80003720 <pop_on>
    80002e9c:	00093783          	ld	a5,0(s2)
    80002ea0:	0004b703          	ld	a4,0(s1)
    80002ea4:	02078693          	addi	a3,a5,32
    80002ea8:	fce688e3          	beq	a3,a4,80002e78 <uartputc+0x50>
    80002eac:	01f77693          	andi	a3,a4,31
    80002eb0:	00003597          	auipc	a1,0x3
    80002eb4:	9e058593          	addi	a1,a1,-1568 # 80005890 <uart_tx_buf>
    80002eb8:	00d586b3          	add	a3,a1,a3
    80002ebc:	00170713          	addi	a4,a4,1
    80002ec0:	01368023          	sb	s3,0(a3)
    80002ec4:	00e4b023          	sd	a4,0(s1)
    80002ec8:	10000637          	lui	a2,0x10000
    80002ecc:	02f71063          	bne	a4,a5,80002eec <uartputc+0xc4>
    80002ed0:	0340006f          	j	80002f04 <uartputc+0xdc>
    80002ed4:	00074703          	lbu	a4,0(a4)
    80002ed8:	00f93023          	sd	a5,0(s2)
    80002edc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002ee0:	00093783          	ld	a5,0(s2)
    80002ee4:	0004b703          	ld	a4,0(s1)
    80002ee8:	00f70e63          	beq	a4,a5,80002f04 <uartputc+0xdc>
    80002eec:	00564683          	lbu	a3,5(a2)
    80002ef0:	01f7f713          	andi	a4,a5,31
    80002ef4:	00e58733          	add	a4,a1,a4
    80002ef8:	0206f693          	andi	a3,a3,32
    80002efc:	00178793          	addi	a5,a5,1
    80002f00:	fc069ae3          	bnez	a3,80002ed4 <uartputc+0xac>
    80002f04:	02813083          	ld	ra,40(sp)
    80002f08:	02013403          	ld	s0,32(sp)
    80002f0c:	01813483          	ld	s1,24(sp)
    80002f10:	01013903          	ld	s2,16(sp)
    80002f14:	00813983          	ld	s3,8(sp)
    80002f18:	03010113          	addi	sp,sp,48
    80002f1c:	00008067          	ret

0000000080002f20 <uartputc_sync>:
    80002f20:	ff010113          	addi	sp,sp,-16
    80002f24:	00813423          	sd	s0,8(sp)
    80002f28:	01010413          	addi	s0,sp,16
    80002f2c:	00001717          	auipc	a4,0x1
    80002f30:	6fc72703          	lw	a4,1788(a4) # 80004628 <panicked>
    80002f34:	02071663          	bnez	a4,80002f60 <uartputc_sync+0x40>
    80002f38:	00050793          	mv	a5,a0
    80002f3c:	100006b7          	lui	a3,0x10000
    80002f40:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002f44:	02077713          	andi	a4,a4,32
    80002f48:	fe070ce3          	beqz	a4,80002f40 <uartputc_sync+0x20>
    80002f4c:	0ff7f793          	andi	a5,a5,255
    80002f50:	00f68023          	sb	a5,0(a3)
    80002f54:	00813403          	ld	s0,8(sp)
    80002f58:	01010113          	addi	sp,sp,16
    80002f5c:	00008067          	ret
    80002f60:	0000006f          	j	80002f60 <uartputc_sync+0x40>

0000000080002f64 <uartstart>:
    80002f64:	ff010113          	addi	sp,sp,-16
    80002f68:	00813423          	sd	s0,8(sp)
    80002f6c:	01010413          	addi	s0,sp,16
    80002f70:	00001617          	auipc	a2,0x1
    80002f74:	6c060613          	addi	a2,a2,1728 # 80004630 <uart_tx_r>
    80002f78:	00001517          	auipc	a0,0x1
    80002f7c:	6c050513          	addi	a0,a0,1728 # 80004638 <uart_tx_w>
    80002f80:	00063783          	ld	a5,0(a2)
    80002f84:	00053703          	ld	a4,0(a0)
    80002f88:	04f70263          	beq	a4,a5,80002fcc <uartstart+0x68>
    80002f8c:	100005b7          	lui	a1,0x10000
    80002f90:	00003817          	auipc	a6,0x3
    80002f94:	90080813          	addi	a6,a6,-1792 # 80005890 <uart_tx_buf>
    80002f98:	01c0006f          	j	80002fb4 <uartstart+0x50>
    80002f9c:	0006c703          	lbu	a4,0(a3)
    80002fa0:	00f63023          	sd	a5,0(a2)
    80002fa4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80002fa8:	00063783          	ld	a5,0(a2)
    80002fac:	00053703          	ld	a4,0(a0)
    80002fb0:	00f70e63          	beq	a4,a5,80002fcc <uartstart+0x68>
    80002fb4:	01f7f713          	andi	a4,a5,31
    80002fb8:	00e806b3          	add	a3,a6,a4
    80002fbc:	0055c703          	lbu	a4,5(a1)
    80002fc0:	00178793          	addi	a5,a5,1
    80002fc4:	02077713          	andi	a4,a4,32
    80002fc8:	fc071ae3          	bnez	a4,80002f9c <uartstart+0x38>
    80002fcc:	00813403          	ld	s0,8(sp)
    80002fd0:	01010113          	addi	sp,sp,16
    80002fd4:	00008067          	ret

0000000080002fd8 <uartgetc>:
    80002fd8:	ff010113          	addi	sp,sp,-16
    80002fdc:	00813423          	sd	s0,8(sp)
    80002fe0:	01010413          	addi	s0,sp,16
    80002fe4:	10000737          	lui	a4,0x10000
    80002fe8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80002fec:	0017f793          	andi	a5,a5,1
    80002ff0:	00078c63          	beqz	a5,80003008 <uartgetc+0x30>
    80002ff4:	00074503          	lbu	a0,0(a4)
    80002ff8:	0ff57513          	andi	a0,a0,255
    80002ffc:	00813403          	ld	s0,8(sp)
    80003000:	01010113          	addi	sp,sp,16
    80003004:	00008067          	ret
    80003008:	fff00513          	li	a0,-1
    8000300c:	ff1ff06f          	j	80002ffc <uartgetc+0x24>

0000000080003010 <uartintr>:
    80003010:	100007b7          	lui	a5,0x10000
    80003014:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80003018:	0017f793          	andi	a5,a5,1
    8000301c:	0a078463          	beqz	a5,800030c4 <uartintr+0xb4>
    80003020:	fe010113          	addi	sp,sp,-32
    80003024:	00813823          	sd	s0,16(sp)
    80003028:	00913423          	sd	s1,8(sp)
    8000302c:	00113c23          	sd	ra,24(sp)
    80003030:	02010413          	addi	s0,sp,32
    80003034:	100004b7          	lui	s1,0x10000
    80003038:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000303c:	0ff57513          	andi	a0,a0,255
    80003040:	fffff097          	auipc	ra,0xfffff
    80003044:	534080e7          	jalr	1332(ra) # 80002574 <consoleintr>
    80003048:	0054c783          	lbu	a5,5(s1)
    8000304c:	0017f793          	andi	a5,a5,1
    80003050:	fe0794e3          	bnez	a5,80003038 <uartintr+0x28>
    80003054:	00001617          	auipc	a2,0x1
    80003058:	5dc60613          	addi	a2,a2,1500 # 80004630 <uart_tx_r>
    8000305c:	00001517          	auipc	a0,0x1
    80003060:	5dc50513          	addi	a0,a0,1500 # 80004638 <uart_tx_w>
    80003064:	00063783          	ld	a5,0(a2)
    80003068:	00053703          	ld	a4,0(a0)
    8000306c:	04f70263          	beq	a4,a5,800030b0 <uartintr+0xa0>
    80003070:	100005b7          	lui	a1,0x10000
    80003074:	00003817          	auipc	a6,0x3
    80003078:	81c80813          	addi	a6,a6,-2020 # 80005890 <uart_tx_buf>
    8000307c:	01c0006f          	j	80003098 <uartintr+0x88>
    80003080:	0006c703          	lbu	a4,0(a3)
    80003084:	00f63023          	sd	a5,0(a2)
    80003088:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000308c:	00063783          	ld	a5,0(a2)
    80003090:	00053703          	ld	a4,0(a0)
    80003094:	00f70e63          	beq	a4,a5,800030b0 <uartintr+0xa0>
    80003098:	01f7f713          	andi	a4,a5,31
    8000309c:	00e806b3          	add	a3,a6,a4
    800030a0:	0055c703          	lbu	a4,5(a1)
    800030a4:	00178793          	addi	a5,a5,1
    800030a8:	02077713          	andi	a4,a4,32
    800030ac:	fc071ae3          	bnez	a4,80003080 <uartintr+0x70>
    800030b0:	01813083          	ld	ra,24(sp)
    800030b4:	01013403          	ld	s0,16(sp)
    800030b8:	00813483          	ld	s1,8(sp)
    800030bc:	02010113          	addi	sp,sp,32
    800030c0:	00008067          	ret
    800030c4:	00001617          	auipc	a2,0x1
    800030c8:	56c60613          	addi	a2,a2,1388 # 80004630 <uart_tx_r>
    800030cc:	00001517          	auipc	a0,0x1
    800030d0:	56c50513          	addi	a0,a0,1388 # 80004638 <uart_tx_w>
    800030d4:	00063783          	ld	a5,0(a2)
    800030d8:	00053703          	ld	a4,0(a0)
    800030dc:	04f70263          	beq	a4,a5,80003120 <uartintr+0x110>
    800030e0:	100005b7          	lui	a1,0x10000
    800030e4:	00002817          	auipc	a6,0x2
    800030e8:	7ac80813          	addi	a6,a6,1964 # 80005890 <uart_tx_buf>
    800030ec:	01c0006f          	j	80003108 <uartintr+0xf8>
    800030f0:	0006c703          	lbu	a4,0(a3)
    800030f4:	00f63023          	sd	a5,0(a2)
    800030f8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800030fc:	00063783          	ld	a5,0(a2)
    80003100:	00053703          	ld	a4,0(a0)
    80003104:	02f70063          	beq	a4,a5,80003124 <uartintr+0x114>
    80003108:	01f7f713          	andi	a4,a5,31
    8000310c:	00e806b3          	add	a3,a6,a4
    80003110:	0055c703          	lbu	a4,5(a1)
    80003114:	00178793          	addi	a5,a5,1
    80003118:	02077713          	andi	a4,a4,32
    8000311c:	fc071ae3          	bnez	a4,800030f0 <uartintr+0xe0>
    80003120:	00008067          	ret
    80003124:	00008067          	ret

0000000080003128 <kinit>:
    80003128:	fc010113          	addi	sp,sp,-64
    8000312c:	02913423          	sd	s1,40(sp)
    80003130:	fffff7b7          	lui	a5,0xfffff
    80003134:	00003497          	auipc	s1,0x3
    80003138:	77b48493          	addi	s1,s1,1915 # 800068af <end+0xfff>
    8000313c:	02813823          	sd	s0,48(sp)
    80003140:	01313c23          	sd	s3,24(sp)
    80003144:	00f4f4b3          	and	s1,s1,a5
    80003148:	02113c23          	sd	ra,56(sp)
    8000314c:	03213023          	sd	s2,32(sp)
    80003150:	01413823          	sd	s4,16(sp)
    80003154:	01513423          	sd	s5,8(sp)
    80003158:	04010413          	addi	s0,sp,64
    8000315c:	000017b7          	lui	a5,0x1
    80003160:	01100993          	li	s3,17
    80003164:	00f487b3          	add	a5,s1,a5
    80003168:	01b99993          	slli	s3,s3,0x1b
    8000316c:	06f9e063          	bltu	s3,a5,800031cc <kinit+0xa4>
    80003170:	00002a97          	auipc	s5,0x2
    80003174:	740a8a93          	addi	s5,s5,1856 # 800058b0 <end>
    80003178:	0754ec63          	bltu	s1,s5,800031f0 <kinit+0xc8>
    8000317c:	0734fa63          	bgeu	s1,s3,800031f0 <kinit+0xc8>
    80003180:	00088a37          	lui	s4,0x88
    80003184:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80003188:	00001917          	auipc	s2,0x1
    8000318c:	4b890913          	addi	s2,s2,1208 # 80004640 <kmem>
    80003190:	00ca1a13          	slli	s4,s4,0xc
    80003194:	0140006f          	j	800031a8 <kinit+0x80>
    80003198:	000017b7          	lui	a5,0x1
    8000319c:	00f484b3          	add	s1,s1,a5
    800031a0:	0554e863          	bltu	s1,s5,800031f0 <kinit+0xc8>
    800031a4:	0534f663          	bgeu	s1,s3,800031f0 <kinit+0xc8>
    800031a8:	00001637          	lui	a2,0x1
    800031ac:	00100593          	li	a1,1
    800031b0:	00048513          	mv	a0,s1
    800031b4:	00000097          	auipc	ra,0x0
    800031b8:	5e4080e7          	jalr	1508(ra) # 80003798 <__memset>
    800031bc:	00093783          	ld	a5,0(s2)
    800031c0:	00f4b023          	sd	a5,0(s1)
    800031c4:	00993023          	sd	s1,0(s2)
    800031c8:	fd4498e3          	bne	s1,s4,80003198 <kinit+0x70>
    800031cc:	03813083          	ld	ra,56(sp)
    800031d0:	03013403          	ld	s0,48(sp)
    800031d4:	02813483          	ld	s1,40(sp)
    800031d8:	02013903          	ld	s2,32(sp)
    800031dc:	01813983          	ld	s3,24(sp)
    800031e0:	01013a03          	ld	s4,16(sp)
    800031e4:	00813a83          	ld	s5,8(sp)
    800031e8:	04010113          	addi	sp,sp,64
    800031ec:	00008067          	ret
    800031f0:	00001517          	auipc	a0,0x1
    800031f4:	13850513          	addi	a0,a0,312 # 80004328 <digits+0x18>
    800031f8:	fffff097          	auipc	ra,0xfffff
    800031fc:	4b4080e7          	jalr	1204(ra) # 800026ac <panic>

0000000080003200 <freerange>:
    80003200:	fc010113          	addi	sp,sp,-64
    80003204:	000017b7          	lui	a5,0x1
    80003208:	02913423          	sd	s1,40(sp)
    8000320c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80003210:	009504b3          	add	s1,a0,s1
    80003214:	fffff537          	lui	a0,0xfffff
    80003218:	02813823          	sd	s0,48(sp)
    8000321c:	02113c23          	sd	ra,56(sp)
    80003220:	03213023          	sd	s2,32(sp)
    80003224:	01313c23          	sd	s3,24(sp)
    80003228:	01413823          	sd	s4,16(sp)
    8000322c:	01513423          	sd	s5,8(sp)
    80003230:	01613023          	sd	s6,0(sp)
    80003234:	04010413          	addi	s0,sp,64
    80003238:	00a4f4b3          	and	s1,s1,a0
    8000323c:	00f487b3          	add	a5,s1,a5
    80003240:	06f5e463          	bltu	a1,a5,800032a8 <freerange+0xa8>
    80003244:	00002a97          	auipc	s5,0x2
    80003248:	66ca8a93          	addi	s5,s5,1644 # 800058b0 <end>
    8000324c:	0954e263          	bltu	s1,s5,800032d0 <freerange+0xd0>
    80003250:	01100993          	li	s3,17
    80003254:	01b99993          	slli	s3,s3,0x1b
    80003258:	0734fc63          	bgeu	s1,s3,800032d0 <freerange+0xd0>
    8000325c:	00058a13          	mv	s4,a1
    80003260:	00001917          	auipc	s2,0x1
    80003264:	3e090913          	addi	s2,s2,992 # 80004640 <kmem>
    80003268:	00002b37          	lui	s6,0x2
    8000326c:	0140006f          	j	80003280 <freerange+0x80>
    80003270:	000017b7          	lui	a5,0x1
    80003274:	00f484b3          	add	s1,s1,a5
    80003278:	0554ec63          	bltu	s1,s5,800032d0 <freerange+0xd0>
    8000327c:	0534fa63          	bgeu	s1,s3,800032d0 <freerange+0xd0>
    80003280:	00001637          	lui	a2,0x1
    80003284:	00100593          	li	a1,1
    80003288:	00048513          	mv	a0,s1
    8000328c:	00000097          	auipc	ra,0x0
    80003290:	50c080e7          	jalr	1292(ra) # 80003798 <__memset>
    80003294:	00093703          	ld	a4,0(s2)
    80003298:	016487b3          	add	a5,s1,s6
    8000329c:	00e4b023          	sd	a4,0(s1)
    800032a0:	00993023          	sd	s1,0(s2)
    800032a4:	fcfa76e3          	bgeu	s4,a5,80003270 <freerange+0x70>
    800032a8:	03813083          	ld	ra,56(sp)
    800032ac:	03013403          	ld	s0,48(sp)
    800032b0:	02813483          	ld	s1,40(sp)
    800032b4:	02013903          	ld	s2,32(sp)
    800032b8:	01813983          	ld	s3,24(sp)
    800032bc:	01013a03          	ld	s4,16(sp)
    800032c0:	00813a83          	ld	s5,8(sp)
    800032c4:	00013b03          	ld	s6,0(sp)
    800032c8:	04010113          	addi	sp,sp,64
    800032cc:	00008067          	ret
    800032d0:	00001517          	auipc	a0,0x1
    800032d4:	05850513          	addi	a0,a0,88 # 80004328 <digits+0x18>
    800032d8:	fffff097          	auipc	ra,0xfffff
    800032dc:	3d4080e7          	jalr	980(ra) # 800026ac <panic>

00000000800032e0 <kfree>:
    800032e0:	fe010113          	addi	sp,sp,-32
    800032e4:	00813823          	sd	s0,16(sp)
    800032e8:	00113c23          	sd	ra,24(sp)
    800032ec:	00913423          	sd	s1,8(sp)
    800032f0:	02010413          	addi	s0,sp,32
    800032f4:	03451793          	slli	a5,a0,0x34
    800032f8:	04079c63          	bnez	a5,80003350 <kfree+0x70>
    800032fc:	00002797          	auipc	a5,0x2
    80003300:	5b478793          	addi	a5,a5,1460 # 800058b0 <end>
    80003304:	00050493          	mv	s1,a0
    80003308:	04f56463          	bltu	a0,a5,80003350 <kfree+0x70>
    8000330c:	01100793          	li	a5,17
    80003310:	01b79793          	slli	a5,a5,0x1b
    80003314:	02f57e63          	bgeu	a0,a5,80003350 <kfree+0x70>
    80003318:	00001637          	lui	a2,0x1
    8000331c:	00100593          	li	a1,1
    80003320:	00000097          	auipc	ra,0x0
    80003324:	478080e7          	jalr	1144(ra) # 80003798 <__memset>
    80003328:	00001797          	auipc	a5,0x1
    8000332c:	31878793          	addi	a5,a5,792 # 80004640 <kmem>
    80003330:	0007b703          	ld	a4,0(a5)
    80003334:	01813083          	ld	ra,24(sp)
    80003338:	01013403          	ld	s0,16(sp)
    8000333c:	00e4b023          	sd	a4,0(s1)
    80003340:	0097b023          	sd	s1,0(a5)
    80003344:	00813483          	ld	s1,8(sp)
    80003348:	02010113          	addi	sp,sp,32
    8000334c:	00008067          	ret
    80003350:	00001517          	auipc	a0,0x1
    80003354:	fd850513          	addi	a0,a0,-40 # 80004328 <digits+0x18>
    80003358:	fffff097          	auipc	ra,0xfffff
    8000335c:	354080e7          	jalr	852(ra) # 800026ac <panic>

0000000080003360 <kalloc>:
    80003360:	fe010113          	addi	sp,sp,-32
    80003364:	00813823          	sd	s0,16(sp)
    80003368:	00913423          	sd	s1,8(sp)
    8000336c:	00113c23          	sd	ra,24(sp)
    80003370:	02010413          	addi	s0,sp,32
    80003374:	00001797          	auipc	a5,0x1
    80003378:	2cc78793          	addi	a5,a5,716 # 80004640 <kmem>
    8000337c:	0007b483          	ld	s1,0(a5)
    80003380:	02048063          	beqz	s1,800033a0 <kalloc+0x40>
    80003384:	0004b703          	ld	a4,0(s1)
    80003388:	00001637          	lui	a2,0x1
    8000338c:	00500593          	li	a1,5
    80003390:	00048513          	mv	a0,s1
    80003394:	00e7b023          	sd	a4,0(a5)
    80003398:	00000097          	auipc	ra,0x0
    8000339c:	400080e7          	jalr	1024(ra) # 80003798 <__memset>
    800033a0:	01813083          	ld	ra,24(sp)
    800033a4:	01013403          	ld	s0,16(sp)
    800033a8:	00048513          	mv	a0,s1
    800033ac:	00813483          	ld	s1,8(sp)
    800033b0:	02010113          	addi	sp,sp,32
    800033b4:	00008067          	ret

00000000800033b8 <initlock>:
    800033b8:	ff010113          	addi	sp,sp,-16
    800033bc:	00813423          	sd	s0,8(sp)
    800033c0:	01010413          	addi	s0,sp,16
    800033c4:	00813403          	ld	s0,8(sp)
    800033c8:	00b53423          	sd	a1,8(a0)
    800033cc:	00052023          	sw	zero,0(a0)
    800033d0:	00053823          	sd	zero,16(a0)
    800033d4:	01010113          	addi	sp,sp,16
    800033d8:	00008067          	ret

00000000800033dc <acquire>:
    800033dc:	fe010113          	addi	sp,sp,-32
    800033e0:	00813823          	sd	s0,16(sp)
    800033e4:	00913423          	sd	s1,8(sp)
    800033e8:	00113c23          	sd	ra,24(sp)
    800033ec:	01213023          	sd	s2,0(sp)
    800033f0:	02010413          	addi	s0,sp,32
    800033f4:	00050493          	mv	s1,a0
    800033f8:	10002973          	csrr	s2,sstatus
    800033fc:	100027f3          	csrr	a5,sstatus
    80003400:	ffd7f793          	andi	a5,a5,-3
    80003404:	10079073          	csrw	sstatus,a5
    80003408:	fffff097          	auipc	ra,0xfffff
    8000340c:	8ec080e7          	jalr	-1812(ra) # 80001cf4 <mycpu>
    80003410:	07852783          	lw	a5,120(a0)
    80003414:	06078e63          	beqz	a5,80003490 <acquire+0xb4>
    80003418:	fffff097          	auipc	ra,0xfffff
    8000341c:	8dc080e7          	jalr	-1828(ra) # 80001cf4 <mycpu>
    80003420:	07852783          	lw	a5,120(a0)
    80003424:	0004a703          	lw	a4,0(s1)
    80003428:	0017879b          	addiw	a5,a5,1
    8000342c:	06f52c23          	sw	a5,120(a0)
    80003430:	04071063          	bnez	a4,80003470 <acquire+0x94>
    80003434:	00100713          	li	a4,1
    80003438:	00070793          	mv	a5,a4
    8000343c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80003440:	0007879b          	sext.w	a5,a5
    80003444:	fe079ae3          	bnez	a5,80003438 <acquire+0x5c>
    80003448:	0ff0000f          	fence
    8000344c:	fffff097          	auipc	ra,0xfffff
    80003450:	8a8080e7          	jalr	-1880(ra) # 80001cf4 <mycpu>
    80003454:	01813083          	ld	ra,24(sp)
    80003458:	01013403          	ld	s0,16(sp)
    8000345c:	00a4b823          	sd	a0,16(s1)
    80003460:	00013903          	ld	s2,0(sp)
    80003464:	00813483          	ld	s1,8(sp)
    80003468:	02010113          	addi	sp,sp,32
    8000346c:	00008067          	ret
    80003470:	0104b903          	ld	s2,16(s1)
    80003474:	fffff097          	auipc	ra,0xfffff
    80003478:	880080e7          	jalr	-1920(ra) # 80001cf4 <mycpu>
    8000347c:	faa91ce3          	bne	s2,a0,80003434 <acquire+0x58>
    80003480:	00001517          	auipc	a0,0x1
    80003484:	eb050513          	addi	a0,a0,-336 # 80004330 <digits+0x20>
    80003488:	fffff097          	auipc	ra,0xfffff
    8000348c:	224080e7          	jalr	548(ra) # 800026ac <panic>
    80003490:	00195913          	srli	s2,s2,0x1
    80003494:	fffff097          	auipc	ra,0xfffff
    80003498:	860080e7          	jalr	-1952(ra) # 80001cf4 <mycpu>
    8000349c:	00197913          	andi	s2,s2,1
    800034a0:	07252e23          	sw	s2,124(a0)
    800034a4:	f75ff06f          	j	80003418 <acquire+0x3c>

00000000800034a8 <release>:
    800034a8:	fe010113          	addi	sp,sp,-32
    800034ac:	00813823          	sd	s0,16(sp)
    800034b0:	00113c23          	sd	ra,24(sp)
    800034b4:	00913423          	sd	s1,8(sp)
    800034b8:	01213023          	sd	s2,0(sp)
    800034bc:	02010413          	addi	s0,sp,32
    800034c0:	00052783          	lw	a5,0(a0)
    800034c4:	00079a63          	bnez	a5,800034d8 <release+0x30>
    800034c8:	00001517          	auipc	a0,0x1
    800034cc:	e7050513          	addi	a0,a0,-400 # 80004338 <digits+0x28>
    800034d0:	fffff097          	auipc	ra,0xfffff
    800034d4:	1dc080e7          	jalr	476(ra) # 800026ac <panic>
    800034d8:	01053903          	ld	s2,16(a0)
    800034dc:	00050493          	mv	s1,a0
    800034e0:	fffff097          	auipc	ra,0xfffff
    800034e4:	814080e7          	jalr	-2028(ra) # 80001cf4 <mycpu>
    800034e8:	fea910e3          	bne	s2,a0,800034c8 <release+0x20>
    800034ec:	0004b823          	sd	zero,16(s1)
    800034f0:	0ff0000f          	fence
    800034f4:	0f50000f          	fence	iorw,ow
    800034f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800034fc:	ffffe097          	auipc	ra,0xffffe
    80003500:	7f8080e7          	jalr	2040(ra) # 80001cf4 <mycpu>
    80003504:	100027f3          	csrr	a5,sstatus
    80003508:	0027f793          	andi	a5,a5,2
    8000350c:	04079a63          	bnez	a5,80003560 <release+0xb8>
    80003510:	07852783          	lw	a5,120(a0)
    80003514:	02f05e63          	blez	a5,80003550 <release+0xa8>
    80003518:	fff7871b          	addiw	a4,a5,-1
    8000351c:	06e52c23          	sw	a4,120(a0)
    80003520:	00071c63          	bnez	a4,80003538 <release+0x90>
    80003524:	07c52783          	lw	a5,124(a0)
    80003528:	00078863          	beqz	a5,80003538 <release+0x90>
    8000352c:	100027f3          	csrr	a5,sstatus
    80003530:	0027e793          	ori	a5,a5,2
    80003534:	10079073          	csrw	sstatus,a5
    80003538:	01813083          	ld	ra,24(sp)
    8000353c:	01013403          	ld	s0,16(sp)
    80003540:	00813483          	ld	s1,8(sp)
    80003544:	00013903          	ld	s2,0(sp)
    80003548:	02010113          	addi	sp,sp,32
    8000354c:	00008067          	ret
    80003550:	00001517          	auipc	a0,0x1
    80003554:	e0850513          	addi	a0,a0,-504 # 80004358 <digits+0x48>
    80003558:	fffff097          	auipc	ra,0xfffff
    8000355c:	154080e7          	jalr	340(ra) # 800026ac <panic>
    80003560:	00001517          	auipc	a0,0x1
    80003564:	de050513          	addi	a0,a0,-544 # 80004340 <digits+0x30>
    80003568:	fffff097          	auipc	ra,0xfffff
    8000356c:	144080e7          	jalr	324(ra) # 800026ac <panic>

0000000080003570 <holding>:
    80003570:	00052783          	lw	a5,0(a0)
    80003574:	00079663          	bnez	a5,80003580 <holding+0x10>
    80003578:	00000513          	li	a0,0
    8000357c:	00008067          	ret
    80003580:	fe010113          	addi	sp,sp,-32
    80003584:	00813823          	sd	s0,16(sp)
    80003588:	00913423          	sd	s1,8(sp)
    8000358c:	00113c23          	sd	ra,24(sp)
    80003590:	02010413          	addi	s0,sp,32
    80003594:	01053483          	ld	s1,16(a0)
    80003598:	ffffe097          	auipc	ra,0xffffe
    8000359c:	75c080e7          	jalr	1884(ra) # 80001cf4 <mycpu>
    800035a0:	01813083          	ld	ra,24(sp)
    800035a4:	01013403          	ld	s0,16(sp)
    800035a8:	40a48533          	sub	a0,s1,a0
    800035ac:	00153513          	seqz	a0,a0
    800035b0:	00813483          	ld	s1,8(sp)
    800035b4:	02010113          	addi	sp,sp,32
    800035b8:	00008067          	ret

00000000800035bc <push_off>:
    800035bc:	fe010113          	addi	sp,sp,-32
    800035c0:	00813823          	sd	s0,16(sp)
    800035c4:	00113c23          	sd	ra,24(sp)
    800035c8:	00913423          	sd	s1,8(sp)
    800035cc:	02010413          	addi	s0,sp,32
    800035d0:	100024f3          	csrr	s1,sstatus
    800035d4:	100027f3          	csrr	a5,sstatus
    800035d8:	ffd7f793          	andi	a5,a5,-3
    800035dc:	10079073          	csrw	sstatus,a5
    800035e0:	ffffe097          	auipc	ra,0xffffe
    800035e4:	714080e7          	jalr	1812(ra) # 80001cf4 <mycpu>
    800035e8:	07852783          	lw	a5,120(a0)
    800035ec:	02078663          	beqz	a5,80003618 <push_off+0x5c>
    800035f0:	ffffe097          	auipc	ra,0xffffe
    800035f4:	704080e7          	jalr	1796(ra) # 80001cf4 <mycpu>
    800035f8:	07852783          	lw	a5,120(a0)
    800035fc:	01813083          	ld	ra,24(sp)
    80003600:	01013403          	ld	s0,16(sp)
    80003604:	0017879b          	addiw	a5,a5,1
    80003608:	06f52c23          	sw	a5,120(a0)
    8000360c:	00813483          	ld	s1,8(sp)
    80003610:	02010113          	addi	sp,sp,32
    80003614:	00008067          	ret
    80003618:	0014d493          	srli	s1,s1,0x1
    8000361c:	ffffe097          	auipc	ra,0xffffe
    80003620:	6d8080e7          	jalr	1752(ra) # 80001cf4 <mycpu>
    80003624:	0014f493          	andi	s1,s1,1
    80003628:	06952e23          	sw	s1,124(a0)
    8000362c:	fc5ff06f          	j	800035f0 <push_off+0x34>

0000000080003630 <pop_off>:
    80003630:	ff010113          	addi	sp,sp,-16
    80003634:	00813023          	sd	s0,0(sp)
    80003638:	00113423          	sd	ra,8(sp)
    8000363c:	01010413          	addi	s0,sp,16
    80003640:	ffffe097          	auipc	ra,0xffffe
    80003644:	6b4080e7          	jalr	1716(ra) # 80001cf4 <mycpu>
    80003648:	100027f3          	csrr	a5,sstatus
    8000364c:	0027f793          	andi	a5,a5,2
    80003650:	04079663          	bnez	a5,8000369c <pop_off+0x6c>
    80003654:	07852783          	lw	a5,120(a0)
    80003658:	02f05a63          	blez	a5,8000368c <pop_off+0x5c>
    8000365c:	fff7871b          	addiw	a4,a5,-1
    80003660:	06e52c23          	sw	a4,120(a0)
    80003664:	00071c63          	bnez	a4,8000367c <pop_off+0x4c>
    80003668:	07c52783          	lw	a5,124(a0)
    8000366c:	00078863          	beqz	a5,8000367c <pop_off+0x4c>
    80003670:	100027f3          	csrr	a5,sstatus
    80003674:	0027e793          	ori	a5,a5,2
    80003678:	10079073          	csrw	sstatus,a5
    8000367c:	00813083          	ld	ra,8(sp)
    80003680:	00013403          	ld	s0,0(sp)
    80003684:	01010113          	addi	sp,sp,16
    80003688:	00008067          	ret
    8000368c:	00001517          	auipc	a0,0x1
    80003690:	ccc50513          	addi	a0,a0,-820 # 80004358 <digits+0x48>
    80003694:	fffff097          	auipc	ra,0xfffff
    80003698:	018080e7          	jalr	24(ra) # 800026ac <panic>
    8000369c:	00001517          	auipc	a0,0x1
    800036a0:	ca450513          	addi	a0,a0,-860 # 80004340 <digits+0x30>
    800036a4:	fffff097          	auipc	ra,0xfffff
    800036a8:	008080e7          	jalr	8(ra) # 800026ac <panic>

00000000800036ac <push_on>:
    800036ac:	fe010113          	addi	sp,sp,-32
    800036b0:	00813823          	sd	s0,16(sp)
    800036b4:	00113c23          	sd	ra,24(sp)
    800036b8:	00913423          	sd	s1,8(sp)
    800036bc:	02010413          	addi	s0,sp,32
    800036c0:	100024f3          	csrr	s1,sstatus
    800036c4:	100027f3          	csrr	a5,sstatus
    800036c8:	0027e793          	ori	a5,a5,2
    800036cc:	10079073          	csrw	sstatus,a5
    800036d0:	ffffe097          	auipc	ra,0xffffe
    800036d4:	624080e7          	jalr	1572(ra) # 80001cf4 <mycpu>
    800036d8:	07852783          	lw	a5,120(a0)
    800036dc:	02078663          	beqz	a5,80003708 <push_on+0x5c>
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	614080e7          	jalr	1556(ra) # 80001cf4 <mycpu>
    800036e8:	07852783          	lw	a5,120(a0)
    800036ec:	01813083          	ld	ra,24(sp)
    800036f0:	01013403          	ld	s0,16(sp)
    800036f4:	0017879b          	addiw	a5,a5,1
    800036f8:	06f52c23          	sw	a5,120(a0)
    800036fc:	00813483          	ld	s1,8(sp)
    80003700:	02010113          	addi	sp,sp,32
    80003704:	00008067          	ret
    80003708:	0014d493          	srli	s1,s1,0x1
    8000370c:	ffffe097          	auipc	ra,0xffffe
    80003710:	5e8080e7          	jalr	1512(ra) # 80001cf4 <mycpu>
    80003714:	0014f493          	andi	s1,s1,1
    80003718:	06952e23          	sw	s1,124(a0)
    8000371c:	fc5ff06f          	j	800036e0 <push_on+0x34>

0000000080003720 <pop_on>:
    80003720:	ff010113          	addi	sp,sp,-16
    80003724:	00813023          	sd	s0,0(sp)
    80003728:	00113423          	sd	ra,8(sp)
    8000372c:	01010413          	addi	s0,sp,16
    80003730:	ffffe097          	auipc	ra,0xffffe
    80003734:	5c4080e7          	jalr	1476(ra) # 80001cf4 <mycpu>
    80003738:	100027f3          	csrr	a5,sstatus
    8000373c:	0027f793          	andi	a5,a5,2
    80003740:	04078463          	beqz	a5,80003788 <pop_on+0x68>
    80003744:	07852783          	lw	a5,120(a0)
    80003748:	02f05863          	blez	a5,80003778 <pop_on+0x58>
    8000374c:	fff7879b          	addiw	a5,a5,-1
    80003750:	06f52c23          	sw	a5,120(a0)
    80003754:	07853783          	ld	a5,120(a0)
    80003758:	00079863          	bnez	a5,80003768 <pop_on+0x48>
    8000375c:	100027f3          	csrr	a5,sstatus
    80003760:	ffd7f793          	andi	a5,a5,-3
    80003764:	10079073          	csrw	sstatus,a5
    80003768:	00813083          	ld	ra,8(sp)
    8000376c:	00013403          	ld	s0,0(sp)
    80003770:	01010113          	addi	sp,sp,16
    80003774:	00008067          	ret
    80003778:	00001517          	auipc	a0,0x1
    8000377c:	c0850513          	addi	a0,a0,-1016 # 80004380 <digits+0x70>
    80003780:	fffff097          	auipc	ra,0xfffff
    80003784:	f2c080e7          	jalr	-212(ra) # 800026ac <panic>
    80003788:	00001517          	auipc	a0,0x1
    8000378c:	bd850513          	addi	a0,a0,-1064 # 80004360 <digits+0x50>
    80003790:	fffff097          	auipc	ra,0xfffff
    80003794:	f1c080e7          	jalr	-228(ra) # 800026ac <panic>

0000000080003798 <__memset>:
    80003798:	ff010113          	addi	sp,sp,-16
    8000379c:	00813423          	sd	s0,8(sp)
    800037a0:	01010413          	addi	s0,sp,16
    800037a4:	1a060e63          	beqz	a2,80003960 <__memset+0x1c8>
    800037a8:	40a007b3          	neg	a5,a0
    800037ac:	0077f793          	andi	a5,a5,7
    800037b0:	00778693          	addi	a3,a5,7
    800037b4:	00b00813          	li	a6,11
    800037b8:	0ff5f593          	andi	a1,a1,255
    800037bc:	fff6071b          	addiw	a4,a2,-1
    800037c0:	1b06e663          	bltu	a3,a6,8000396c <__memset+0x1d4>
    800037c4:	1cd76463          	bltu	a4,a3,8000398c <__memset+0x1f4>
    800037c8:	1a078e63          	beqz	a5,80003984 <__memset+0x1ec>
    800037cc:	00b50023          	sb	a1,0(a0)
    800037d0:	00100713          	li	a4,1
    800037d4:	1ae78463          	beq	a5,a4,8000397c <__memset+0x1e4>
    800037d8:	00b500a3          	sb	a1,1(a0)
    800037dc:	00200713          	li	a4,2
    800037e0:	1ae78a63          	beq	a5,a4,80003994 <__memset+0x1fc>
    800037e4:	00b50123          	sb	a1,2(a0)
    800037e8:	00300713          	li	a4,3
    800037ec:	18e78463          	beq	a5,a4,80003974 <__memset+0x1dc>
    800037f0:	00b501a3          	sb	a1,3(a0)
    800037f4:	00400713          	li	a4,4
    800037f8:	1ae78263          	beq	a5,a4,8000399c <__memset+0x204>
    800037fc:	00b50223          	sb	a1,4(a0)
    80003800:	00500713          	li	a4,5
    80003804:	1ae78063          	beq	a5,a4,800039a4 <__memset+0x20c>
    80003808:	00b502a3          	sb	a1,5(a0)
    8000380c:	00700713          	li	a4,7
    80003810:	18e79e63          	bne	a5,a4,800039ac <__memset+0x214>
    80003814:	00b50323          	sb	a1,6(a0)
    80003818:	00700e93          	li	t4,7
    8000381c:	00859713          	slli	a4,a1,0x8
    80003820:	00e5e733          	or	a4,a1,a4
    80003824:	01059e13          	slli	t3,a1,0x10
    80003828:	01c76e33          	or	t3,a4,t3
    8000382c:	01859313          	slli	t1,a1,0x18
    80003830:	006e6333          	or	t1,t3,t1
    80003834:	02059893          	slli	a7,a1,0x20
    80003838:	40f60e3b          	subw	t3,a2,a5
    8000383c:	011368b3          	or	a7,t1,a7
    80003840:	02859813          	slli	a6,a1,0x28
    80003844:	0108e833          	or	a6,a7,a6
    80003848:	03059693          	slli	a3,a1,0x30
    8000384c:	003e589b          	srliw	a7,t3,0x3
    80003850:	00d866b3          	or	a3,a6,a3
    80003854:	03859713          	slli	a4,a1,0x38
    80003858:	00389813          	slli	a6,a7,0x3
    8000385c:	00f507b3          	add	a5,a0,a5
    80003860:	00e6e733          	or	a4,a3,a4
    80003864:	000e089b          	sext.w	a7,t3
    80003868:	00f806b3          	add	a3,a6,a5
    8000386c:	00e7b023          	sd	a4,0(a5)
    80003870:	00878793          	addi	a5,a5,8
    80003874:	fed79ce3          	bne	a5,a3,8000386c <__memset+0xd4>
    80003878:	ff8e7793          	andi	a5,t3,-8
    8000387c:	0007871b          	sext.w	a4,a5
    80003880:	01d787bb          	addw	a5,a5,t4
    80003884:	0ce88e63          	beq	a7,a4,80003960 <__memset+0x1c8>
    80003888:	00f50733          	add	a4,a0,a5
    8000388c:	00b70023          	sb	a1,0(a4)
    80003890:	0017871b          	addiw	a4,a5,1
    80003894:	0cc77663          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    80003898:	00e50733          	add	a4,a0,a4
    8000389c:	00b70023          	sb	a1,0(a4)
    800038a0:	0027871b          	addiw	a4,a5,2
    800038a4:	0ac77e63          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    800038a8:	00e50733          	add	a4,a0,a4
    800038ac:	00b70023          	sb	a1,0(a4)
    800038b0:	0037871b          	addiw	a4,a5,3
    800038b4:	0ac77663          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    800038b8:	00e50733          	add	a4,a0,a4
    800038bc:	00b70023          	sb	a1,0(a4)
    800038c0:	0047871b          	addiw	a4,a5,4
    800038c4:	08c77e63          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    800038c8:	00e50733          	add	a4,a0,a4
    800038cc:	00b70023          	sb	a1,0(a4)
    800038d0:	0057871b          	addiw	a4,a5,5
    800038d4:	08c77663          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    800038d8:	00e50733          	add	a4,a0,a4
    800038dc:	00b70023          	sb	a1,0(a4)
    800038e0:	0067871b          	addiw	a4,a5,6
    800038e4:	06c77e63          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    800038e8:	00e50733          	add	a4,a0,a4
    800038ec:	00b70023          	sb	a1,0(a4)
    800038f0:	0077871b          	addiw	a4,a5,7
    800038f4:	06c77663          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    800038f8:	00e50733          	add	a4,a0,a4
    800038fc:	00b70023          	sb	a1,0(a4)
    80003900:	0087871b          	addiw	a4,a5,8
    80003904:	04c77e63          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    80003908:	00e50733          	add	a4,a0,a4
    8000390c:	00b70023          	sb	a1,0(a4)
    80003910:	0097871b          	addiw	a4,a5,9
    80003914:	04c77663          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    80003918:	00e50733          	add	a4,a0,a4
    8000391c:	00b70023          	sb	a1,0(a4)
    80003920:	00a7871b          	addiw	a4,a5,10
    80003924:	02c77e63          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    80003928:	00e50733          	add	a4,a0,a4
    8000392c:	00b70023          	sb	a1,0(a4)
    80003930:	00b7871b          	addiw	a4,a5,11
    80003934:	02c77663          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    80003938:	00e50733          	add	a4,a0,a4
    8000393c:	00b70023          	sb	a1,0(a4)
    80003940:	00c7871b          	addiw	a4,a5,12
    80003944:	00c77e63          	bgeu	a4,a2,80003960 <__memset+0x1c8>
    80003948:	00e50733          	add	a4,a0,a4
    8000394c:	00b70023          	sb	a1,0(a4)
    80003950:	00d7879b          	addiw	a5,a5,13
    80003954:	00c7f663          	bgeu	a5,a2,80003960 <__memset+0x1c8>
    80003958:	00f507b3          	add	a5,a0,a5
    8000395c:	00b78023          	sb	a1,0(a5)
    80003960:	00813403          	ld	s0,8(sp)
    80003964:	01010113          	addi	sp,sp,16
    80003968:	00008067          	ret
    8000396c:	00b00693          	li	a3,11
    80003970:	e55ff06f          	j	800037c4 <__memset+0x2c>
    80003974:	00300e93          	li	t4,3
    80003978:	ea5ff06f          	j	8000381c <__memset+0x84>
    8000397c:	00100e93          	li	t4,1
    80003980:	e9dff06f          	j	8000381c <__memset+0x84>
    80003984:	00000e93          	li	t4,0
    80003988:	e95ff06f          	j	8000381c <__memset+0x84>
    8000398c:	00000793          	li	a5,0
    80003990:	ef9ff06f          	j	80003888 <__memset+0xf0>
    80003994:	00200e93          	li	t4,2
    80003998:	e85ff06f          	j	8000381c <__memset+0x84>
    8000399c:	00400e93          	li	t4,4
    800039a0:	e7dff06f          	j	8000381c <__memset+0x84>
    800039a4:	00500e93          	li	t4,5
    800039a8:	e75ff06f          	j	8000381c <__memset+0x84>
    800039ac:	00600e93          	li	t4,6
    800039b0:	e6dff06f          	j	8000381c <__memset+0x84>

00000000800039b4 <__memmove>:
    800039b4:	ff010113          	addi	sp,sp,-16
    800039b8:	00813423          	sd	s0,8(sp)
    800039bc:	01010413          	addi	s0,sp,16
    800039c0:	0e060863          	beqz	a2,80003ab0 <__memmove+0xfc>
    800039c4:	fff6069b          	addiw	a3,a2,-1
    800039c8:	0006881b          	sext.w	a6,a3
    800039cc:	0ea5e863          	bltu	a1,a0,80003abc <__memmove+0x108>
    800039d0:	00758713          	addi	a4,a1,7
    800039d4:	00a5e7b3          	or	a5,a1,a0
    800039d8:	40a70733          	sub	a4,a4,a0
    800039dc:	0077f793          	andi	a5,a5,7
    800039e0:	00f73713          	sltiu	a4,a4,15
    800039e4:	00174713          	xori	a4,a4,1
    800039e8:	0017b793          	seqz	a5,a5
    800039ec:	00e7f7b3          	and	a5,a5,a4
    800039f0:	10078863          	beqz	a5,80003b00 <__memmove+0x14c>
    800039f4:	00900793          	li	a5,9
    800039f8:	1107f463          	bgeu	a5,a6,80003b00 <__memmove+0x14c>
    800039fc:	0036581b          	srliw	a6,a2,0x3
    80003a00:	fff8081b          	addiw	a6,a6,-1
    80003a04:	02081813          	slli	a6,a6,0x20
    80003a08:	01d85893          	srli	a7,a6,0x1d
    80003a0c:	00858813          	addi	a6,a1,8
    80003a10:	00058793          	mv	a5,a1
    80003a14:	00050713          	mv	a4,a0
    80003a18:	01088833          	add	a6,a7,a6
    80003a1c:	0007b883          	ld	a7,0(a5)
    80003a20:	00878793          	addi	a5,a5,8
    80003a24:	00870713          	addi	a4,a4,8
    80003a28:	ff173c23          	sd	a7,-8(a4)
    80003a2c:	ff0798e3          	bne	a5,a6,80003a1c <__memmove+0x68>
    80003a30:	ff867713          	andi	a4,a2,-8
    80003a34:	02071793          	slli	a5,a4,0x20
    80003a38:	0207d793          	srli	a5,a5,0x20
    80003a3c:	00f585b3          	add	a1,a1,a5
    80003a40:	40e686bb          	subw	a3,a3,a4
    80003a44:	00f507b3          	add	a5,a0,a5
    80003a48:	06e60463          	beq	a2,a4,80003ab0 <__memmove+0xfc>
    80003a4c:	0005c703          	lbu	a4,0(a1)
    80003a50:	00e78023          	sb	a4,0(a5)
    80003a54:	04068e63          	beqz	a3,80003ab0 <__memmove+0xfc>
    80003a58:	0015c603          	lbu	a2,1(a1)
    80003a5c:	00100713          	li	a4,1
    80003a60:	00c780a3          	sb	a2,1(a5)
    80003a64:	04e68663          	beq	a3,a4,80003ab0 <__memmove+0xfc>
    80003a68:	0025c603          	lbu	a2,2(a1)
    80003a6c:	00200713          	li	a4,2
    80003a70:	00c78123          	sb	a2,2(a5)
    80003a74:	02e68e63          	beq	a3,a4,80003ab0 <__memmove+0xfc>
    80003a78:	0035c603          	lbu	a2,3(a1)
    80003a7c:	00300713          	li	a4,3
    80003a80:	00c781a3          	sb	a2,3(a5)
    80003a84:	02e68663          	beq	a3,a4,80003ab0 <__memmove+0xfc>
    80003a88:	0045c603          	lbu	a2,4(a1)
    80003a8c:	00400713          	li	a4,4
    80003a90:	00c78223          	sb	a2,4(a5)
    80003a94:	00e68e63          	beq	a3,a4,80003ab0 <__memmove+0xfc>
    80003a98:	0055c603          	lbu	a2,5(a1)
    80003a9c:	00500713          	li	a4,5
    80003aa0:	00c782a3          	sb	a2,5(a5)
    80003aa4:	00e68663          	beq	a3,a4,80003ab0 <__memmove+0xfc>
    80003aa8:	0065c703          	lbu	a4,6(a1)
    80003aac:	00e78323          	sb	a4,6(a5)
    80003ab0:	00813403          	ld	s0,8(sp)
    80003ab4:	01010113          	addi	sp,sp,16
    80003ab8:	00008067          	ret
    80003abc:	02061713          	slli	a4,a2,0x20
    80003ac0:	02075713          	srli	a4,a4,0x20
    80003ac4:	00e587b3          	add	a5,a1,a4
    80003ac8:	f0f574e3          	bgeu	a0,a5,800039d0 <__memmove+0x1c>
    80003acc:	02069613          	slli	a2,a3,0x20
    80003ad0:	02065613          	srli	a2,a2,0x20
    80003ad4:	fff64613          	not	a2,a2
    80003ad8:	00e50733          	add	a4,a0,a4
    80003adc:	00c78633          	add	a2,a5,a2
    80003ae0:	fff7c683          	lbu	a3,-1(a5)
    80003ae4:	fff78793          	addi	a5,a5,-1
    80003ae8:	fff70713          	addi	a4,a4,-1
    80003aec:	00d70023          	sb	a3,0(a4)
    80003af0:	fec798e3          	bne	a5,a2,80003ae0 <__memmove+0x12c>
    80003af4:	00813403          	ld	s0,8(sp)
    80003af8:	01010113          	addi	sp,sp,16
    80003afc:	00008067          	ret
    80003b00:	02069713          	slli	a4,a3,0x20
    80003b04:	02075713          	srli	a4,a4,0x20
    80003b08:	00170713          	addi	a4,a4,1
    80003b0c:	00e50733          	add	a4,a0,a4
    80003b10:	00050793          	mv	a5,a0
    80003b14:	0005c683          	lbu	a3,0(a1)
    80003b18:	00178793          	addi	a5,a5,1
    80003b1c:	00158593          	addi	a1,a1,1
    80003b20:	fed78fa3          	sb	a3,-1(a5)
    80003b24:	fee798e3          	bne	a5,a4,80003b14 <__memmove+0x160>
    80003b28:	f89ff06f          	j	80003ab0 <__memmove+0xfc>

0000000080003b2c <__putc>:
    80003b2c:	fe010113          	addi	sp,sp,-32
    80003b30:	00813823          	sd	s0,16(sp)
    80003b34:	00113c23          	sd	ra,24(sp)
    80003b38:	02010413          	addi	s0,sp,32
    80003b3c:	00050793          	mv	a5,a0
    80003b40:	fef40593          	addi	a1,s0,-17
    80003b44:	00100613          	li	a2,1
    80003b48:	00000513          	li	a0,0
    80003b4c:	fef407a3          	sb	a5,-17(s0)
    80003b50:	fffff097          	auipc	ra,0xfffff
    80003b54:	b3c080e7          	jalr	-1220(ra) # 8000268c <console_write>
    80003b58:	01813083          	ld	ra,24(sp)
    80003b5c:	01013403          	ld	s0,16(sp)
    80003b60:	02010113          	addi	sp,sp,32
    80003b64:	00008067          	ret

0000000080003b68 <__getc>:
    80003b68:	fe010113          	addi	sp,sp,-32
    80003b6c:	00813823          	sd	s0,16(sp)
    80003b70:	00113c23          	sd	ra,24(sp)
    80003b74:	02010413          	addi	s0,sp,32
    80003b78:	fe840593          	addi	a1,s0,-24
    80003b7c:	00100613          	li	a2,1
    80003b80:	00000513          	li	a0,0
    80003b84:	fffff097          	auipc	ra,0xfffff
    80003b88:	ae8080e7          	jalr	-1304(ra) # 8000266c <console_read>
    80003b8c:	fe844503          	lbu	a0,-24(s0)
    80003b90:	01813083          	ld	ra,24(sp)
    80003b94:	01013403          	ld	s0,16(sp)
    80003b98:	02010113          	addi	sp,sp,32
    80003b9c:	00008067          	ret

0000000080003ba0 <console_handler>:
    80003ba0:	fe010113          	addi	sp,sp,-32
    80003ba4:	00813823          	sd	s0,16(sp)
    80003ba8:	00113c23          	sd	ra,24(sp)
    80003bac:	00913423          	sd	s1,8(sp)
    80003bb0:	02010413          	addi	s0,sp,32
    80003bb4:	14202773          	csrr	a4,scause
    80003bb8:	100027f3          	csrr	a5,sstatus
    80003bbc:	0027f793          	andi	a5,a5,2
    80003bc0:	06079e63          	bnez	a5,80003c3c <console_handler+0x9c>
    80003bc4:	00074c63          	bltz	a4,80003bdc <console_handler+0x3c>
    80003bc8:	01813083          	ld	ra,24(sp)
    80003bcc:	01013403          	ld	s0,16(sp)
    80003bd0:	00813483          	ld	s1,8(sp)
    80003bd4:	02010113          	addi	sp,sp,32
    80003bd8:	00008067          	ret
    80003bdc:	0ff77713          	andi	a4,a4,255
    80003be0:	00900793          	li	a5,9
    80003be4:	fef712e3          	bne	a4,a5,80003bc8 <console_handler+0x28>
    80003be8:	ffffe097          	auipc	ra,0xffffe
    80003bec:	6dc080e7          	jalr	1756(ra) # 800022c4 <plic_claim>
    80003bf0:	00a00793          	li	a5,10
    80003bf4:	00050493          	mv	s1,a0
    80003bf8:	02f50c63          	beq	a0,a5,80003c30 <console_handler+0x90>
    80003bfc:	fc0506e3          	beqz	a0,80003bc8 <console_handler+0x28>
    80003c00:	00050593          	mv	a1,a0
    80003c04:	00000517          	auipc	a0,0x0
    80003c08:	68450513          	addi	a0,a0,1668 # 80004288 <CONSOLE_STATUS+0x278>
    80003c0c:	fffff097          	auipc	ra,0xfffff
    80003c10:	afc080e7          	jalr	-1284(ra) # 80002708 <__printf>
    80003c14:	01013403          	ld	s0,16(sp)
    80003c18:	01813083          	ld	ra,24(sp)
    80003c1c:	00048513          	mv	a0,s1
    80003c20:	00813483          	ld	s1,8(sp)
    80003c24:	02010113          	addi	sp,sp,32
    80003c28:	ffffe317          	auipc	t1,0xffffe
    80003c2c:	6d430067          	jr	1748(t1) # 800022fc <plic_complete>
    80003c30:	fffff097          	auipc	ra,0xfffff
    80003c34:	3e0080e7          	jalr	992(ra) # 80003010 <uartintr>
    80003c38:	fddff06f          	j	80003c14 <console_handler+0x74>
    80003c3c:	00000517          	auipc	a0,0x0
    80003c40:	74c50513          	addi	a0,a0,1868 # 80004388 <digits+0x78>
    80003c44:	fffff097          	auipc	ra,0xfffff
    80003c48:	a68080e7          	jalr	-1432(ra) # 800026ac <panic>
	...
