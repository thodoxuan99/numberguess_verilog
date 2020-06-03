module displayLCD(Nvalue,Mvalue,out,button,counter_times,timesIN,submit2,string);//,D7,D6,D5,D4,D3,D2,D1,D0,RS,RW);
input [16:0]Nvalue,Mvalue;
input [1:0]out;
input button;
input [3:0]counter_times;
input [3:0]timesIN;
input submit2;
reg [3:0]timesIN_;
//output reg D7,D6,D5,D4,D3,D2,D1,D0,RS,RW;
integer i=0;
reg [8*16:1]string1="M < N ,con ";
reg [8*16:1]string2="M > N ,con ";
reg [8*16:1]string3="       N = ";
reg [8*16:1]string4="       M = ";
output reg [ 8*16:1]string={16{8'h20}};
wire [8*5:1] N_str,M_str,Times_Str;
convertInt_Str convertN(Nvalue,N_str);
convertInt_Str convertM(Mvalue,M_str);
convertInt_Str convertTime(timesIN_-counter_times,Times_Str);
always@(negedge submit2)
timesIN_<=timesIN;
always@( negedge button) 
begin
i=(i+1)%3;
end
always@(*)
begin
	case(i)
	0:
		if(counter_times>=timesIN_) string<="      LOSE      ";
		else string<=(out==1)?(((string1<<8)+Times_Str[8:1])<<(8*4))+" lan":
				(out==0)?(((string2<<8)+Times_Str[8:1])<<(8*4))+" lan":"      WIN       ";
	1: string<=(string3<<40)+N_str;
	2: string<=(string4<<40)+M_str;
	endcase
end
endmodule 				
	//((("         N lon hon M    Ban con ")<<8)+Times_Str[8:1])<<(8*5) + " lan ":			
//((("         M lon hon N    Ban con ")<<8)+Times_Str[8:1])<<(8*5) + " lan "
