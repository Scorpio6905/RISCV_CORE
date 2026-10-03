package risc_v
import chisel3._
import chisel3.util._

class LM_IO_Interface_ImmdValGen extends Bundle {
    val instr = Input(UInt(32.W))
    val immd_se = Output(UInt(32.W))
}

class ImmdValGen extends Module {
    val io = IO ( new LM_IO_Interface_ImmdValGen )
    io.immd_se := 0.U
    val opcode = io.instr(6,0)
    switch(opcode) {
        is ("b0010011".U, "b0000011".U, "b1100111".U){  //I-type 
            val immbits = io.instr(31,20)
            val sign_ext = Fill(20, io.instr(31))
            io.immd_se := Cat(sign_ext, immbits) 
        }

        is ("b0100011".U) {   // S-type
            val immbits = Cat(io.instr(31,25), io.instr(11,7))
            val sign_ext = Fill(20, io.instr(31))
            io.immd_se := Cat(sign_ext, immbits)
        }

        is ("b1100011".U) {       // B-type
          val immbits = Cat(
                io.instr(31),
                io.instr(7),
                io.instr(30,25),
                io.instr(11,8),
                0.U(1.W))
          val sign_ext = Fill(19, io.instr(31))
          io.immd_se := Cat(sign_ext, immbits)
        }

        is ("b0110111".U, "b0010111".U) { // U-Type
            val immbits = io.instr(31, 12)
            val bit_ext = Fill(12, "b0".U)
            io.immd_se := Cat(immbits, bit_ext)
        }
        is ("b1101111".U) {   // UJ-Type
            val immbits = Cat(
                io.instr(31,30),
                io.instr(19,12),
                io.instr(20),
                io.instr(30,21),
                0.U(1.W) 
            )

            val sign_ext = Fill(11, io.instr(31))
            io.immd_se := Cat(sign_ext, immbits)
        }
    }
}
