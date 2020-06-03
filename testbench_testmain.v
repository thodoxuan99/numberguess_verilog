module testbench_testmain();
reg mode,submit_N,submit_M,reset,submit2,submit1,button;
reg [16:0]data_buffer;
reg [3:0]timesIN;
wire [16*8:1]string;
test_main uut(mode,submit_N,submit_M,reset,timesIN,submit2,submit1,button,data_buffer,string);
initial 
begin
$monitor($time,"  timesIN = %d , databuffer = %h , submit_N = %b , submit_M = %b , reset = %b , mode = %b , string = %s ",timesIN,data_buffer,submit_N,submit_M,reset,mode,string);
mode=1;
timesIN=5;
reset=1;
submit_N=1;
submit_M=1;
submit2=1;
submit1=1;
button=1;
data_buffer=17'h10010;
#5 submit_N=0;
#6 submit1=0;
submit2=0;
#7 submit_N=1;
submit1=1;
submit2=1;
#10 data_buffer=17'h10015;
#11 submit_M=0;
submit1=0;
#12 submit_M=1;
submit1=1;
#20 data_buffer=17'h10007;
#21 submit_M=0;
submit1=0;
#22 submit_M=1;
submit1=1;

end

endmodule 