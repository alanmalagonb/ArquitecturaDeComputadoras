module deco_ins(
   input [3:0] RI_i,
   output reg [0:7] DI_o
);

parameter AND=4'b0000, OR=4'b0001, XOR=4'b0010, SUMA=4'b0011, INV=4'b0100, HOLD=4'b0101, LOAD=4'b0110, RST=4'b0111, UNAB=4'b1000;

always @(RI_i)
    case (RI_i)
	   AND : DI_o = 8'b10000000;
		OR  : DI_o = 8'b01000000;
		XOR : DI_o = 8'b00100000;
		SUMA: DI_o = 8'b00010000;
		INV : DI_o = 8'b00001000;
		HOLD: DI_o = 8'b00000100;
		LOAD: DI_o = 8'b00000010;
		RST : DI_o = 8'b00000001;
		default: DI_o = 8'b00000000;   //Deshabilita DI
	endcase

endmodule


//Modulo de estimulo

module tb_deco_ins ();

//input
reg  [3:0] RI_i;

//output
wire [0:7] DI_o;

deco_ins uut(RI_i, DI_o);

initial 
  begin
    RI_i = 4'b1111;
	 #10
	 RI_i = 4'b0000;
	 #10
	 RI_i = 4'b0001;
	 #10
	 RI_i = 4'b0010;
	 #10
	 RI_i = 4'b0001;
	 #10
	 RI_i = 4'b0011;
	 #10
	 RI_i = 4'b0100;
	 #10
	 RI_i = 4'b0101;
  end
  
initial #70 $finish;

endmodule
	 