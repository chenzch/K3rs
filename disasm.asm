
target/thumbv7em-none-eabihf/release/K3rs:	file format elf32-littlearm

Disassembly of section .text:

00400490 <Reset_Handler>:
  400490:      	cpsid i
  400492:      	movs	r0, #0x0
  400494:      	strd	r0, r0, [sp, #-16]
  400498:      	strd	r0, r0, [sp, #-8]
  40049c:      	ldr	r0, [pc, #0x28]         @ 0x4004c8 <Reset_Handler+0x38>
  40049e:      	ldr	r1, [pc, #0x2c]         @ 0x4004cc <Reset_Handler+0x3c>
  4004a0:      	ldr	r2, [pc, #0x2c]         @ 0x4004d0 <Reset_Handler+0x40>
  4004a2:      	sub.w	r2, r2, r1
  4004a6:      	cbz	r2, 0x4004b4 <Reset_Handler+0x24> @ imm = #0xa
  4004a8:      	ldrd	r3, r4, [r0], #8
  4004ac:      	strd	r3, r4, [r1], #8
  4004b0:      	subs	r2, #0x8
  4004b2:      	b	0x4004a6 <Reset_Handler+0x16> @ imm = #-0x10
  4004b4:      	ldr	r0, [pc, #0x1c]         @ 0x4004d4 <Reset_Handler+0x44>
  4004b6:      	ldr	r1, [pc, #0x20]         @ 0x4004d8 <Reset_Handler+0x48>
  4004b8:      	ldr	r2, [pc, #0x20]         @ 0x4004dc <Reset_Handler+0x4c>
  4004ba:      	sub.w	r2, r2, r1
  4004be:      	bl	0x0 <memcpy64>          @ imm = #-0x4004c2
  4004c2:      	b.w	0x4004e6 <main>         @ imm = #0x20
  4004c6:      	movs	r0, r0
  4004c8: f0 04 40 00  	.word	0x004004f0
  4004cc: 00 00 00 00  	.word	0x00000000
  4004d0: 20 00 00 00  	.word	0x00000020
  4004d4: 10 05 40 00  	.word	0x00400510
  4004d8: 20 00 00 00  	.word	0x00000020
  4004dc: 38 00 00 00  	.word	0x00000038

004004e0 <WKPU_IRQHandler>:
; pub extern "C" fn Default_Handler() -> ! {
  4004e0:      	push	{r7, lr}
  4004e2:      	mov	r7, sp
;     loop {}
  4004e4:      	b	0x4004e4 <WKPU_IRQHandler+0x4> @ imm = #-0x4

004004e6 <main>:
; pub extern "C" fn main() -> ! {
  4004e6:      	push	{r7, lr}
  4004e8:      	mov	r7, sp
;     loop {}
  4004ea:      	b	0x4004ea <main+0x4>     @ imm = #-0x4
  4004ec:      	bmi	0x400498 <Reset_Handler+0x8> @ imm = #-0x58
  4004ee:      	bmi	0x40049a <Reset_Handler+0xa> @ imm = #-0x58

Disassembly of section .itcm_text.memcpy64:

00000000 <memcpy64>:
; fn panic(_info: &PanicInfo) -> ! {
       0:      	push	{r4, r5, r7, lr}
       2:      	add	r7, sp, #0x8
;     loop {}
       4:      	lsrs	r2, r2, #0x3
       6:      	mov	r3, r1
;     while i < count {
       8:      	cbz	r2, 0x16 <memcpy64+0x16> @ imm = #0xa
/root/.local/share/swiftly/toolchains/6.2.4/usr/bin/llvm-objdump: warning: 'target/thumbv7em-none-eabihf/release/K3rs': failed to find source /rustc/ded5c06cf21d2b93bffd5d884aa6e96934ee4234/library/core/src/ptr/mod.rs
       a:      	ldrd	r4, r5, [r0], #8
;     while i < count {
       e:      	subs	r2, #0x1
      10:      	strd	r4, r5, [r3], #8
;     while i < count {
      14:      	b	0x8 <memcpy64+0x8>      @ imm = #-0x10
; }
      16:      	mov	r0, r1
      18:      	pop	{r4, r5, r7, pc}
;         if ptr as usize % 4 == 2 {
      1a:      	bmi	0xffffffc6 <__bss_start+0xffffffffdfffffc6> @ imm = #-0x58
      1c:      	bmi	0xffffffc8 <__bss_start+0xffffffffdfffffc8> @ imm = #-0x58
      1e:      	bmi	0xffffffca <__bss_start+0xffffffffdfffffca> @ imm = #-0x58

Disassembly of section .itcm_text:

00000020 <memset64>:
;             if len > 1 {
      20:      	push	{r4, r6, r7, lr}
      22:      	add	r7, sp, #0x8
      24:      	ldr	r1, [r7, #0x8]
;                 while !port.is_fifo_ready() {}
      26:      	mov	r4, r0
      28:      	lsrs	r1, r1, #0x3
      2a:      	cbz	r1, 0x34 <memset64+0x14> @ imm = #0x6
      2c:      	strd	r2, r3, [r4], #8
      30:      	subs	r1, #0x1
;         write_aligned_impl(port, slice::from_raw_parts(ptr, len));
      32:      	b	0x2a <memset64+0xa>     @ imm = #-0xc
      34:      	pop	{r4, r6, r7, pc}
      36:      	bmi	0xffffffe2 <__bss_start+0xffffffffdfffffe2> @ imm = #-0x58
