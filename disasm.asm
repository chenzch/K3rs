
target/thumbv7em-none-eabihf/release/K3rs:	file format elf32-littlearm

Disassembly of section .text:

00400490 <Reset_Handler>:
  400490:      	cpsid i
  400492:      	eor.w	r0, r0, r0
  400496:      	strd	r0, r0, [sp, #-16]
  40049a:      	strd	r0, r0, [sp, #-8]
  40049e:      	b.w	0x4004a8 <_ZN4K3rs4main17ha93230f50fb32d98E> @ imm = #0x6

004004a2 <WKPU_IRQHandler>:
; pub fn Default_Handler() -> ! {
  4004a2:      	push	{r7, lr}
  4004a4:      	mov	r7, sp
;     loop {}
  4004a6:      	b	0x4004a6 <WKPU_IRQHandler+0x4> @ imm = #-0x4

004004a8 <_ZN4K3rs4main17ha93230f50fb32d98E>:
; fn main() -> ! {
  4004a8:      	push	{r5, r6, r7, lr}
  4004aa:      	add	r7, sp, #0x8
;         let m64_count = m64_len / 8;
  4004ac:      	ldr	r0, [pc, #0x28]         @ 0x4004d8 <_ZN4K3rs4main17ha93230f50fb32d98E+0x30>
  4004ae:      	ldr	r1, [pc, #0x2c]         @ 0x4004dc <_ZN4K3rs4main17ha93230f50fb32d98E+0x34>
  4004b0:      	ldr	r2, [pc, #0x2c]         @ 0x4004e0 <_ZN4K3rs4main17ha93230f50fb32d98E+0x38>
  4004b2:      	subs	r1, r1, r0
  4004b4:      	lsrs	r1, r1, #0x3
/root/.local/share/swiftly/toolchains/6.2.4/usr/bin/llvm-objdump: warning: 'target/thumbv7em-none-eabihf/release/K3rs': failed to find source /rustc/ded5c06cf21d2b93bffd5d884aa6e96934ee4234/library/core/src/iter/range.rs
  4004b6:      	cbz	r1, 0x4004c4 <_ZN4K3rs4main17ha93230f50fb32d98E+0x1c> @ imm = #0xa
/root/.local/share/swiftly/toolchains/6.2.4/usr/bin/llvm-objdump: warning: 'target/thumbv7em-none-eabihf/release/K3rs': failed to find source /rustc/ded5c06cf21d2b93bffd5d884aa6e96934ee4234/library/core/src/ptr/mod.rs
  4004b8:      	ldrd	r3, r4, [r2], #8
;         for i in 0..m64_count {
  4004bc:      	subs	r1, #0x1
  4004be:      	strd	r3, r4, [r0], #8
;         for i in 0..m64_count {
  4004c2:      	b	0x4004b6 <_ZN4K3rs4main17ha93230f50fb32d98E+0xe> @ imm = #-0x10
/root/.local/share/swiftly/toolchains/6.2.4/usr/bin/llvm-objdump: warning: 'target/thumbv7em-none-eabihf/release/K3rs': failed to find source /rustc/ded5c06cf21d2b93bffd5d884aa6e96934ee4234/library/core/src/hint.rs
  4004c4:      	ldr	r0, [pc, #0x1c]         @ 0x4004e4 <_ZN4K3rs4main17ha93230f50fb32d98E+0x3c>
  4004c6:      	str	r0, [sp, #0x4]
  4004c8:      	add	r0, sp, #0x4
;         do_copy(text_src, text_dst, text_len);
  4004ca:      	ldr	r1, [pc, #0x1c]         @ 0x4004e8 <_ZN4K3rs4main17ha93230f50fb32d98E+0x40>
  4004cc:      	ldr	r0, [pc, #0x1c]         @ 0x4004ec <_ZN4K3rs4main17ha93230f50fb32d98E+0x44>
  4004ce:      	ldr	r3, [sp, #0x4]
;         do_copy(text_src, text_dst, text_len);
  4004d0:      	subs	r2, r0, r1
  4004d2:      	ldr	r0, [pc, #0x1c]         @ 0x4004f0 <_ZN4K3rs4main17ha93230f50fb32d98E+0x48>
  4004d4:      	blx	r3
;     loop {}
  4004d6:      	b	0x4004d6 <_ZN4K3rs4main17ha93230f50fb32d98E+0x2e> @ imm = #-0x4
  4004d8: 00 00 00 00  	.word	0x00000000
  4004dc: 20 00 00 00  	.word	0x00000020
  4004e0: f8 04 40 00  	.word	0x004004f8
  4004e4: 01 00 00 00  	.word	0x00000001
  4004e8: 20 00 00 00  	.word	0x00000020
  4004ec: 38 00 00 00  	.word	0x00000038
  4004f0: 18 05 40 00  	.word	0x00400518
  4004f4: d4 d4 d4 d4  	.word	0xd4d4d4d4

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
