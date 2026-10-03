package risc_v

import chisel3._

class Control extends Module{
    val io = IO (new Bundle {
        val opcode = Input(UInt(7.W))

        val MemWrite = Output(Bool())
        val BranchOut = Output(Bool())
        val MemRead = Output(Bool())
        val RegWrite = Output(Bool())
        val MemtoReg = Output(Bool())
        val ALUOP = Output(UInt(3.W))
        val operandAsel = Output(UInt(2.W))
        val operandBsel = Output(Bool())
        val extend_sel = Output(UInt(2.W))
        val next_PC_sel = Output(UInt(2.W))   
        
  })

    val TypeDecode = Module(new InstructionDecode)
    val ControlDecode = Module(new ControlDecode)

    TypeDecode.io.opcode := io.opcode
    ControlDecode.io.Rformat := TypeDecode.io.R_Type
    ControlDecode.io.load := TypeDecode.io.Load
    ControlDecode.io.Store := TypeDecode.io.Store
    ControlDecode.io.Branch := TypeDecode.io.Branch
    ControlDecode.io.Itype := TypeDecode.io.I_Type
    ControlDecode.io.JALR := TypeDecode.io.JALR
    ControlDecode.io.JAL := TypeDecode.io.JAL
    ControlDecode.io.Lui := TypeDecode.io.LUI

    io.MemWrite := ControlDecode.io.MemWrite
    io.BranchOut := ControlDecode.io.BranchOut
    io.MemRead := ControlDecode.io.MemRead
    io.RegWrite := ControlDecode.io.RegWrite
    io.MemtoReg := ControlDecode.io.MemtoReg
    io.ALUOP := ControlDecode.io.ALUOP
    io.operandAsel := ControlDecode.io.operandAsel
    io.operandBsel := ControlDecode.io.operandBsel
    io.extend_sel := ControlDecode.io.extend_sel
    io.next_PC_sel := ControlDecode.io.next_PC_sel
}