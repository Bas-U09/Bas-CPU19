//main cop module

module CPU(
    input clk,
    input reset,
    input [18:0] instruction,
    output [18:0] result,
    output zero,
    output negative
);
    reg [18:0] PC;
    wire [4:0] opcode;
    wire [2:0] r1, r2, r3;
    wire [18:0] data1, data2, alu_result;
    wire is_branch, is_mem_access, is_jump;

    RegisterFile reg_file(
        .clk(clk),
        .rs1(r2),
        .rs2(r3),
        .rd(r1),
        .write_data(alu_result),
        .write_enable(1) 
    );

    ALU alu(
        .A(data1),
        .B(data2),
        .opcode(opcode),
        .result(alu_result),
        .zero(zero),
        .negative(negative)
    );

    ControlUnit control(
        .instruction(instruction),
        .opcode(opcode),
        .r1(r1),
        .r2(r2),
        .r3(r3),
        .is_branch(is_branch),
        .is_mem_access(is_mem_access),
        .is_jump(is_jump)
    );

    
always @(posedge clk or posedge reset) begin
        if (reset) begin
         PC <= 0;
        end else begin
         if (is_jump) begin
            PC <= instruction[13:0]; // Jump address location
            end else if (is_branch) 
            begin
              if (opcode == 5'b10100 && zero) // BEQ instruction
                 PC <= instruction[13:0]; 
              else if (opcode == 5'b10101 && !zero) // BNE instruction
                  PC <= instruction[13:0]; 
              else
                  PC <= PC + 1; 
            end 
             else begin
             PC <= PC + 1; // Increment PC for regular instructions
end
end
end
endmodule

