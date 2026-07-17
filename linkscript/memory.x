/* NXP S32K312 (Cortex-M7) memory map.
 *
 *   ITCM  : 0x00000000  (32 KiB)  - Instruction Tightly Coupled Memory
 *   DTCM  : 0x20000000  (64 KiB)  - Data    Tightly Coupled Memory
 *   FLASH : 0x00400000  (2 MiB)   - Program flash (boot region)
 *   SRAM  : 0x20400000  (160 KiB) - System SRAM
 *
 * Reference: S32K3xx Reference Manual (SVD: S32K312_M7.svd, CM7 r0p1, FPU).
 */
MEMORY
{
    ITCM  (rx)  : ORIGIN = 0x00000000, LENGTH = 32K
    DTCM  (rwx) : ORIGIN = 0x20000000, LENGTH = 64K
    FLASH (rx)  : ORIGIN = 0x00400000, LENGTH = 2M
    SRAM  (rwx) : ORIGIN = 0x20400000, LENGTH = 160K
}
