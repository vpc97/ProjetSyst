`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:25 06/06/2018 
// Design Name: 
// Module Name:    bram16 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bram16 #(
	parameter init_file = "none",
	parameter adr_width = 11
) (
	input sys_clk,
	input sys_rst,
	
  input [15:0] do,
  output reg [15:0] di,
  input we,
  input [15:0] a
);

//-----------------------------------------------------------------
// Storage depth in 16 bit words
//-----------------------------------------------------------------
parameter word_width = adr_width - 1;
parameter word_depth = (1 << word_width);

//-----------------------------------------------------------------
// Actual RAM
//-----------------------------------------------------------------
reg [15:0] ram [0:word_depth-1];
wire [word_width-1:0] adr;

always @(posedge sys_clk) begin
  if (we) begin
    ram[adr] <= do;
  end
	di <= ram[adr];
end

assign adr = a[adr_width-2:0];

//-----------------------------------------------------------------
// RAM initialization
//-----------------------------------------------------------------
initial
begin
	if (init_file != "none")
	begin
		$readmemh(init_file, ram);
	end
end

endmodule