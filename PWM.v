`timescale 1s / 1s


module PWM ( input signed [0: 31] DUTY_CYCLE,
                input clk,
                output PWMWave,
                output [0:31] counter);
                
parameter FREQUENCY = 500_000;              // Desired Frequency to drive
parameter CLK_FREQUENCY = 33_330_000;       //MiniZed Ocillator goes to 33.33Mhz
parameter SINE_FREQUENCY = 310;             //Sine frequency is desired to be 310Hz

parameter STEPS = CLK_FREQUENCY / FREQUENCY;

reg [0 : 31] DutyCycleCounter;
reg [0 : 31] PWMCounter = STEPS;
reg [0 : 31] Counter = 32'd0;
reg [0 : 31] DCCounter = 32'd0;
reg [0 : 31] sinClk = 32'd0;
reg PWMOut;


reg [0 : 31] SinLut [ 0 : 101];
reg [0 : 31] counterSin = 32'd0;

initial begin
$readmemb("sineLUT.mem", SinLut);
counterSin = 32'd1;
end

always @(posedge clk) begin


DutyCycleCounter <= SinLut[counterSin];

//Reference Counter    
    Counter <= Counter + 32'd1000;
    
//Comparator to toggle the PWM signal
    if(DutyCycleCounter > Counter) begin
        PWMOut <= 1'b1;
        //Counter <= 32'd0;
        
    end
    else begin 
        PWMOut <= 1'b0;
        counterSin <= counterSin + 32'd1;
        if(counterSin == 32'd100) begin
            counterSin <= 32'd0;
        end
    end
    
end

   assign PWMWave = PWMOut;
  // assign counter = Counter;
   
               
endmodule



/*
module PWM ( input signed [0: 31] DUTY_CYCLE,
                input clk,
                input reset,
                output reg PWMWave,
                output convert);

reg [31:0] cnt;
parameter cnt_max_c = 32'hFFFF_FFFF;
always@(posedge clk)
    begin
if(reset == 1'b1)
    cnt <= 0;
else
      if(convert == 1'b1) 
      begin
            cnt <= 0;
      end
      else
         cnt <= cnt +1;
      if(cnt < DUTY_CYCLE)
        PWMWave <= 1'b1;
      else
        PWMWave <= 1'b0;
end 
  
//decode max counter value and output the pwm conversion start
assign convert = (cnt == cnt_max_c) ? 1'b1 : 1'b0;

endmodule

*/