/* Linker script for the S32K312 (Cortex-M7) bare-metal Rust firmware.
 *
 * The program is linked to run out of FLASH at 0x00400000. The vector table
 * sits at the very start of FLASH; the CPU loads the initial SP from its
 * first word and the reset vector from its second word.
 *
 * Ramcode layout in ITCM (VMA=ITCM, LMA=FLASH):
 *   - .itcm_text.memcpy64 : placed at ITCM origin (0x00000000).
 *     Copied first by inline loop in Reset_Handler (cannot call memcpy64
 *     before it is in ITCM).
 *   - .itcm_text           : follows memcpy64, contains memset64 (and any
 *     other ramcode). Copied by memcpy64 after memcpy64 is in place.
 * All start/end/load addresses are 8-byte aligned.
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

    /* ---- memcpy64 as ramcode, at the very start of ITCM ---- */
    .itcm_text.memcpy64 ORIGIN(ITCM) :
    {
        . = ALIGN(8);
        __memcpy64_start = .;
        KEEP(*(.itcm_text.memcpy64))
        . = ALIGN(8);
        __memcpy64_end = .;
    } > ITCM AT > FLASH
    __memcpy64_load = LOADADDR(.itcm_text.memcpy64);
    ASSERT(__memcpy64_load % 8 == 0, "memcpy64 load address must be 8-byte aligned")

    /* ---- memset64 (and other ramcode) in ITCM, after memcpy64 ---- */
    .itcm_text :
    {
        . = ALIGN(8);
        __itcm_text_start = .;
        KEEP(*(.itcm_text))
        . = ALIGN(8);
        __itcm_text_end = .;
    } > ITCM AT > FLASH
    __itcm_text_load = LOADADDR(.itcm_text);
    ASSERT(__itcm_text_load % 8 == 0, "itcm_text load address must be 8-byte aligned")

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
