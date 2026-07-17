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

ENTRY(Reset_Handler)

PROVIDE(_stack_top = ORIGIN(DTCM) + LENGTH(DTCM));

/* Weak interrupt handler aliases: default to Default_Handler.
   A strong definition elsewhere overrides the PROVIDE. */
PROVIDE(NMI_Handler = Default_Handler);
PROVIDE(HardFault_Handler = Default_Handler);
PROVIDE(MemManage_Handler = Default_Handler);
PROVIDE(BusFault_Handler = Default_Handler);
PROVIDE(UsageFault_Handler = Default_Handler);
PROVIDE(SVC_Handler = Default_Handler);
PROVIDE(DebugMon_Handler = Default_Handler);
PROVIDE(PendSV_Handler = Default_Handler);
PROVIDE(SysTick_Handler = Default_Handler);
PROVIDE(DMATCD0_IRQHandler = Default_Handler);
PROVIDE(DMATCD1_IRQHandler = Default_Handler);
PROVIDE(DMATCD2_IRQHandler = Default_Handler);
PROVIDE(DMATCD3_IRQHandler = Default_Handler);
PROVIDE(DMATCD4_IRQHandler = Default_Handler);
PROVIDE(DMATCD5_IRQHandler = Default_Handler);
PROVIDE(DMATCD6_IRQHandler = Default_Handler);
PROVIDE(DMATCD7_IRQHandler = Default_Handler);
PROVIDE(DMATCD8_IRQHandler = Default_Handler);
PROVIDE(DMATCD9_IRQHandler = Default_Handler);
PROVIDE(DMATCD10_IRQHandler = Default_Handler);
PROVIDE(DMATCD11_IRQHandler = Default_Handler);
PROVIDE(ERM_0_IRQHandler = Default_Handler);
PROVIDE(ERM_1_IRQHandler = Default_Handler);
PROVIDE(STM0_IRQHandler = Default_Handler);
PROVIDE(SWT0_IRQHandler = Default_Handler);
PROVIDE(FLASH_0_IRQHandler = Default_Handler);
PROVIDE(FLASH_1_IRQHandler = Default_Handler);
PROVIDE(FLASH_2_IRQHandler = Default_Handler);
PROVIDE(RGM_IRQHandler = Default_Handler);
PROVIDE(PMC_IRQHandler = Default_Handler);
PROVIDE(SIUL_0_IRQHandler = Default_Handler);
PROVIDE(SIUL_1_IRQHandler = Default_Handler);
PROVIDE(SIUL_2_IRQHandler = Default_Handler);
PROVIDE(SIUL_3_IRQHandler = Default_Handler);
PROVIDE(WKPU_IRQHandler = Default_Handler);
PROVIDE(CMU0_IRQHandler = Default_Handler);
PROVIDE(CMU1_IRQHandler = Default_Handler);
PROVIDE(CMU2_IRQHandler = Default_Handler);
PROVIDE(BCTU_IRQHandler = Default_Handler);
PROVIDE(LCU0_IRQHandler = Default_Handler);
PROVIDE(LCU1_IRQHandler = Default_Handler);
PROVIDE(PIT0_IRQHandler = Default_Handler);
PROVIDE(PIT1_IRQHandler = Default_Handler);
PROVIDE(RTC_IRQHandler = Default_Handler);
PROVIDE(FlexCAN0_0_IRQHandler = Default_Handler);
PROVIDE(FlexCAN0_1_IRQHandler = Default_Handler);
PROVIDE(FlexCAN0_2_IRQHandler = Default_Handler);
PROVIDE(FlexCAN1_0_IRQHandler = Default_Handler);
PROVIDE(FlexCAN1_1_IRQHandler = Default_Handler);
PROVIDE(FlexCAN1_2_IRQHandler = Default_Handler);
PROVIDE(FlexCAN2_0_IRQHandler = Default_Handler);
PROVIDE(FlexCAN2_1_IRQHandler = Default_Handler);
PROVIDE(FlexCAN2_2_IRQHandler = Default_Handler);
PROVIDE(FlexCAN3_0_IRQHandler = Default_Handler);
PROVIDE(FlexCAN3_1_IRQHandler = Default_Handler);
PROVIDE(FlexCAN4_0_IRQHandler = Default_Handler);
PROVIDE(FlexCAN4_1_IRQHandler = Default_Handler);
PROVIDE(FlexCAN5_0_IRQHandler = Default_Handler);
PROVIDE(FlexCAN5_1_IRQHandler = Default_Handler);
PROVIDE(LPUART0_IRQHandler = Default_Handler);
PROVIDE(LPUART1_IRQHandler = Default_Handler);
PROVIDE(LPUART2_IRQHandler = Default_Handler);
PROVIDE(LPUART3_IRQHandler = Default_Handler);
PROVIDE(LPUART4_IRQHandler = Default_Handler);
PROVIDE(LPUART5_IRQHandler = Default_Handler);
PROVIDE(LPUART6_IRQHandler = Default_Handler);
PROVIDE(LPUART7_IRQHandler = Default_Handler);
PROVIDE(I3C_IRQHandler = Default_Handler);
PROVIDE(LPI2C0_IRQHandler = Default_Handler);
PROVIDE(LPI2C1_IRQHandler = Default_Handler);
PROVIDE(LPSPI0_IRQHandler = Default_Handler);
PROVIDE(LPSPI1_IRQHandler = Default_Handler);
PROVIDE(LPSPI2_IRQHandler = Default_Handler);
PROVIDE(LPSPI3_IRQHandler = Default_Handler);
PROVIDE(JDC_IRQHandler = Default_Handler);
PROVIDE(ADC0_IRQHandler = Default_Handler);
PROVIDE(ADC1_IRQHandler = Default_Handler);
PROVIDE(LPCMP0_IRQHandler = Default_Handler);
PROVIDE(LPCMP1_IRQHandler = Default_Handler);
PROVIDE(FCCU_0_IRQHandler = Default_Handler);
PROVIDE(FCCU_1_IRQHandler = Default_Handler);
PROVIDE(STCU_MBIST_IRQHandler = Default_Handler);
PROVIDE(SoC_IRQHandler = Default_Handler);

SECTIONS
{
    /* ---- Vector table at the very start of FLASH ---- */
    .vector_table ORIGIN(FLASH) :
    {
        . = ALIGN(256);
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
