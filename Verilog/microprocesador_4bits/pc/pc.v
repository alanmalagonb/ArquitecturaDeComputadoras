module pc (
  input   rst_i,
  input   E_i,
  input   [0:7] DI_i,
  output reg [3:0] PC_o 
);

   always @(posedge rst_i or posedge E_i)
	   if (rst_i)
		   PC_o <= 4'b0000;
	   else if (DI_i == 8'b0000001)
		   PC_o <= 4'b0000;
		else if (E_i)
		   PC_o <= PC_o + 1;

endmodule

//Módulo de estímulo para program Counter
module tb_pc();
  reg rst_i, E_i;
  reg [0:7] DI_i;
  wire [3:0] PC_o;
  
  pc UUT(rst_i, E_i, DI_i, PC_o);
  
  initial E_i = 0;
  
  always #5 E_i = ~E_i;
  
  initial 
   begin
    rst_i=0; DI_i=8'b00000000;
    rst_i=1; DI_i=8'b00000001; #10
    rst_i=0; DI_i=8'b00000010; #10
    rst_i=0; DI_i=8'b00001000; #10
    rst_i=0; DI_i=8'b01000000; #10
    rst_i=0; DI_i=8'b00010000; #10
    rst_i=0; DI_i=8'b00100000; #10
	 rst_i=1; DI_i=8'b00100000; #10
	 rst_i=0; DI_i=8'b10000000; #10
	 rst_i=0; DI_i=8'b00000001; #10
    #10
    $finish;
  end
  
endmodule