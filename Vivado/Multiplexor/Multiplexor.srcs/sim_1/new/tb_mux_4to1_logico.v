`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// 
// Module Name: mux_4to1_logico
// Target Devices: Artix
//
//////////////////////////////////////////////////////////////////////////////////

module tb_mux_4to1_logico();
    
    //Inputs
reg [1:0] i_Select;
reg  i_Data1;
reg  i_Data2;
reg  i_Data3;
reg  i_Data4;

//Outputs
wire o_Data;

integer i;

mux_4to1_logico mux0(
    .i_Select (i_Select),
    .i_Data1 (i_Data1),
    .i_Data2 (i_Data2),
    .i_Data3 (i_Data3),
    .i_Data4 (i_Data4),
    .o_Data (o_Data)
);

initial i_Data1 = 1'b0;
always #1 i_Data1 = ~i_Data1;

initial i_Data2 = 1'b0;
always #2 i_Data2 = ~i_Data2;

initial i_Data3 = 1'b0;
always #3 i_Data3 = ~i_Data3;

initial i_Data4 = 1'b0;
always #4 i_Data4 = ~i_Data4;

initial
  begin     
     for(i=0;i<4;i=i+1) begin
        i_Select = i;
        #5; 
     end
     $finish;
  end
endmodule
