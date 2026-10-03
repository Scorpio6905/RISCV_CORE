package risc_v
import chisel3._
import chisel3.util._

class InstructionDecode extends Module {

  val io = IO(new Bundle {
    val opcode = Input(UInt(7.W))

    val R_Type = Output(Bool())
    val Load = Output(Bool())
    val Store = Output(Bool())
    val Branch = Output(Bool())
    val I_Type = Output(Bool())
    val JALR = Output(Bool())
    val JAL = Output(Bool())
    val LUI = Output(Bool())
  })

  io.R_Type := false.B
  io.Load := false.B
  io.Store := false.B
  io.Branch := false.B
  io.I_Type := false.B
  io.JALR := false.B
  io.JAL := false.B
  io.LUI := false.B


  switch(io.opcode) {

    is(51.U) {
      io.R_Type := true.B
    }

    is(19.U) {
      io.I_Type := true.B
    }

    is(35.U) {
      io.Store := true.B
    }

    is(99.U) {
      io.Branch := true.B
    }

    is(55.U) {
      io.LUI := true.B
    }

    is(111.U) {
      io.JAL := true.B
    }

    is(3.U) {
      io.Load := true.B
    }

    is(103.U) {
      io.JALR := true.B
    }

  }
}