package risc_v

import chisel3._
import chisel3.util._

class AluControl extends Module {
  val io = IO(new Bundle {
        val aluOp = Input(UInt(3.W))
        val funct3 = Input(UInt(3.W))
	    val funct7 = Input(Bool())
	    val out = Output(UInt(5.W))
	})

	io.out := 0.U

	switch(Cat(io.aluOp, io.funct7, io.funct3)) {
		is("b0000000".U, "b0010000".U) { io.out := "b00000".U } // Add, Addi
		is("b0000001".U, "b0010001".U) { io.out := "b00001".U } // SLL, SLLi
		is("b0000010".U, "b0010010".U) { io.out := "b00010".U } // SLT, SLTi
		is("b0100000".U, "b0101000".U) { io.out := "b10000".U } // BEQ
		is("b0100101".U, "b0101101".U) { io.out := "b10101".U } // BGE
		is("b0000100".U, "b0010100".U) { io.out := "b00100".U } // XOR, XORi
		is("b0000101".U, "b0010101".U) { io.out := "b00101".U } // SRL, SRLi
		is("b0000110".U, "b0010110".U) { io.out := "b00110".U } // OR, ORi
		is("b0000111".U, "b0010111".U) { io.out := "b00111".U } // AND, ANDi
	 	is("b0001000".U) { io.out := "b01000".U } // SUB
		is("b0001101".U, "b0011101".U) { io.out := "b01101".U } // SRA, SRAi
		is("b0000011".U, "b0010011".U) { io.out := "b00011".U } // SLTU, SLTUi
		is("b0100110".U, "b0101110".U) { io.out := "b10110".U } // BLTU
		is("b0100111".U, "b0101111".U) { io.out := "b10111".U } // BGEU
		is("b0100001".U, "b0101001".U) { io.out := "b10001".U } // BNE
		is("b0100100".U, "b0101100".U) { io.out := "b10100".U } // BLT
		is("b0110011".U) { io.out := "b11111".U } // JAL, JALR
	}
}