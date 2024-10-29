module ControlUnit(
	input [18:0] instruction,
	output reg [4:0] opcode,
	output reg [2:0] r1,r2,r3,
	output reg is_branch
	output reg is_mem_access,
	output reg is_jump,
	);

always @(*) 
	begin
		opcode=instruction[18:14]; //the first 5 bits are assigned to opcode
		r1=instruction[13:11];  //remaining 3 bits for each registers
		r2=instruction[10:8]; 
		r3=instruction[7:5];	//remaining 5 bits could be used for immediate instructions (ADDI,SUBI)
		is_mem_access=(opcode==5'b01011||opcode==5'b01100); //load or store instructions
		is_branch=(opcode[4:2]==3'b101);// branch equations
		is_jump=(opcode==5;b11000);  //jmp instruction
end
endmodule 

