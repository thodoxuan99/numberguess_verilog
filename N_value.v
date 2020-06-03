module N_value(mode,submit_N,data_buffer,Nvalue,reset,counter);
input mode,submit_N;
input [16:0]data_buffer;
input reset;
input [31:0] counter;
output reg [16:0]Nvalue=0;
always@(*)
if(!reset) Nvalue<=17'b10000_0000_0000_0000;
else
begin
	if(mode) 
		begin
		if(!submit_N) Nvalue<=data_buffer;
		end
	else
		begin
			if(!submit_N)
			begin
			Nvalue[3:0]<=counter[3:0]%10;
			Nvalue[7:4]<=counter[7:4]%10;
			Nvalue[11:8]<=counter[11:8]%10;
			Nvalue[15:12]<=counter[15:12]%10;
			Nvalue[16]<=counter[16]%2;
			end
		end
end
endmodule
	