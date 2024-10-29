//Name:Basaveshappa U
//Email:basaveshu12345@gmail.com
//Title:19-bit CPU Architecture
//Type:Module
//-----------------------------------------------------------------------------------


module ALU(
	input[18:0]A,B,
	input [4:0] opcode,
	output reg [18:0] result,
	output reg zero,
	output reg negative
	    );

   always @(*) begin
	case(opcode)
	  5'b00001:result=A+B;
	  5'b00010:result=A-B;
	  5'b00011:result=A*B;
	  5'b00100:result=A/B;
	  5'b00101:result=A+1;
	  5'b00110:result=A-1;
	  5'b00111:result=A&B;	
	  5'b01000:result=A|B;
	  5'b01001:result=A^B;
	  5'b01010:result=~A;
	  default:result=19'b0;
	endcase

  zero=(result==19'b0);	//zero flag is set if result=0
  negative=result[18];	//negative flag is set if the MSB bit of result is 1
 end
endmodule
