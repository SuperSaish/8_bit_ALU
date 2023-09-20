
module tb_ALU_8bit;

  // Inputs
  reg [7:0] A;
  reg [7:0] B;
  reg [2:0] select;
  
  // Outputs
  wire [15:0] result;
  wire carry;
  wire zflag;

  // Instantiate the ALU_8bit module
  ALU_8bit uut (
    .A(A),
    .B(B),
    .select(select),
    .result(result),
    .carry(carry),
    .zflag(zflag)
  );

  // Test vectors
  initial begin
    // Test case 1: ADD operation
    A = 8'b01010101;
    B = 8'b10101010;
    select = 3'b000; // ADD operation
    #10;
    if (result === 16'b0000000011111111 && carry === 0 && zflag === 0)
      $display("Test case 1 (ADD) passed");
    else
      $display("Test case 1 (ADD) failed");

    // Test case 2: SUB operation
    A = 8'b10101010;
    B = 8'b01010101;
    select = 3'b001; // SUB operation
    #10;
    if (result === 16'b0000000001010101 && carry === 0 && zflag === 0)
      $display("Test case 2 (SUB) passed");
    else
      $display("Test case 2 (SUB) failed");

    // Test case 3: MUL operation
    A = 8'b01010101;
    B = 8'b10101010;
    select = 3'b010; // MUL operation
    #10;
    if (result === 16'b011100001110010 && zflag === 0)
      $display("Test case 3 (MUL) passed");
    else
      $display("Test case 3 (MUL) failed");

    // Test case 4: AND operation
    A = 8'b01010101;
    B = 8'b10101010;
    select = 3'b011; // AND operation
    #10;
    if (result === 16'b0000000000000000 && carry === 0 && zflag === 1)
      $display("Test case 4 (AND) passed");
    else
      $display("Test case 4 (AND) failed");

    // Add more test cases for OR, NAND, NOR, and XOR operations.

    // Test case 5: OR operation
    A = 8'b01010101;
    B = 8'b10101010;
    select = 3'b100; // OR operation
    #10;
    if (result === 16'b0000000011111111 && carry === 0 && zflag === 0)
      $display("Test case 5 (OR) passed");
    else
      $display("Test case 5 (OR) failed");

    // Test case 6: NAND operation
    A = 8'b01010101;
    B = 8'b10101010;
    select = 3'b101; // NAND operation
    #10;
    if (result === 16'b1111111111111111 && carry === 0 && zflag === 0)
      $display("Test case 6 (NAND) passed");
    else
      $display("Test case 6 (NAND) failed");

    // Test case 7: NOR operation
    A = 8'b01010101;
    B = 8'b10101010;
    select = 3'b110; // NOR operation
    #10;
    if (result === 16'b1111111100000000 && carry === 0 && zflag === 0)
      $display("Test case 7 (NOR) passed");
    else
      $display("Test case 7 (NOR) failed");

    // Test case 8: XOR operation
    A = 8'b01010101;
    B = 8'b10101010;
    select = 3'b111; // XOR operation
    #10;
    if (result === 16'b0000000011111111 && carry === 0 && zflag === 0)
      $display("Test case 8 (XOR) passed");
    else
      $display("Test case 8 (XOR) failed");

    // Finish simulation
    $finish;
  end

endmodule
