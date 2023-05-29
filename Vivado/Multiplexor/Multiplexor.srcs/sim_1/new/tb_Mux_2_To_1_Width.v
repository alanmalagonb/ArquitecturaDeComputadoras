`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Unidad de Aprendizaje: Arquitectura de Computadoras 
// Alumno: Alan Adrian Malagon Baeza
// Grupo: 5CV1
// Profesor: Miguel Angel Aleman Arce
// Module Name: tb_Mux_2_To_1_Width
// Target Devices: Artix
//
//////////////////////////////////////////////////////////////////////////////////

// Modulo de estimulo
module tb_Mux_2_To_1_Width();

localparam g_WIDTH = 8;
//Inputs
reg [1:0] i_Select;
reg [g_WIDTH-1:0] i_Data1;
reg [g_WIDTH-1:0] i_Data2;

//Outputs
wire [g_WIDTH-1:0] o_Data;

integer i;

Mux_2_To_1_Width #(
    .g_WIDTH(g_WIDTH)
    ) MUX0 (
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
     i_Select <= 0;
     i_Data1 <= $random;
     i_Data2 <= $random;
     for(i=0;i<2;i=i+1) begin
        #5; 
        i_Select = i;
     end
      #5;
      $finish;
  end
endmodule