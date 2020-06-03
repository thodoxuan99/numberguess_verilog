module main(
reset,dataIN,timesIN,submit,submit1,submit2,shift,submit_N,submit_M,mode,clk,button,
lcd_data,lcd_en,lcd_rw,lcd_rs,
A0,B0,C0,D0,E0,F0,G0,
A1,B1,C1,D1,E1,F1,G1,
A2,B2,C2,D2,E2,F2,G2,
A3,B3,C3,D3,E3,F3,G3,
A4,B4,C4,D4,E4,F4,G4);
input reset,submit,submit1,submit2,shift,submit_N,submit_M,mode,clk,button;
input [3:0]dataIN;
input [3:0] timesIN;
output lcd_en,lcd_rw,lcd_rs;
output [7:0]lcd_data;
output A0,B0,C0,D0,E0,F0,G0,
A1,B1,C1,D1,E1,F1,G1,
A2,B2,C2,D2,E2,F2,G2,
A3,B3,C3,D3,E3,F3,G3,
A4,B4,C4,D4,E4,F4,G4;
wire [8*16:1] string;
wire [2:0]i;
wire [16:0] data_buffer;
wire [16:0] counter,NvalueBefo,MvalueBefo;
reg [16:0] NvalueAfter,MvalueAfter;
wire [3:0] counter_times;
wire [1:0]out;
wire signal;
databuffer block1(submit,dataIN,shift,data_buffer,reset,i);
display7segment block2(data_buffer,i,clk,
A0,B0,C0,D0,E0,F0,G0,
A1,B1,C1,D1,E1,F1,G1,
A2,B2,C2,D2,E2,F2,G2,
A3,B3,C3,D3,E3,F3,G3,
A4,B4,C4,D4,E4,F4,G4);
N_value block3(mode,submit_N,data_buffer,NvalueBefo,reset,counter);
counter block4(clk,counter);
M_value block5(submit_M,data_buffer,MvalueBefo,reset,counter_times);
comparator block6(NvalueAfter,MvalueAfter,out);
displayLCD block7(NvalueAfter,MvalueAfter,out,button,counter_times,timesIN,submit2,string);
LCD block8(string,button,submit1,clk,reset,lcd_data,lcd_rw,lcd_en,lcd_rs);
always@(negedge submit1)
begin
NvalueAfter<=NvalueBefo;
MvalueAfter<=MvalueBefo;
end
endmodule 