package risc_v


import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import scala.io.Source


trait CONFIG {
    val WLEN = 32
    val INST_MEM_LEN = 1024

}

// object Generate_ProcessorTile extends App {
//     var initFile = "src/test/resources/main.txt"

//     chisel3.Driver.execute(args , () => new InstMem( initFile ))
// }

class InstMemIO extends Bundle with CONFIG{
    val addr = Input (UInt(WLEN.W))
    val inst = Output (UInt(WLEN.W))
                                       
}

class InstMem extends Module with CONFIG {
    val io = IO (new InstMemIO)

    // INST_MEM_LEN in Bytes or INST_MEM_LEN / 4 in words
    val imem = Mem (INST_MEM_LEN , UInt(WLEN.W))

    loadMemoryFromFile(imem , "main.txt")
    
    io.inst := imem(io.addr / 4.U)  
}
