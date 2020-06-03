module databuffer(submit,dataIN,shift,data_buffer,reset,i);
input submit,shift,reset;
input [3:0]dataIN;
output reg [16:0] data_buffer=0;
output reg [2:0] i=0;
always@(negedge submit, negedge shift,negedge reset)
if( !reset) 
	begin
	i<=0;
	data_buffer<=17'h10000;
	end
else
	begin
	if (!submit) 
		begin
		case (i)
				0:data_buffer[3:0]<=dataIN%10;
				1:data_buffer[7:4]<=dataIN%10;
				2:data_buffer[11:8]<=dataIN%10;
				3:data_buffer[15:12]<=dataIN%10;
				4:data_buffer[16]<=dataIN%10;
		endcase
	
		end
	else if (!shift) i<=(i+1)%5;
end
endmodule 
