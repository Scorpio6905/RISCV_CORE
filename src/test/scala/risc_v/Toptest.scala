package risc_v

import chiseltest._
import org.scalatest.FreeSpec

class Toptest extends FreeSpec with ChiselScalatestTester {

  "runs 10 clock steps" in {
    test(new Top) { dut =>
      dut.clock.step(100)
    }
  }
}
