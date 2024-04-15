
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00004117          	auipc	sp,0x4
    80000004:	28813103          	ld	sp,648(sp) # 80004288 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	068010ef          	jal	ra,80001084 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_Z9mem_allocm>:
//
// Created by os on 4/15/24.
//
#include "../h/syscall_c.hpp"

void* mem_alloc(uint64 size){
    80001000:	ff010113          	addi	sp,sp,-16
    80001004:	00813423          	sd	s0,8(sp)
    80001008:	01010413          	addi	s0,sp,16
    __asm__ volatile("la a0, 0x01;"
                     "mv a1, %0;"
                     "ecall;": "=r"(size));
    8000100c:	0010051b          	addiw	a0,zero,1
    80001010:	00078593          	mv	a1,a5
    80001014:	00000073          	ecall

    void* returnValue;
    __asm__ volatile("mv %0, a0;": "=r"(returnValue));
    80001018:	00050513          	mv	a0,a0
    return returnValue;
}
    8000101c:	00813403          	ld	s0,8(sp)
    80001020:	01010113          	addi	sp,sp,16
    80001024:	00008067          	ret

0000000080001028 <_Z8mem_freev>:

int mem_free(){
    80001028:	ff010113          	addi	sp,sp,-16
    8000102c:	00813423          	sd	s0,8(sp)
    80001030:	01010413          	addi	s0,sp,16
    __asm__ volatile("la a0, 0x01;"
                     "ecall;");
    80001034:	0010051b          	addiw	a0,zero,1
    80001038:	00000073          	ecall

    int returnValue;
    __asm__ volatile("mv %0, a0;": "=r"(returnValue));
    8000103c:	00050513          	mv	a0,a0
    return returnValue;
    80001040:	0005051b          	sext.w	a0,a0
    80001044:	00813403          	ld	s0,8(sp)
    80001048:	01010113          	addi	sp,sp,16
    8000104c:	00008067          	ret

0000000080001050 <main>:
//
#include "../lib/hw.h"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"

int main(){
    80001050:	ff010113          	addi	sp,sp,-16
    80001054:	00813423          	sd	s0,8(sp)
    80001058:	01010413          	addi	s0,sp,16
    //initialize system data structures and register values
    return 0;
    8000105c:	00000513          	li	a0,0
    80001060:	00813403          	ld	s0,8(sp)
    80001064:	01010113          	addi	sp,sp,16
    80001068:	00008067          	ret

000000008000106c <_Z12ecallHandlerv>:
// Created by os on 4/15/24.
//

#include "../h/riscv.hpp"

void ecallHandler(){
    8000106c:	ff010113          	addi	sp,sp,-16
    80001070:	00813423          	sd	s0,8(sp)
    80001074:	01010413          	addi	s0,sp,16
    int x = 0;
    x++;
    return;
    80001078:	00813403          	ld	s0,8(sp)
    8000107c:	01010113          	addi	sp,sp,16
    80001080:	00008067          	ret

0000000080001084 <start>:
    80001084:	ff010113          	addi	sp,sp,-16
    80001088:	00813423          	sd	s0,8(sp)
    8000108c:	01010413          	addi	s0,sp,16
    80001090:	300027f3          	csrr	a5,mstatus
    80001094:	ffffe737          	lui	a4,0xffffe
    80001098:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff92df>
    8000109c:	00e7f7b3          	and	a5,a5,a4
    800010a0:	00001737          	lui	a4,0x1
    800010a4:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800010a8:	00e7e7b3          	or	a5,a5,a4
    800010ac:	30079073          	csrw	mstatus,a5
    800010b0:	00000797          	auipc	a5,0x0
    800010b4:	16078793          	addi	a5,a5,352 # 80001210 <system_main>
    800010b8:	34179073          	csrw	mepc,a5
    800010bc:	00000793          	li	a5,0
    800010c0:	18079073          	csrw	satp,a5
    800010c4:	000107b7          	lui	a5,0x10
    800010c8:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800010cc:	30279073          	csrw	medeleg,a5
    800010d0:	30379073          	csrw	mideleg,a5
    800010d4:	104027f3          	csrr	a5,sie
    800010d8:	2227e793          	ori	a5,a5,546
    800010dc:	10479073          	csrw	sie,a5
    800010e0:	fff00793          	li	a5,-1
    800010e4:	00a7d793          	srli	a5,a5,0xa
    800010e8:	3b079073          	csrw	pmpaddr0,a5
    800010ec:	00f00793          	li	a5,15
    800010f0:	3a079073          	csrw	pmpcfg0,a5
    800010f4:	f14027f3          	csrr	a5,mhartid
    800010f8:	0200c737          	lui	a4,0x200c
    800010fc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80001100:	0007869b          	sext.w	a3,a5
    80001104:	00269713          	slli	a4,a3,0x2
    80001108:	000f4637          	lui	a2,0xf4
    8000110c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80001110:	00d70733          	add	a4,a4,a3
    80001114:	0037979b          	slliw	a5,a5,0x3
    80001118:	020046b7          	lui	a3,0x2004
    8000111c:	00d787b3          	add	a5,a5,a3
    80001120:	00c585b3          	add	a1,a1,a2
    80001124:	00371693          	slli	a3,a4,0x3
    80001128:	00003717          	auipc	a4,0x3
    8000112c:	1a870713          	addi	a4,a4,424 # 800042d0 <timer_scratch>
    80001130:	00b7b023          	sd	a1,0(a5)
    80001134:	00d70733          	add	a4,a4,a3
    80001138:	00f73c23          	sd	a5,24(a4)
    8000113c:	02c73023          	sd	a2,32(a4)
    80001140:	34071073          	csrw	mscratch,a4
    80001144:	00000797          	auipc	a5,0x0
    80001148:	6ec78793          	addi	a5,a5,1772 # 80001830 <timervec>
    8000114c:	30579073          	csrw	mtvec,a5
    80001150:	300027f3          	csrr	a5,mstatus
    80001154:	0087e793          	ori	a5,a5,8
    80001158:	30079073          	csrw	mstatus,a5
    8000115c:	304027f3          	csrr	a5,mie
    80001160:	0807e793          	ori	a5,a5,128
    80001164:	30479073          	csrw	mie,a5
    80001168:	f14027f3          	csrr	a5,mhartid
    8000116c:	0007879b          	sext.w	a5,a5
    80001170:	00078213          	mv	tp,a5
    80001174:	30200073          	mret
    80001178:	00813403          	ld	s0,8(sp)
    8000117c:	01010113          	addi	sp,sp,16
    80001180:	00008067          	ret

0000000080001184 <timerinit>:
    80001184:	ff010113          	addi	sp,sp,-16
    80001188:	00813423          	sd	s0,8(sp)
    8000118c:	01010413          	addi	s0,sp,16
    80001190:	f14027f3          	csrr	a5,mhartid
    80001194:	0200c737          	lui	a4,0x200c
    80001198:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    8000119c:	0007869b          	sext.w	a3,a5
    800011a0:	00269713          	slli	a4,a3,0x2
    800011a4:	000f4637          	lui	a2,0xf4
    800011a8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800011ac:	00d70733          	add	a4,a4,a3
    800011b0:	0037979b          	slliw	a5,a5,0x3
    800011b4:	020046b7          	lui	a3,0x2004
    800011b8:	00d787b3          	add	a5,a5,a3
    800011bc:	00c585b3          	add	a1,a1,a2
    800011c0:	00371693          	slli	a3,a4,0x3
    800011c4:	00003717          	auipc	a4,0x3
    800011c8:	10c70713          	addi	a4,a4,268 # 800042d0 <timer_scratch>
    800011cc:	00b7b023          	sd	a1,0(a5)
    800011d0:	00d70733          	add	a4,a4,a3
    800011d4:	00f73c23          	sd	a5,24(a4)
    800011d8:	02c73023          	sd	a2,32(a4)
    800011dc:	34071073          	csrw	mscratch,a4
    800011e0:	00000797          	auipc	a5,0x0
    800011e4:	65078793          	addi	a5,a5,1616 # 80001830 <timervec>
    800011e8:	30579073          	csrw	mtvec,a5
    800011ec:	300027f3          	csrr	a5,mstatus
    800011f0:	0087e793          	ori	a5,a5,8
    800011f4:	30079073          	csrw	mstatus,a5
    800011f8:	304027f3          	csrr	a5,mie
    800011fc:	0807e793          	ori	a5,a5,128
    80001200:	30479073          	csrw	mie,a5
    80001204:	00813403          	ld	s0,8(sp)
    80001208:	01010113          	addi	sp,sp,16
    8000120c:	00008067          	ret

0000000080001210 <system_main>:
    80001210:	fe010113          	addi	sp,sp,-32
    80001214:	00813823          	sd	s0,16(sp)
    80001218:	00913423          	sd	s1,8(sp)
    8000121c:	00113c23          	sd	ra,24(sp)
    80001220:	02010413          	addi	s0,sp,32
    80001224:	00000097          	auipc	ra,0x0
    80001228:	0c4080e7          	jalr	196(ra) # 800012e8 <cpuid>
    8000122c:	00003497          	auipc	s1,0x3
    80001230:	07448493          	addi	s1,s1,116 # 800042a0 <started>
    80001234:	02050263          	beqz	a0,80001258 <system_main+0x48>
    80001238:	0004a783          	lw	a5,0(s1)
    8000123c:	0007879b          	sext.w	a5,a5
    80001240:	fe078ce3          	beqz	a5,80001238 <system_main+0x28>
    80001244:	0ff0000f          	fence
    80001248:	00003517          	auipc	a0,0x3
    8000124c:	de850513          	addi	a0,a0,-536 # 80004030 <__memmove+0x105c>
    80001250:	00001097          	auipc	ra,0x1
    80001254:	a7c080e7          	jalr	-1412(ra) # 80001ccc <panic>
    80001258:	00001097          	auipc	ra,0x1
    8000125c:	9d0080e7          	jalr	-1584(ra) # 80001c28 <consoleinit>
    80001260:	00001097          	auipc	ra,0x1
    80001264:	15c080e7          	jalr	348(ra) # 800023bc <printfinit>
    80001268:	00003517          	auipc	a0,0x3
    8000126c:	ea850513          	addi	a0,a0,-344 # 80004110 <__memmove+0x113c>
    80001270:	00001097          	auipc	ra,0x1
    80001274:	ab8080e7          	jalr	-1352(ra) # 80001d28 <__printf>
    80001278:	00003517          	auipc	a0,0x3
    8000127c:	d8850513          	addi	a0,a0,-632 # 80004000 <__memmove+0x102c>
    80001280:	00001097          	auipc	ra,0x1
    80001284:	aa8080e7          	jalr	-1368(ra) # 80001d28 <__printf>
    80001288:	00003517          	auipc	a0,0x3
    8000128c:	e8850513          	addi	a0,a0,-376 # 80004110 <__memmove+0x113c>
    80001290:	00001097          	auipc	ra,0x1
    80001294:	a98080e7          	jalr	-1384(ra) # 80001d28 <__printf>
    80001298:	00001097          	auipc	ra,0x1
    8000129c:	4b0080e7          	jalr	1200(ra) # 80002748 <kinit>
    800012a0:	00000097          	auipc	ra,0x0
    800012a4:	148080e7          	jalr	328(ra) # 800013e8 <trapinit>
    800012a8:	00000097          	auipc	ra,0x0
    800012ac:	16c080e7          	jalr	364(ra) # 80001414 <trapinithart>
    800012b0:	00000097          	auipc	ra,0x0
    800012b4:	5c0080e7          	jalr	1472(ra) # 80001870 <plicinit>
    800012b8:	00000097          	auipc	ra,0x0
    800012bc:	5e0080e7          	jalr	1504(ra) # 80001898 <plicinithart>
    800012c0:	00000097          	auipc	ra,0x0
    800012c4:	078080e7          	jalr	120(ra) # 80001338 <userinit>
    800012c8:	0ff0000f          	fence
    800012cc:	00100793          	li	a5,1
    800012d0:	00003517          	auipc	a0,0x3
    800012d4:	d4850513          	addi	a0,a0,-696 # 80004018 <__memmove+0x1044>
    800012d8:	00f4a023          	sw	a5,0(s1)
    800012dc:	00001097          	auipc	ra,0x1
    800012e0:	a4c080e7          	jalr	-1460(ra) # 80001d28 <__printf>
    800012e4:	0000006f          	j	800012e4 <system_main+0xd4>

00000000800012e8 <cpuid>:
    800012e8:	ff010113          	addi	sp,sp,-16
    800012ec:	00813423          	sd	s0,8(sp)
    800012f0:	01010413          	addi	s0,sp,16
    800012f4:	00020513          	mv	a0,tp
    800012f8:	00813403          	ld	s0,8(sp)
    800012fc:	0005051b          	sext.w	a0,a0
    80001300:	01010113          	addi	sp,sp,16
    80001304:	00008067          	ret

0000000080001308 <mycpu>:
    80001308:	ff010113          	addi	sp,sp,-16
    8000130c:	00813423          	sd	s0,8(sp)
    80001310:	01010413          	addi	s0,sp,16
    80001314:	00020793          	mv	a5,tp
    80001318:	00813403          	ld	s0,8(sp)
    8000131c:	0007879b          	sext.w	a5,a5
    80001320:	00779793          	slli	a5,a5,0x7
    80001324:	00004517          	auipc	a0,0x4
    80001328:	fdc50513          	addi	a0,a0,-36 # 80005300 <cpus>
    8000132c:	00f50533          	add	a0,a0,a5
    80001330:	01010113          	addi	sp,sp,16
    80001334:	00008067          	ret

0000000080001338 <userinit>:
    80001338:	ff010113          	addi	sp,sp,-16
    8000133c:	00813423          	sd	s0,8(sp)
    80001340:	01010413          	addi	s0,sp,16
    80001344:	00813403          	ld	s0,8(sp)
    80001348:	01010113          	addi	sp,sp,16
    8000134c:	00000317          	auipc	t1,0x0
    80001350:	d0430067          	jr	-764(t1) # 80001050 <main>

0000000080001354 <either_copyout>:
    80001354:	ff010113          	addi	sp,sp,-16
    80001358:	00813023          	sd	s0,0(sp)
    8000135c:	00113423          	sd	ra,8(sp)
    80001360:	01010413          	addi	s0,sp,16
    80001364:	02051663          	bnez	a0,80001390 <either_copyout+0x3c>
    80001368:	00058513          	mv	a0,a1
    8000136c:	00060593          	mv	a1,a2
    80001370:	0006861b          	sext.w	a2,a3
    80001374:	00002097          	auipc	ra,0x2
    80001378:	c60080e7          	jalr	-928(ra) # 80002fd4 <__memmove>
    8000137c:	00813083          	ld	ra,8(sp)
    80001380:	00013403          	ld	s0,0(sp)
    80001384:	00000513          	li	a0,0
    80001388:	01010113          	addi	sp,sp,16
    8000138c:	00008067          	ret
    80001390:	00003517          	auipc	a0,0x3
    80001394:	cc850513          	addi	a0,a0,-824 # 80004058 <__memmove+0x1084>
    80001398:	00001097          	auipc	ra,0x1
    8000139c:	934080e7          	jalr	-1740(ra) # 80001ccc <panic>

00000000800013a0 <either_copyin>:
    800013a0:	ff010113          	addi	sp,sp,-16
    800013a4:	00813023          	sd	s0,0(sp)
    800013a8:	00113423          	sd	ra,8(sp)
    800013ac:	01010413          	addi	s0,sp,16
    800013b0:	02059463          	bnez	a1,800013d8 <either_copyin+0x38>
    800013b4:	00060593          	mv	a1,a2
    800013b8:	0006861b          	sext.w	a2,a3
    800013bc:	00002097          	auipc	ra,0x2
    800013c0:	c18080e7          	jalr	-1000(ra) # 80002fd4 <__memmove>
    800013c4:	00813083          	ld	ra,8(sp)
    800013c8:	00013403          	ld	s0,0(sp)
    800013cc:	00000513          	li	a0,0
    800013d0:	01010113          	addi	sp,sp,16
    800013d4:	00008067          	ret
    800013d8:	00003517          	auipc	a0,0x3
    800013dc:	ca850513          	addi	a0,a0,-856 # 80004080 <__memmove+0x10ac>
    800013e0:	00001097          	auipc	ra,0x1
    800013e4:	8ec080e7          	jalr	-1812(ra) # 80001ccc <panic>

00000000800013e8 <trapinit>:
    800013e8:	ff010113          	addi	sp,sp,-16
    800013ec:	00813423          	sd	s0,8(sp)
    800013f0:	01010413          	addi	s0,sp,16
    800013f4:	00813403          	ld	s0,8(sp)
    800013f8:	00003597          	auipc	a1,0x3
    800013fc:	cb058593          	addi	a1,a1,-848 # 800040a8 <__memmove+0x10d4>
    80001400:	00004517          	auipc	a0,0x4
    80001404:	f8050513          	addi	a0,a0,-128 # 80005380 <tickslock>
    80001408:	01010113          	addi	sp,sp,16
    8000140c:	00001317          	auipc	t1,0x1
    80001410:	5cc30067          	jr	1484(t1) # 800029d8 <initlock>

0000000080001414 <trapinithart>:
    80001414:	ff010113          	addi	sp,sp,-16
    80001418:	00813423          	sd	s0,8(sp)
    8000141c:	01010413          	addi	s0,sp,16
    80001420:	00000797          	auipc	a5,0x0
    80001424:	30078793          	addi	a5,a5,768 # 80001720 <kernelvec>
    80001428:	10579073          	csrw	stvec,a5
    8000142c:	00813403          	ld	s0,8(sp)
    80001430:	01010113          	addi	sp,sp,16
    80001434:	00008067          	ret

0000000080001438 <usertrap>:
    80001438:	ff010113          	addi	sp,sp,-16
    8000143c:	00813423          	sd	s0,8(sp)
    80001440:	01010413          	addi	s0,sp,16
    80001444:	00813403          	ld	s0,8(sp)
    80001448:	01010113          	addi	sp,sp,16
    8000144c:	00008067          	ret

0000000080001450 <usertrapret>:
    80001450:	ff010113          	addi	sp,sp,-16
    80001454:	00813423          	sd	s0,8(sp)
    80001458:	01010413          	addi	s0,sp,16
    8000145c:	00813403          	ld	s0,8(sp)
    80001460:	01010113          	addi	sp,sp,16
    80001464:	00008067          	ret

0000000080001468 <kerneltrap>:
    80001468:	fe010113          	addi	sp,sp,-32
    8000146c:	00813823          	sd	s0,16(sp)
    80001470:	00113c23          	sd	ra,24(sp)
    80001474:	00913423          	sd	s1,8(sp)
    80001478:	02010413          	addi	s0,sp,32
    8000147c:	142025f3          	csrr	a1,scause
    80001480:	100027f3          	csrr	a5,sstatus
    80001484:	0027f793          	andi	a5,a5,2
    80001488:	10079c63          	bnez	a5,800015a0 <kerneltrap+0x138>
    8000148c:	142027f3          	csrr	a5,scause
    80001490:	0207ce63          	bltz	a5,800014cc <kerneltrap+0x64>
    80001494:	00003517          	auipc	a0,0x3
    80001498:	c5c50513          	addi	a0,a0,-932 # 800040f0 <__memmove+0x111c>
    8000149c:	00001097          	auipc	ra,0x1
    800014a0:	88c080e7          	jalr	-1908(ra) # 80001d28 <__printf>
    800014a4:	141025f3          	csrr	a1,sepc
    800014a8:	14302673          	csrr	a2,stval
    800014ac:	00003517          	auipc	a0,0x3
    800014b0:	c5450513          	addi	a0,a0,-940 # 80004100 <__memmove+0x112c>
    800014b4:	00001097          	auipc	ra,0x1
    800014b8:	874080e7          	jalr	-1932(ra) # 80001d28 <__printf>
    800014bc:	00003517          	auipc	a0,0x3
    800014c0:	c5c50513          	addi	a0,a0,-932 # 80004118 <__memmove+0x1144>
    800014c4:	00001097          	auipc	ra,0x1
    800014c8:	808080e7          	jalr	-2040(ra) # 80001ccc <panic>
    800014cc:	0ff7f713          	andi	a4,a5,255
    800014d0:	00900693          	li	a3,9
    800014d4:	04d70063          	beq	a4,a3,80001514 <kerneltrap+0xac>
    800014d8:	fff00713          	li	a4,-1
    800014dc:	03f71713          	slli	a4,a4,0x3f
    800014e0:	00170713          	addi	a4,a4,1
    800014e4:	fae798e3          	bne	a5,a4,80001494 <kerneltrap+0x2c>
    800014e8:	00000097          	auipc	ra,0x0
    800014ec:	e00080e7          	jalr	-512(ra) # 800012e8 <cpuid>
    800014f0:	06050663          	beqz	a0,8000155c <kerneltrap+0xf4>
    800014f4:	144027f3          	csrr	a5,sip
    800014f8:	ffd7f793          	andi	a5,a5,-3
    800014fc:	14479073          	csrw	sip,a5
    80001500:	01813083          	ld	ra,24(sp)
    80001504:	01013403          	ld	s0,16(sp)
    80001508:	00813483          	ld	s1,8(sp)
    8000150c:	02010113          	addi	sp,sp,32
    80001510:	00008067          	ret
    80001514:	00000097          	auipc	ra,0x0
    80001518:	3d0080e7          	jalr	976(ra) # 800018e4 <plic_claim>
    8000151c:	00a00793          	li	a5,10
    80001520:	00050493          	mv	s1,a0
    80001524:	06f50863          	beq	a0,a5,80001594 <kerneltrap+0x12c>
    80001528:	fc050ce3          	beqz	a0,80001500 <kerneltrap+0x98>
    8000152c:	00050593          	mv	a1,a0
    80001530:	00003517          	auipc	a0,0x3
    80001534:	ba050513          	addi	a0,a0,-1120 # 800040d0 <__memmove+0x10fc>
    80001538:	00000097          	auipc	ra,0x0
    8000153c:	7f0080e7          	jalr	2032(ra) # 80001d28 <__printf>
    80001540:	01013403          	ld	s0,16(sp)
    80001544:	01813083          	ld	ra,24(sp)
    80001548:	00048513          	mv	a0,s1
    8000154c:	00813483          	ld	s1,8(sp)
    80001550:	02010113          	addi	sp,sp,32
    80001554:	00000317          	auipc	t1,0x0
    80001558:	3c830067          	jr	968(t1) # 8000191c <plic_complete>
    8000155c:	00004517          	auipc	a0,0x4
    80001560:	e2450513          	addi	a0,a0,-476 # 80005380 <tickslock>
    80001564:	00001097          	auipc	ra,0x1
    80001568:	498080e7          	jalr	1176(ra) # 800029fc <acquire>
    8000156c:	00003717          	auipc	a4,0x3
    80001570:	d3870713          	addi	a4,a4,-712 # 800042a4 <ticks>
    80001574:	00072783          	lw	a5,0(a4)
    80001578:	00004517          	auipc	a0,0x4
    8000157c:	e0850513          	addi	a0,a0,-504 # 80005380 <tickslock>
    80001580:	0017879b          	addiw	a5,a5,1
    80001584:	00f72023          	sw	a5,0(a4)
    80001588:	00001097          	auipc	ra,0x1
    8000158c:	540080e7          	jalr	1344(ra) # 80002ac8 <release>
    80001590:	f65ff06f          	j	800014f4 <kerneltrap+0x8c>
    80001594:	00001097          	auipc	ra,0x1
    80001598:	09c080e7          	jalr	156(ra) # 80002630 <uartintr>
    8000159c:	fa5ff06f          	j	80001540 <kerneltrap+0xd8>
    800015a0:	00003517          	auipc	a0,0x3
    800015a4:	b1050513          	addi	a0,a0,-1264 # 800040b0 <__memmove+0x10dc>
    800015a8:	00000097          	auipc	ra,0x0
    800015ac:	724080e7          	jalr	1828(ra) # 80001ccc <panic>

00000000800015b0 <clockintr>:
    800015b0:	fe010113          	addi	sp,sp,-32
    800015b4:	00813823          	sd	s0,16(sp)
    800015b8:	00913423          	sd	s1,8(sp)
    800015bc:	00113c23          	sd	ra,24(sp)
    800015c0:	02010413          	addi	s0,sp,32
    800015c4:	00004497          	auipc	s1,0x4
    800015c8:	dbc48493          	addi	s1,s1,-580 # 80005380 <tickslock>
    800015cc:	00048513          	mv	a0,s1
    800015d0:	00001097          	auipc	ra,0x1
    800015d4:	42c080e7          	jalr	1068(ra) # 800029fc <acquire>
    800015d8:	00003717          	auipc	a4,0x3
    800015dc:	ccc70713          	addi	a4,a4,-820 # 800042a4 <ticks>
    800015e0:	00072783          	lw	a5,0(a4)
    800015e4:	01013403          	ld	s0,16(sp)
    800015e8:	01813083          	ld	ra,24(sp)
    800015ec:	00048513          	mv	a0,s1
    800015f0:	0017879b          	addiw	a5,a5,1
    800015f4:	00813483          	ld	s1,8(sp)
    800015f8:	00f72023          	sw	a5,0(a4)
    800015fc:	02010113          	addi	sp,sp,32
    80001600:	00001317          	auipc	t1,0x1
    80001604:	4c830067          	jr	1224(t1) # 80002ac8 <release>

0000000080001608 <devintr>:
    80001608:	142027f3          	csrr	a5,scause
    8000160c:	00000513          	li	a0,0
    80001610:	0007c463          	bltz	a5,80001618 <devintr+0x10>
    80001614:	00008067          	ret
    80001618:	fe010113          	addi	sp,sp,-32
    8000161c:	00813823          	sd	s0,16(sp)
    80001620:	00113c23          	sd	ra,24(sp)
    80001624:	00913423          	sd	s1,8(sp)
    80001628:	02010413          	addi	s0,sp,32
    8000162c:	0ff7f713          	andi	a4,a5,255
    80001630:	00900693          	li	a3,9
    80001634:	04d70c63          	beq	a4,a3,8000168c <devintr+0x84>
    80001638:	fff00713          	li	a4,-1
    8000163c:	03f71713          	slli	a4,a4,0x3f
    80001640:	00170713          	addi	a4,a4,1
    80001644:	00e78c63          	beq	a5,a4,8000165c <devintr+0x54>
    80001648:	01813083          	ld	ra,24(sp)
    8000164c:	01013403          	ld	s0,16(sp)
    80001650:	00813483          	ld	s1,8(sp)
    80001654:	02010113          	addi	sp,sp,32
    80001658:	00008067          	ret
    8000165c:	00000097          	auipc	ra,0x0
    80001660:	c8c080e7          	jalr	-884(ra) # 800012e8 <cpuid>
    80001664:	06050663          	beqz	a0,800016d0 <devintr+0xc8>
    80001668:	144027f3          	csrr	a5,sip
    8000166c:	ffd7f793          	andi	a5,a5,-3
    80001670:	14479073          	csrw	sip,a5
    80001674:	01813083          	ld	ra,24(sp)
    80001678:	01013403          	ld	s0,16(sp)
    8000167c:	00813483          	ld	s1,8(sp)
    80001680:	00200513          	li	a0,2
    80001684:	02010113          	addi	sp,sp,32
    80001688:	00008067          	ret
    8000168c:	00000097          	auipc	ra,0x0
    80001690:	258080e7          	jalr	600(ra) # 800018e4 <plic_claim>
    80001694:	00a00793          	li	a5,10
    80001698:	00050493          	mv	s1,a0
    8000169c:	06f50663          	beq	a0,a5,80001708 <devintr+0x100>
    800016a0:	00100513          	li	a0,1
    800016a4:	fa0482e3          	beqz	s1,80001648 <devintr+0x40>
    800016a8:	00048593          	mv	a1,s1
    800016ac:	00003517          	auipc	a0,0x3
    800016b0:	a2450513          	addi	a0,a0,-1500 # 800040d0 <__memmove+0x10fc>
    800016b4:	00000097          	auipc	ra,0x0
    800016b8:	674080e7          	jalr	1652(ra) # 80001d28 <__printf>
    800016bc:	00048513          	mv	a0,s1
    800016c0:	00000097          	auipc	ra,0x0
    800016c4:	25c080e7          	jalr	604(ra) # 8000191c <plic_complete>
    800016c8:	00100513          	li	a0,1
    800016cc:	f7dff06f          	j	80001648 <devintr+0x40>
    800016d0:	00004517          	auipc	a0,0x4
    800016d4:	cb050513          	addi	a0,a0,-848 # 80005380 <tickslock>
    800016d8:	00001097          	auipc	ra,0x1
    800016dc:	324080e7          	jalr	804(ra) # 800029fc <acquire>
    800016e0:	00003717          	auipc	a4,0x3
    800016e4:	bc470713          	addi	a4,a4,-1084 # 800042a4 <ticks>
    800016e8:	00072783          	lw	a5,0(a4)
    800016ec:	00004517          	auipc	a0,0x4
    800016f0:	c9450513          	addi	a0,a0,-876 # 80005380 <tickslock>
    800016f4:	0017879b          	addiw	a5,a5,1
    800016f8:	00f72023          	sw	a5,0(a4)
    800016fc:	00001097          	auipc	ra,0x1
    80001700:	3cc080e7          	jalr	972(ra) # 80002ac8 <release>
    80001704:	f65ff06f          	j	80001668 <devintr+0x60>
    80001708:	00001097          	auipc	ra,0x1
    8000170c:	f28080e7          	jalr	-216(ra) # 80002630 <uartintr>
    80001710:	fadff06f          	j	800016bc <devintr+0xb4>
	...

0000000080001720 <kernelvec>:
    80001720:	f0010113          	addi	sp,sp,-256
    80001724:	00113023          	sd	ra,0(sp)
    80001728:	00213423          	sd	sp,8(sp)
    8000172c:	00313823          	sd	gp,16(sp)
    80001730:	00413c23          	sd	tp,24(sp)
    80001734:	02513023          	sd	t0,32(sp)
    80001738:	02613423          	sd	t1,40(sp)
    8000173c:	02713823          	sd	t2,48(sp)
    80001740:	02813c23          	sd	s0,56(sp)
    80001744:	04913023          	sd	s1,64(sp)
    80001748:	04a13423          	sd	a0,72(sp)
    8000174c:	04b13823          	sd	a1,80(sp)
    80001750:	04c13c23          	sd	a2,88(sp)
    80001754:	06d13023          	sd	a3,96(sp)
    80001758:	06e13423          	sd	a4,104(sp)
    8000175c:	06f13823          	sd	a5,112(sp)
    80001760:	07013c23          	sd	a6,120(sp)
    80001764:	09113023          	sd	a7,128(sp)
    80001768:	09213423          	sd	s2,136(sp)
    8000176c:	09313823          	sd	s3,144(sp)
    80001770:	09413c23          	sd	s4,152(sp)
    80001774:	0b513023          	sd	s5,160(sp)
    80001778:	0b613423          	sd	s6,168(sp)
    8000177c:	0b713823          	sd	s7,176(sp)
    80001780:	0b813c23          	sd	s8,184(sp)
    80001784:	0d913023          	sd	s9,192(sp)
    80001788:	0da13423          	sd	s10,200(sp)
    8000178c:	0db13823          	sd	s11,208(sp)
    80001790:	0dc13c23          	sd	t3,216(sp)
    80001794:	0fd13023          	sd	t4,224(sp)
    80001798:	0fe13423          	sd	t5,232(sp)
    8000179c:	0ff13823          	sd	t6,240(sp)
    800017a0:	cc9ff0ef          	jal	ra,80001468 <kerneltrap>
    800017a4:	00013083          	ld	ra,0(sp)
    800017a8:	00813103          	ld	sp,8(sp)
    800017ac:	01013183          	ld	gp,16(sp)
    800017b0:	02013283          	ld	t0,32(sp)
    800017b4:	02813303          	ld	t1,40(sp)
    800017b8:	03013383          	ld	t2,48(sp)
    800017bc:	03813403          	ld	s0,56(sp)
    800017c0:	04013483          	ld	s1,64(sp)
    800017c4:	04813503          	ld	a0,72(sp)
    800017c8:	05013583          	ld	a1,80(sp)
    800017cc:	05813603          	ld	a2,88(sp)
    800017d0:	06013683          	ld	a3,96(sp)
    800017d4:	06813703          	ld	a4,104(sp)
    800017d8:	07013783          	ld	a5,112(sp)
    800017dc:	07813803          	ld	a6,120(sp)
    800017e0:	08013883          	ld	a7,128(sp)
    800017e4:	08813903          	ld	s2,136(sp)
    800017e8:	09013983          	ld	s3,144(sp)
    800017ec:	09813a03          	ld	s4,152(sp)
    800017f0:	0a013a83          	ld	s5,160(sp)
    800017f4:	0a813b03          	ld	s6,168(sp)
    800017f8:	0b013b83          	ld	s7,176(sp)
    800017fc:	0b813c03          	ld	s8,184(sp)
    80001800:	0c013c83          	ld	s9,192(sp)
    80001804:	0c813d03          	ld	s10,200(sp)
    80001808:	0d013d83          	ld	s11,208(sp)
    8000180c:	0d813e03          	ld	t3,216(sp)
    80001810:	0e013e83          	ld	t4,224(sp)
    80001814:	0e813f03          	ld	t5,232(sp)
    80001818:	0f013f83          	ld	t6,240(sp)
    8000181c:	10010113          	addi	sp,sp,256
    80001820:	10200073          	sret
    80001824:	00000013          	nop
    80001828:	00000013          	nop
    8000182c:	00000013          	nop

0000000080001830 <timervec>:
    80001830:	34051573          	csrrw	a0,mscratch,a0
    80001834:	00b53023          	sd	a1,0(a0)
    80001838:	00c53423          	sd	a2,8(a0)
    8000183c:	00d53823          	sd	a3,16(a0)
    80001840:	01853583          	ld	a1,24(a0)
    80001844:	02053603          	ld	a2,32(a0)
    80001848:	0005b683          	ld	a3,0(a1)
    8000184c:	00c686b3          	add	a3,a3,a2
    80001850:	00d5b023          	sd	a3,0(a1)
    80001854:	00200593          	li	a1,2
    80001858:	14459073          	csrw	sip,a1
    8000185c:	01053683          	ld	a3,16(a0)
    80001860:	00853603          	ld	a2,8(a0)
    80001864:	00053583          	ld	a1,0(a0)
    80001868:	34051573          	csrrw	a0,mscratch,a0
    8000186c:	30200073          	mret

0000000080001870 <plicinit>:
    80001870:	ff010113          	addi	sp,sp,-16
    80001874:	00813423          	sd	s0,8(sp)
    80001878:	01010413          	addi	s0,sp,16
    8000187c:	00813403          	ld	s0,8(sp)
    80001880:	0c0007b7          	lui	a5,0xc000
    80001884:	00100713          	li	a4,1
    80001888:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000188c:	00e7a223          	sw	a4,4(a5)
    80001890:	01010113          	addi	sp,sp,16
    80001894:	00008067          	ret

0000000080001898 <plicinithart>:
    80001898:	ff010113          	addi	sp,sp,-16
    8000189c:	00813023          	sd	s0,0(sp)
    800018a0:	00113423          	sd	ra,8(sp)
    800018a4:	01010413          	addi	s0,sp,16
    800018a8:	00000097          	auipc	ra,0x0
    800018ac:	a40080e7          	jalr	-1472(ra) # 800012e8 <cpuid>
    800018b0:	0085171b          	slliw	a4,a0,0x8
    800018b4:	0c0027b7          	lui	a5,0xc002
    800018b8:	00e787b3          	add	a5,a5,a4
    800018bc:	40200713          	li	a4,1026
    800018c0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800018c4:	00813083          	ld	ra,8(sp)
    800018c8:	00013403          	ld	s0,0(sp)
    800018cc:	00d5151b          	slliw	a0,a0,0xd
    800018d0:	0c2017b7          	lui	a5,0xc201
    800018d4:	00a78533          	add	a0,a5,a0
    800018d8:	00052023          	sw	zero,0(a0)
    800018dc:	01010113          	addi	sp,sp,16
    800018e0:	00008067          	ret

00000000800018e4 <plic_claim>:
    800018e4:	ff010113          	addi	sp,sp,-16
    800018e8:	00813023          	sd	s0,0(sp)
    800018ec:	00113423          	sd	ra,8(sp)
    800018f0:	01010413          	addi	s0,sp,16
    800018f4:	00000097          	auipc	ra,0x0
    800018f8:	9f4080e7          	jalr	-1548(ra) # 800012e8 <cpuid>
    800018fc:	00813083          	ld	ra,8(sp)
    80001900:	00013403          	ld	s0,0(sp)
    80001904:	00d5151b          	slliw	a0,a0,0xd
    80001908:	0c2017b7          	lui	a5,0xc201
    8000190c:	00a78533          	add	a0,a5,a0
    80001910:	00452503          	lw	a0,4(a0)
    80001914:	01010113          	addi	sp,sp,16
    80001918:	00008067          	ret

000000008000191c <plic_complete>:
    8000191c:	fe010113          	addi	sp,sp,-32
    80001920:	00813823          	sd	s0,16(sp)
    80001924:	00913423          	sd	s1,8(sp)
    80001928:	00113c23          	sd	ra,24(sp)
    8000192c:	02010413          	addi	s0,sp,32
    80001930:	00050493          	mv	s1,a0
    80001934:	00000097          	auipc	ra,0x0
    80001938:	9b4080e7          	jalr	-1612(ra) # 800012e8 <cpuid>
    8000193c:	01813083          	ld	ra,24(sp)
    80001940:	01013403          	ld	s0,16(sp)
    80001944:	00d5179b          	slliw	a5,a0,0xd
    80001948:	0c201737          	lui	a4,0xc201
    8000194c:	00f707b3          	add	a5,a4,a5
    80001950:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80001954:	00813483          	ld	s1,8(sp)
    80001958:	02010113          	addi	sp,sp,32
    8000195c:	00008067          	ret

0000000080001960 <consolewrite>:
    80001960:	fb010113          	addi	sp,sp,-80
    80001964:	04813023          	sd	s0,64(sp)
    80001968:	04113423          	sd	ra,72(sp)
    8000196c:	02913c23          	sd	s1,56(sp)
    80001970:	03213823          	sd	s2,48(sp)
    80001974:	03313423          	sd	s3,40(sp)
    80001978:	03413023          	sd	s4,32(sp)
    8000197c:	01513c23          	sd	s5,24(sp)
    80001980:	05010413          	addi	s0,sp,80
    80001984:	06c05c63          	blez	a2,800019fc <consolewrite+0x9c>
    80001988:	00060993          	mv	s3,a2
    8000198c:	00050a13          	mv	s4,a0
    80001990:	00058493          	mv	s1,a1
    80001994:	00000913          	li	s2,0
    80001998:	fff00a93          	li	s5,-1
    8000199c:	01c0006f          	j	800019b8 <consolewrite+0x58>
    800019a0:	fbf44503          	lbu	a0,-65(s0)
    800019a4:	0019091b          	addiw	s2,s2,1
    800019a8:	00148493          	addi	s1,s1,1
    800019ac:	00001097          	auipc	ra,0x1
    800019b0:	a9c080e7          	jalr	-1380(ra) # 80002448 <uartputc>
    800019b4:	03298063          	beq	s3,s2,800019d4 <consolewrite+0x74>
    800019b8:	00048613          	mv	a2,s1
    800019bc:	00100693          	li	a3,1
    800019c0:	000a0593          	mv	a1,s4
    800019c4:	fbf40513          	addi	a0,s0,-65
    800019c8:	00000097          	auipc	ra,0x0
    800019cc:	9d8080e7          	jalr	-1576(ra) # 800013a0 <either_copyin>
    800019d0:	fd5518e3          	bne	a0,s5,800019a0 <consolewrite+0x40>
    800019d4:	04813083          	ld	ra,72(sp)
    800019d8:	04013403          	ld	s0,64(sp)
    800019dc:	03813483          	ld	s1,56(sp)
    800019e0:	02813983          	ld	s3,40(sp)
    800019e4:	02013a03          	ld	s4,32(sp)
    800019e8:	01813a83          	ld	s5,24(sp)
    800019ec:	00090513          	mv	a0,s2
    800019f0:	03013903          	ld	s2,48(sp)
    800019f4:	05010113          	addi	sp,sp,80
    800019f8:	00008067          	ret
    800019fc:	00000913          	li	s2,0
    80001a00:	fd5ff06f          	j	800019d4 <consolewrite+0x74>

0000000080001a04 <consoleread>:
    80001a04:	f9010113          	addi	sp,sp,-112
    80001a08:	06813023          	sd	s0,96(sp)
    80001a0c:	04913c23          	sd	s1,88(sp)
    80001a10:	05213823          	sd	s2,80(sp)
    80001a14:	05313423          	sd	s3,72(sp)
    80001a18:	05413023          	sd	s4,64(sp)
    80001a1c:	03513c23          	sd	s5,56(sp)
    80001a20:	03613823          	sd	s6,48(sp)
    80001a24:	03713423          	sd	s7,40(sp)
    80001a28:	03813023          	sd	s8,32(sp)
    80001a2c:	06113423          	sd	ra,104(sp)
    80001a30:	01913c23          	sd	s9,24(sp)
    80001a34:	07010413          	addi	s0,sp,112
    80001a38:	00060b93          	mv	s7,a2
    80001a3c:	00050913          	mv	s2,a0
    80001a40:	00058c13          	mv	s8,a1
    80001a44:	00060b1b          	sext.w	s6,a2
    80001a48:	00004497          	auipc	s1,0x4
    80001a4c:	95048493          	addi	s1,s1,-1712 # 80005398 <cons>
    80001a50:	00400993          	li	s3,4
    80001a54:	fff00a13          	li	s4,-1
    80001a58:	00a00a93          	li	s5,10
    80001a5c:	05705e63          	blez	s7,80001ab8 <consoleread+0xb4>
    80001a60:	09c4a703          	lw	a4,156(s1)
    80001a64:	0984a783          	lw	a5,152(s1)
    80001a68:	0007071b          	sext.w	a4,a4
    80001a6c:	08e78463          	beq	a5,a4,80001af4 <consoleread+0xf0>
    80001a70:	07f7f713          	andi	a4,a5,127
    80001a74:	00e48733          	add	a4,s1,a4
    80001a78:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80001a7c:	0017869b          	addiw	a3,a5,1
    80001a80:	08d4ac23          	sw	a3,152(s1)
    80001a84:	00070c9b          	sext.w	s9,a4
    80001a88:	0b370663          	beq	a4,s3,80001b34 <consoleread+0x130>
    80001a8c:	00100693          	li	a3,1
    80001a90:	f9f40613          	addi	a2,s0,-97
    80001a94:	000c0593          	mv	a1,s8
    80001a98:	00090513          	mv	a0,s2
    80001a9c:	f8e40fa3          	sb	a4,-97(s0)
    80001aa0:	00000097          	auipc	ra,0x0
    80001aa4:	8b4080e7          	jalr	-1868(ra) # 80001354 <either_copyout>
    80001aa8:	01450863          	beq	a0,s4,80001ab8 <consoleread+0xb4>
    80001aac:	001c0c13          	addi	s8,s8,1
    80001ab0:	fffb8b9b          	addiw	s7,s7,-1
    80001ab4:	fb5c94e3          	bne	s9,s5,80001a5c <consoleread+0x58>
    80001ab8:	000b851b          	sext.w	a0,s7
    80001abc:	06813083          	ld	ra,104(sp)
    80001ac0:	06013403          	ld	s0,96(sp)
    80001ac4:	05813483          	ld	s1,88(sp)
    80001ac8:	05013903          	ld	s2,80(sp)
    80001acc:	04813983          	ld	s3,72(sp)
    80001ad0:	04013a03          	ld	s4,64(sp)
    80001ad4:	03813a83          	ld	s5,56(sp)
    80001ad8:	02813b83          	ld	s7,40(sp)
    80001adc:	02013c03          	ld	s8,32(sp)
    80001ae0:	01813c83          	ld	s9,24(sp)
    80001ae4:	40ab053b          	subw	a0,s6,a0
    80001ae8:	03013b03          	ld	s6,48(sp)
    80001aec:	07010113          	addi	sp,sp,112
    80001af0:	00008067          	ret
    80001af4:	00001097          	auipc	ra,0x1
    80001af8:	1d8080e7          	jalr	472(ra) # 80002ccc <push_on>
    80001afc:	0984a703          	lw	a4,152(s1)
    80001b00:	09c4a783          	lw	a5,156(s1)
    80001b04:	0007879b          	sext.w	a5,a5
    80001b08:	fef70ce3          	beq	a4,a5,80001b00 <consoleread+0xfc>
    80001b0c:	00001097          	auipc	ra,0x1
    80001b10:	234080e7          	jalr	564(ra) # 80002d40 <pop_on>
    80001b14:	0984a783          	lw	a5,152(s1)
    80001b18:	07f7f713          	andi	a4,a5,127
    80001b1c:	00e48733          	add	a4,s1,a4
    80001b20:	01874703          	lbu	a4,24(a4)
    80001b24:	0017869b          	addiw	a3,a5,1
    80001b28:	08d4ac23          	sw	a3,152(s1)
    80001b2c:	00070c9b          	sext.w	s9,a4
    80001b30:	f5371ee3          	bne	a4,s3,80001a8c <consoleread+0x88>
    80001b34:	000b851b          	sext.w	a0,s7
    80001b38:	f96bf2e3          	bgeu	s7,s6,80001abc <consoleread+0xb8>
    80001b3c:	08f4ac23          	sw	a5,152(s1)
    80001b40:	f7dff06f          	j	80001abc <consoleread+0xb8>

0000000080001b44 <consputc>:
    80001b44:	10000793          	li	a5,256
    80001b48:	00f50663          	beq	a0,a5,80001b54 <consputc+0x10>
    80001b4c:	00001317          	auipc	t1,0x1
    80001b50:	9f430067          	jr	-1548(t1) # 80002540 <uartputc_sync>
    80001b54:	ff010113          	addi	sp,sp,-16
    80001b58:	00113423          	sd	ra,8(sp)
    80001b5c:	00813023          	sd	s0,0(sp)
    80001b60:	01010413          	addi	s0,sp,16
    80001b64:	00800513          	li	a0,8
    80001b68:	00001097          	auipc	ra,0x1
    80001b6c:	9d8080e7          	jalr	-1576(ra) # 80002540 <uartputc_sync>
    80001b70:	02000513          	li	a0,32
    80001b74:	00001097          	auipc	ra,0x1
    80001b78:	9cc080e7          	jalr	-1588(ra) # 80002540 <uartputc_sync>
    80001b7c:	00013403          	ld	s0,0(sp)
    80001b80:	00813083          	ld	ra,8(sp)
    80001b84:	00800513          	li	a0,8
    80001b88:	01010113          	addi	sp,sp,16
    80001b8c:	00001317          	auipc	t1,0x1
    80001b90:	9b430067          	jr	-1612(t1) # 80002540 <uartputc_sync>

0000000080001b94 <consoleintr>:
    80001b94:	fe010113          	addi	sp,sp,-32
    80001b98:	00813823          	sd	s0,16(sp)
    80001b9c:	00913423          	sd	s1,8(sp)
    80001ba0:	01213023          	sd	s2,0(sp)
    80001ba4:	00113c23          	sd	ra,24(sp)
    80001ba8:	02010413          	addi	s0,sp,32
    80001bac:	00003917          	auipc	s2,0x3
    80001bb0:	7ec90913          	addi	s2,s2,2028 # 80005398 <cons>
    80001bb4:	00050493          	mv	s1,a0
    80001bb8:	00090513          	mv	a0,s2
    80001bbc:	00001097          	auipc	ra,0x1
    80001bc0:	e40080e7          	jalr	-448(ra) # 800029fc <acquire>
    80001bc4:	02048c63          	beqz	s1,80001bfc <consoleintr+0x68>
    80001bc8:	0a092783          	lw	a5,160(s2)
    80001bcc:	09892703          	lw	a4,152(s2)
    80001bd0:	07f00693          	li	a3,127
    80001bd4:	40e7873b          	subw	a4,a5,a4
    80001bd8:	02e6e263          	bltu	a3,a4,80001bfc <consoleintr+0x68>
    80001bdc:	00d00713          	li	a4,13
    80001be0:	04e48063          	beq	s1,a4,80001c20 <consoleintr+0x8c>
    80001be4:	07f7f713          	andi	a4,a5,127
    80001be8:	00e90733          	add	a4,s2,a4
    80001bec:	0017879b          	addiw	a5,a5,1
    80001bf0:	0af92023          	sw	a5,160(s2)
    80001bf4:	00970c23          	sb	s1,24(a4)
    80001bf8:	08f92e23          	sw	a5,156(s2)
    80001bfc:	01013403          	ld	s0,16(sp)
    80001c00:	01813083          	ld	ra,24(sp)
    80001c04:	00813483          	ld	s1,8(sp)
    80001c08:	00013903          	ld	s2,0(sp)
    80001c0c:	00003517          	auipc	a0,0x3
    80001c10:	78c50513          	addi	a0,a0,1932 # 80005398 <cons>
    80001c14:	02010113          	addi	sp,sp,32
    80001c18:	00001317          	auipc	t1,0x1
    80001c1c:	eb030067          	jr	-336(t1) # 80002ac8 <release>
    80001c20:	00a00493          	li	s1,10
    80001c24:	fc1ff06f          	j	80001be4 <consoleintr+0x50>

0000000080001c28 <consoleinit>:
    80001c28:	fe010113          	addi	sp,sp,-32
    80001c2c:	00113c23          	sd	ra,24(sp)
    80001c30:	00813823          	sd	s0,16(sp)
    80001c34:	00913423          	sd	s1,8(sp)
    80001c38:	02010413          	addi	s0,sp,32
    80001c3c:	00003497          	auipc	s1,0x3
    80001c40:	75c48493          	addi	s1,s1,1884 # 80005398 <cons>
    80001c44:	00048513          	mv	a0,s1
    80001c48:	00002597          	auipc	a1,0x2
    80001c4c:	4e058593          	addi	a1,a1,1248 # 80004128 <__memmove+0x1154>
    80001c50:	00001097          	auipc	ra,0x1
    80001c54:	d88080e7          	jalr	-632(ra) # 800029d8 <initlock>
    80001c58:	00000097          	auipc	ra,0x0
    80001c5c:	7ac080e7          	jalr	1964(ra) # 80002404 <uartinit>
    80001c60:	01813083          	ld	ra,24(sp)
    80001c64:	01013403          	ld	s0,16(sp)
    80001c68:	00000797          	auipc	a5,0x0
    80001c6c:	d9c78793          	addi	a5,a5,-612 # 80001a04 <consoleread>
    80001c70:	0af4bc23          	sd	a5,184(s1)
    80001c74:	00000797          	auipc	a5,0x0
    80001c78:	cec78793          	addi	a5,a5,-788 # 80001960 <consolewrite>
    80001c7c:	0cf4b023          	sd	a5,192(s1)
    80001c80:	00813483          	ld	s1,8(sp)
    80001c84:	02010113          	addi	sp,sp,32
    80001c88:	00008067          	ret

0000000080001c8c <console_read>:
    80001c8c:	ff010113          	addi	sp,sp,-16
    80001c90:	00813423          	sd	s0,8(sp)
    80001c94:	01010413          	addi	s0,sp,16
    80001c98:	00813403          	ld	s0,8(sp)
    80001c9c:	00003317          	auipc	t1,0x3
    80001ca0:	7b433303          	ld	t1,1972(t1) # 80005450 <devsw+0x10>
    80001ca4:	01010113          	addi	sp,sp,16
    80001ca8:	00030067          	jr	t1

0000000080001cac <console_write>:
    80001cac:	ff010113          	addi	sp,sp,-16
    80001cb0:	00813423          	sd	s0,8(sp)
    80001cb4:	01010413          	addi	s0,sp,16
    80001cb8:	00813403          	ld	s0,8(sp)
    80001cbc:	00003317          	auipc	t1,0x3
    80001cc0:	79c33303          	ld	t1,1948(t1) # 80005458 <devsw+0x18>
    80001cc4:	01010113          	addi	sp,sp,16
    80001cc8:	00030067          	jr	t1

0000000080001ccc <panic>:
    80001ccc:	fe010113          	addi	sp,sp,-32
    80001cd0:	00113c23          	sd	ra,24(sp)
    80001cd4:	00813823          	sd	s0,16(sp)
    80001cd8:	00913423          	sd	s1,8(sp)
    80001cdc:	02010413          	addi	s0,sp,32
    80001ce0:	00050493          	mv	s1,a0
    80001ce4:	00002517          	auipc	a0,0x2
    80001ce8:	44c50513          	addi	a0,a0,1100 # 80004130 <__memmove+0x115c>
    80001cec:	00004797          	auipc	a5,0x4
    80001cf0:	8007a623          	sw	zero,-2036(a5) # 800054f8 <pr+0x18>
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	034080e7          	jalr	52(ra) # 80001d28 <__printf>
    80001cfc:	00048513          	mv	a0,s1
    80001d00:	00000097          	auipc	ra,0x0
    80001d04:	028080e7          	jalr	40(ra) # 80001d28 <__printf>
    80001d08:	00002517          	auipc	a0,0x2
    80001d0c:	40850513          	addi	a0,a0,1032 # 80004110 <__memmove+0x113c>
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	018080e7          	jalr	24(ra) # 80001d28 <__printf>
    80001d18:	00100793          	li	a5,1
    80001d1c:	00002717          	auipc	a4,0x2
    80001d20:	58f72623          	sw	a5,1420(a4) # 800042a8 <panicked>
    80001d24:	0000006f          	j	80001d24 <panic+0x58>

0000000080001d28 <__printf>:
    80001d28:	f3010113          	addi	sp,sp,-208
    80001d2c:	08813023          	sd	s0,128(sp)
    80001d30:	07313423          	sd	s3,104(sp)
    80001d34:	09010413          	addi	s0,sp,144
    80001d38:	05813023          	sd	s8,64(sp)
    80001d3c:	08113423          	sd	ra,136(sp)
    80001d40:	06913c23          	sd	s1,120(sp)
    80001d44:	07213823          	sd	s2,112(sp)
    80001d48:	07413023          	sd	s4,96(sp)
    80001d4c:	05513c23          	sd	s5,88(sp)
    80001d50:	05613823          	sd	s6,80(sp)
    80001d54:	05713423          	sd	s7,72(sp)
    80001d58:	03913c23          	sd	s9,56(sp)
    80001d5c:	03a13823          	sd	s10,48(sp)
    80001d60:	03b13423          	sd	s11,40(sp)
    80001d64:	00003317          	auipc	t1,0x3
    80001d68:	77c30313          	addi	t1,t1,1916 # 800054e0 <pr>
    80001d6c:	01832c03          	lw	s8,24(t1)
    80001d70:	00b43423          	sd	a1,8(s0)
    80001d74:	00c43823          	sd	a2,16(s0)
    80001d78:	00d43c23          	sd	a3,24(s0)
    80001d7c:	02e43023          	sd	a4,32(s0)
    80001d80:	02f43423          	sd	a5,40(s0)
    80001d84:	03043823          	sd	a6,48(s0)
    80001d88:	03143c23          	sd	a7,56(s0)
    80001d8c:	00050993          	mv	s3,a0
    80001d90:	4a0c1663          	bnez	s8,8000223c <__printf+0x514>
    80001d94:	60098c63          	beqz	s3,800023ac <__printf+0x684>
    80001d98:	0009c503          	lbu	a0,0(s3)
    80001d9c:	00840793          	addi	a5,s0,8
    80001da0:	f6f43c23          	sd	a5,-136(s0)
    80001da4:	00000493          	li	s1,0
    80001da8:	22050063          	beqz	a0,80001fc8 <__printf+0x2a0>
    80001dac:	00002a37          	lui	s4,0x2
    80001db0:	00018ab7          	lui	s5,0x18
    80001db4:	000f4b37          	lui	s6,0xf4
    80001db8:	00989bb7          	lui	s7,0x989
    80001dbc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80001dc0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80001dc4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80001dc8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80001dcc:	00148c9b          	addiw	s9,s1,1
    80001dd0:	02500793          	li	a5,37
    80001dd4:	01998933          	add	s2,s3,s9
    80001dd8:	38f51263          	bne	a0,a5,8000215c <__printf+0x434>
    80001ddc:	00094783          	lbu	a5,0(s2)
    80001de0:	00078c9b          	sext.w	s9,a5
    80001de4:	1e078263          	beqz	a5,80001fc8 <__printf+0x2a0>
    80001de8:	0024849b          	addiw	s1,s1,2
    80001dec:	07000713          	li	a4,112
    80001df0:	00998933          	add	s2,s3,s1
    80001df4:	38e78a63          	beq	a5,a4,80002188 <__printf+0x460>
    80001df8:	20f76863          	bltu	a4,a5,80002008 <__printf+0x2e0>
    80001dfc:	42a78863          	beq	a5,a0,8000222c <__printf+0x504>
    80001e00:	06400713          	li	a4,100
    80001e04:	40e79663          	bne	a5,a4,80002210 <__printf+0x4e8>
    80001e08:	f7843783          	ld	a5,-136(s0)
    80001e0c:	0007a603          	lw	a2,0(a5)
    80001e10:	00878793          	addi	a5,a5,8
    80001e14:	f6f43c23          	sd	a5,-136(s0)
    80001e18:	42064a63          	bltz	a2,8000224c <__printf+0x524>
    80001e1c:	00a00713          	li	a4,10
    80001e20:	02e677bb          	remuw	a5,a2,a4
    80001e24:	00002d97          	auipc	s11,0x2
    80001e28:	334d8d93          	addi	s11,s11,820 # 80004158 <digits>
    80001e2c:	00900593          	li	a1,9
    80001e30:	0006051b          	sext.w	a0,a2
    80001e34:	00000c93          	li	s9,0
    80001e38:	02079793          	slli	a5,a5,0x20
    80001e3c:	0207d793          	srli	a5,a5,0x20
    80001e40:	00fd87b3          	add	a5,s11,a5
    80001e44:	0007c783          	lbu	a5,0(a5)
    80001e48:	02e656bb          	divuw	a3,a2,a4
    80001e4c:	f8f40023          	sb	a5,-128(s0)
    80001e50:	14c5d863          	bge	a1,a2,80001fa0 <__printf+0x278>
    80001e54:	06300593          	li	a1,99
    80001e58:	00100c93          	li	s9,1
    80001e5c:	02e6f7bb          	remuw	a5,a3,a4
    80001e60:	02079793          	slli	a5,a5,0x20
    80001e64:	0207d793          	srli	a5,a5,0x20
    80001e68:	00fd87b3          	add	a5,s11,a5
    80001e6c:	0007c783          	lbu	a5,0(a5)
    80001e70:	02e6d73b          	divuw	a4,a3,a4
    80001e74:	f8f400a3          	sb	a5,-127(s0)
    80001e78:	12a5f463          	bgeu	a1,a0,80001fa0 <__printf+0x278>
    80001e7c:	00a00693          	li	a3,10
    80001e80:	00900593          	li	a1,9
    80001e84:	02d777bb          	remuw	a5,a4,a3
    80001e88:	02079793          	slli	a5,a5,0x20
    80001e8c:	0207d793          	srli	a5,a5,0x20
    80001e90:	00fd87b3          	add	a5,s11,a5
    80001e94:	0007c503          	lbu	a0,0(a5)
    80001e98:	02d757bb          	divuw	a5,a4,a3
    80001e9c:	f8a40123          	sb	a0,-126(s0)
    80001ea0:	48e5f263          	bgeu	a1,a4,80002324 <__printf+0x5fc>
    80001ea4:	06300513          	li	a0,99
    80001ea8:	02d7f5bb          	remuw	a1,a5,a3
    80001eac:	02059593          	slli	a1,a1,0x20
    80001eb0:	0205d593          	srli	a1,a1,0x20
    80001eb4:	00bd85b3          	add	a1,s11,a1
    80001eb8:	0005c583          	lbu	a1,0(a1)
    80001ebc:	02d7d7bb          	divuw	a5,a5,a3
    80001ec0:	f8b401a3          	sb	a1,-125(s0)
    80001ec4:	48e57263          	bgeu	a0,a4,80002348 <__printf+0x620>
    80001ec8:	3e700513          	li	a0,999
    80001ecc:	02d7f5bb          	remuw	a1,a5,a3
    80001ed0:	02059593          	slli	a1,a1,0x20
    80001ed4:	0205d593          	srli	a1,a1,0x20
    80001ed8:	00bd85b3          	add	a1,s11,a1
    80001edc:	0005c583          	lbu	a1,0(a1)
    80001ee0:	02d7d7bb          	divuw	a5,a5,a3
    80001ee4:	f8b40223          	sb	a1,-124(s0)
    80001ee8:	46e57663          	bgeu	a0,a4,80002354 <__printf+0x62c>
    80001eec:	02d7f5bb          	remuw	a1,a5,a3
    80001ef0:	02059593          	slli	a1,a1,0x20
    80001ef4:	0205d593          	srli	a1,a1,0x20
    80001ef8:	00bd85b3          	add	a1,s11,a1
    80001efc:	0005c583          	lbu	a1,0(a1)
    80001f00:	02d7d7bb          	divuw	a5,a5,a3
    80001f04:	f8b402a3          	sb	a1,-123(s0)
    80001f08:	46ea7863          	bgeu	s4,a4,80002378 <__printf+0x650>
    80001f0c:	02d7f5bb          	remuw	a1,a5,a3
    80001f10:	02059593          	slli	a1,a1,0x20
    80001f14:	0205d593          	srli	a1,a1,0x20
    80001f18:	00bd85b3          	add	a1,s11,a1
    80001f1c:	0005c583          	lbu	a1,0(a1)
    80001f20:	02d7d7bb          	divuw	a5,a5,a3
    80001f24:	f8b40323          	sb	a1,-122(s0)
    80001f28:	3eeaf863          	bgeu	s5,a4,80002318 <__printf+0x5f0>
    80001f2c:	02d7f5bb          	remuw	a1,a5,a3
    80001f30:	02059593          	slli	a1,a1,0x20
    80001f34:	0205d593          	srli	a1,a1,0x20
    80001f38:	00bd85b3          	add	a1,s11,a1
    80001f3c:	0005c583          	lbu	a1,0(a1)
    80001f40:	02d7d7bb          	divuw	a5,a5,a3
    80001f44:	f8b403a3          	sb	a1,-121(s0)
    80001f48:	42eb7e63          	bgeu	s6,a4,80002384 <__printf+0x65c>
    80001f4c:	02d7f5bb          	remuw	a1,a5,a3
    80001f50:	02059593          	slli	a1,a1,0x20
    80001f54:	0205d593          	srli	a1,a1,0x20
    80001f58:	00bd85b3          	add	a1,s11,a1
    80001f5c:	0005c583          	lbu	a1,0(a1)
    80001f60:	02d7d7bb          	divuw	a5,a5,a3
    80001f64:	f8b40423          	sb	a1,-120(s0)
    80001f68:	42ebfc63          	bgeu	s7,a4,800023a0 <__printf+0x678>
    80001f6c:	02079793          	slli	a5,a5,0x20
    80001f70:	0207d793          	srli	a5,a5,0x20
    80001f74:	00fd8db3          	add	s11,s11,a5
    80001f78:	000dc703          	lbu	a4,0(s11)
    80001f7c:	00a00793          	li	a5,10
    80001f80:	00900c93          	li	s9,9
    80001f84:	f8e404a3          	sb	a4,-119(s0)
    80001f88:	00065c63          	bgez	a2,80001fa0 <__printf+0x278>
    80001f8c:	f9040713          	addi	a4,s0,-112
    80001f90:	00f70733          	add	a4,a4,a5
    80001f94:	02d00693          	li	a3,45
    80001f98:	fed70823          	sb	a3,-16(a4)
    80001f9c:	00078c93          	mv	s9,a5
    80001fa0:	f8040793          	addi	a5,s0,-128
    80001fa4:	01978cb3          	add	s9,a5,s9
    80001fa8:	f7f40d13          	addi	s10,s0,-129
    80001fac:	000cc503          	lbu	a0,0(s9)
    80001fb0:	fffc8c93          	addi	s9,s9,-1
    80001fb4:	00000097          	auipc	ra,0x0
    80001fb8:	b90080e7          	jalr	-1136(ra) # 80001b44 <consputc>
    80001fbc:	ffac98e3          	bne	s9,s10,80001fac <__printf+0x284>
    80001fc0:	00094503          	lbu	a0,0(s2)
    80001fc4:	e00514e3          	bnez	a0,80001dcc <__printf+0xa4>
    80001fc8:	1a0c1663          	bnez	s8,80002174 <__printf+0x44c>
    80001fcc:	08813083          	ld	ra,136(sp)
    80001fd0:	08013403          	ld	s0,128(sp)
    80001fd4:	07813483          	ld	s1,120(sp)
    80001fd8:	07013903          	ld	s2,112(sp)
    80001fdc:	06813983          	ld	s3,104(sp)
    80001fe0:	06013a03          	ld	s4,96(sp)
    80001fe4:	05813a83          	ld	s5,88(sp)
    80001fe8:	05013b03          	ld	s6,80(sp)
    80001fec:	04813b83          	ld	s7,72(sp)
    80001ff0:	04013c03          	ld	s8,64(sp)
    80001ff4:	03813c83          	ld	s9,56(sp)
    80001ff8:	03013d03          	ld	s10,48(sp)
    80001ffc:	02813d83          	ld	s11,40(sp)
    80002000:	0d010113          	addi	sp,sp,208
    80002004:	00008067          	ret
    80002008:	07300713          	li	a4,115
    8000200c:	1ce78a63          	beq	a5,a4,800021e0 <__printf+0x4b8>
    80002010:	07800713          	li	a4,120
    80002014:	1ee79e63          	bne	a5,a4,80002210 <__printf+0x4e8>
    80002018:	f7843783          	ld	a5,-136(s0)
    8000201c:	0007a703          	lw	a4,0(a5)
    80002020:	00878793          	addi	a5,a5,8
    80002024:	f6f43c23          	sd	a5,-136(s0)
    80002028:	28074263          	bltz	a4,800022ac <__printf+0x584>
    8000202c:	00002d97          	auipc	s11,0x2
    80002030:	12cd8d93          	addi	s11,s11,300 # 80004158 <digits>
    80002034:	00f77793          	andi	a5,a4,15
    80002038:	00fd87b3          	add	a5,s11,a5
    8000203c:	0007c683          	lbu	a3,0(a5)
    80002040:	00f00613          	li	a2,15
    80002044:	0007079b          	sext.w	a5,a4
    80002048:	f8d40023          	sb	a3,-128(s0)
    8000204c:	0047559b          	srliw	a1,a4,0x4
    80002050:	0047569b          	srliw	a3,a4,0x4
    80002054:	00000c93          	li	s9,0
    80002058:	0ee65063          	bge	a2,a4,80002138 <__printf+0x410>
    8000205c:	00f6f693          	andi	a3,a3,15
    80002060:	00dd86b3          	add	a3,s11,a3
    80002064:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80002068:	0087d79b          	srliw	a5,a5,0x8
    8000206c:	00100c93          	li	s9,1
    80002070:	f8d400a3          	sb	a3,-127(s0)
    80002074:	0cb67263          	bgeu	a2,a1,80002138 <__printf+0x410>
    80002078:	00f7f693          	andi	a3,a5,15
    8000207c:	00dd86b3          	add	a3,s11,a3
    80002080:	0006c583          	lbu	a1,0(a3)
    80002084:	00f00613          	li	a2,15
    80002088:	0047d69b          	srliw	a3,a5,0x4
    8000208c:	f8b40123          	sb	a1,-126(s0)
    80002090:	0047d593          	srli	a1,a5,0x4
    80002094:	28f67e63          	bgeu	a2,a5,80002330 <__printf+0x608>
    80002098:	00f6f693          	andi	a3,a3,15
    8000209c:	00dd86b3          	add	a3,s11,a3
    800020a0:	0006c503          	lbu	a0,0(a3)
    800020a4:	0087d813          	srli	a6,a5,0x8
    800020a8:	0087d69b          	srliw	a3,a5,0x8
    800020ac:	f8a401a3          	sb	a0,-125(s0)
    800020b0:	28b67663          	bgeu	a2,a1,8000233c <__printf+0x614>
    800020b4:	00f6f693          	andi	a3,a3,15
    800020b8:	00dd86b3          	add	a3,s11,a3
    800020bc:	0006c583          	lbu	a1,0(a3)
    800020c0:	00c7d513          	srli	a0,a5,0xc
    800020c4:	00c7d69b          	srliw	a3,a5,0xc
    800020c8:	f8b40223          	sb	a1,-124(s0)
    800020cc:	29067a63          	bgeu	a2,a6,80002360 <__printf+0x638>
    800020d0:	00f6f693          	andi	a3,a3,15
    800020d4:	00dd86b3          	add	a3,s11,a3
    800020d8:	0006c583          	lbu	a1,0(a3)
    800020dc:	0107d813          	srli	a6,a5,0x10
    800020e0:	0107d69b          	srliw	a3,a5,0x10
    800020e4:	f8b402a3          	sb	a1,-123(s0)
    800020e8:	28a67263          	bgeu	a2,a0,8000236c <__printf+0x644>
    800020ec:	00f6f693          	andi	a3,a3,15
    800020f0:	00dd86b3          	add	a3,s11,a3
    800020f4:	0006c683          	lbu	a3,0(a3)
    800020f8:	0147d79b          	srliw	a5,a5,0x14
    800020fc:	f8d40323          	sb	a3,-122(s0)
    80002100:	21067663          	bgeu	a2,a6,8000230c <__printf+0x5e4>
    80002104:	02079793          	slli	a5,a5,0x20
    80002108:	0207d793          	srli	a5,a5,0x20
    8000210c:	00fd8db3          	add	s11,s11,a5
    80002110:	000dc683          	lbu	a3,0(s11)
    80002114:	00800793          	li	a5,8
    80002118:	00700c93          	li	s9,7
    8000211c:	f8d403a3          	sb	a3,-121(s0)
    80002120:	00075c63          	bgez	a4,80002138 <__printf+0x410>
    80002124:	f9040713          	addi	a4,s0,-112
    80002128:	00f70733          	add	a4,a4,a5
    8000212c:	02d00693          	li	a3,45
    80002130:	fed70823          	sb	a3,-16(a4)
    80002134:	00078c93          	mv	s9,a5
    80002138:	f8040793          	addi	a5,s0,-128
    8000213c:	01978cb3          	add	s9,a5,s9
    80002140:	f7f40d13          	addi	s10,s0,-129
    80002144:	000cc503          	lbu	a0,0(s9)
    80002148:	fffc8c93          	addi	s9,s9,-1
    8000214c:	00000097          	auipc	ra,0x0
    80002150:	9f8080e7          	jalr	-1544(ra) # 80001b44 <consputc>
    80002154:	ff9d18e3          	bne	s10,s9,80002144 <__printf+0x41c>
    80002158:	0100006f          	j	80002168 <__printf+0x440>
    8000215c:	00000097          	auipc	ra,0x0
    80002160:	9e8080e7          	jalr	-1560(ra) # 80001b44 <consputc>
    80002164:	000c8493          	mv	s1,s9
    80002168:	00094503          	lbu	a0,0(s2)
    8000216c:	c60510e3          	bnez	a0,80001dcc <__printf+0xa4>
    80002170:	e40c0ee3          	beqz	s8,80001fcc <__printf+0x2a4>
    80002174:	00003517          	auipc	a0,0x3
    80002178:	36c50513          	addi	a0,a0,876 # 800054e0 <pr>
    8000217c:	00001097          	auipc	ra,0x1
    80002180:	94c080e7          	jalr	-1716(ra) # 80002ac8 <release>
    80002184:	e49ff06f          	j	80001fcc <__printf+0x2a4>
    80002188:	f7843783          	ld	a5,-136(s0)
    8000218c:	03000513          	li	a0,48
    80002190:	01000d13          	li	s10,16
    80002194:	00878713          	addi	a4,a5,8
    80002198:	0007bc83          	ld	s9,0(a5)
    8000219c:	f6e43c23          	sd	a4,-136(s0)
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	9a4080e7          	jalr	-1628(ra) # 80001b44 <consputc>
    800021a8:	07800513          	li	a0,120
    800021ac:	00000097          	auipc	ra,0x0
    800021b0:	998080e7          	jalr	-1640(ra) # 80001b44 <consputc>
    800021b4:	00002d97          	auipc	s11,0x2
    800021b8:	fa4d8d93          	addi	s11,s11,-92 # 80004158 <digits>
    800021bc:	03ccd793          	srli	a5,s9,0x3c
    800021c0:	00fd87b3          	add	a5,s11,a5
    800021c4:	0007c503          	lbu	a0,0(a5)
    800021c8:	fffd0d1b          	addiw	s10,s10,-1
    800021cc:	004c9c93          	slli	s9,s9,0x4
    800021d0:	00000097          	auipc	ra,0x0
    800021d4:	974080e7          	jalr	-1676(ra) # 80001b44 <consputc>
    800021d8:	fe0d12e3          	bnez	s10,800021bc <__printf+0x494>
    800021dc:	f8dff06f          	j	80002168 <__printf+0x440>
    800021e0:	f7843783          	ld	a5,-136(s0)
    800021e4:	0007bc83          	ld	s9,0(a5)
    800021e8:	00878793          	addi	a5,a5,8
    800021ec:	f6f43c23          	sd	a5,-136(s0)
    800021f0:	000c9a63          	bnez	s9,80002204 <__printf+0x4dc>
    800021f4:	1080006f          	j	800022fc <__printf+0x5d4>
    800021f8:	001c8c93          	addi	s9,s9,1
    800021fc:	00000097          	auipc	ra,0x0
    80002200:	948080e7          	jalr	-1720(ra) # 80001b44 <consputc>
    80002204:	000cc503          	lbu	a0,0(s9)
    80002208:	fe0518e3          	bnez	a0,800021f8 <__printf+0x4d0>
    8000220c:	f5dff06f          	j	80002168 <__printf+0x440>
    80002210:	02500513          	li	a0,37
    80002214:	00000097          	auipc	ra,0x0
    80002218:	930080e7          	jalr	-1744(ra) # 80001b44 <consputc>
    8000221c:	000c8513          	mv	a0,s9
    80002220:	00000097          	auipc	ra,0x0
    80002224:	924080e7          	jalr	-1756(ra) # 80001b44 <consputc>
    80002228:	f41ff06f          	j	80002168 <__printf+0x440>
    8000222c:	02500513          	li	a0,37
    80002230:	00000097          	auipc	ra,0x0
    80002234:	914080e7          	jalr	-1772(ra) # 80001b44 <consputc>
    80002238:	f31ff06f          	j	80002168 <__printf+0x440>
    8000223c:	00030513          	mv	a0,t1
    80002240:	00000097          	auipc	ra,0x0
    80002244:	7bc080e7          	jalr	1980(ra) # 800029fc <acquire>
    80002248:	b4dff06f          	j	80001d94 <__printf+0x6c>
    8000224c:	40c0053b          	negw	a0,a2
    80002250:	00a00713          	li	a4,10
    80002254:	02e576bb          	remuw	a3,a0,a4
    80002258:	00002d97          	auipc	s11,0x2
    8000225c:	f00d8d93          	addi	s11,s11,-256 # 80004158 <digits>
    80002260:	ff700593          	li	a1,-9
    80002264:	02069693          	slli	a3,a3,0x20
    80002268:	0206d693          	srli	a3,a3,0x20
    8000226c:	00dd86b3          	add	a3,s11,a3
    80002270:	0006c683          	lbu	a3,0(a3)
    80002274:	02e557bb          	divuw	a5,a0,a4
    80002278:	f8d40023          	sb	a3,-128(s0)
    8000227c:	10b65e63          	bge	a2,a1,80002398 <__printf+0x670>
    80002280:	06300593          	li	a1,99
    80002284:	02e7f6bb          	remuw	a3,a5,a4
    80002288:	02069693          	slli	a3,a3,0x20
    8000228c:	0206d693          	srli	a3,a3,0x20
    80002290:	00dd86b3          	add	a3,s11,a3
    80002294:	0006c683          	lbu	a3,0(a3)
    80002298:	02e7d73b          	divuw	a4,a5,a4
    8000229c:	00200793          	li	a5,2
    800022a0:	f8d400a3          	sb	a3,-127(s0)
    800022a4:	bca5ece3          	bltu	a1,a0,80001e7c <__printf+0x154>
    800022a8:	ce5ff06f          	j	80001f8c <__printf+0x264>
    800022ac:	40e007bb          	negw	a5,a4
    800022b0:	00002d97          	auipc	s11,0x2
    800022b4:	ea8d8d93          	addi	s11,s11,-344 # 80004158 <digits>
    800022b8:	00f7f693          	andi	a3,a5,15
    800022bc:	00dd86b3          	add	a3,s11,a3
    800022c0:	0006c583          	lbu	a1,0(a3)
    800022c4:	ff100613          	li	a2,-15
    800022c8:	0047d69b          	srliw	a3,a5,0x4
    800022cc:	f8b40023          	sb	a1,-128(s0)
    800022d0:	0047d59b          	srliw	a1,a5,0x4
    800022d4:	0ac75e63          	bge	a4,a2,80002390 <__printf+0x668>
    800022d8:	00f6f693          	andi	a3,a3,15
    800022dc:	00dd86b3          	add	a3,s11,a3
    800022e0:	0006c603          	lbu	a2,0(a3)
    800022e4:	00f00693          	li	a3,15
    800022e8:	0087d79b          	srliw	a5,a5,0x8
    800022ec:	f8c400a3          	sb	a2,-127(s0)
    800022f0:	d8b6e4e3          	bltu	a3,a1,80002078 <__printf+0x350>
    800022f4:	00200793          	li	a5,2
    800022f8:	e2dff06f          	j	80002124 <__printf+0x3fc>
    800022fc:	00002c97          	auipc	s9,0x2
    80002300:	e3cc8c93          	addi	s9,s9,-452 # 80004138 <__memmove+0x1164>
    80002304:	02800513          	li	a0,40
    80002308:	ef1ff06f          	j	800021f8 <__printf+0x4d0>
    8000230c:	00700793          	li	a5,7
    80002310:	00600c93          	li	s9,6
    80002314:	e0dff06f          	j	80002120 <__printf+0x3f8>
    80002318:	00700793          	li	a5,7
    8000231c:	00600c93          	li	s9,6
    80002320:	c69ff06f          	j	80001f88 <__printf+0x260>
    80002324:	00300793          	li	a5,3
    80002328:	00200c93          	li	s9,2
    8000232c:	c5dff06f          	j	80001f88 <__printf+0x260>
    80002330:	00300793          	li	a5,3
    80002334:	00200c93          	li	s9,2
    80002338:	de9ff06f          	j	80002120 <__printf+0x3f8>
    8000233c:	00400793          	li	a5,4
    80002340:	00300c93          	li	s9,3
    80002344:	dddff06f          	j	80002120 <__printf+0x3f8>
    80002348:	00400793          	li	a5,4
    8000234c:	00300c93          	li	s9,3
    80002350:	c39ff06f          	j	80001f88 <__printf+0x260>
    80002354:	00500793          	li	a5,5
    80002358:	00400c93          	li	s9,4
    8000235c:	c2dff06f          	j	80001f88 <__printf+0x260>
    80002360:	00500793          	li	a5,5
    80002364:	00400c93          	li	s9,4
    80002368:	db9ff06f          	j	80002120 <__printf+0x3f8>
    8000236c:	00600793          	li	a5,6
    80002370:	00500c93          	li	s9,5
    80002374:	dadff06f          	j	80002120 <__printf+0x3f8>
    80002378:	00600793          	li	a5,6
    8000237c:	00500c93          	li	s9,5
    80002380:	c09ff06f          	j	80001f88 <__printf+0x260>
    80002384:	00800793          	li	a5,8
    80002388:	00700c93          	li	s9,7
    8000238c:	bfdff06f          	j	80001f88 <__printf+0x260>
    80002390:	00100793          	li	a5,1
    80002394:	d91ff06f          	j	80002124 <__printf+0x3fc>
    80002398:	00100793          	li	a5,1
    8000239c:	bf1ff06f          	j	80001f8c <__printf+0x264>
    800023a0:	00900793          	li	a5,9
    800023a4:	00800c93          	li	s9,8
    800023a8:	be1ff06f          	j	80001f88 <__printf+0x260>
    800023ac:	00002517          	auipc	a0,0x2
    800023b0:	d9450513          	addi	a0,a0,-620 # 80004140 <__memmove+0x116c>
    800023b4:	00000097          	auipc	ra,0x0
    800023b8:	918080e7          	jalr	-1768(ra) # 80001ccc <panic>

00000000800023bc <printfinit>:
    800023bc:	fe010113          	addi	sp,sp,-32
    800023c0:	00813823          	sd	s0,16(sp)
    800023c4:	00913423          	sd	s1,8(sp)
    800023c8:	00113c23          	sd	ra,24(sp)
    800023cc:	02010413          	addi	s0,sp,32
    800023d0:	00003497          	auipc	s1,0x3
    800023d4:	11048493          	addi	s1,s1,272 # 800054e0 <pr>
    800023d8:	00048513          	mv	a0,s1
    800023dc:	00002597          	auipc	a1,0x2
    800023e0:	d7458593          	addi	a1,a1,-652 # 80004150 <__memmove+0x117c>
    800023e4:	00000097          	auipc	ra,0x0
    800023e8:	5f4080e7          	jalr	1524(ra) # 800029d8 <initlock>
    800023ec:	01813083          	ld	ra,24(sp)
    800023f0:	01013403          	ld	s0,16(sp)
    800023f4:	0004ac23          	sw	zero,24(s1)
    800023f8:	00813483          	ld	s1,8(sp)
    800023fc:	02010113          	addi	sp,sp,32
    80002400:	00008067          	ret

0000000080002404 <uartinit>:
    80002404:	ff010113          	addi	sp,sp,-16
    80002408:	00813423          	sd	s0,8(sp)
    8000240c:	01010413          	addi	s0,sp,16
    80002410:	100007b7          	lui	a5,0x10000
    80002414:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80002418:	f8000713          	li	a4,-128
    8000241c:	00e781a3          	sb	a4,3(a5)
    80002420:	00300713          	li	a4,3
    80002424:	00e78023          	sb	a4,0(a5)
    80002428:	000780a3          	sb	zero,1(a5)
    8000242c:	00e781a3          	sb	a4,3(a5)
    80002430:	00700693          	li	a3,7
    80002434:	00d78123          	sb	a3,2(a5)
    80002438:	00e780a3          	sb	a4,1(a5)
    8000243c:	00813403          	ld	s0,8(sp)
    80002440:	01010113          	addi	sp,sp,16
    80002444:	00008067          	ret

0000000080002448 <uartputc>:
    80002448:	00002797          	auipc	a5,0x2
    8000244c:	e607a783          	lw	a5,-416(a5) # 800042a8 <panicked>
    80002450:	00078463          	beqz	a5,80002458 <uartputc+0x10>
    80002454:	0000006f          	j	80002454 <uartputc+0xc>
    80002458:	fd010113          	addi	sp,sp,-48
    8000245c:	02813023          	sd	s0,32(sp)
    80002460:	00913c23          	sd	s1,24(sp)
    80002464:	01213823          	sd	s2,16(sp)
    80002468:	01313423          	sd	s3,8(sp)
    8000246c:	02113423          	sd	ra,40(sp)
    80002470:	03010413          	addi	s0,sp,48
    80002474:	00002917          	auipc	s2,0x2
    80002478:	e3c90913          	addi	s2,s2,-452 # 800042b0 <uart_tx_r>
    8000247c:	00093783          	ld	a5,0(s2)
    80002480:	00002497          	auipc	s1,0x2
    80002484:	e3848493          	addi	s1,s1,-456 # 800042b8 <uart_tx_w>
    80002488:	0004b703          	ld	a4,0(s1)
    8000248c:	02078693          	addi	a3,a5,32
    80002490:	00050993          	mv	s3,a0
    80002494:	02e69c63          	bne	a3,a4,800024cc <uartputc+0x84>
    80002498:	00001097          	auipc	ra,0x1
    8000249c:	834080e7          	jalr	-1996(ra) # 80002ccc <push_on>
    800024a0:	00093783          	ld	a5,0(s2)
    800024a4:	0004b703          	ld	a4,0(s1)
    800024a8:	02078793          	addi	a5,a5,32
    800024ac:	00e79463          	bne	a5,a4,800024b4 <uartputc+0x6c>
    800024b0:	0000006f          	j	800024b0 <uartputc+0x68>
    800024b4:	00001097          	auipc	ra,0x1
    800024b8:	88c080e7          	jalr	-1908(ra) # 80002d40 <pop_on>
    800024bc:	00093783          	ld	a5,0(s2)
    800024c0:	0004b703          	ld	a4,0(s1)
    800024c4:	02078693          	addi	a3,a5,32
    800024c8:	fce688e3          	beq	a3,a4,80002498 <uartputc+0x50>
    800024cc:	01f77693          	andi	a3,a4,31
    800024d0:	00003597          	auipc	a1,0x3
    800024d4:	03058593          	addi	a1,a1,48 # 80005500 <uart_tx_buf>
    800024d8:	00d586b3          	add	a3,a1,a3
    800024dc:	00170713          	addi	a4,a4,1
    800024e0:	01368023          	sb	s3,0(a3)
    800024e4:	00e4b023          	sd	a4,0(s1)
    800024e8:	10000637          	lui	a2,0x10000
    800024ec:	02f71063          	bne	a4,a5,8000250c <uartputc+0xc4>
    800024f0:	0340006f          	j	80002524 <uartputc+0xdc>
    800024f4:	00074703          	lbu	a4,0(a4)
    800024f8:	00f93023          	sd	a5,0(s2)
    800024fc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80002500:	00093783          	ld	a5,0(s2)
    80002504:	0004b703          	ld	a4,0(s1)
    80002508:	00f70e63          	beq	a4,a5,80002524 <uartputc+0xdc>
    8000250c:	00564683          	lbu	a3,5(a2)
    80002510:	01f7f713          	andi	a4,a5,31
    80002514:	00e58733          	add	a4,a1,a4
    80002518:	0206f693          	andi	a3,a3,32
    8000251c:	00178793          	addi	a5,a5,1
    80002520:	fc069ae3          	bnez	a3,800024f4 <uartputc+0xac>
    80002524:	02813083          	ld	ra,40(sp)
    80002528:	02013403          	ld	s0,32(sp)
    8000252c:	01813483          	ld	s1,24(sp)
    80002530:	01013903          	ld	s2,16(sp)
    80002534:	00813983          	ld	s3,8(sp)
    80002538:	03010113          	addi	sp,sp,48
    8000253c:	00008067          	ret

0000000080002540 <uartputc_sync>:
    80002540:	ff010113          	addi	sp,sp,-16
    80002544:	00813423          	sd	s0,8(sp)
    80002548:	01010413          	addi	s0,sp,16
    8000254c:	00002717          	auipc	a4,0x2
    80002550:	d5c72703          	lw	a4,-676(a4) # 800042a8 <panicked>
    80002554:	02071663          	bnez	a4,80002580 <uartputc_sync+0x40>
    80002558:	00050793          	mv	a5,a0
    8000255c:	100006b7          	lui	a3,0x10000
    80002560:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80002564:	02077713          	andi	a4,a4,32
    80002568:	fe070ce3          	beqz	a4,80002560 <uartputc_sync+0x20>
    8000256c:	0ff7f793          	andi	a5,a5,255
    80002570:	00f68023          	sb	a5,0(a3)
    80002574:	00813403          	ld	s0,8(sp)
    80002578:	01010113          	addi	sp,sp,16
    8000257c:	00008067          	ret
    80002580:	0000006f          	j	80002580 <uartputc_sync+0x40>

0000000080002584 <uartstart>:
    80002584:	ff010113          	addi	sp,sp,-16
    80002588:	00813423          	sd	s0,8(sp)
    8000258c:	01010413          	addi	s0,sp,16
    80002590:	00002617          	auipc	a2,0x2
    80002594:	d2060613          	addi	a2,a2,-736 # 800042b0 <uart_tx_r>
    80002598:	00002517          	auipc	a0,0x2
    8000259c:	d2050513          	addi	a0,a0,-736 # 800042b8 <uart_tx_w>
    800025a0:	00063783          	ld	a5,0(a2)
    800025a4:	00053703          	ld	a4,0(a0)
    800025a8:	04f70263          	beq	a4,a5,800025ec <uartstart+0x68>
    800025ac:	100005b7          	lui	a1,0x10000
    800025b0:	00003817          	auipc	a6,0x3
    800025b4:	f5080813          	addi	a6,a6,-176 # 80005500 <uart_tx_buf>
    800025b8:	01c0006f          	j	800025d4 <uartstart+0x50>
    800025bc:	0006c703          	lbu	a4,0(a3)
    800025c0:	00f63023          	sd	a5,0(a2)
    800025c4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800025c8:	00063783          	ld	a5,0(a2)
    800025cc:	00053703          	ld	a4,0(a0)
    800025d0:	00f70e63          	beq	a4,a5,800025ec <uartstart+0x68>
    800025d4:	01f7f713          	andi	a4,a5,31
    800025d8:	00e806b3          	add	a3,a6,a4
    800025dc:	0055c703          	lbu	a4,5(a1)
    800025e0:	00178793          	addi	a5,a5,1
    800025e4:	02077713          	andi	a4,a4,32
    800025e8:	fc071ae3          	bnez	a4,800025bc <uartstart+0x38>
    800025ec:	00813403          	ld	s0,8(sp)
    800025f0:	01010113          	addi	sp,sp,16
    800025f4:	00008067          	ret

00000000800025f8 <uartgetc>:
    800025f8:	ff010113          	addi	sp,sp,-16
    800025fc:	00813423          	sd	s0,8(sp)
    80002600:	01010413          	addi	s0,sp,16
    80002604:	10000737          	lui	a4,0x10000
    80002608:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000260c:	0017f793          	andi	a5,a5,1
    80002610:	00078c63          	beqz	a5,80002628 <uartgetc+0x30>
    80002614:	00074503          	lbu	a0,0(a4)
    80002618:	0ff57513          	andi	a0,a0,255
    8000261c:	00813403          	ld	s0,8(sp)
    80002620:	01010113          	addi	sp,sp,16
    80002624:	00008067          	ret
    80002628:	fff00513          	li	a0,-1
    8000262c:	ff1ff06f          	j	8000261c <uartgetc+0x24>

0000000080002630 <uartintr>:
    80002630:	100007b7          	lui	a5,0x10000
    80002634:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80002638:	0017f793          	andi	a5,a5,1
    8000263c:	0a078463          	beqz	a5,800026e4 <uartintr+0xb4>
    80002640:	fe010113          	addi	sp,sp,-32
    80002644:	00813823          	sd	s0,16(sp)
    80002648:	00913423          	sd	s1,8(sp)
    8000264c:	00113c23          	sd	ra,24(sp)
    80002650:	02010413          	addi	s0,sp,32
    80002654:	100004b7          	lui	s1,0x10000
    80002658:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000265c:	0ff57513          	andi	a0,a0,255
    80002660:	fffff097          	auipc	ra,0xfffff
    80002664:	534080e7          	jalr	1332(ra) # 80001b94 <consoleintr>
    80002668:	0054c783          	lbu	a5,5(s1)
    8000266c:	0017f793          	andi	a5,a5,1
    80002670:	fe0794e3          	bnez	a5,80002658 <uartintr+0x28>
    80002674:	00002617          	auipc	a2,0x2
    80002678:	c3c60613          	addi	a2,a2,-964 # 800042b0 <uart_tx_r>
    8000267c:	00002517          	auipc	a0,0x2
    80002680:	c3c50513          	addi	a0,a0,-964 # 800042b8 <uart_tx_w>
    80002684:	00063783          	ld	a5,0(a2)
    80002688:	00053703          	ld	a4,0(a0)
    8000268c:	04f70263          	beq	a4,a5,800026d0 <uartintr+0xa0>
    80002690:	100005b7          	lui	a1,0x10000
    80002694:	00003817          	auipc	a6,0x3
    80002698:	e6c80813          	addi	a6,a6,-404 # 80005500 <uart_tx_buf>
    8000269c:	01c0006f          	j	800026b8 <uartintr+0x88>
    800026a0:	0006c703          	lbu	a4,0(a3)
    800026a4:	00f63023          	sd	a5,0(a2)
    800026a8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800026ac:	00063783          	ld	a5,0(a2)
    800026b0:	00053703          	ld	a4,0(a0)
    800026b4:	00f70e63          	beq	a4,a5,800026d0 <uartintr+0xa0>
    800026b8:	01f7f713          	andi	a4,a5,31
    800026bc:	00e806b3          	add	a3,a6,a4
    800026c0:	0055c703          	lbu	a4,5(a1)
    800026c4:	00178793          	addi	a5,a5,1
    800026c8:	02077713          	andi	a4,a4,32
    800026cc:	fc071ae3          	bnez	a4,800026a0 <uartintr+0x70>
    800026d0:	01813083          	ld	ra,24(sp)
    800026d4:	01013403          	ld	s0,16(sp)
    800026d8:	00813483          	ld	s1,8(sp)
    800026dc:	02010113          	addi	sp,sp,32
    800026e0:	00008067          	ret
    800026e4:	00002617          	auipc	a2,0x2
    800026e8:	bcc60613          	addi	a2,a2,-1076 # 800042b0 <uart_tx_r>
    800026ec:	00002517          	auipc	a0,0x2
    800026f0:	bcc50513          	addi	a0,a0,-1076 # 800042b8 <uart_tx_w>
    800026f4:	00063783          	ld	a5,0(a2)
    800026f8:	00053703          	ld	a4,0(a0)
    800026fc:	04f70263          	beq	a4,a5,80002740 <uartintr+0x110>
    80002700:	100005b7          	lui	a1,0x10000
    80002704:	00003817          	auipc	a6,0x3
    80002708:	dfc80813          	addi	a6,a6,-516 # 80005500 <uart_tx_buf>
    8000270c:	01c0006f          	j	80002728 <uartintr+0xf8>
    80002710:	0006c703          	lbu	a4,0(a3)
    80002714:	00f63023          	sd	a5,0(a2)
    80002718:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000271c:	00063783          	ld	a5,0(a2)
    80002720:	00053703          	ld	a4,0(a0)
    80002724:	02f70063          	beq	a4,a5,80002744 <uartintr+0x114>
    80002728:	01f7f713          	andi	a4,a5,31
    8000272c:	00e806b3          	add	a3,a6,a4
    80002730:	0055c703          	lbu	a4,5(a1)
    80002734:	00178793          	addi	a5,a5,1
    80002738:	02077713          	andi	a4,a4,32
    8000273c:	fc071ae3          	bnez	a4,80002710 <uartintr+0xe0>
    80002740:	00008067          	ret
    80002744:	00008067          	ret

0000000080002748 <kinit>:
    80002748:	fc010113          	addi	sp,sp,-64
    8000274c:	02913423          	sd	s1,40(sp)
    80002750:	fffff7b7          	lui	a5,0xfffff
    80002754:	00004497          	auipc	s1,0x4
    80002758:	dcb48493          	addi	s1,s1,-565 # 8000651f <end+0xfff>
    8000275c:	02813823          	sd	s0,48(sp)
    80002760:	01313c23          	sd	s3,24(sp)
    80002764:	00f4f4b3          	and	s1,s1,a5
    80002768:	02113c23          	sd	ra,56(sp)
    8000276c:	03213023          	sd	s2,32(sp)
    80002770:	01413823          	sd	s4,16(sp)
    80002774:	01513423          	sd	s5,8(sp)
    80002778:	04010413          	addi	s0,sp,64
    8000277c:	000017b7          	lui	a5,0x1
    80002780:	01100993          	li	s3,17
    80002784:	00f487b3          	add	a5,s1,a5
    80002788:	01b99993          	slli	s3,s3,0x1b
    8000278c:	06f9e063          	bltu	s3,a5,800027ec <kinit+0xa4>
    80002790:	00003a97          	auipc	s5,0x3
    80002794:	d90a8a93          	addi	s5,s5,-624 # 80005520 <end>
    80002798:	0754ec63          	bltu	s1,s5,80002810 <kinit+0xc8>
    8000279c:	0734fa63          	bgeu	s1,s3,80002810 <kinit+0xc8>
    800027a0:	00088a37          	lui	s4,0x88
    800027a4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800027a8:	00002917          	auipc	s2,0x2
    800027ac:	b1890913          	addi	s2,s2,-1256 # 800042c0 <kmem>
    800027b0:	00ca1a13          	slli	s4,s4,0xc
    800027b4:	0140006f          	j	800027c8 <kinit+0x80>
    800027b8:	000017b7          	lui	a5,0x1
    800027bc:	00f484b3          	add	s1,s1,a5
    800027c0:	0554e863          	bltu	s1,s5,80002810 <kinit+0xc8>
    800027c4:	0534f663          	bgeu	s1,s3,80002810 <kinit+0xc8>
    800027c8:	00001637          	lui	a2,0x1
    800027cc:	00100593          	li	a1,1
    800027d0:	00048513          	mv	a0,s1
    800027d4:	00000097          	auipc	ra,0x0
    800027d8:	5e4080e7          	jalr	1508(ra) # 80002db8 <__memset>
    800027dc:	00093783          	ld	a5,0(s2)
    800027e0:	00f4b023          	sd	a5,0(s1)
    800027e4:	00993023          	sd	s1,0(s2)
    800027e8:	fd4498e3          	bne	s1,s4,800027b8 <kinit+0x70>
    800027ec:	03813083          	ld	ra,56(sp)
    800027f0:	03013403          	ld	s0,48(sp)
    800027f4:	02813483          	ld	s1,40(sp)
    800027f8:	02013903          	ld	s2,32(sp)
    800027fc:	01813983          	ld	s3,24(sp)
    80002800:	01013a03          	ld	s4,16(sp)
    80002804:	00813a83          	ld	s5,8(sp)
    80002808:	04010113          	addi	sp,sp,64
    8000280c:	00008067          	ret
    80002810:	00002517          	auipc	a0,0x2
    80002814:	96050513          	addi	a0,a0,-1696 # 80004170 <digits+0x18>
    80002818:	fffff097          	auipc	ra,0xfffff
    8000281c:	4b4080e7          	jalr	1204(ra) # 80001ccc <panic>

0000000080002820 <freerange>:
    80002820:	fc010113          	addi	sp,sp,-64
    80002824:	000017b7          	lui	a5,0x1
    80002828:	02913423          	sd	s1,40(sp)
    8000282c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80002830:	009504b3          	add	s1,a0,s1
    80002834:	fffff537          	lui	a0,0xfffff
    80002838:	02813823          	sd	s0,48(sp)
    8000283c:	02113c23          	sd	ra,56(sp)
    80002840:	03213023          	sd	s2,32(sp)
    80002844:	01313c23          	sd	s3,24(sp)
    80002848:	01413823          	sd	s4,16(sp)
    8000284c:	01513423          	sd	s5,8(sp)
    80002850:	01613023          	sd	s6,0(sp)
    80002854:	04010413          	addi	s0,sp,64
    80002858:	00a4f4b3          	and	s1,s1,a0
    8000285c:	00f487b3          	add	a5,s1,a5
    80002860:	06f5e463          	bltu	a1,a5,800028c8 <freerange+0xa8>
    80002864:	00003a97          	auipc	s5,0x3
    80002868:	cbca8a93          	addi	s5,s5,-836 # 80005520 <end>
    8000286c:	0954e263          	bltu	s1,s5,800028f0 <freerange+0xd0>
    80002870:	01100993          	li	s3,17
    80002874:	01b99993          	slli	s3,s3,0x1b
    80002878:	0734fc63          	bgeu	s1,s3,800028f0 <freerange+0xd0>
    8000287c:	00058a13          	mv	s4,a1
    80002880:	00002917          	auipc	s2,0x2
    80002884:	a4090913          	addi	s2,s2,-1472 # 800042c0 <kmem>
    80002888:	00002b37          	lui	s6,0x2
    8000288c:	0140006f          	j	800028a0 <freerange+0x80>
    80002890:	000017b7          	lui	a5,0x1
    80002894:	00f484b3          	add	s1,s1,a5
    80002898:	0554ec63          	bltu	s1,s5,800028f0 <freerange+0xd0>
    8000289c:	0534fa63          	bgeu	s1,s3,800028f0 <freerange+0xd0>
    800028a0:	00001637          	lui	a2,0x1
    800028a4:	00100593          	li	a1,1
    800028a8:	00048513          	mv	a0,s1
    800028ac:	00000097          	auipc	ra,0x0
    800028b0:	50c080e7          	jalr	1292(ra) # 80002db8 <__memset>
    800028b4:	00093703          	ld	a4,0(s2)
    800028b8:	016487b3          	add	a5,s1,s6
    800028bc:	00e4b023          	sd	a4,0(s1)
    800028c0:	00993023          	sd	s1,0(s2)
    800028c4:	fcfa76e3          	bgeu	s4,a5,80002890 <freerange+0x70>
    800028c8:	03813083          	ld	ra,56(sp)
    800028cc:	03013403          	ld	s0,48(sp)
    800028d0:	02813483          	ld	s1,40(sp)
    800028d4:	02013903          	ld	s2,32(sp)
    800028d8:	01813983          	ld	s3,24(sp)
    800028dc:	01013a03          	ld	s4,16(sp)
    800028e0:	00813a83          	ld	s5,8(sp)
    800028e4:	00013b03          	ld	s6,0(sp)
    800028e8:	04010113          	addi	sp,sp,64
    800028ec:	00008067          	ret
    800028f0:	00002517          	auipc	a0,0x2
    800028f4:	88050513          	addi	a0,a0,-1920 # 80004170 <digits+0x18>
    800028f8:	fffff097          	auipc	ra,0xfffff
    800028fc:	3d4080e7          	jalr	980(ra) # 80001ccc <panic>

0000000080002900 <kfree>:
    80002900:	fe010113          	addi	sp,sp,-32
    80002904:	00813823          	sd	s0,16(sp)
    80002908:	00113c23          	sd	ra,24(sp)
    8000290c:	00913423          	sd	s1,8(sp)
    80002910:	02010413          	addi	s0,sp,32
    80002914:	03451793          	slli	a5,a0,0x34
    80002918:	04079c63          	bnez	a5,80002970 <kfree+0x70>
    8000291c:	00003797          	auipc	a5,0x3
    80002920:	c0478793          	addi	a5,a5,-1020 # 80005520 <end>
    80002924:	00050493          	mv	s1,a0
    80002928:	04f56463          	bltu	a0,a5,80002970 <kfree+0x70>
    8000292c:	01100793          	li	a5,17
    80002930:	01b79793          	slli	a5,a5,0x1b
    80002934:	02f57e63          	bgeu	a0,a5,80002970 <kfree+0x70>
    80002938:	00001637          	lui	a2,0x1
    8000293c:	00100593          	li	a1,1
    80002940:	00000097          	auipc	ra,0x0
    80002944:	478080e7          	jalr	1144(ra) # 80002db8 <__memset>
    80002948:	00002797          	auipc	a5,0x2
    8000294c:	97878793          	addi	a5,a5,-1672 # 800042c0 <kmem>
    80002950:	0007b703          	ld	a4,0(a5)
    80002954:	01813083          	ld	ra,24(sp)
    80002958:	01013403          	ld	s0,16(sp)
    8000295c:	00e4b023          	sd	a4,0(s1)
    80002960:	0097b023          	sd	s1,0(a5)
    80002964:	00813483          	ld	s1,8(sp)
    80002968:	02010113          	addi	sp,sp,32
    8000296c:	00008067          	ret
    80002970:	00002517          	auipc	a0,0x2
    80002974:	80050513          	addi	a0,a0,-2048 # 80004170 <digits+0x18>
    80002978:	fffff097          	auipc	ra,0xfffff
    8000297c:	354080e7          	jalr	852(ra) # 80001ccc <panic>

0000000080002980 <kalloc>:
    80002980:	fe010113          	addi	sp,sp,-32
    80002984:	00813823          	sd	s0,16(sp)
    80002988:	00913423          	sd	s1,8(sp)
    8000298c:	00113c23          	sd	ra,24(sp)
    80002990:	02010413          	addi	s0,sp,32
    80002994:	00002797          	auipc	a5,0x2
    80002998:	92c78793          	addi	a5,a5,-1748 # 800042c0 <kmem>
    8000299c:	0007b483          	ld	s1,0(a5)
    800029a0:	02048063          	beqz	s1,800029c0 <kalloc+0x40>
    800029a4:	0004b703          	ld	a4,0(s1)
    800029a8:	00001637          	lui	a2,0x1
    800029ac:	00500593          	li	a1,5
    800029b0:	00048513          	mv	a0,s1
    800029b4:	00e7b023          	sd	a4,0(a5)
    800029b8:	00000097          	auipc	ra,0x0
    800029bc:	400080e7          	jalr	1024(ra) # 80002db8 <__memset>
    800029c0:	01813083          	ld	ra,24(sp)
    800029c4:	01013403          	ld	s0,16(sp)
    800029c8:	00048513          	mv	a0,s1
    800029cc:	00813483          	ld	s1,8(sp)
    800029d0:	02010113          	addi	sp,sp,32
    800029d4:	00008067          	ret

00000000800029d8 <initlock>:
    800029d8:	ff010113          	addi	sp,sp,-16
    800029dc:	00813423          	sd	s0,8(sp)
    800029e0:	01010413          	addi	s0,sp,16
    800029e4:	00813403          	ld	s0,8(sp)
    800029e8:	00b53423          	sd	a1,8(a0)
    800029ec:	00052023          	sw	zero,0(a0)
    800029f0:	00053823          	sd	zero,16(a0)
    800029f4:	01010113          	addi	sp,sp,16
    800029f8:	00008067          	ret

00000000800029fc <acquire>:
    800029fc:	fe010113          	addi	sp,sp,-32
    80002a00:	00813823          	sd	s0,16(sp)
    80002a04:	00913423          	sd	s1,8(sp)
    80002a08:	00113c23          	sd	ra,24(sp)
    80002a0c:	01213023          	sd	s2,0(sp)
    80002a10:	02010413          	addi	s0,sp,32
    80002a14:	00050493          	mv	s1,a0
    80002a18:	10002973          	csrr	s2,sstatus
    80002a1c:	100027f3          	csrr	a5,sstatus
    80002a20:	ffd7f793          	andi	a5,a5,-3
    80002a24:	10079073          	csrw	sstatus,a5
    80002a28:	fffff097          	auipc	ra,0xfffff
    80002a2c:	8e0080e7          	jalr	-1824(ra) # 80001308 <mycpu>
    80002a30:	07852783          	lw	a5,120(a0)
    80002a34:	06078e63          	beqz	a5,80002ab0 <acquire+0xb4>
    80002a38:	fffff097          	auipc	ra,0xfffff
    80002a3c:	8d0080e7          	jalr	-1840(ra) # 80001308 <mycpu>
    80002a40:	07852783          	lw	a5,120(a0)
    80002a44:	0004a703          	lw	a4,0(s1)
    80002a48:	0017879b          	addiw	a5,a5,1
    80002a4c:	06f52c23          	sw	a5,120(a0)
    80002a50:	04071063          	bnez	a4,80002a90 <acquire+0x94>
    80002a54:	00100713          	li	a4,1
    80002a58:	00070793          	mv	a5,a4
    80002a5c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80002a60:	0007879b          	sext.w	a5,a5
    80002a64:	fe079ae3          	bnez	a5,80002a58 <acquire+0x5c>
    80002a68:	0ff0000f          	fence
    80002a6c:	fffff097          	auipc	ra,0xfffff
    80002a70:	89c080e7          	jalr	-1892(ra) # 80001308 <mycpu>
    80002a74:	01813083          	ld	ra,24(sp)
    80002a78:	01013403          	ld	s0,16(sp)
    80002a7c:	00a4b823          	sd	a0,16(s1)
    80002a80:	00013903          	ld	s2,0(sp)
    80002a84:	00813483          	ld	s1,8(sp)
    80002a88:	02010113          	addi	sp,sp,32
    80002a8c:	00008067          	ret
    80002a90:	0104b903          	ld	s2,16(s1)
    80002a94:	fffff097          	auipc	ra,0xfffff
    80002a98:	874080e7          	jalr	-1932(ra) # 80001308 <mycpu>
    80002a9c:	faa91ce3          	bne	s2,a0,80002a54 <acquire+0x58>
    80002aa0:	00001517          	auipc	a0,0x1
    80002aa4:	6d850513          	addi	a0,a0,1752 # 80004178 <digits+0x20>
    80002aa8:	fffff097          	auipc	ra,0xfffff
    80002aac:	224080e7          	jalr	548(ra) # 80001ccc <panic>
    80002ab0:	00195913          	srli	s2,s2,0x1
    80002ab4:	fffff097          	auipc	ra,0xfffff
    80002ab8:	854080e7          	jalr	-1964(ra) # 80001308 <mycpu>
    80002abc:	00197913          	andi	s2,s2,1
    80002ac0:	07252e23          	sw	s2,124(a0)
    80002ac4:	f75ff06f          	j	80002a38 <acquire+0x3c>

0000000080002ac8 <release>:
    80002ac8:	fe010113          	addi	sp,sp,-32
    80002acc:	00813823          	sd	s0,16(sp)
    80002ad0:	00113c23          	sd	ra,24(sp)
    80002ad4:	00913423          	sd	s1,8(sp)
    80002ad8:	01213023          	sd	s2,0(sp)
    80002adc:	02010413          	addi	s0,sp,32
    80002ae0:	00052783          	lw	a5,0(a0)
    80002ae4:	00079a63          	bnez	a5,80002af8 <release+0x30>
    80002ae8:	00001517          	auipc	a0,0x1
    80002aec:	69850513          	addi	a0,a0,1688 # 80004180 <digits+0x28>
    80002af0:	fffff097          	auipc	ra,0xfffff
    80002af4:	1dc080e7          	jalr	476(ra) # 80001ccc <panic>
    80002af8:	01053903          	ld	s2,16(a0)
    80002afc:	00050493          	mv	s1,a0
    80002b00:	fffff097          	auipc	ra,0xfffff
    80002b04:	808080e7          	jalr	-2040(ra) # 80001308 <mycpu>
    80002b08:	fea910e3          	bne	s2,a0,80002ae8 <release+0x20>
    80002b0c:	0004b823          	sd	zero,16(s1)
    80002b10:	0ff0000f          	fence
    80002b14:	0f50000f          	fence	iorw,ow
    80002b18:	0804a02f          	amoswap.w	zero,zero,(s1)
    80002b1c:	ffffe097          	auipc	ra,0xffffe
    80002b20:	7ec080e7          	jalr	2028(ra) # 80001308 <mycpu>
    80002b24:	100027f3          	csrr	a5,sstatus
    80002b28:	0027f793          	andi	a5,a5,2
    80002b2c:	04079a63          	bnez	a5,80002b80 <release+0xb8>
    80002b30:	07852783          	lw	a5,120(a0)
    80002b34:	02f05e63          	blez	a5,80002b70 <release+0xa8>
    80002b38:	fff7871b          	addiw	a4,a5,-1
    80002b3c:	06e52c23          	sw	a4,120(a0)
    80002b40:	00071c63          	bnez	a4,80002b58 <release+0x90>
    80002b44:	07c52783          	lw	a5,124(a0)
    80002b48:	00078863          	beqz	a5,80002b58 <release+0x90>
    80002b4c:	100027f3          	csrr	a5,sstatus
    80002b50:	0027e793          	ori	a5,a5,2
    80002b54:	10079073          	csrw	sstatus,a5
    80002b58:	01813083          	ld	ra,24(sp)
    80002b5c:	01013403          	ld	s0,16(sp)
    80002b60:	00813483          	ld	s1,8(sp)
    80002b64:	00013903          	ld	s2,0(sp)
    80002b68:	02010113          	addi	sp,sp,32
    80002b6c:	00008067          	ret
    80002b70:	00001517          	auipc	a0,0x1
    80002b74:	63050513          	addi	a0,a0,1584 # 800041a0 <digits+0x48>
    80002b78:	fffff097          	auipc	ra,0xfffff
    80002b7c:	154080e7          	jalr	340(ra) # 80001ccc <panic>
    80002b80:	00001517          	auipc	a0,0x1
    80002b84:	60850513          	addi	a0,a0,1544 # 80004188 <digits+0x30>
    80002b88:	fffff097          	auipc	ra,0xfffff
    80002b8c:	144080e7          	jalr	324(ra) # 80001ccc <panic>

0000000080002b90 <holding>:
    80002b90:	00052783          	lw	a5,0(a0)
    80002b94:	00079663          	bnez	a5,80002ba0 <holding+0x10>
    80002b98:	00000513          	li	a0,0
    80002b9c:	00008067          	ret
    80002ba0:	fe010113          	addi	sp,sp,-32
    80002ba4:	00813823          	sd	s0,16(sp)
    80002ba8:	00913423          	sd	s1,8(sp)
    80002bac:	00113c23          	sd	ra,24(sp)
    80002bb0:	02010413          	addi	s0,sp,32
    80002bb4:	01053483          	ld	s1,16(a0)
    80002bb8:	ffffe097          	auipc	ra,0xffffe
    80002bbc:	750080e7          	jalr	1872(ra) # 80001308 <mycpu>
    80002bc0:	01813083          	ld	ra,24(sp)
    80002bc4:	01013403          	ld	s0,16(sp)
    80002bc8:	40a48533          	sub	a0,s1,a0
    80002bcc:	00153513          	seqz	a0,a0
    80002bd0:	00813483          	ld	s1,8(sp)
    80002bd4:	02010113          	addi	sp,sp,32
    80002bd8:	00008067          	ret

0000000080002bdc <push_off>:
    80002bdc:	fe010113          	addi	sp,sp,-32
    80002be0:	00813823          	sd	s0,16(sp)
    80002be4:	00113c23          	sd	ra,24(sp)
    80002be8:	00913423          	sd	s1,8(sp)
    80002bec:	02010413          	addi	s0,sp,32
    80002bf0:	100024f3          	csrr	s1,sstatus
    80002bf4:	100027f3          	csrr	a5,sstatus
    80002bf8:	ffd7f793          	andi	a5,a5,-3
    80002bfc:	10079073          	csrw	sstatus,a5
    80002c00:	ffffe097          	auipc	ra,0xffffe
    80002c04:	708080e7          	jalr	1800(ra) # 80001308 <mycpu>
    80002c08:	07852783          	lw	a5,120(a0)
    80002c0c:	02078663          	beqz	a5,80002c38 <push_off+0x5c>
    80002c10:	ffffe097          	auipc	ra,0xffffe
    80002c14:	6f8080e7          	jalr	1784(ra) # 80001308 <mycpu>
    80002c18:	07852783          	lw	a5,120(a0)
    80002c1c:	01813083          	ld	ra,24(sp)
    80002c20:	01013403          	ld	s0,16(sp)
    80002c24:	0017879b          	addiw	a5,a5,1
    80002c28:	06f52c23          	sw	a5,120(a0)
    80002c2c:	00813483          	ld	s1,8(sp)
    80002c30:	02010113          	addi	sp,sp,32
    80002c34:	00008067          	ret
    80002c38:	0014d493          	srli	s1,s1,0x1
    80002c3c:	ffffe097          	auipc	ra,0xffffe
    80002c40:	6cc080e7          	jalr	1740(ra) # 80001308 <mycpu>
    80002c44:	0014f493          	andi	s1,s1,1
    80002c48:	06952e23          	sw	s1,124(a0)
    80002c4c:	fc5ff06f          	j	80002c10 <push_off+0x34>

0000000080002c50 <pop_off>:
    80002c50:	ff010113          	addi	sp,sp,-16
    80002c54:	00813023          	sd	s0,0(sp)
    80002c58:	00113423          	sd	ra,8(sp)
    80002c5c:	01010413          	addi	s0,sp,16
    80002c60:	ffffe097          	auipc	ra,0xffffe
    80002c64:	6a8080e7          	jalr	1704(ra) # 80001308 <mycpu>
    80002c68:	100027f3          	csrr	a5,sstatus
    80002c6c:	0027f793          	andi	a5,a5,2
    80002c70:	04079663          	bnez	a5,80002cbc <pop_off+0x6c>
    80002c74:	07852783          	lw	a5,120(a0)
    80002c78:	02f05a63          	blez	a5,80002cac <pop_off+0x5c>
    80002c7c:	fff7871b          	addiw	a4,a5,-1
    80002c80:	06e52c23          	sw	a4,120(a0)
    80002c84:	00071c63          	bnez	a4,80002c9c <pop_off+0x4c>
    80002c88:	07c52783          	lw	a5,124(a0)
    80002c8c:	00078863          	beqz	a5,80002c9c <pop_off+0x4c>
    80002c90:	100027f3          	csrr	a5,sstatus
    80002c94:	0027e793          	ori	a5,a5,2
    80002c98:	10079073          	csrw	sstatus,a5
    80002c9c:	00813083          	ld	ra,8(sp)
    80002ca0:	00013403          	ld	s0,0(sp)
    80002ca4:	01010113          	addi	sp,sp,16
    80002ca8:	00008067          	ret
    80002cac:	00001517          	auipc	a0,0x1
    80002cb0:	4f450513          	addi	a0,a0,1268 # 800041a0 <digits+0x48>
    80002cb4:	fffff097          	auipc	ra,0xfffff
    80002cb8:	018080e7          	jalr	24(ra) # 80001ccc <panic>
    80002cbc:	00001517          	auipc	a0,0x1
    80002cc0:	4cc50513          	addi	a0,a0,1228 # 80004188 <digits+0x30>
    80002cc4:	fffff097          	auipc	ra,0xfffff
    80002cc8:	008080e7          	jalr	8(ra) # 80001ccc <panic>

0000000080002ccc <push_on>:
    80002ccc:	fe010113          	addi	sp,sp,-32
    80002cd0:	00813823          	sd	s0,16(sp)
    80002cd4:	00113c23          	sd	ra,24(sp)
    80002cd8:	00913423          	sd	s1,8(sp)
    80002cdc:	02010413          	addi	s0,sp,32
    80002ce0:	100024f3          	csrr	s1,sstatus
    80002ce4:	100027f3          	csrr	a5,sstatus
    80002ce8:	0027e793          	ori	a5,a5,2
    80002cec:	10079073          	csrw	sstatus,a5
    80002cf0:	ffffe097          	auipc	ra,0xffffe
    80002cf4:	618080e7          	jalr	1560(ra) # 80001308 <mycpu>
    80002cf8:	07852783          	lw	a5,120(a0)
    80002cfc:	02078663          	beqz	a5,80002d28 <push_on+0x5c>
    80002d00:	ffffe097          	auipc	ra,0xffffe
    80002d04:	608080e7          	jalr	1544(ra) # 80001308 <mycpu>
    80002d08:	07852783          	lw	a5,120(a0)
    80002d0c:	01813083          	ld	ra,24(sp)
    80002d10:	01013403          	ld	s0,16(sp)
    80002d14:	0017879b          	addiw	a5,a5,1
    80002d18:	06f52c23          	sw	a5,120(a0)
    80002d1c:	00813483          	ld	s1,8(sp)
    80002d20:	02010113          	addi	sp,sp,32
    80002d24:	00008067          	ret
    80002d28:	0014d493          	srli	s1,s1,0x1
    80002d2c:	ffffe097          	auipc	ra,0xffffe
    80002d30:	5dc080e7          	jalr	1500(ra) # 80001308 <mycpu>
    80002d34:	0014f493          	andi	s1,s1,1
    80002d38:	06952e23          	sw	s1,124(a0)
    80002d3c:	fc5ff06f          	j	80002d00 <push_on+0x34>

0000000080002d40 <pop_on>:
    80002d40:	ff010113          	addi	sp,sp,-16
    80002d44:	00813023          	sd	s0,0(sp)
    80002d48:	00113423          	sd	ra,8(sp)
    80002d4c:	01010413          	addi	s0,sp,16
    80002d50:	ffffe097          	auipc	ra,0xffffe
    80002d54:	5b8080e7          	jalr	1464(ra) # 80001308 <mycpu>
    80002d58:	100027f3          	csrr	a5,sstatus
    80002d5c:	0027f793          	andi	a5,a5,2
    80002d60:	04078463          	beqz	a5,80002da8 <pop_on+0x68>
    80002d64:	07852783          	lw	a5,120(a0)
    80002d68:	02f05863          	blez	a5,80002d98 <pop_on+0x58>
    80002d6c:	fff7879b          	addiw	a5,a5,-1
    80002d70:	06f52c23          	sw	a5,120(a0)
    80002d74:	07853783          	ld	a5,120(a0)
    80002d78:	00079863          	bnez	a5,80002d88 <pop_on+0x48>
    80002d7c:	100027f3          	csrr	a5,sstatus
    80002d80:	ffd7f793          	andi	a5,a5,-3
    80002d84:	10079073          	csrw	sstatus,a5
    80002d88:	00813083          	ld	ra,8(sp)
    80002d8c:	00013403          	ld	s0,0(sp)
    80002d90:	01010113          	addi	sp,sp,16
    80002d94:	00008067          	ret
    80002d98:	00001517          	auipc	a0,0x1
    80002d9c:	43050513          	addi	a0,a0,1072 # 800041c8 <digits+0x70>
    80002da0:	fffff097          	auipc	ra,0xfffff
    80002da4:	f2c080e7          	jalr	-212(ra) # 80001ccc <panic>
    80002da8:	00001517          	auipc	a0,0x1
    80002dac:	40050513          	addi	a0,a0,1024 # 800041a8 <digits+0x50>
    80002db0:	fffff097          	auipc	ra,0xfffff
    80002db4:	f1c080e7          	jalr	-228(ra) # 80001ccc <panic>

0000000080002db8 <__memset>:
    80002db8:	ff010113          	addi	sp,sp,-16
    80002dbc:	00813423          	sd	s0,8(sp)
    80002dc0:	01010413          	addi	s0,sp,16
    80002dc4:	1a060e63          	beqz	a2,80002f80 <__memset+0x1c8>
    80002dc8:	40a007b3          	neg	a5,a0
    80002dcc:	0077f793          	andi	a5,a5,7
    80002dd0:	00778693          	addi	a3,a5,7
    80002dd4:	00b00813          	li	a6,11
    80002dd8:	0ff5f593          	andi	a1,a1,255
    80002ddc:	fff6071b          	addiw	a4,a2,-1
    80002de0:	1b06e663          	bltu	a3,a6,80002f8c <__memset+0x1d4>
    80002de4:	1cd76463          	bltu	a4,a3,80002fac <__memset+0x1f4>
    80002de8:	1a078e63          	beqz	a5,80002fa4 <__memset+0x1ec>
    80002dec:	00b50023          	sb	a1,0(a0)
    80002df0:	00100713          	li	a4,1
    80002df4:	1ae78463          	beq	a5,a4,80002f9c <__memset+0x1e4>
    80002df8:	00b500a3          	sb	a1,1(a0)
    80002dfc:	00200713          	li	a4,2
    80002e00:	1ae78a63          	beq	a5,a4,80002fb4 <__memset+0x1fc>
    80002e04:	00b50123          	sb	a1,2(a0)
    80002e08:	00300713          	li	a4,3
    80002e0c:	18e78463          	beq	a5,a4,80002f94 <__memset+0x1dc>
    80002e10:	00b501a3          	sb	a1,3(a0)
    80002e14:	00400713          	li	a4,4
    80002e18:	1ae78263          	beq	a5,a4,80002fbc <__memset+0x204>
    80002e1c:	00b50223          	sb	a1,4(a0)
    80002e20:	00500713          	li	a4,5
    80002e24:	1ae78063          	beq	a5,a4,80002fc4 <__memset+0x20c>
    80002e28:	00b502a3          	sb	a1,5(a0)
    80002e2c:	00700713          	li	a4,7
    80002e30:	18e79e63          	bne	a5,a4,80002fcc <__memset+0x214>
    80002e34:	00b50323          	sb	a1,6(a0)
    80002e38:	00700e93          	li	t4,7
    80002e3c:	00859713          	slli	a4,a1,0x8
    80002e40:	00e5e733          	or	a4,a1,a4
    80002e44:	01059e13          	slli	t3,a1,0x10
    80002e48:	01c76e33          	or	t3,a4,t3
    80002e4c:	01859313          	slli	t1,a1,0x18
    80002e50:	006e6333          	or	t1,t3,t1
    80002e54:	02059893          	slli	a7,a1,0x20
    80002e58:	40f60e3b          	subw	t3,a2,a5
    80002e5c:	011368b3          	or	a7,t1,a7
    80002e60:	02859813          	slli	a6,a1,0x28
    80002e64:	0108e833          	or	a6,a7,a6
    80002e68:	03059693          	slli	a3,a1,0x30
    80002e6c:	003e589b          	srliw	a7,t3,0x3
    80002e70:	00d866b3          	or	a3,a6,a3
    80002e74:	03859713          	slli	a4,a1,0x38
    80002e78:	00389813          	slli	a6,a7,0x3
    80002e7c:	00f507b3          	add	a5,a0,a5
    80002e80:	00e6e733          	or	a4,a3,a4
    80002e84:	000e089b          	sext.w	a7,t3
    80002e88:	00f806b3          	add	a3,a6,a5
    80002e8c:	00e7b023          	sd	a4,0(a5)
    80002e90:	00878793          	addi	a5,a5,8
    80002e94:	fed79ce3          	bne	a5,a3,80002e8c <__memset+0xd4>
    80002e98:	ff8e7793          	andi	a5,t3,-8
    80002e9c:	0007871b          	sext.w	a4,a5
    80002ea0:	01d787bb          	addw	a5,a5,t4
    80002ea4:	0ce88e63          	beq	a7,a4,80002f80 <__memset+0x1c8>
    80002ea8:	00f50733          	add	a4,a0,a5
    80002eac:	00b70023          	sb	a1,0(a4)
    80002eb0:	0017871b          	addiw	a4,a5,1
    80002eb4:	0cc77663          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002eb8:	00e50733          	add	a4,a0,a4
    80002ebc:	00b70023          	sb	a1,0(a4)
    80002ec0:	0027871b          	addiw	a4,a5,2
    80002ec4:	0ac77e63          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002ec8:	00e50733          	add	a4,a0,a4
    80002ecc:	00b70023          	sb	a1,0(a4)
    80002ed0:	0037871b          	addiw	a4,a5,3
    80002ed4:	0ac77663          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002ed8:	00e50733          	add	a4,a0,a4
    80002edc:	00b70023          	sb	a1,0(a4)
    80002ee0:	0047871b          	addiw	a4,a5,4
    80002ee4:	08c77e63          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002ee8:	00e50733          	add	a4,a0,a4
    80002eec:	00b70023          	sb	a1,0(a4)
    80002ef0:	0057871b          	addiw	a4,a5,5
    80002ef4:	08c77663          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002ef8:	00e50733          	add	a4,a0,a4
    80002efc:	00b70023          	sb	a1,0(a4)
    80002f00:	0067871b          	addiw	a4,a5,6
    80002f04:	06c77e63          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002f08:	00e50733          	add	a4,a0,a4
    80002f0c:	00b70023          	sb	a1,0(a4)
    80002f10:	0077871b          	addiw	a4,a5,7
    80002f14:	06c77663          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002f18:	00e50733          	add	a4,a0,a4
    80002f1c:	00b70023          	sb	a1,0(a4)
    80002f20:	0087871b          	addiw	a4,a5,8
    80002f24:	04c77e63          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002f28:	00e50733          	add	a4,a0,a4
    80002f2c:	00b70023          	sb	a1,0(a4)
    80002f30:	0097871b          	addiw	a4,a5,9
    80002f34:	04c77663          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002f38:	00e50733          	add	a4,a0,a4
    80002f3c:	00b70023          	sb	a1,0(a4)
    80002f40:	00a7871b          	addiw	a4,a5,10
    80002f44:	02c77e63          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002f48:	00e50733          	add	a4,a0,a4
    80002f4c:	00b70023          	sb	a1,0(a4)
    80002f50:	00b7871b          	addiw	a4,a5,11
    80002f54:	02c77663          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002f58:	00e50733          	add	a4,a0,a4
    80002f5c:	00b70023          	sb	a1,0(a4)
    80002f60:	00c7871b          	addiw	a4,a5,12
    80002f64:	00c77e63          	bgeu	a4,a2,80002f80 <__memset+0x1c8>
    80002f68:	00e50733          	add	a4,a0,a4
    80002f6c:	00b70023          	sb	a1,0(a4)
    80002f70:	00d7879b          	addiw	a5,a5,13
    80002f74:	00c7f663          	bgeu	a5,a2,80002f80 <__memset+0x1c8>
    80002f78:	00f507b3          	add	a5,a0,a5
    80002f7c:	00b78023          	sb	a1,0(a5)
    80002f80:	00813403          	ld	s0,8(sp)
    80002f84:	01010113          	addi	sp,sp,16
    80002f88:	00008067          	ret
    80002f8c:	00b00693          	li	a3,11
    80002f90:	e55ff06f          	j	80002de4 <__memset+0x2c>
    80002f94:	00300e93          	li	t4,3
    80002f98:	ea5ff06f          	j	80002e3c <__memset+0x84>
    80002f9c:	00100e93          	li	t4,1
    80002fa0:	e9dff06f          	j	80002e3c <__memset+0x84>
    80002fa4:	00000e93          	li	t4,0
    80002fa8:	e95ff06f          	j	80002e3c <__memset+0x84>
    80002fac:	00000793          	li	a5,0
    80002fb0:	ef9ff06f          	j	80002ea8 <__memset+0xf0>
    80002fb4:	00200e93          	li	t4,2
    80002fb8:	e85ff06f          	j	80002e3c <__memset+0x84>
    80002fbc:	00400e93          	li	t4,4
    80002fc0:	e7dff06f          	j	80002e3c <__memset+0x84>
    80002fc4:	00500e93          	li	t4,5
    80002fc8:	e75ff06f          	j	80002e3c <__memset+0x84>
    80002fcc:	00600e93          	li	t4,6
    80002fd0:	e6dff06f          	j	80002e3c <__memset+0x84>

0000000080002fd4 <__memmove>:
    80002fd4:	ff010113          	addi	sp,sp,-16
    80002fd8:	00813423          	sd	s0,8(sp)
    80002fdc:	01010413          	addi	s0,sp,16
    80002fe0:	0e060863          	beqz	a2,800030d0 <__memmove+0xfc>
    80002fe4:	fff6069b          	addiw	a3,a2,-1
    80002fe8:	0006881b          	sext.w	a6,a3
    80002fec:	0ea5e863          	bltu	a1,a0,800030dc <__memmove+0x108>
    80002ff0:	00758713          	addi	a4,a1,7
    80002ff4:	00a5e7b3          	or	a5,a1,a0
    80002ff8:	40a70733          	sub	a4,a4,a0
    80002ffc:	0077f793          	andi	a5,a5,7
    80003000:	00f73713          	sltiu	a4,a4,15
    80003004:	00174713          	xori	a4,a4,1
    80003008:	0017b793          	seqz	a5,a5
    8000300c:	00e7f7b3          	and	a5,a5,a4
    80003010:	10078863          	beqz	a5,80003120 <__memmove+0x14c>
    80003014:	00900793          	li	a5,9
    80003018:	1107f463          	bgeu	a5,a6,80003120 <__memmove+0x14c>
    8000301c:	0036581b          	srliw	a6,a2,0x3
    80003020:	fff8081b          	addiw	a6,a6,-1
    80003024:	02081813          	slli	a6,a6,0x20
    80003028:	01d85893          	srli	a7,a6,0x1d
    8000302c:	00858813          	addi	a6,a1,8
    80003030:	00058793          	mv	a5,a1
    80003034:	00050713          	mv	a4,a0
    80003038:	01088833          	add	a6,a7,a6
    8000303c:	0007b883          	ld	a7,0(a5)
    80003040:	00878793          	addi	a5,a5,8
    80003044:	00870713          	addi	a4,a4,8
    80003048:	ff173c23          	sd	a7,-8(a4)
    8000304c:	ff0798e3          	bne	a5,a6,8000303c <__memmove+0x68>
    80003050:	ff867713          	andi	a4,a2,-8
    80003054:	02071793          	slli	a5,a4,0x20
    80003058:	0207d793          	srli	a5,a5,0x20
    8000305c:	00f585b3          	add	a1,a1,a5
    80003060:	40e686bb          	subw	a3,a3,a4
    80003064:	00f507b3          	add	a5,a0,a5
    80003068:	06e60463          	beq	a2,a4,800030d0 <__memmove+0xfc>
    8000306c:	0005c703          	lbu	a4,0(a1)
    80003070:	00e78023          	sb	a4,0(a5)
    80003074:	04068e63          	beqz	a3,800030d0 <__memmove+0xfc>
    80003078:	0015c603          	lbu	a2,1(a1)
    8000307c:	00100713          	li	a4,1
    80003080:	00c780a3          	sb	a2,1(a5)
    80003084:	04e68663          	beq	a3,a4,800030d0 <__memmove+0xfc>
    80003088:	0025c603          	lbu	a2,2(a1)
    8000308c:	00200713          	li	a4,2
    80003090:	00c78123          	sb	a2,2(a5)
    80003094:	02e68e63          	beq	a3,a4,800030d0 <__memmove+0xfc>
    80003098:	0035c603          	lbu	a2,3(a1)
    8000309c:	00300713          	li	a4,3
    800030a0:	00c781a3          	sb	a2,3(a5)
    800030a4:	02e68663          	beq	a3,a4,800030d0 <__memmove+0xfc>
    800030a8:	0045c603          	lbu	a2,4(a1)
    800030ac:	00400713          	li	a4,4
    800030b0:	00c78223          	sb	a2,4(a5)
    800030b4:	00e68e63          	beq	a3,a4,800030d0 <__memmove+0xfc>
    800030b8:	0055c603          	lbu	a2,5(a1)
    800030bc:	00500713          	li	a4,5
    800030c0:	00c782a3          	sb	a2,5(a5)
    800030c4:	00e68663          	beq	a3,a4,800030d0 <__memmove+0xfc>
    800030c8:	0065c703          	lbu	a4,6(a1)
    800030cc:	00e78323          	sb	a4,6(a5)
    800030d0:	00813403          	ld	s0,8(sp)
    800030d4:	01010113          	addi	sp,sp,16
    800030d8:	00008067          	ret
    800030dc:	02061713          	slli	a4,a2,0x20
    800030e0:	02075713          	srli	a4,a4,0x20
    800030e4:	00e587b3          	add	a5,a1,a4
    800030e8:	f0f574e3          	bgeu	a0,a5,80002ff0 <__memmove+0x1c>
    800030ec:	02069613          	slli	a2,a3,0x20
    800030f0:	02065613          	srli	a2,a2,0x20
    800030f4:	fff64613          	not	a2,a2
    800030f8:	00e50733          	add	a4,a0,a4
    800030fc:	00c78633          	add	a2,a5,a2
    80003100:	fff7c683          	lbu	a3,-1(a5)
    80003104:	fff78793          	addi	a5,a5,-1
    80003108:	fff70713          	addi	a4,a4,-1
    8000310c:	00d70023          	sb	a3,0(a4)
    80003110:	fec798e3          	bne	a5,a2,80003100 <__memmove+0x12c>
    80003114:	00813403          	ld	s0,8(sp)
    80003118:	01010113          	addi	sp,sp,16
    8000311c:	00008067          	ret
    80003120:	02069713          	slli	a4,a3,0x20
    80003124:	02075713          	srli	a4,a4,0x20
    80003128:	00170713          	addi	a4,a4,1
    8000312c:	00e50733          	add	a4,a0,a4
    80003130:	00050793          	mv	a5,a0
    80003134:	0005c683          	lbu	a3,0(a1)
    80003138:	00178793          	addi	a5,a5,1
    8000313c:	00158593          	addi	a1,a1,1
    80003140:	fed78fa3          	sb	a3,-1(a5)
    80003144:	fee798e3          	bne	a5,a4,80003134 <__memmove+0x160>
    80003148:	f89ff06f          	j	800030d0 <__memmove+0xfc>
	...
