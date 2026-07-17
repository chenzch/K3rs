# S32K312 Rust 裸机固件

NXP S32K312（Cortex-M7）的原生 Rust 裸机固件项目。无外部 HAL 依赖，直接操作寄存器。

## 项目特性

- **裸机 Rust**：`no_std` + `no_main`，无标准库依赖
- **memcpy64 ramcode**：自实现的 `memcpy64` 函数链接到 ITCM，启动时从 FLASH 自举复制
- **完整中断向量表**：229 个向量入口（SP + 15 个内核异常 + 213 个外部 IRQ），全部弱链接到 `Default_Handler`（死循环）
- **MCU 寄存器访问模块**：通过 svd2rust 从 S32K312_M7.svd 生成，包含 82 个外设的完整寄存器定义
- **Cortex-M7 标准支持**：引用 `cortex-m` crate 提供中断 trait 和临界区后端

## 环境安装（Arch Linux）

### 1. 安装基础工具链

```bash
sudo pacman -S rustup gcc make
```

### 2. 初始化 Rust 工具链

```bash
# 安装 stable 工具链
rustup default stable

# 添加 Cortex-M7 目标平台（ARMv7E-M + 硬件浮点）
rustup target add thumbv7em-none-eabihf
```

### 3. 验证安装

```bash
rustc --version
cargo --version
rustup target list --installed
# 应输出: thumbv7em-none-eabihf
```

### 4. （可选）安装交叉工具链用于反汇编/调试

```bash
sudo pacman -S arm-none-eabi-binutils
```

提供 `arm-none-eabi-objdump`、`arm-none-eabi-nm`、`arm-none-eabi-readelf` 等工具。
项目已配置使用 LLVM 工具链（随 rustup 自带），无需额外安装即可编译。

## 编译项目

```bash
# 进入项目目录
cd /workspace

# Release 编译（默认 target: thumbv7em-none-eabihf）
cargo build --release
```

编译目标已在 `.cargo/config.toml` 中配置为 `thumbv7em-none-eabihf`，无需手动指定 `--target`。

## 生成文件位置

编译产物位于：

```
target/thumbv7em-none-eabihf/release/s32k312-rust
```

这是一个 ELF 格式的固件文件。可用以下命令查看信息：

```bash
# 查看段布局
readelf -S target/thumbv7em-none-eabihf/release/s32k312-rust

# 查看符号表
nm -n target/thumbv7em-none-eabihf/release/s32k312-rust

# 反汇编
llvm-objdump -d target/thumbv7em-none-eabihf/release/s32k312-rust
```

### 内存布局

| 区域   | 起始地址     | 大小    | 用途                         |
| ------ | ------------ | ------- | ---------------------------- |
| ITCM   | `0x00000000` | 32 KiB  | 指令紧耦合内存（memcpy64 运行区） |
| DTCM   | `0x20000000` | 64 KiB  | 数据紧耦合内存（栈 + .data + .bss）|
| FLASH  | `0x00400000` | 2 MiB   | 程序闪存（向量表 + 代码 + memcpy64 存储）|
| SRAM   | `0x04000000` | 256 KiB | 系统 SRAM                    |

### 关键符号

| 符号               | 地址         | 说明                          |
| ------------------ | ------------ | ----------------------------- |
| `.vector_table`    | `0x00400000` | 中断向量表（912 字节，229 入口）|
| `Reset_Handler`    | `0x00400390` | 复位入口函数                  |
| `Default_Handler`  | `0x004003bd` | 默认中断处理（死循环）        |
| `memcpy64`         | `0x00000000` | 自实现拷贝函数（ITCM 运行）   |
| `__memcpy64_load`  | `0x004003c8` | memcpy64 在 FLASH 中的存储地址 |

## 项目结构

```
.
├── Cargo.toml              # 项目配置与依赖
├── build.rs                # 构建脚本（链接脚本路径配置）
├── memory.x                # 内存布局定义（ITCM/DTCM/FLASH/SRAM）
├── link.x                  # 链接脚本（段布局、ramcode 配置）
├── .cargo/
│   └── config.toml         # Cargo 构建目标与链接参数
└── src/
    ├── main.rs             # 入口：Reset_Handler、memcpy64、Default_Handler、main
    ├── mcu.rs              # svd2rust 生成的 S32K312 寄存器访问模块
    └── vector_table.rs     # 自动生成的中断向量表与弱别名
```

## MCU 模块使用

`mcu` 模块由 svd2rust 从 S32K312_M7.svd 生成，提供所有外设的寄存器级访问：

```rust
// 获取外设单例
let p = mcu::Peripherals::take().unwrap();

// 读写寄存器
p.SIUL2.mscr[0].write(|w| w.bits(0x1234));

// 中断枚举
let irq = mcu::Interrupt::DMATCD0;
```
