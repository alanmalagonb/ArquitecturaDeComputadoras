module alu (
  input [0:7] DI_i,
  input [3:0] RD_i,
  input [3:0] ACC_i,
  output reg [3:0] OP_o
);

parameter AND = 8'b10000000, OR = 8'b01000000, XOR = 8'b00100000, SUM = 8'b00010000;
parameter INV = 8'b00001000, HOLD = 8'b00000100; 

//Opcion if 
 always @(DI_i, ACC_i, RD_i)
   begin 
     if (DI_i == AND)
	     OP_o = ACC_i & RD_i;  //AND
	  else if (DI_i == OR)
	     OP_o = ACC_i | RD_i;  // OR
	  else if (DI_i == XOR)
	     OP_o = ACC_i ^ RD_i;  //XOR
	  else if (DI_i == SUM)
	     OP_o = ACC_i + RD_i;  // SUMA
	  else if (DI_i == INV)
	     OP_o = ~ACC_i;     // INVIERTE 
	  else if (DI_i == HOLD)
	     OP_o = ACC_i;     // HOLD
	  else 
	     OP_o = RD_i;      // CARGA ACUMULADOR
   end

//Opcion case
//
//   always @(DI_i,ACC_i, RD_i)
//	  begin
//	   case (DI_i)
//		  AND  : OP_o = ACC_i & RD_i;
//		  OR   : OP_o = ACC_i | RD_i;
//		  XOR  : OP_o = ACC_i ^ RD_i;
//		  SUM  : OP_o = ACC_i + RD_i;
//		  INV  : OP_o = ~ACC_i;
//		  HOLD : OP_o = ACC_i;
//		  default : OP_o = RD_i;
//      endcase
//	  end


endmodule

//Módulo de Estimulo para la alu

module tb_alu();
  reg  [0:7] DI_i;
  reg  [3:0] RD_i, ACC_i;
  wire [3:0] OP_o;
  
  alu alu1(DI_i, RD_i, ACC_i, OP_o);
  
  initial 
    begin
      	 DI_i = 8'b00000000; RD_i = 4'b0000; ACC_i = 4'b0000;
      #25 DI_i = 8'b10000000; RD_i = 4'b1010; ACC_i = 4'b0101;  //AND
      #25 DI_i = 8'b01000000; RD_i = 4'b1010; ACC_i = 4'b0101;  //OR
      #25 DI_i = 8'b00100000; RD_i = 4'b1010; ACC_i = 4'b1010;  //XOR
      #25 DI_i = 8'b00010000; RD_i = 4'b0001; ACC_i = 4'b0001;  //ADD
      #25 DI_i = 8'b00001000; RD_i = 4'b0000; ACC_i = 4'b0000;  //INV
		#25 DI_i = 8'b00000100; RD_i = 4'b0000; ACC_i = 4'b0000;  //HOLD
	   #25 DI_i = 8'b00000010; RD_i = 4'b1000; ACC_i = 4'b0000;	 //CARGA
		#25 DI_i = 8'b00000001; RD_i = 4'b0011; ACC_i = 4'b0000;  // CARGA
    #25;
    end
  initial
    #250 $finish;
endmodule
      
