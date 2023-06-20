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

    // Test case 3: Multiplicación
    A = 8'h0A;
    B = 8'h05;
    op = 3'b010;  // Multiplicación
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;

    // Test case 4: Operación lógica AND
    A = 8'h0A;
    B = 8'h05;
    op = 3'b011;  // Operación lógica AND
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;

    // Test case 5: Operación lógica OR
    A = 8'h0A;
    B = 8'h05;
    op = 3'b100;  // Operación lógica OR
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;

    // Test case 6: Operación lógica XOR
    A = 8'h0A;
    B = 8'h05;
    op = 3'b101;  // Operación lógica XOR
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;

    // Test case 7: Operación NOP
    A = 8'h0A;
    B = 8'h05;
    op = 3'b110;  // Operación NOP (no existe)
    reset = 0;
    start = 1;
    #10;
    start = 0;
    #20;
    
    // Test case 7: Operación NOP
    A = 8'h0A;
    B = 8'h05;
    op = 3'b110;  // Operación NOP (no existe)
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
