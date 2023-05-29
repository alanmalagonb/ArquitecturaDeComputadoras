`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// Module Name: tb_Mux_2_To_1
// Target Devices: Artix
//
//////////////////////////////////////////////////////////////////////////////////

// Modulo de estimulo
module tb_Mux_2_To_1();

//Inputs
reg [1:0] i_Select;
reg  i_Data1;
reg  i_Data2;

//Outputs
wire o_Data;

integer i;

//Instantiation of Unit Under Tes
Mux_2_To_1 mux0(
    .i_Select (i_Select),
    .i_Data1 (i_Data1),
    .i_Data2 (i_Data2),
    .o_Data (o_Data)
);

initial i_Data1 = 1'b0;
always #1 i_Data1 = ~i_Data1;

initial i_Data2 = 1'b0;
always #2 i_Data2 = ~i_Data2;

initial
  begin     
     for(i=0;i<2;i=i+1) begin
        i_Select = i;
        #5; 
     end
     $finish;
  end
endmodule
