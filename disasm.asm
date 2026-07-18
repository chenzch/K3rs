
target/thumbv7em-none-eabihf/release/K3rs:	file format elf32-littlearm

Disassembly of section .text:

00400490 <Reset_Handler>:
; pub unsafe extern "C" fn Reset_Handler() -> ! {
  400490:      	push	{r5, r6, r7, lr}
  400492:      	add	r7, sp, #0x8
;     core::arch::asm!(
  400494:      	cpsid i
  400496:      	eor.w	r0, r0, r0
  40049a:      	mov	r1, sp
  40049c:      	ldr	r2, [pc, #0x3c]         @ 0x4004dc <Reset_Handler+0x4c>
  40049e:      	movs	r0, #0x0
/root/.local/share/swiftly/toolchains/6.2.4/usr/bin/llvm-objdump: warning: 'target/thumbv7em-none-eabihf/release/K3rs': failed to find source /rustc/ded5c06cf21d2b93bffd5d884aa6e96934ee4234/library/core/src/ptr/mod.rs
  4004a0:      	strd	r0, r0, [r1, #-16]
  4004a4:      	strd	r0, r0, [r1, #-8]
;     let m64_count = m64_len / 8;
  4004a8:      	ldr	r0, [pc, #0x28]         @ 0x4004d4 <Reset_Handler+0x44>
  4004aa:      	ldr	r1, [pc, #0x2c]         @ 0x4004d8 <Reset_Handler+0x48>
  4004ac:      	subs	r1, r1, r0
  4004ae:      	lsrs	r1, r1, #0x3
/root/.local/share/swiftly/toolchains/6.2.4/usr/bin/llvm-objdump: warning: 'target/thumbv7em-none-eabihf/release/K3rs': failed to find source /rustc/ded5c06cf21d2b93bffd5d884aa6e96934ee4234/library/core/src/iter/range.rs
  4004b0:      	cbz	r1, 0x4004be <Reset_Handler+0x2e> @ imm = #0xa
  4004b2:      	ldrd	r3, r4, [r2], #8
;     for i in 0..m64_count {
  4004b6:      	subs	r1, #0x1
  4004b8:      	strd	r3, r4, [r0], #8
;     for i in 0..m64_count {
  4004bc:      	b	0x4004b0 <Reset_Handler+0x20> @ imm = #-0x10
/root/.local/share/swiftly/toolchains/6.2.4/usr/bin/llvm-objdump: warning: 'target/thumbv7em-none-eabihf/release/K3rs': failed to find source /rustc/ded5c06cf21d2b93bffd5d884aa6e96934ee4234/library/core/src/hint.rs
  4004be:      	ldr	r0, [pc, #0x20]         @ 0x4004e0 <Reset_Handler+0x50>
  4004c0:      	str	r0, [sp, #0x4]
  4004c2:      	add	r0, sp, #0x4
;     do_copy(text_src, text_dst, text_len);
  4004c4:      	ldr	r1, [pc, #0x1c]         @ 0x4004e4 <Reset_Handler+0x54>
  4004c6:      	ldr	r0, [pc, #0x20]         @ 0x4004e8 <Reset_Handler+0x58>
  4004c8:      	ldr	r3, [sp, #0x4]
;     do_copy(text_src, text_dst, text_len);
  4004ca:      	subs	r2, r0, r1
  4004cc:      	ldr	r0, [pc, #0x1c]         @ 0x4004ec <Reset_Handler+0x5c>
  4004ce:      	blx	r3
;     main();
  4004d0:      	bl	0x4004f6 <_ZN4K3rs4main17ha93230f50fb32d98E> @ imm = #0x22
  4004d4: 00 00 00 00  	.word	0x00000000
  4004d8: 20 00 00 00  	.word	0x00000020
  4004dc: 00 05 40 00  	.word	0x00400500
  4004e0: 01 00 00 00  	.word	0x00000001
  4004e4: 20 00 00 00  	.word	0x00000020
  4004e8: 38 00 00 00  	.word	0x00000038
  4004ec: 20 05 40 00  	.word	0x00400520

004004f0 <WKPU_IRQHandler>:
; pub extern "C" fn Default_Handler() -> ! {
  4004f0:      	push	{r7, lr}
  4004f2:      	mov	r7, sp
;     loop {}
  4004f4:      	b	0x4004f4 <WKPU_IRQHandler+0x4> @ imm = #-0x4

004004f6 <_ZN4K3rs4main17ha93230f50fb32d98E>:
; fn main() -> ! {
  4004f6:      	push	{r7, lr}
  4004f8:      	mov	r7, sp
;     loop {}
  4004fa:      	b	0x4004fa <_ZN4K3rs4main17ha93230f50fb32d98E+0x4> @ imm = #-0x4
  4004fc:      	bmi	0x4004a8 <Reset_Handler+0x18> @ imm = #-0x58
  4004fe:      	bmi	0x4004aa <Reset_Handler+0x1a> @ imm = #-0x58

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
