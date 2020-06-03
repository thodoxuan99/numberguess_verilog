module convertInt_Str(M,out);
input [17:1] M;
output   [8*5:1]out;
assign out[8:1]=M[4:1]+48;
assign out[16:9]=M[8:5]+48;
assign out[24:17]=M[12:9]+48;
assign out[32:25]=M[16:13]+48;
assign out[40:33]=(M[17]==0)?45:43;
endmodule 