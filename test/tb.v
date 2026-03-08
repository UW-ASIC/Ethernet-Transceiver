`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave or surfer.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg din;
  wire [1:0] orx_state;
  wire [7:0] orx_byte;
  wire [1:0] orx_status;

  // Instantiate RX_frame as the unit under test:
  RX_frame uut (
      .i_clk     (clk),       // clock
      .i_rstn    (rst_n),     // not reset
      .din       (din),       // serial data input
      .orx_state (orx_state), // RX state
      .orx_byte  (orx_byte),  // received byte
      .orx_status(orx_status) // RX status
  );

endmodule
