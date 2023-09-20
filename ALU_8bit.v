module ALU_8bit(A,B,result,carry,zflag,select);
  input [7:0]A,B;
  input [3:0]select
  output reg [15:0]result;
  output reg carry,zflag;

  parameter [2:0]ADD = 3'b000,SUB = 3'b001,MUL = 3'b010,AND = 3'b011,OR = 3'b100,NAND = 3'b101,NOR = 3'b110,XOR = 3'b111;

  always@(A or B or select) begin
    case(select) begin
      default begin
        result = 16'b0;
        carry = 1'b0;
        zflag = 1'b0;
      end
      ADD: begin
        result = A + B;
        carry = result[8];
        zflag = (result == 16'b0);
      end
      SUB: begin
        result = A - B;
        carry = result[8];
        zflag = (result == 16'b0);
      end
      MUL: begin
        result = A*B;
        zflag = (result == 16'b0);
      end
      AND: begin
        result = A&B;
        zflag = (result == 16'b0);
      end
      OR: begin
        result = A|B;
        zflag = (result == 16'b0);
      end
      NAND: begin
        result = ~(A&B);
        zflag = (result == 16'b0);
      end
      NOR: begin
        result = ~(A|B);
        zflag = (result == 16'b0);
      end
      XOR: begin
        result = A^B;
        zflag = (result == 16'b0);
      end
      endcase
    end
     
      endmodule
      
        
