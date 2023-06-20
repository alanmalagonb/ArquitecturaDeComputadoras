`timescale 1ns / 1ps

module three_cycle_tb;

  // Inputs
  reg [7:0] A;
  reg [7:0] B;
  reg [2:0] op;
  reg clk;
  reg reset_n;
  reg start;
  
  // Outputs
  wire done;
  wire [15:0] result;

  // Instantiate the module
  three_cycle dut (
    .A(A),
    .B(B),
    .op(op),
    .clk(clk),
    .reset_n(reset_n),
    .start(start),
    .done(done),
    .result(result)
  );
  
  // Clock generation
  always #5 clk = ~clk;
  
// Stimulus
initial begin
  clk = 0;
  reset_n = 0;
  A = 8'd5;
  B = 8'd5;
  op = 3'b000;
  start = 1;
  #10
  start=0;
  reset_n = 1; // Release reset
  
  // Test case 1
  #20 A = 8'd5;
  B = A;
  op = 3'b000;
  start = 1;
  #10
  start = 0;
  
  // Test case 2
  #20 A = 8'd5;
  B = A;
  op = 3'b001;
  start = 1;
  #10 start = 0;
  
  // Test case 3
  #20 A = 8'd5;
  B = A;
  op = 3'b010;
  start = 1;
  #10 start = 0;
  
  // Test case 4
  #20 A = 8'd5;
  B = A;
  op = 3'b011;
  start = 1;
  #10 start = 0;
  
  // Test case 5
  #20 A = 8'd5;
  B = A;
  op = 3'b100;
  start = 1;
  #10 start = 0;
  
  // Test case 6
  #20 A = 8'd5;
  B = A;
  op = 3'b101;
  start = 1;
  #10 start = 0;
  
  // Test case 7
  #20 A = 8'd5;
  B = A;
  op = 3'b110;
  start = 1;
  #10 start = 0;
  
  #25
   $finish;
end

endmodule

