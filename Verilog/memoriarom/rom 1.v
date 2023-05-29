// Example: Behavioral Model of a 4x4 Synchronous Read Only Memory in Verilog
// Brock J. LaMeres, Introduction to Logic Circuits & Logic Design with Verilog,
// Springer, 1st Edition, USA, 2017.  pp 353

module rom (

input            clk,
input      [1:0] address,
output reg [3:0] data_out
);

always @(posedge clk)
  case (address)
    2'b00   : data_out = 4'b1110;
	 2'b01   : data_out = 4'b0010;
	 2'b10   : data_out = 4'b1111;
	 2'b11   : data_out = 4'b0100;
	 default : data_out = 4'bxxxx;
  endcase
  
endmodule

//Modulo de Estimulo

module tb_rom ();

reg        clk;
reg  [1:0] address;

wire [3:0] data_out;

rom uut(clk, address, data_out);

initial clk = 1'b0;

always #10 clk = ~clk;  //periodo de 20 unidades de tiempo

initial
  begin
    address = 2'b00;
	 #20
	 address = 2'b11;
	 #20
	 address = 2'b10;
	 #20
	 address = 2'b01;
  end
  
initial #80 $finish;

endmodule

