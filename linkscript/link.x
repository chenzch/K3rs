/* Linker script for the S32K312 (Cortex-M7) bare-metal Rust firmware.
 *
 * The program is linked to run out of FLASH at 0x00400000. The vector table
 * sits at the very start of FLASH; the CPU loads the initial SP from its
 * first word and the reset vector from its second word.
 *
 * `memcpy64` is placed as ramcode: its VMA is in ITCM (so calls to it go
 * through the ITCM address), but its LMA is in FLASH (so it is stored in
 * flash image).  On reset, Reset_Handler copies it from FLASH to ITCM.
 * Both start/end symbols and the load address are 8-byte aligned.
 */

INCLUDE memory.x
INCLUDE interrupt.x

ENTRY(Reset_Handler)

PROVIDE(_stack_top = ORIGIN(DTCM) + LENGTH(DTCM));

SECTIONS
{
    /* ---- IVT table at the very start of FLASH (256 bytes) ---- */
    .ivt_table ORIGIN(FLASH) :
    {
        KEEP(*(.ivt_table))
        . = ALIGN(4);
    } > FLASH

    /* ---- Vector table (128-byte aligned), follows IVT ---- */
    .vector_table :
    {
        . = ALIGN(128);
        KEEP(*(.vector_table))
        . = ALIGN(4);
    } > FLASH

    /* ---- Code ---- */
    .text :
    {
        . = ALIGN(4);
        *(.text.Reset_Handler)
        KEEP(*(.text.Default_Handler))
        *(.text .text.*)
        . = ALIGN(8);
    } > FLASH

    /* ---- Read-only data ---- */
    .rodata :
    {
        . = ALIGN(8);
        *(.rodata .rodata.*)
        . = ALIGN(8);
    } > FLASH

    /* ---- memcpy64 as ramcode in ITCM (VMA=ITCM, LMA=FLASH) ---- */
    .memcpy64_text :
    {
        . = ALIGN(8);
        __memcpy64_start = .;
        KEEP(*(.memcpy64_code))
        . = ALIGN(8);
        __memcpy64_end = .;
    } > ITCM AT > FLASH
    __memcpy64_load = LOADADDR(.memcpy64_text);
    ASSERT(__memcpy64_load % 8 == 0, "memcpy64 load address must be 8-byte aligned")

    /* ---- Initialized data: lives in FLASH, copied to DTCM at runtime ---- */
    .data :
    {
        . = ALIGN(8);
        __data_start = .;
        *(.data .data.*)
        . = ALIGN(8);
        __data_end = .;
    } > DTCM AT > FLASH
    __data_load = LOADADDR(.data);

    /* ---- Zero-initialized data ---- */
    .bss (NOLOAD) :
    {
        . = ALIGN(8);
        __bss_start = .;
        *(.bss .bss.*)
        *(COMMON)
        . = ALIGN(8);
        __bss_end = .;
    } > DTCM

    /* ---- Discard unneeded sections ---- */
    /DISCARD/ :
    {
        *(.ARM.exidx*)
        *(.ARM.extab*)
        *(.comment)
        *(.note*)
        *(.eh_frame*)
        *(.eh_frame_hdr*)
    }
}
