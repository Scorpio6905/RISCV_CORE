package risc_v

import chisel3._
import chisel3.util._
import chisel3.core

class Top extends Module {

    val io = IO(new Bundle{ 
        val pc       = Output(UInt(32.W))
        val inst     = Output(UInt(32.W))

        val aluInA   = Output(SInt(32.W))
        val aluInB   = Output(SInt(32.W))
        val aluOut   = Output(SInt(32.W))

        val regRdata1 = Output(UInt(32.W))
        val regRdata2 = Output(UInt(32.W))
        val regWdata  = Output(UInt(32.W))

        val regWen   = Output(Bool())
        val regWaddr = Output(UInt(5.W))
        val regFile  = Output(new RegFileDebugIO)

        val imm      = Output(UInt(32.W))

        val branch   = Output(Bool())

    })

    // MODULES

    val Alu = Module(new Alu())
    val Control = Module(new Control())
    val ImmGen = Module(new ImmdValGen())
    val AluControl = Module(new AluControl())
    val Register = Module(new RegFile())
    val Instr_Memory = Module(new InstMem)
    val PC = Module(new PC())
    val Jalr = Module(new Jalr())
    val DataMemory = Module(new Asynch_Mem())
        

    // DEBUG OUTPUTS

    io.pc        := PC.io.PC_OUT
    io.inst      := Instr_Memory.io.inst

    io.aluInA    := Alu.io.InA
    io.aluInB    := Alu.io.InB
    io.aluOut    := Alu.io.output

    io.regRdata1 := Register.io.rdata1
    io.regRdata2 := Register.io.rdata2
    io.regWdata  := Register.io.wdata

    io.regWen    := Register.io.wen
    io.regWaddr  := Register.io.waddr
    io.regFile   := Register.io.debug

    io.imm       := ImmGen.io.immd_se

    io.branch    := Alu.io.Branch


    // INSTRUCTION FETCH

    Instr_Memory.io.addr := PC.io.PC_OUT


    // INSTRUCTION DECODE

    Control.io.opcode := Instr_Memory.io.inst(6, 0)

    ImmGen.io.instr := Instr_Memory.io.inst


    // REGISTER FILE ADDRESSES

    Register.io.waddr := Instr_Memory.io.inst(11, 7)
    Register.io.raddr1 := Instr_Memory.io.inst(19, 15)
    Register.io.raddr2 := Instr_Memory.io.inst(24, 20)


    // ALU CONTROL

    AluControl.io.funct3 := Instr_Memory.io.inst(14, 12)
    AluControl.io.funct7 := Instr_Memory.io.inst(30)

    AluControl.io.aluOp := Control.io.ALUOP

    Alu.io.alucontrol := AluControl.io.out


    // DEFAULT VALUES
    
    PC.io.PC_IN := PC.io.PC_NEXT

    DataMemory.io.wr_en := false.B
    DataMemory.io.data_selector := 0.U

    Register.io.wen := false.B

    Alu.io.InA := Register.io.rdata1.asSInt
    Alu.io.InB := Register.io.rdata2.asSInt

    Jalr.io.in1 := 0.S
    Jalr.io.in2 := 0.S

    DataMemory.io.addr := Alu.io.output.asUInt()(6,2)

    DataMemory.io.data_in := Register.io.rdata2

    Register.io.wdata := Alu.io.output.asUInt


    // LOAD

    when (
        Control.io.RegWrite === 1.B && Control.io.MemRead === 1.B && Control.io.MemtoReg === 1.B && Control.io.operandBsel === 1.B
    ) {

        Alu.io.InA := Register.io.rdata1.asSInt
        Alu.io.InB := ImmGen.io.immd_se.asSInt

        // ALU result = memory address

        DataMemory.io.addr := Alu.io.output.asUInt()(6,2)

        Register.io.wdata := DataMemory.io.data_out

        Register.io.wen := true.B


    // STORE

    }.elsewhen (
        Control.io.MemWrite === 1.B && Control.io.operandBsel === 1.B
    ) {

        Alu.io.InA := Register.io.rdata1.asSInt
        Alu.io.InB := ImmGen.io.immd_se.asSInt

        // ALU result = memory address

        DataMemory.io.addr := Alu.io.output.asUInt()(6,2)

        DataMemory.io.data_in := Register.io.rdata2

        DataMemory.io.wr_en := true.B


    // BRANCH

    }.elsewhen (
        Control.io.next_PC_sel === "b01".U  && Control.io.BranchOut === 1.B
    ) {

        Alu.io.InA := Register.io.rdata1.asSInt
        Alu.io.InB := Register.io.rdata2.asSInt

        when (Alu.io.Branch === 1.B){
            PC.io.PC_IN := PC.io.PC_OUT + ImmGen.io.immd_se
        }

    // JALR

    }.elsewhen (
        Control.io.RegWrite === 1.B && Control.io.operandAsel === "b10".U && Control.io.next_PC_sel === "b11".U
    ) {

        // rs1 + immediate

        Jalr.io.in1 := Register.io.rdata1.asSInt
        Jalr.io.in2 := ImmGen.io.immd_se.asSInt

        // Save PC + 4 in rd

        Register.io.wdata := PC.io.PC_NEXT

        Register.io.wen := true.B

        PC.io.PC_IN := Jalr.io.out.asUInt


    // JAL

    }.elsewhen (
        Control.io.RegWrite === 1.B && Control.io.operandAsel === "b10".U && Control.io.next_PC_sel === "b10".U
    ) {

        // PC + JAL immediate

        PC.io.PC_IN := PC.io.PC_OUT + ImmGen.io.immd_se

        // Save PC + 4 in rd

        Register.io.wdata := PC.io.PC_NEXT

        Register.io.wen := true.B


    // LUI

    }.elsewhen (
        Control.io.RegWrite === 1.B && Control.io.operandAsel === "b11".U && Control.io.operandBsel === true.B
    ) {

        Register.io.wdata := ImmGen.io.immd_se

        Register.io.wen := true.B


    // R-TYPE / I-TYPE

    }.elsewhen (
        Control.io.RegWrite === 1.B
    ) {

        Register.io.wen := true.B

        Alu.io.InA := Register.io.rdata1.asSInt

        switch (Control.io.operandBsel) {

            is(false.B) {

                Alu.io.InB := Register.io.rdata2.asSInt

            }

            is(true.B) {

                Alu.io.InB := ImmGen.io.immd_se.asSInt

            }

        }

        Register.io.wdata := Alu.io.output.asUInt
    }
}