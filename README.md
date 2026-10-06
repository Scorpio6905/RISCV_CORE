# RISCV_CORE

## RISC-V RV32I Single-Cycle Processor in Chisel

**RISCV_CORE** is a simple 32-bit RISC-V processor designed and implemented using **Chisel**, a hardware construction language built on Scala.

The project is designed to understand how a processor works internally by implementing the main components of a RISC-V single-cycle datapath, including the Program Counter, Instruction Memory, Control Unit, Register File, Immediate Generator, ALU, Data Memory, and the logic used to calculate the next Program Counter.

The processor executes instructions in a **single clock cycle**, meaning that instruction fetch, decode, execution, memory access, and write-back are handled within one processor cycle.

---

## Project Goals

The main goals of this project are:

- Understand the internal working of a RISC-V processor.
- Implement a simple CPU datapath using Chisel.
- Understand how RISC-V instructions are decoded and executed.
- Learn how the Control Unit generates control signals.
- Implement register and memory operations.
- Understand how branches and jumps change the Program Counter.
- Test the processor using ChiselTest.
- Observe processor signals during simulation.

---

## Architecture

The processor follows a basic **single-cycle RISC-V datapath**.

The general flow of an instruction is:

```text
             ┌─────────────────┐
             │ Program Counter │
             └────────┬────────┘
                      │
                      ▼
             ┌─────────────────┐
             │ Instruction    │
             │ Memory         │
             └────────┬────────┘
                      │
                      ▼
             ┌─────────────────┐
             │ Instruction     │
             │ Decode /        │
             │ Control Unit    │
             └───────┬─────────┘
                     │
          ┌──────────┼──────────┐
          ▼          ▼          ▼
     Register      Immediate    Control
       File        Generator    Signals
          │          │
          └────┬─────┘
               ▼
          ┌─────────┐
          │   ALU   │
          └────┬────┘
               │
        ┌──────┴──────┐
        ▼             ▼
   Data Memory    Write Back
        │             │
        └──────┬──────┘
               ▼
          Register File

               +
               
        Next PC Selection
        (PC + 4 / Branch /
         JAL / JALR)
```

### Instruction Flow

For each instruction:

1. The **Program Counter (PC)** provides the address of the current instruction.
2. **Instruction Memory** returns the 32-bit instruction.
3. The instruction is decoded to determine its type and required control signals.
4. The **Register File** provides the required register values.
5. The **Immediate Generator** creates the immediate value when required.
6. The **ALU** performs arithmetic, logical, comparison, or address calculations.
7. **Data Memory** is accessed for load and store instructions.
8. The result is written back to the destination register when required.
9. The processor calculates the address of the next instruction.

---

## Main Components

The processor is divided into several hardware modules.

### Program Counter

The Program Counter stores the address of the current instruction.

Normally, the PC moves to the next instruction using:

```text
PC + 4
```

For branches and jumps, the next PC can instead be calculated from the instruction's immediate value.

---

### Instruction Memory

Instruction Memory stores the RISC-V instructions that the processor executes.

The PC is used as the instruction address, and the corresponding 32-bit instruction is supplied to the rest of the processor.

---

### Control Unit

The Control Unit examines the instruction opcode and determines what the processor should do.

It generates signals for operations such as:

- Register writing
- Memory reading
- Memory writing
- Branching
- Selecting ALU operands
- Selecting the write-back value
- Selecting the next PC
- Selecting the immediate format

---

### Register File

The Register File contains the RISC-V general-purpose registers.

It provides the source operands required by instructions and receives results when an instruction writes to a destination register.

---

### Immediate Generator

Different RISC-V instruction formats place immediate values in different positions.

The Immediate Generator extracts and creates the correct immediate value for the instruction.

It handles the immediate formats required by the implemented instruction types.

---

### ALU

The Arithmetic Logic Unit performs the main calculations required by the processor.

It is used for:

- Arithmetic operations
- Logical operations
- Comparisons
- Address calculations
- Branch comparisons
- Other instruction-specific calculations

---

### Data Memory

Data Memory is used by memory instructions.

For example:

```text
LW   → Read data from memory
SW   → Write data to memory
```

The ALU calculates the memory address before the memory operation takes place.

---

### Next-PC Logic

The processor must decide where execution continues after every instruction.

The next PC can come from different sources depending on the instruction:

```text
PC + 4
Branch Target
JAL Target
JALR Target
```

The Control Unit determines which option should be selected.

---

## Supported Instruction Types

The current processor implements the main instruction categories used in the project:

### R-Type

Register-to-register operations.

Examples include:

```text
ADD
SUB
AND
OR
XOR
SLT
SLTU
SLL
SRL
SRA
```

Example:

```assembly
add x5, x1, x2
```

This adds the values in `x1` and `x2` and stores the result in `x5`.

---

### I-Type

Immediate-based arithmetic and logical instructions.

Examples include:

```text
ADDI
ANDI
ORI
XORI
SLTI
SLTIU
SLLI
SRLI
SRAI
```

Example:

```assembly
addi x5, x1, 10
```

This adds `10` to the value in `x1` and stores the result in `x5`.

---

### Load

The processor supports load operations for reading data from memory.

Example:

```assembly
lw x5, 0(x1)
```

The address is calculated using:

```text
x1 + immediate
```

and the value stored at that address is loaded into `x5`.

---

### Store

Store instructions write register data into memory.

Example:

```assembly
sw x5, 0(x1)
```

The value in `x5` is stored at the memory address calculated from:

```text
x1 + immediate
```

---

### Branch

The processor supports conditional branch instructions:

```text
BEQ
BNE
BLT
BGE
BLTU
BGEU
```

Example:

```assembly
beq x1, x2, label
```

If `x1` and `x2` are equal, execution continues from the branch target.

---

### JAL

`JAL` is used for an unconditional PC-relative jump and can also save a return address in a destination register.

Example:

```assembly
jal x1, label
```

---

### JALR

`JALR` calculates the jump target using a register and an immediate value.

Example:

```assembly
jalr x1, x5, 0
```

This is commonly used for function calls and indirect jumps.

---

### LUI

`LUI` loads an upper immediate value into a register.

Example:

```assembly
lui x5, 0x12345
```

---

# Getting Started

## 1. Prerequisites

Before running the project, install:

- Java JDK
- Scala-compatible **sbt**
- Git

A Java JDK version compatible with the project's older Chisel/Scala setup is recommended.

You can check whether the required tools are installed using:

```bash
java -version
sbt --version
git --version
```

---

## 2. Clone the Repository

Clone the repository using:

```bash
git clone https://github.com/Scorpio6905/RISCV_CORE.git
```

Then enter the project directory:

```bash
cd RISCV_CORE
```

---

## 3. Open the Project

The project can be opened in an IDE such as:

- IntelliJ IDEA
- VS Code with Scala/Metals support

If using IntelliJ IDEA, open the repository folder as an sbt project.

---

# Running the Project

The project uses **sbt** for building and testing.

From the repository root, run:

```bash
sbt
```

Then compile the project:

```text
compile
```

To run the available tests:

```text
test
```

You can also run the test command directly from the terminal:

```bash
sbt test
```

The first build may take some time because sbt downloads Scala, Chisel, ChiselTest, and their dependencies.

---

# Running Your Own RISC-V Program

The processor uses hexadecimal machine instructions as its input program.

For example:

```text
00500313
00130313
ffdff06f
```

Each line represents a RISC-V instruction encoded as a 32-bit hexadecimal value.

The repository currently contains a small `main.txt` file containing example instruction values.

To test another program:

1. Write the RISC-V assembly program.
2. Assemble the program into machine-code hexadecimal values.
3. Place the hexadecimal instructions in the input file used by the processor/testbench.
4. Run the ChiselTest simulation.
5. Observe the register, ALU, memory, and PC behavior.

---

# Example

A simple RISC-V program might contain:

```assembly
addi x6, x0, 5
addi x6, x6, 1
```

The corresponding machine instructions are provided to the processor as hexadecimal values.

The processor then performs the following operations:

```text
Instruction 1
      ↓
Decode ADDI
      ↓
Read x0
      ↓
Generate immediate 5
      ↓
ALU performs addition
      ↓
Write result to x6

Instruction 2
      ↓
Decode ADDI
      ↓
Read x6
      ↓
Generate immediate 1
      ↓
ALU performs addition
      ↓
Write result to x6
```

After execution, `x6` contains:

```text
6
```

---

# Testing

The project uses **ChiselTest** to test the processor hardware.

Testing allows the processor to be checked by providing instructions and observing its outputs.

Tests can be used to verify areas such as:

- Arithmetic operations
- Immediate operations
- Register operations
- Load/store operations
- Branch instructions
- Jump instructions
- LUI
- Program Counter updates
- Control signals
- ALU results

Run all available tests with:

```bash
sbt test
```

---

