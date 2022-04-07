`timescale 1s / 1s
//////////////////////////////////////////////////////////////////////////////////
// Testbench for the PWM 
// 1Mhz = 1000 seconds
// 1Hz = 1 secconds
//////////////////////////////////////////////////////////////////////////////////


module testbench();

wire PWMOut;
wire [0:31] DC;
reg clk;

//SLOW_CLK SLOW_CLK(.clk(clk));
DutyCycle DutyCycle(.index(PWMOut),.DutyOut(DC));
PWM PWM(.clk(clk),.PWMWave(PWMOut),.DUTY_CYCLE(DC));

initial begin
clk = 0;
#2000 $finish;
end

always begin
 #1 clk = ~clk;
end



endmodule
