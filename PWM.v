`timescale 1ns / 1ps

module PWM( input clk,
                input [0 : 31] OCRA,
                input [0 : 31] DC,
                output reg PWM);
reg [0 : 31] OCRB;
reg [0 : 31] counter;
reg [0 : 31] comparator;
reg [0 : 31] PreviousDC [0 : 1];
// OCRB = Duty Cycle
// OCRA = Frequency of the PWM
// Top of the PWM value can be OCRA or some other value
initial begin
OCRB = 32'd0; //Duty Cycle
counter = 32'd0;
comparator = 32'd0;
end

always @ (posedge clk) begin

    
    OCRB <= DC;
    counter <= counter + 32'd1;
    
    comparator <= (OCRA * OCRB) / 100;
    
    if(counter >= OCRA) begin
        counter <= 32'd0;
    end
 
    if(counter >= comparator) begin
        PWM <= 1'b0;
    end
    else begin
        PWM <= 1'b1;
    end
end

endmodule
