module counter(clk,counter);
input clk;
output reg [31:0] counter=0;
always@(posedge clk)
counter<=counter+1;
endmodule
