//Modulo Acumulador Final
module acc (
   input D_i,
	input rst_i,
	input      [3:0] ACT_i,
	output reg [3:0] ACC_o
);	
		
  always @(posedge D_i or posedge rst_i)
    begin
	   if (rst_i)
        ACC_o <= 4'b0000;
		else
	     ACC_o <= ACT_i;
	 end

endmodule 

//Módulo de Estimulo Acumulador Final

module tb_acc ();
  reg        D_i;
  reg        rst_i; 
  reg  [3:0] ACT_i;
  wire [3:0] ACC_o;
  
  acc ACC1(D_i, ACT_i, ACC_o);

//  initial CLK = 1'b0; //Inicializamos el reloj
//  always #5 CLK = ~CLK;	//El ciclo del Reloj  (cambia cada 5 nS)
//  
  initial 
    begin

      	 D_i = 1'b0; ACT_i = 4'b0000;
      #25 D_i = 1'b0; ACT_i = 4'b0000;
      #5  D_i = 1'b1; ACT_i = 4'b1111;
      #25 D_i = 1'b0; ACT_i = 4'b1111;
      #25 D_i = 1'b0; ACT_i = 4'b0101;
      #25 D_i = 1'b1; ACT_i = 4'b1010;
		#5  D_i = 1'b0; ACT_i = 4'b1010;
		#25 D_i = 1'b0; ACT_i = 4'b1010;
      #25;
    end
  initial
    #250 $finish;
endmodule
      
