package risc_v
import chisel3._
import chisel3.util._


class ControlDecode extends Module {
    val io = IO(new Bundle {

        val Rformat = Input(Bool())
        val load = Input(Bool())
        val Store = Input(Bool())
        val Branch = Input(Bool())
        val Itype = Input(Bool())
        val JALR = Input(Bool())
        val JAL = Input(Bool())
        val Lui = Input(Bool())

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

  io.MemWrite := 0.B
  io.BranchOut := 0.B
  io.MemRead := 0.B
  io.RegWrite := 0.B
  io.MemtoReg := 0.B
  io.ALUOP := "b111".U
  io.operandAsel := "b00".U
  io.operandBsel := 0.B
  io.extend_sel := "b00".U
  io.next_PC_sel := "b00".U

  when(io.Rformat === 1.B){
    io.RegWrite := 1.B
    io.ALUOP := "b000".U
  }.elsewhen(io.load === 1.B){
     io.MemRead := 1.B
     io.RegWrite := 1.B
     io.MemtoReg := 1.B
     io.ALUOP := "b100".U
     io.operandBsel := 1.B
  }.elsewhen(io.Store === 1.B){
    io.MemWrite := 1.B
    io.ALUOP := "b101".U
    io.operandBsel := 1.B
    io.extend_sel := "b10".U
  }.elsewhen(io.Branch === 1.B){
    io.BranchOut := 1.B
    io.ALUOP := "b010".U
    io.next_PC_sel := "b01".U
  }.elsewhen(io.Itype === 1.B){
     io.RegWrite := 1.B
     io.ALUOP := "b001".U
     io.operandBsel := 1.B
  }.elsewhen(io.JALR === 1.B){
    io.RegWrite := 1.B
    io.ALUOP := "b011".U
    io.operandAsel := "b10".U
    io.next_PC_sel := "b11".U
  }.elsewhen(io.JAL === 1.B){
    io.RegWrite := 1.B
    io.ALUOP := "b011".U
    io.operandAsel := "b10".U
    io.next_PC_sel := "b10".U
  }.elsewhen(io.Lui === 1.B){
    io.RegWrite := 1.B
    io.ALUOP := "b100".U
    io.operandAsel := "b11".U
    io.operandBsel := 1.B
    io.extend_sel := "b01".U
  }.otherwise{
    io.RegWrite := 0.B
    io.ALUOP := "b111".U
    io.BranchOut := 0.B
    io.MemWrite := 1.B
    io.MemRead := 0.B
    io.MemtoReg := 0.B
    io.operandAsel := "b00".U
    io.operandBsel := 0.B
    io.extend_sel := "b00".U
    io.next_PC_sel := "b00".U
  }
}