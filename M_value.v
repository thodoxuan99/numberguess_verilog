module M_value(submit_M,data_buffer,Mvalue,reset,counter_times);
input submit_M;
input [16:0]data_buffer;
input reset;
output reg[16:0]Mvalue=0; 
output reg [3:0]counter_times=0;
always@(negedge reset,negedge submit_M) 
begin
if(!reset) 
begin
Mvalue<=17'b10000_0000_0000_0000;
counter_times<=0;
end
else 
		begin
		Mvalue<=data_buffer;
		counter_times<=counter_times+1;
		end 
end
endmodule 
	