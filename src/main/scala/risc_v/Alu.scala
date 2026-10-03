package risc_v

import chisel3._


class Alu extends Module {
	val io = IO(new Bundle {
		val alucontrol = Input(UInt(5.W))

		val InA = Input(SInt(32.W))
		val InB = Input(SInt(32.W))
		val output = Output(SInt(32.W))
		val Branch = Output(Bool())
	})

	// Add Addi
	when (io.alucontrol === "b00000".U) {
		io.output := io.InA + io.InB
	}.elsewhen (io.alucontrol === "b00001".U) {
		// Sll Slli
		io.output := (io.InA << io.InB.asUInt()(4,0))
	}.elsewhen (io.alucontrol === "b00100".U) {
		// Xor Xori
		io.output := io.InA ^ io.InB
	}.elsewhen (io.alucontrol === "b00101".U) {
		// Srl Srli
		io.output := (io.InA >> io.InB.asUInt()(4,0))
	}.elsewhen (io.alucontrol === "b01101".U) {
		// Sra Srai
		io.output := io.InA >> io.InB.asUInt()(4,0)
	}.elsewhen (io.alucontrol === "b00110".U) {
		// Or Ori
		io.output := io.InA | io.InB
	}.elsewhen (io.alucontrol === "b00111".U) {
		// And Andi
		io.output := io.InA & io.InB
	}.elsewhen (io.alucontrol === "b01000".U) {
		// Sub
		io.output := io.InA - io.InB
	}.elsewhen (io.alucontrol === "b11111".U) {
		// Jal Jalr
		io.output := io.InA
	}.elsewhen (io.alucontrol === "b10101".U) {
		// Bge
		when (io.InA >= io.InB) {
			io.output := 1.S
		}.otherwise {
			io.output := 0.S
		}
	}.elsewhen (io.alucontrol === "b10111".U) {
		// Bgeu
		when (io.InA.asUInt >= io.InB.asUInt) {
			io.output := 1.S
		}.otherwise {
			io.output := 0.S
		}
	}.elsewhen (io.alucontrol === "b00011".U || io.alucontrol === "b10110".U) {
		// Sltu Sltui OR Bltu
		when (io.InA.asUInt < io.InB.asUInt) {
			io.output := 1.S
		}.otherwise {
			io.output := 0.S
		}
	}.elsewhen (io.alucontrol === "b10000".U) {
		// Beq
		when (io.InA === io.InB) {
			io.output := 1.S
		}.otherwise {
			io.output := 0.S
		}
	}.elsewhen (io.alucontrol === "b00010".U || io.alucontrol === "b10100".U) {
		// Slt Slti OR Blt
		when (io.InA < io.InB) {
			io.output := 1.S
		}.otherwise {
			io.output := 0.S
		}
	}.elsewhen (io.alucontrol === "b10001".U) {
		// Bne
		when (io.InA =/= io.InB) {
			io.output := 1.S
		}.otherwise {
			io.output := 0.S
		}
	}.otherwise {
		io.output := DontCare
	}

	// Branch
	when (io.output === 1.S && io.alucontrol(4,3) === "b10".U) {
		io.Branch := 1.B
	}.otherwise {
		io.Branch := 0.B
	}
}