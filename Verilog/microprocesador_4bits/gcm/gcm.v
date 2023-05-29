module gcm (
   input clk,
	input rst_i,
	output reg A_o,
	output reg B_o,
	output reg C_o,
	output reg D_o,
   output reg E_o,
	output  [3:0] Q_o
);

reg [3:0] Q;

  always @(posedge clk or posedge rst_i)
    begin
      if (rst_i)  
	       Q <= 0;
	   else if (Q == 4'b0110)
		    Q <= 0;
	   else if (clk)
	       Q <= Q +1;	
	 end
	  
  always @(Q)
     case (Q) 
        4'b0000 :  begin A_o = 1'b1; E_o <= 1'b0; B_o <= 1'b0; C_o <= 1'b0; D_o <= 1'b0; end
		  4'b0001 : begin A_o <= 1'b0; E_o <= 1'b1; B_o <= 1'b0; C_o <= 1'b0; D_o <= 1'b0; end
		  4'b0010 : begin A_o <= 1'b0; E_o <= 1'b0; B_o <= 1'b1; C_o <= 1'b0; D_o <= 1'b0; end
		  4'b0011 : begin A_o <= 1'b0; E_o <= 1'b1; B_o <= 1'b0; C_o <= 1'b0; D_o <= 1'b0; end
		  4'b0100 : begin A_o <= 1'b0; E_o <= 1'b0; B_o <= 1'b0; C_o <= 1'b1; D_o <= 1'b0; end
		  default : begin A_o <= 1'b0; E_o <= 1'b0; B_o <= 1'b0; C_o <= 1'b0; D_o <= 1'b1; end
     endcase
	  
assign Q_o = Q;

endmodule 

//Módulo de Estimulo

module tb_gcm();
  reg clk, rst_i;
  wire A_o,B_o,C_o,D_o, E_o;
  wire [3:0] Q_o;
  
  gcm UC1(clk, rst_i, A_o, B_o, C_o, D_o, E_o, Q_o);
  
  initial clk = 1'b0; //Inicializamos el reloj
  always #5 clk = ~clk;	//El ciclo del Reloj  (cambia cada 5 nS)
  
  initial 
    begin
      	  rst_i = 1'b0;	
      #10   rst_i = 1'b1;
      #10   rst_i = 1'b1;
		#10   rst_i = 1'b1;
		#10   rst_i = 1'b1;
		#10   rst_i = 1'b1;
		#10  rst_i = 1'b1;
		#20  rst_i = 1'b0;

    #25;
    end
  initial
    #250 $finish;
endmodule
      
