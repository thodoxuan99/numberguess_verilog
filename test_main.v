module test_main(mode,submit_N,submit_M,reset,timesIN,submit2,submit1,button,data_buffer,string);
input mode,submit_N,submit_M,reset,submit2,submit1,button;
input [16:0]data_buffer;
input [3:0]timesIN;
output [8*16:1] string;
wire [16:0]NvalueBefo,MvalueBefo;
reg [16:0] NvalueAfter,MvalueAfter;
wire [1:0]out;
wire [3:0] counter_times;
N_value block3(mode,submit_N,data_buffer,NvalueBefo,reset,);
M_value block5(submit_M,data_buffer,MvalueBefo,reset,counter_times);
comparator block6(NvalueAfter,MvalueAfter,out);
displayLCD block7(NvalueAfter,MvalueAfter,out,button,counter_times,timesIN,submit2,string);
always@(negedge submit1)
begin
NvalueAfter<=NvalueBefo;
MvalueAfter<=MvalueBefo;
end
endmodule 