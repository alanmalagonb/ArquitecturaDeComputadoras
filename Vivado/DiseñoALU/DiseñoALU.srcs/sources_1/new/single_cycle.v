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
      3'b000: begin // Operaci�n l�gica AND
        result <= A & B;
      end

      3'b001: begin // Operaci�n l�gica OR
        result <= A | B;
      end

      3'b010: begin // Operaci�n l�gica XOR
        result <= A ^ B;
      end

      3'b011: begin // Operaci�n aritm�tica suma
        result <= A + B;
      end

      3'b100: begin // Operaci�n aritm�tica resta
        result <= A - B;
      end

      3'b101: begin // Operaci�n aritm�tica multiplicaci�n
        result <= A * B;
      end

      default: begin // Operaci�n NOP
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