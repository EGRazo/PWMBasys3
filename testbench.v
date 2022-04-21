`timescale 1ns / 1ns

/*
Please refer to the readme file if there are any questions


*/

module testbench();

reg clk = 1'b0;
wire pwmOut, iFlagOut;
reg [0 : 31] OCRA, DC;
wire [0 : 31] MAX;

//PWM PWM (.clk(clk),.OCRA(OCRA),.DC(DC),.PWM(pwmOut));
PWM PWM (.clk(clk),.DC(DC),.PWM(pwmOut),.MAX(MAX),.iFlag(iFlagOut));
DutyCycle Duty (.indexFlag(iFlagOut),.DutyOut(MAX));

initial begin
DC = 50;
#5000 $finish;
end


always begin
#1 clk = ~clk;
end

endmodule
