`timescale 1ns / 1ps

/*

input clk,
                input [0 : 31] OCRA,
                input [0 : 31] DC,
                output reg PWM


*/

module testbench();

reg clk = 1'b0;
wire pwmOut;
reg [0 : 31] OCRA, DC;

PWM PWM (.clk(clk),.OCRA(OCRA),.DC(DC),.PWM(pwmOut));


initial begin
OCRA = 100; DC = 25;
#250 OCRA = 100; 
#100 DC = 100;
#1000 DC = 50;


end


always begin
#1 clk = ~clk;
end

endmodule
