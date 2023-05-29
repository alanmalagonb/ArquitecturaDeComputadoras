//Behavioral Moderl of a 4x4 Synchronous Read Only Memory in Verilog
// Brock J. LaMeres, Introduction to Logic Circuits & Logic Design with Verilog, 
// Springer, 1st Edition, USA, 2017. pp 353

//modulo descriptivo
module rom (
input clk,
input [1:0] address,
output reg [3:0] data_out
);

reg [3:0] ROM [0:3];

initial 
  begin
    ROM[0] = 4'b1110;    //E
	 ROM[1] = 4'b0010;    //2
	 ROM[2] = 4'b1111;    //F
	 ROM[3] = 4'b0100;    //4
  end
  
always @(posedge clk)
  data_out = ROM[address];
  
endmodule


//Modulo de estimulo
module tb_rom ();

//Inputs
reg clk;
reg [1:0] address;

//Outputs
wire [3:0] data_out;

//Instantiation of Unit Under Test
rom uut(clk, address, data_out);

initial clk = 1'b0;

always #10 clk = ~clk;

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
  
endmodule
