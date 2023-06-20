module single_cycle(
  input [7:0] A,
  input [7:0] B,
  input clk,
  input [2:0] op,
  input reset,
  input start,
  output reg done,
  output reg [15:0] result
);

always @(posedge clk)
begin
  if (reset) begin
    result <= 16'b0;
    done <= 0;
  end
  else if (start) begin
    case (op)
      3'b000: begin // Operación lógica AND
        result <= A & B;
      end

      3'b001: begin // Operación lógica OR
        result <= A | B;
      end

      3'b010: begin // Operación lógica XOR
        result <= A ^ B;
      end

      3'b011: begin // Operación aritmética suma
        result <= A + B;
      end

      3'b100: begin // Operación aritmética resta
        result <= A - B;
      end

      3'b101: begin // Operación aritmética multiplicación
        result <= A * B;
      end

      default: begin // Operación NOP
        result <= 16'bX;
      end
    endcase
    done <= 1;
  end
  else begin
    done <= 0;
  end
end

endmodule