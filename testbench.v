`timescale 1s / 1s
//////////////////////////////////////////////////////////////////////////////////
// Testbench for the PWM 
// 1Mhz = 1000 seconds
// 1Hz = 1 secconds
//////////////////////////////////////////////////////////////////////////////////


module testbench();

//SLOW_CLK SLOW_CLK(.clk(clk));
DutyCycle(.index(),.DutyOut(DC));
PWM PWM(.clk(clk),.PWM(PWMOut),.DUTY_CYCLE(DC));

wire PWMOut;
wire [0:31] DC;
reg clk;
initial begin
clk = 0;
#2000 $finish;
end

always begin
 #1 clk = ~clk;
end



endmodule
