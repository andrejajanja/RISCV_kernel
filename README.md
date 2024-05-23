# Single-core RISCV® Kernel
 
A student project for a subject named [`Operating systems 1`](http://os.etf.bg.ac.rs/OS1/index.htm) under full professor [**Dragan Milićev**](https://www.etf.bg.ac.rs/en/faculty/staff/dragan-milicev-522)

![Logo](https://riscv.org/wp-content/uploads/2020/06/riscv-color.svg)

## System Features
| **No** | **Name** |
| :-----: | :------: |
| **1.** | Continuous memory allocation - `C`/`C++` API|
| **2.** | Threads - `C`/`C++` API |
| **3.** | Thread scheduling |
| **4.** | Sleeping threads |
| **5.** | Semaphores - `C`/`C++` API |
| **6.** | Synchronous context switch |
| **7.** | Asynchronous context switch |
| **8.** | Console support (_hardware interrutps_)|
| **9.** | Dynamic system data structures |

_Use of dynamic data structures allows the system to have a large number of entities (e.g. Threads, Semaphores...) present in operating memory and allows Kernel as a whole to use the least memory possible._

## Architecture and properties
|**Architecture Levels (top-down)**|
| :----: |
| C++ API|
| C API|
| ABI (Application binary interface) |

#### Platform and technologies :
- ABI is written using RISCV assembly
- Implementation for all system features is written in `C++`
- Asynchronous context switch is done every ~200ms
- The entire system is executed on Qemu RISCV emulator

