`timescale 1ns / 1ps
module three_cycle(
  input [7:0] A,
  input [7:0] B,
  input [2:0] op,
  input clk,
  input reset_n,
  input start,
  output done,
  output reg [15:0] result
);

reg [7:0] a_init, b_init;
reg [15:0] result1, result2;
reg done3, done2, done1, done_mult_init;

always @(posedge clk, negedge reset_n) begin
if (!reset_n) begin
  done_mult_init <= 0;
  done3 <= 0;
  done2 <= 0;
  done1 <= 0;
  a_init <= 0;
  b_init <= 0;
  result1 <= 0;
  result2 <= 0;
  result <= 0;
end
else if (clk) begin
  a_init <= A;
  b_init <= B;
    
  case (op)
      3'b000: begin // Operación lógica AND
        result1 <= a_init & b_init;
        result2 <= result1;
      end
      
      3'b001: begin // Operación lógica OR
        result1 <= a_init | b_init;
        result2 <= result1;
      end
      
      3'b010: begin // Operación lógica XOR
        result1 <= a_init ^ b_init;
        result2 <= result1;
      end
      
      3'b011: begin // Operación aritmética suma
        result1 <= a_init + b_init;
        result2 <= result1;
      end
      
      3'b100: begin // Operación aritmética resta
        result1 <= a_init - b_init;
        result2 <= result1;
      end
      
      3'b101: begin // Operación aritmética multiplicación
        result1 <= a_init * b_init;
        result2 <= result1;
      end
      default: begin // Operación NOP
        result1 <= 16'bX;
        result2 <= result1;
      end
    endcase
  
  result <= result2;
  done3 <= start & (~done_mult_init);
  done2 <= done3 & (~done_mult_init);
  done1 <= done2 & (~done_mult_init);

end
end

assign done = done1 & (~start);

endmodule
