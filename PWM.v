`timescale 1s / 1s



module PWM ( input signed [0: 31] DUTY_CYCLE,
                input clk,
                output PWMWave);
                
parameter FREQUENCY = 500_000;              // Desired Frequency to drive
parameter CLK_FREQUENCY = 33_330_000;       //MiniZed Ocillator goes to 33.33Mhz
parameter SINE_FREQUENCY = 310;             //Sine frequency is desired to be 310Hz

parameter STEPS = CLK_FREQUENCY / FREQUENCY;

reg [0 : 31] DutyCycleCounter;
reg [0 : 31] PWMCounter = STEPS;
reg [0 : 31] Counter = 32'd0;
reg [0 : 31] DCCounter = 32'd0;
reg PWMOut;

initial begin

DutyCycleCounter = (DUTY_CYCLE * STEPS )/ 100;

end


always @(posedge clk) begin
//Reference Counter    
    Counter <= Counter + 1'd1;
//Comparator to toggle the PWM signal
    if(DutyCycleCounter > Counter) begin
        PWMOut = 1'b1;
    end
    
end

always @(DUTY_CYCLE) begin
//Always recalculate the DutyCycleCounter since we are assuming it's a dynamic range 
    DutyCycleCounter = (DUTY_CYCLE * STEPS )/ 100;
end
   assign PWMWave = PWMOut;             
endmodule