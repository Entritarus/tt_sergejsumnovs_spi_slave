module tt_um_sergejsumnovs_spi_slave
  (input  [7:0] ui_in,
   input  [7:0] uio_in,
   input  ena,
   input  clk,
   input  rst_n,
   output [7:0] uo_out,
   output [7:0] uio_out,
   output [7:0] uio_oe);
  reg [7:0] ctr_reg;
  reg [7:0] ctr_next;
  wire n7_o;
  wire [7:0] n14_o;
  localparam [7:0] n15_o = 8'b00000000;
  localparam [7:0] n16_o = 8'b00000000;
  reg [7:0] n17_q;
  assign uo_out = ctr_reg; //(module output)
  assign uio_out = n15_o; //(module output)
  assign uio_oe = n16_o; //(module output)
  /* main.vhdl:20:10  */
  always @*
    ctr_reg = n17_q; // (isignal)
  initial
    ctr_reg = 8'b00000000;
  /* main.vhdl:20:19  */
  always @*
    ctr_next = n14_o; // (isignal)
  initial
    ctr_next = 8'b00000000;
  /* main.vhdl:24:14  */
  assign n7_o = ~rst_n;
  /* main.vhdl:33:23  */
  assign n14_o = ctr_reg + 8'b00000001;
  /* main.vhdl:27:7  */
  always @(posedge clk or posedge n7_o)
    if (n7_o)
      n17_q <= 8'b00000000;
    else
      n17_q <= ctr_next;
endmodule

