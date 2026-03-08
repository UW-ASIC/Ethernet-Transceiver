# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

# empty testbench to check that the test setup is working
@cocotb.test()
async def test_rx_frame(dut):
    dut._log.info("Start RX_frame test")

    # Set the clock period to 8 ns (125 MHz)
    clock = Clock(dut.clk, 8, units="ns")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.din.value = 0
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1

    dut._log.info("Test complete")
    
    # Wait a few cycles then pass
    await ClockCycles(dut.clk, 5)
