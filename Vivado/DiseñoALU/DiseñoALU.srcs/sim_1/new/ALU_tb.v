`timescale 1ns / 1ps
module ALU_tb;

  reg [7:0] A;
  reg [7:0] B;
  reg clk;
  reg [2:0] op;
  reg reset;
  reg start;
  wire done;
  wire [15:0] result;

  ALU dut (
    .A(A),
    .B(B),
    .clk(clk),
    .op(op),
    .reset(reset),
    .start(start),
    .done(done),
    .result(result)
  );

  initial begin
    $monitor("Time=%t, A=%h, B=%h, op=%b, result=%h, done=%b", $time, A, B, op, result, done);

    // Test case 1: Suma
    A = 8'h0A;
    B = 8'h05;
    op = 3'b000;  // Suma
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;

    // Test case 2: Resta
    A = 8'h0A;
    B = 8'h05;
    op = 3'b001;  // Resta
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;

    // Test case 3: Multiplicaci�n
    A = 8'h0A;
    B = 8'h05;
    op = 3'b010;  // Multiplicaci�n
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;

    // Test case 4: Operaci�n l�gica AND
    A = 8'h0A;
    B = 8'h05;
    op = 3'b011;  // Operaci�n l�gica AND
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;

    // Test case 5: Operaci�n l�gica OR
    A = 8'h0A;
    B = 8'h05;
    op = 3'b100;  // Operaci�n l�gica OR
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;

    // Test case 6: Operaci�n l�gica XOR
    A = 8'h0A;
    B = 8'h05;
    op = 3'b101;  // Operaci�n l�gica XOR
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;

    // Test case 7: Operaci�n NOP
    A = 8'h0A;
    B = 8'h05;
    op = 3'b110;  // Operaci�n NOP (no existe)
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;
    
    // Test case 7: Operaci�n NOP
    A = 8'h0A;
    B = 8'h05;
    op = 3'b110;  // Operaci�n NOP (no existe)
    reset = 1;
    start = 1;
    #10;
    start = 0;
    #20;

    $finish;
  end

  always begin
    #5 clk = ~clk;
  end

  initial begin
    clk = 0;
    #5;
    forever #10 clk = ~clk;
  end

endmodule
