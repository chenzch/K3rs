//! Vector table for S32K312 (Cortex-M7).
//!
//! Auto-generated from S32K312_M7.svd.
//! 228 entries: 1 SP + 14 core exceptions + 213 external IRQs (IRQ0-IRQ212).
//! Reserved IRQ slots are filled with 0 (NULL).
//! Named handlers default to Default_Handler via PROVIDE aliases in interrupt.x.

/// A vector table entry — union of function pointer and raw address,
/// needed because the initial SP is a data address, not a function pointer.
#[repr(C)]
pub union VectorEntry {
    fn_ptr: unsafe extern "C" fn(),
    addr: usize,
}

const NULL: VectorEntry = VectorEntry { addr: 0 };

const fn h(f: unsafe extern "C" fn()) -> VectorEntry {
    VectorEntry { fn_ptr: f }
}

extern "C" {
    fn _stack_top();
    fn Reset_Handler();
    fn NMI_Handler();
    fn HardFault_Handler();
    fn MemManage_Handler();
    fn BusFault_Handler();
    fn UsageFault_Handler();
    fn SVC_Handler();
    fn DebugMon_Handler();
    fn PendSV_Handler();
    fn SysTick_Handler();
    fn DMATCD0_IRQHandler();
    fn DMATCD1_IRQHandler();
    fn DMATCD2_IRQHandler();
    fn DMATCD3_IRQHandler();
    fn DMATCD4_IRQHandler();
    fn DMATCD5_IRQHandler();
    fn DMATCD6_IRQHandler();
    fn DMATCD7_IRQHandler();
    fn DMATCD8_IRQHandler();
    fn DMATCD9_IRQHandler();
    fn DMATCD10_IRQHandler();
    fn DMATCD11_IRQHandler();
    fn ERM_0_IRQHandler();
    fn ERM_1_IRQHandler();
    fn STM0_IRQHandler();
    fn SWT0_IRQHandler();
    fn FLASH_0_IRQHandler();
    fn FLASH_1_IRQHandler();
    fn FLASH_2_IRQHandler();
    fn RGM_IRQHandler();
    fn PMC_IRQHandler();
    fn SIUL_0_IRQHandler();
    fn SIUL_1_IRQHandler();
    fn SIUL_2_IRQHandler();
    fn SIUL_3_IRQHandler();
    fn WKPU_IRQHandler();
    fn CMU0_IRQHandler();
    fn CMU1_IRQHandler();
    fn CMU2_IRQHandler();
    fn BCTU_IRQHandler();
    fn LCU0_IRQHandler();
    fn LCU1_IRQHandler();
    fn PIT0_IRQHandler();
    fn PIT1_IRQHandler();
    fn RTC_IRQHandler();
    fn FlexCAN0_0_IRQHandler();
    fn FlexCAN0_1_IRQHandler();
    fn FlexCAN0_2_IRQHandler();
    fn FlexCAN1_0_IRQHandler();
    fn FlexCAN1_1_IRQHandler();
    fn FlexCAN1_2_IRQHandler();
    fn FlexCAN2_0_IRQHandler();
    fn FlexCAN2_1_IRQHandler();
    fn FlexCAN2_2_IRQHandler();
    fn FlexCAN3_0_IRQHandler();
    fn FlexCAN3_1_IRQHandler();
    fn FlexCAN4_0_IRQHandler();
    fn FlexCAN4_1_IRQHandler();
    fn FlexCAN5_0_IRQHandler();
    fn FlexCAN5_1_IRQHandler();
    fn LPUART0_IRQHandler();
    fn LPUART1_IRQHandler();
    fn LPUART2_IRQHandler();
    fn LPUART3_IRQHandler();
    fn LPUART4_IRQHandler();
    fn LPUART5_IRQHandler();
    fn LPUART6_IRQHandler();
    fn LPUART7_IRQHandler();
    fn I3C_IRQHandler();
    fn LPI2C0_IRQHandler();
    fn LPI2C1_IRQHandler();
    fn LPSPI0_IRQHandler();
    fn LPSPI1_IRQHandler();
    fn LPSPI2_IRQHandler();
    fn LPSPI3_IRQHandler();
    fn JDC_IRQHandler();
    fn ADC0_IRQHandler();
    fn ADC1_IRQHandler();
    fn LPCMP0_IRQHandler();
    fn LPCMP1_IRQHandler();
    fn FCCU_0_IRQHandler();
    fn FCCU_1_IRQHandler();
    fn STCU_MBIST_IRQHandler();
    fn SoC_IRQHandler();
}

#[link_section = ".vector_table"]
#[used]
#[no_mangle]
pub static _vector_table: [VectorEntry; 228] = [
    // --- Core exceptions (entries 0-14) ---
    h(_stack_top),            //  0: Initial SP
    h(Reset_Handler),         //  1: Reset
    h(NMI_Handler),           //  2: NMI
    h(HardFault_Handler),     //  3: HardFault
    h(MemManage_Handler),     //  4: MemManage
    h(BusFault_Handler),      //  5: BusFault
    h(UsageFault_Handler),    //  6: UsageFault
    NULL,                     //  7: Reserved
    NULL,                     //  8: Reserved
    NULL,                     //  9: Reserved
    h(SVC_Handler),           // 10: SVCall
    h(DebugMon_Handler),      // 11: DebugMonitor
    NULL,                     // 12: Reserved
    h(PendSV_Handler),        // 13: PendSV
    h(SysTick_Handler),       // 14: SysTick
    // --- External IRQs (entries 15-227, IRQ0-IRQ212) ---
    NULL,                     // 15: IRQ0 (Reserved)
    NULL,                     // 16: IRQ1 (Reserved)
    NULL,                     // 17: IRQ2 (Reserved)
    NULL,                     // 18: IRQ3 (Reserved)
    h(DMATCD0_IRQHandler),    // 19: IRQ4
    h(DMATCD1_IRQHandler),    // 20: IRQ5
    h(DMATCD2_IRQHandler),    // 21: IRQ6
    h(DMATCD3_IRQHandler),    // 22: IRQ7
    h(DMATCD4_IRQHandler),    // 23: IRQ8
    h(DMATCD5_IRQHandler),    // 24: IRQ9
    h(DMATCD6_IRQHandler),    // 25: IRQ10
    h(DMATCD7_IRQHandler),    // 26: IRQ11
    h(DMATCD8_IRQHandler),    // 27: IRQ12
    h(DMATCD9_IRQHandler),    // 28: IRQ13
    h(DMATCD10_IRQHandler),   // 29: IRQ14
    h(DMATCD11_IRQHandler),   // 30: IRQ15
    NULL,                     // 31: IRQ16 (Reserved)
    NULL,                     // 32: IRQ17 (Reserved)
    NULL,                     // 33: IRQ18 (Reserved)
    NULL,                     // 34: IRQ19 (Reserved)
    NULL,                     // 35: IRQ20 (Reserved)
    NULL,                     // 36: IRQ21 (Reserved)
    NULL,                     // 37: IRQ22 (Reserved)
    NULL,                     // 38: IRQ23 (Reserved)
    NULL,                     // 39: IRQ24 (Reserved)
    NULL,                     // 40: IRQ25 (Reserved)
    NULL,                     // 41: IRQ26 (Reserved)
    NULL,                     // 42: IRQ27 (Reserved)
    NULL,                     // 43: IRQ28 (Reserved)
    NULL,                     // 44: IRQ29 (Reserved)
    NULL,                     // 45: IRQ30 (Reserved)
    NULL,                     // 46: IRQ31 (Reserved)
    NULL,                     // 47: IRQ32 (Reserved)
    NULL,                     // 48: IRQ33 (Reserved)
    NULL,                     // 49: IRQ34 (Reserved)
    NULL,                     // 50: IRQ35 (Reserved)
    h(ERM_0_IRQHandler),      // 51: IRQ36
    h(ERM_1_IRQHandler),      // 52: IRQ37
    NULL,                     // 53: IRQ38 (Reserved)
    h(STM0_IRQHandler),       // 54: IRQ39
    NULL,                     // 55: IRQ40 (Reserved)
    NULL,                     // 56: IRQ41 (Reserved)
    h(SWT0_IRQHandler),       // 57: IRQ42
    NULL,                     // 58: IRQ43 (Reserved)
    NULL,                     // 59: IRQ44 (Reserved)
    NULL,                     // 60: IRQ45 (Reserved)
    NULL,                     // 61: IRQ46 (Reserved)
    NULL,                     // 62: IRQ47 (Reserved)
    h(FLASH_0_IRQHandler),    // 63: IRQ48
    h(FLASH_1_IRQHandler),    // 64: IRQ49
    h(FLASH_2_IRQHandler),    // 65: IRQ50
    h(RGM_IRQHandler),        // 66: IRQ51
    h(PMC_IRQHandler),        // 67: IRQ52
    h(SIUL_0_IRQHandler),     // 68: IRQ53
    h(SIUL_1_IRQHandler),     // 69: IRQ54
    h(SIUL_2_IRQHandler),     // 70: IRQ55
    h(SIUL_3_IRQHandler),     // 71: IRQ56
    NULL,                     // 72: IRQ57 (Reserved)
    NULL,                     // 73: IRQ58 (Reserved)
    NULL,                     // 74: IRQ59 (Reserved)
    NULL,                     // 75: IRQ60 (Reserved)
    NULL,                     // 76: IRQ61 (Reserved)
    NULL,                     // 77: IRQ62 (Reserved)
    NULL,                     // 78: IRQ63 (Reserved)
    NULL,                     // 79: IRQ64 (Reserved)
    NULL,                     // 80: IRQ65 (Reserved)
    NULL,                     // 81: IRQ66 (Reserved)
    NULL,                     // 82: IRQ67 (Reserved)
    NULL,                     // 83: IRQ68 (Reserved)
    NULL,                     // 84: IRQ69 (Reserved)
    NULL,                     // 85: IRQ70 (Reserved)
    NULL,                     // 86: IRQ71 (Reserved)
    NULL,                     // 87: IRQ72 (Reserved)
    NULL,                     // 88: IRQ73 (Reserved)
    NULL,                     // 89: IRQ74 (Reserved)
    NULL,                     // 90: IRQ75 (Reserved)
    NULL,                     // 91: IRQ76 (Reserved)
    NULL,                     // 92: IRQ77 (Reserved)
    NULL,                     // 93: IRQ78 (Reserved)
    NULL,                     // 94: IRQ79 (Reserved)
    NULL,                     // 95: IRQ80 (Reserved)
    NULL,                     // 96: IRQ81 (Reserved)
    NULL,                     // 97: IRQ82 (Reserved)
    h(WKPU_IRQHandler),       // 98: IRQ83
    h(CMU0_IRQHandler),       // 99: IRQ84
    h(CMU1_IRQHandler),       // 100: IRQ85
    h(CMU2_IRQHandler),       // 101: IRQ86
    h(BCTU_IRQHandler),       // 102: IRQ87
    NULL,                     // 103: IRQ88 (Reserved)
    NULL,                     // 104: IRQ89 (Reserved)
    NULL,                     // 105: IRQ90 (Reserved)
    NULL,                     // 106: IRQ91 (Reserved)
    h(LCU0_IRQHandler),       // 107: IRQ92
    h(LCU1_IRQHandler),       // 108: IRQ93
    NULL,                     // 109: IRQ94 (Reserved)
    NULL,                     // 110: IRQ95 (Reserved)
    h(PIT0_IRQHandler),       // 111: IRQ96
    h(PIT1_IRQHandler),       // 112: IRQ97
    NULL,                     // 113: IRQ98 (Reserved)
    NULL,                     // 114: IRQ99 (Reserved)
    NULL,                     // 115: IRQ100 (Reserved)
    NULL,                     // 116: IRQ101 (Reserved)
    h(RTC_IRQHandler),        // 117: IRQ102
    NULL,                     // 118: IRQ103 (Reserved)
    NULL,                     // 119: IRQ104 (Reserved)
    NULL,                     // 120: IRQ105 (Reserved)
    NULL,                     // 121: IRQ106 (Reserved)
    NULL,                     // 122: IRQ107 (Reserved)
    NULL,                     // 123: IRQ108 (Reserved)
    h(FlexCAN0_0_IRQHandler), // 124: IRQ109
    h(FlexCAN0_1_IRQHandler), // 125: IRQ110
    h(FlexCAN0_2_IRQHandler), // 126: IRQ111
    NULL,                     // 127: IRQ112 (Reserved)
    h(FlexCAN1_0_IRQHandler), // 128: IRQ113
    h(FlexCAN1_1_IRQHandler), // 129: IRQ114
    h(FlexCAN1_2_IRQHandler), // 130: IRQ115
    h(FlexCAN2_0_IRQHandler), // 131: IRQ116
    h(FlexCAN2_1_IRQHandler), // 132: IRQ117
    h(FlexCAN2_2_IRQHandler), // 133: IRQ118
    h(FlexCAN3_0_IRQHandler), // 134: IRQ119
    h(FlexCAN3_1_IRQHandler), // 135: IRQ120
    h(FlexCAN4_0_IRQHandler), // 136: IRQ121
    h(FlexCAN4_1_IRQHandler), // 137: IRQ122
    h(FlexCAN5_0_IRQHandler), // 138: IRQ123
    h(FlexCAN5_1_IRQHandler), // 139: IRQ124
    NULL,                     // 140: IRQ125 (Reserved)
    NULL,                     // 141: IRQ126 (Reserved)
    NULL,                     // 142: IRQ127 (Reserved)
    NULL,                     // 143: IRQ128 (Reserved)
    NULL,                     // 144: IRQ129 (Reserved)
    NULL,                     // 145: IRQ130 (Reserved)
    NULL,                     // 146: IRQ131 (Reserved)
    NULL,                     // 147: IRQ132 (Reserved)
    NULL,                     // 148: IRQ133 (Reserved)
    NULL,                     // 149: IRQ134 (Reserved)
    NULL,                     // 150: IRQ135 (Reserved)
    NULL,                     // 151: IRQ136 (Reserved)
    NULL,                     // 152: IRQ137 (Reserved)
    NULL,                     // 153: IRQ138 (Reserved)
    NULL,                     // 154: IRQ139 (Reserved)
    NULL,                     // 155: IRQ140 (Reserved)
    h(LPUART0_IRQHandler),    // 156: IRQ141
    h(LPUART1_IRQHandler),    // 157: IRQ142
    h(LPUART2_IRQHandler),    // 158: IRQ143
    h(LPUART3_IRQHandler),    // 159: IRQ144
    h(LPUART4_IRQHandler),    // 160: IRQ145
    h(LPUART5_IRQHandler),    // 161: IRQ146
    h(LPUART6_IRQHandler),    // 162: IRQ147
    h(LPUART7_IRQHandler),    // 163: IRQ148
    NULL,                     // 164: IRQ149 (Reserved)
    NULL,                     // 165: IRQ150 (Reserved)
    NULL,                     // 166: IRQ151 (Reserved)
    NULL,                     // 167: IRQ152 (Reserved)
    NULL,                     // 168: IRQ153 (Reserved)
    NULL,                     // 169: IRQ154 (Reserved)
    NULL,                     // 170: IRQ155 (Reserved)
    NULL,                     // 171: IRQ156 (Reserved)
    NULL,                     // 172: IRQ157 (Reserved)
    NULL,                     // 173: IRQ158 (Reserved)
    NULL,                     // 174: IRQ159 (Reserved)
    h(I3C_IRQHandler),        // 175: IRQ160
    h(LPI2C0_IRQHandler),     // 176: IRQ161
    h(LPI2C1_IRQHandler),     // 177: IRQ162
    NULL,                     // 178: IRQ163 (Reserved)
    NULL,                     // 179: IRQ164 (Reserved)
    h(LPSPI0_IRQHandler),     // 180: IRQ165
    h(LPSPI1_IRQHandler),     // 181: IRQ166
    h(LPSPI2_IRQHandler),     // 182: IRQ167
    h(LPSPI3_IRQHandler),     // 183: IRQ168
    NULL,                     // 184: IRQ169 (Reserved)
    NULL,                     // 185: IRQ170 (Reserved)
    NULL,                     // 186: IRQ171 (Reserved)
    NULL,                     // 187: IRQ172 (Reserved)
    NULL,                     // 188: IRQ173 (Reserved)
    NULL,                     // 189: IRQ174 (Reserved)
    NULL,                     // 190: IRQ175 (Reserved)
    NULL,                     // 191: IRQ176 (Reserved)
    NULL,                     // 192: IRQ177 (Reserved)
    h(JDC_IRQHandler),        // 193: IRQ178
    NULL,                     // 194: IRQ179 (Reserved)
    h(ADC0_IRQHandler),       // 195: IRQ180
    h(ADC1_IRQHandler),       // 196: IRQ181
    NULL,                     // 197: IRQ182 (Reserved)
    h(LPCMP0_IRQHandler),     // 198: IRQ183
    h(LPCMP1_IRQHandler),     // 199: IRQ184
    NULL,                     // 200: IRQ185 (Reserved)
    NULL,                     // 201: IRQ186 (Reserved)
    NULL,                     // 202: IRQ187 (Reserved)
    NULL,                     // 203: IRQ188 (Reserved)
    h(FCCU_0_IRQHandler),     // 204: IRQ189
    h(FCCU_1_IRQHandler),     // 205: IRQ190
    h(STCU_MBIST_IRQHandler), // 206: IRQ191
    NULL,                     // 207: IRQ192 (Reserved)
    NULL,                     // 208: IRQ193 (Reserved)
    NULL,                     // 209: IRQ194 (Reserved)
    NULL,                     // 210: IRQ195 (Reserved)
    NULL,                     // 211: IRQ196 (Reserved)
    NULL,                     // 212: IRQ197 (Reserved)
    NULL,                     // 213: IRQ198 (Reserved)
    NULL,                     // 214: IRQ199 (Reserved)
    NULL,                     // 215: IRQ200 (Reserved)
    NULL,                     // 216: IRQ201 (Reserved)
    NULL,                     // 217: IRQ202 (Reserved)
    NULL,                     // 218: IRQ203 (Reserved)
    NULL,                     // 219: IRQ204 (Reserved)
    NULL,                     // 220: IRQ205 (Reserved)
    NULL,                     // 221: IRQ206 (Reserved)
    NULL,                     // 222: IRQ207 (Reserved)
    NULL,                     // 223: IRQ208 (Reserved)
    NULL,                     // 224: IRQ209 (Reserved)
    NULL,                     // 225: IRQ210 (Reserved)
    NULL,                     // 226: IRQ211 (Reserved)
    h(SoC_IRQHandler),        // 227: IRQ212
];
