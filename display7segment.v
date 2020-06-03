module display7segment(databuffer,i,CLK,
A0,B0,C0,D0,E0,F0,G0,
A1,B1,C1,D1,E1,F1,G1,
A2,B2,C2,D2,E2,F2,G2,
A3,B3,C3,D3,E3,F3,G3,
A4,B4,C4,D4,E4,F4,G4);
input [16:0]databuffer;
input [2:0]i;
input CLK;
output reg A0,B0,C0,D0,E0,F0,G0,
A1,B1,C1,D1,E1,F1,G1,
A2,B2,C2,D2,E2,F2,G2,
A3,B3,C3,D3,E3,F3,G3,
A4,B4,C4,D4,E4,F4,G4;
integer j=0;
reg w1=0;
always @( posedge CLK) 
begin
j=(j+1)%50000000;
if(j>25000000) w1=1;else w1=0;
end
always@(*)
begin
if(i==0)
	begin
	{A4,B4,C4,D4,E4,F4,G4}<=_7segment(databuffer[16],0);
	{A3,B3,C3,D3,E3,F3,G3}<=_7segment(databuffer[15:12],1);
	{A2,B2,C2,D2,E2,F2,G2}<=_7segment(databuffer[11:8],1);
	{A1,B1,C1,D1,E1,F1,G1}<=_7segment(databuffer[7:4],1);
	{A0,B0,C0,D0,E0,F0,G0}<=_7segment(databuffer[3:0],1);
	if(w1==1) {A0,B0,C0,D0,E0,F0,G0}<=_7segment(databuffer[3:0],1);
	else {A0,B0,C0,D0,E0,F0,G0}<=_7segment(1,0);
	end
else if(i==1)
	begin
	{A4,B4,C4,D4,E4,F4,G4}<=_7segment(databuffer[16],0);
	{A3,B3,C3,D3,E3,F3,G3}<=_7segment(databuffer[15:12],1);
	{A2,B2,C2,D2,E2,F2,G2}<=_7segment(databuffer[11:8],1);
	{A0,B0,C0,D0,E0,F0,G0}<=_7segment(databuffer[3:0],1);
	{A1,B1,C1,D1,E1,F1,G1}<=_7segment(databuffer[7:4],1);
	if(w1==1) {A1,B1,C1,D1,E1,F1,G1}<=_7segment(databuffer[7:4],1);
	else {A1,B1,C1,D1,E1,F1,G1}<=_7segment(1,0);
	end
else if(i==2)
	begin
	{A4,B4,C4,D4,E4,F4,G4}<=_7segment(databuffer[16],0);
	{A3,B3,C3,D3,E3,F3,G3}<=_7segment(databuffer[15:12],1);
	{A1,B1,C1,D1,E1,F1,G1}<=_7segment(databuffer[7:4],1);
	{A0,B0,C0,D0,E0,F0,G0}<=_7segment(databuffer[3:0],1);
	{A2,B2,C2,D2,E2,F2,G2}<=_7segment(databuffer[11:8],1);
	if(w1==1) {A2,B2,C2,D2,E2,F2,G2}<=_7segment(databuffer[11:8],1);
	else {A2,B2,C2,D2,E2,F2,G2}<=_7segment(1,0);
	end
else if(i==3)
	begin
	{A4,B4,C4,D4,E4,F4,G4}<=_7segment(databuffer[16],0);
	{A2,B2,C2,D2,E2,F2,G2}<=_7segment(databuffer[11:8],1);
	{A1,B1,C1,D1,E1,F1,G1}<=_7segment(databuffer[7:4],1);
	{A0,B0,C0,D0,E0,F0,G0}<=_7segment(databuffer[3:0],1);
	{A3,B3,C3,D3,E3,F3,G3}<=_7segment(databuffer[15:12],1);
	if(w1==1) {A3,B3,C3,D3,E3,F3,G3}<=_7segment(databuffer[15:12],1);
	else {A3,B3,C3,D3,E3,F3,G3}<=_7segment(1,0);
	end
else if(i==4)
	begin
	{A3,B3,C3,D3,E3,F3,G3}<=_7segment(databuffer[15:12],1);
	{A2,B2,C2,D2,E2,F2,G2}<=_7segment(databuffer[11:8],1);
	{A1,B1,C1,D1,E1,F1,G1}<=_7segment(databuffer[7:4],1);
	{A0,B0,C0,D0,E0,F0,G0}<=_7segment(databuffer[3:0],1);
	{A4,B4,C4,D4,E4,F4,G4}<=_7segment(databuffer[16],0);
	if(w1==1) {A4,B4,C4,D4,E4,F4,G4}<=_7segment(databuffer[16],0);
	else {A4,B4,C4,D4,E4,F4,G4}<=_7segment(1,0);
	end
end


function [6:0]_7segment;
input [3:0]value;
input mode;
_7segment=(mode==0&&value==0)?7'b1111110:
						(mode==0&&value==1)?7'b1111111:
					 (value==0)?7'b0000001:
					 (value==1)?7'b1001111:
					 (value==2)?7'b0010010:
					 (value==3)?7'b0000110:
					 (value==4)?7'b1001100:
					 (value==5)?7'b0100100:
					 (value==6)?7'b0100000:
					 (value==7)?7'b0001111:
					 (value==8)?7'b0000000:
					 (value==9)?7'b0000100:1;
endfunction  
endmodule 