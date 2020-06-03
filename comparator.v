module comparator (in1,in2,out);
input [16:0]in1,in2;
output reg [1:0]out=2;
always@(*)
begin
	case ({in1[16],in2[16]})
	2'b11:out=in1[15:0]>in2[15:0]?1:
				 in1[15:0]<in2[15:0]?0:2;
	2'b00:out=in1[15:0]>in2[15:0]?0:
				 in1[15:0]<in2[15:0]?1:2;
	2'b01:out=0;
	2'b10:out=1;
	endcase
end
endmodule 