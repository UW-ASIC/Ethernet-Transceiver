`default_nettype none


module RX_frame (

    input wire i_clk,
    input wire i_rstn,
    input wire din,

    output reg [1:0] orx_state,
    output reg [7:0] orx_byte,
    output reg [1:0] orx_status

);
endmodule