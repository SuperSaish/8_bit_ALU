//ADD  = 3'b000
//SUB  = 3'b001
//MUL  = 3'b010
//AND  = 3'b011
//OR   = 3'b100
//NAND = 3'b101
//NOR  = 3'b110
//XOR  = 3'b111

module ALU_8bit(
  input [7:0] A, B,
  input [2:0] select,
  output reg [15:0] result,
  output reg carry, zflag
);

always @(A or B or select) begin
  case (select) 
    3'b000: begin 
      result = A + B;
    end
    3'b001: begin
      result = A - B;
    end
    3'b010: begin
      result = A * B;
    end
    3'b011: begin
      result = A & B;
    end
    3'b100: begin
      result = A | B;
    end
    3'b101: begin
      result = ~(A & B);
    end
    3'b110: begin
      result = ~(A | B);
    end
    3'b111: begin
      result = A ^ B;
    end
    default: begin
      result = 16'b0;
    end
  endcase
  zflag = (result == 16'b0);
  
  if (select == 3'b000 || select == 3'b001) begin
    carry = result[8];
  end else begin
    carry = 1'b0;
  end
end

endmodule
