
target/thumbv7em-none-eabihf/release/K3rs:	file format elf32-littlearm

Disassembly of section .text:

00400490 <Reset_Handler>:
  400490:      	cpsid i
  400492:      	movs	r0, #0x0
  400494:      	strd	r0, r0, [sp, #-16]
  400498:      	strd	r0, r0, [sp, #-8]
  40049c:      	b.w	0x4004a8 <_ZN4K3rs11__rust_init17h7f850b3e10c5f602E> @ imm = #0x8

004004a0 <WKPU_IRQHandler>:
; pub extern "C" fn Default_Handler() -> ! {
  4004a0:      	push	{r7, lr}
  4004a2:      	mov	r7, sp
;     loop {}
  4004a4:      	b	0x4004a4 <WKPU_IRQHandler+0x4> @ imm = #-0x4
  4004a6:      	bmi	0x400452 <_vector_table+0x352> @ imm = #-0x58

004004a8 <_ZN4K3rs11__rust_init17h7f850b3e10c5f602E>:
; unsafe extern "C" fn __rust_init() -> ! {
  4004a8:      	push	{r5, r6, r7, lr}
  4004aa:      	add	r7, sp, #0x8
/root/.local/share/swiftly/toolchains/6.2.4/usr/bin/llvm-objdump: warning: 'target/thumbv7em-none-eabihf/release/K3rs': failed to find source /rustc/ded5c06cf21d2b93bffd5d884aa6e96934ee4234/library/core/src/hint.rs
  4004ac:      	ldr	r0, [pc, #0x14]         @ 0x4004c4 <_ZN4K3rs11__rust_init17h7f850b3e10c5f602E+0x1c>
  4004ae:      	str	r0, [sp, #0x4]
  4004b0:      	add	r0, sp, #0x4
;     do_copy(src, dst, len);
  4004b2:      	ldr	r1, [pc, #0x14]         @ 0x4004c8 <_ZN4K3rs11__rust_init17h7f850b3e10c5f602E+0x20>
  4004b4:      	ldr	r0, [pc, #0x14]         @ 0x4004cc <_ZN4K3rs11__rust_init17h7f850b3e10c5f602E+0x24>
  4004b6:      	ldr	r3, [sp, #0x4]
;     do_copy(src, dst, len);
  4004b8:      	subs	r2, r0, r1
  4004ba:      	ldr	r0, [pc, #0x14]         @ 0x4004d0 <_ZN4K3rs11__rust_init17h7f850b3e10c5f602E+0x28>
  4004bc:      	blx	r3
;     main();
  4004be:      	bl	0x4004d4 <main>         @ imm = #0x12
  4004c2:      	nop
  4004c4: 01 00 00 00  	.word	0x00000001
  4004c8: 00 00 00 00  	.word	0x00000000
  4004cc: 30 00 00 00  	.word	0x00000030
  4004d0: e0 04 40 00  	.word	0x004004e0

004004d4 <main>:
; pub extern "C" fn main() -> ! {
  4004d4:      	push	{r7, lr}
  4004d6:      	mov	r7, sp
;     loop {}
  4004d8:      	b	0x4004d8 <main+0x4>     @ imm = #-0x4
  4004da:      	bmi	0x400486 <_vector_table+0x386> @ imm = #-0x58
  4004dc:      	bmi	0x400488 <_vector_table+0x388> @ imm = #-0x58
  4004de:      	bmi	0x40048a <_vector_table+0x38a> @ imm = #-0x58

Disassembly of section .ramcode:

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

0000001a <memset64>:
; pub unsafe extern "C" fn memset64(dst: *mut u8, value: u64, n: usize) -> *mut u8 {
      1a:      	push	{r4, r6, r7, lr}
      1c:      	add	r7, sp, #0x8
      1e:      	ldr	r1, [r7, #0x8]
      20:      	mov	r4, r0
;     let count = n / 8;
      22:      	lsrs	r1, r1, #0x3
;     while i < count {
      24:      	cbz	r1, 0x2e <memset64+0x14> @ imm = #0x6
      26:      	strd	r2, r3, [r4], #8
;     while i < count {
      2a:      	subs	r1, #0x1
      2c:      	b	0x24 <memset64+0xa>     @ imm = #-0xc
; }
      2e:      	pop	{r4, r6, r7, pc}
