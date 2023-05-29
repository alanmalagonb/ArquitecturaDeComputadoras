module mp4b (

	input rst,
	input clk,
	
	input [3:0] DM,
	
	output A_out,
	output B_out,
	output C_out,
	output D_out,
	output E_out,

	output  [0:7] DI_out,
	output  [3:0] RI_out,
   output  [3:0] RD_out,
   output  [3:0] ACC_out,
   output  [3:0] ACT_out,
   output  [3:0] OP_out,	
	output  [3:0] Q_out,
	output  [3:0] PC_o
);

wire [3:0] RD, RI, ACC, ACT, OP, Q, PC;
wire A, B, C, D, E;
wire [0:7] DI;

acc acc1 (.D_i(D), .rst_i(rst), .ACT_i(ACT), .ACC_o(ACC));
act act1 (.C_i(C), .rst_i(rst), .OP_i(OP), .ACT_o(ACT));
alu alu1 (.DI_i(DI), .RD_i(RD), .ACC_i(ACC), .OP_o(OP));
reg_dat RD1 (.B_i(B), .rst_i(rst), .DM_i(DM), .RD_o(RD));
reg_ins RI1 (.A_i(A), .rst_i(rst), .DM_i(DM), .RI_o(RI));
deco_ins DEEC (.RI_i(RI), .DI_o(DI));
gcm UC1 (.clk(clk), .rst_i(rst), .A_o(A), .B_o(B), .C_o(C), .D_o(D), .E_o(E), .Q_o(Q));
pc UPC (.rst_i(rst), .E_i(E), .DI_i(DI), .PC_o(PC));

assign DM_out = DM;
assign DI_out = DI;
assign RI_out = RI;
assign RD_out = RD;
assign ACC_out = ACC;
assign ACT_out = ACT;
assign OP_out = OP;
assign A_out = A;
assign B_out = B;
assign C_out = C;
assign D_out = D;
assign E_out = E;
assign Q_out = Q;
assign PC_o = PC;

endmodule

//Módulo de Estimulo para m4b (Microprocesador de 4 bits

module tb_m4b ();
   reg rst;
	reg clk;
	reg [3:0] DM;
	
	wire        A_out;
	wire        B_out;
	wire        C_out;
	wire        D_out;
	wire        E_out;
	wire  [0:7] DI_out;
	wire  [3:0] RI_out;
   wire  [3:0] RD_out;
   wire  [3:0] ACC_out;
   wire  [3:0] ACT_out;
   wire  [3:0] OP_out;	
	wire  [3:0] Q_out;
	wire  [3:0] PC_o;
  
  mp4b m4b1(rst, clk, DM, A_out, B_out, C_out, D_out, E_out, DI_out, RI_out, RD_out, ACC_out, ACT_out, OP_out, Q_out, PC_o);

  initial clk = 1'b0; //Inicializamos el reloj
  always #5 clk = ~clk;	//El ciclo del Reloj  (cambia cada 5 nS)
//  
  initial 
    begin

      	 rst=1'b0; DM=4'b0000;
	   #10 rst=1'b1; DM=4'b0001;
	   #10 rst=1'b0; DM=4'b0010;
	   #10 rst=1'b0; DM=4'b0100;
      #10 rst=1'b0; DM=4'b0000; 
      #10 rst=1'b0; DM=4'b0100;
      #10 rst=1'b0; DM=4'b0010; 
      #10 rst=1'b0; DM=4'b0100;
      #10 rst=1'b0; DM=4'b0010;
      #10 rst=1'b0; DM=4'b0100;
		#10 rst=1'b0; DM=4'b0010;
		#10 rst=1'b0; DM=4'b0100;
	   #10 rst=1'b0; DM=4'b0010;
		#10 rst=1'b0; DM=4'b0100;
		#10 rst=1'b0; DM=4'b0010;
      #25;
    end
  initial
    #250 $finish;
endmodule
      
