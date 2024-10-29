module RegisterFile(
  input clk,
  input [2:0] rs1,rs2,rd,  //rs1,rs2 are sourse registers and rd is destination register
  input [18:0] write_data,
  input write_enable,
  output [18:0] data1,data2
);

reg [18:0] registers [7:0];   //8x19 bits registers

  assign data1 = registers[rs1];
    assign data2 = registers[rs2];
always @(posedge clk) begin
  if(write_enable)begin
     registers[rd]<=write_data;
  end
 end
endmodule
