
target/thumbv7em-none-eabihf/release/K3rs:	file format elf32-littlearm

Disassembly of section .text:

00400490 <Reset_Handler>:
  400490:      	cpsid i
  400492:      	movs	r0, #0x0
  400494:      	strd	r0, r0, [sp, #-16]
  400498:      	strd	r0, r0, [sp, #-8]
  40049c:      	ldr	r0, [pc, #0x10]         @ 0x4004b0 <Reset_Handler+0x20>
  40049e:      	ldr	r1, [pc, #0x14]         @ 0x4004b4 <Reset_Handler+0x24>
  4004a0:      	ldr	r2, [pc, #0x14]         @ 0x4004b8 <Reset_Handler+0x28>
  4004a2:      	sub.w	r2, r2, r1
  4004a6:      	bl	0x0 <memcpy64>          @ imm = #-0x4004aa
  4004aa:      	b.w	0x4004c2 <main>         @ imm = #0x14
  4004ae:      	movs	r0, r0
  4004b0: c8 04 40 00  	.word	0x004004c8
  4004b4: 00 00 00 00  	.word	0x00000000
  4004b8: 30 00 00 00  	.word	0x00000030

004004bc <WKPU_IRQHandler>:
; pub extern "C" fn Default_Handler() -> ! {
  4004bc:      	push	{r7, lr}
  4004be:      	mov	r7, sp
;     loop {}
  4004c0:      	b	0x4004c0 <WKPU_IRQHandler+0x4> @ imm = #-0x4

004004c2 <main>:
; pub extern "C" fn main() -> ! {
  4004c2:      	push	{r7, lr}
  4004c4:      	mov	r7, sp
;     loop {}
  4004c6:      	b	0x4004c6 <main+0x4>     @ imm = #-0x4

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
