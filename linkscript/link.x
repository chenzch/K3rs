/* Linker script for the S32K312 (Cortex-M7) bare-metal Rust firmware.
 *
 * The program is linked to run out of FLASH at 0x00400000. The vector table
 * sits at the very start of FLASH; the CPU loads the initial SP from its
 * first word and the reset vector from its second word.
 *
 * `memcpy64` and `memset64` are placed as ramcode: VMA in ITCM, LMA in FLASH,
 * self-copied at reset. Both start/end symbols and the load address are
 * 8-byte aligned.
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

    /* ---- Ramcode (memcpy64 + memset64) in ITCM (VMA=ITCM, LMA=FLASH) ---- */
    .ramcode :
    {
        . = ALIGN(8);
        __ramcode_start = .;
        KEEP(*(.ramcode))
        . = ALIGN(8);
        __ramcode_end = .;
    } > ITCM AT > FLASH
    __ramcode_load = LOADADDR(.ramcode);
    ASSERT(__ramcode_load % 8 == 0, "ramcode load address must be 8-byte aligned")

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
