`timescale 1ns / 1ps

module PWM_Gen #(parameter width = 32)
                  ( input clk,
                    input reset,
                    input [width - 1 : 0] signal_in,
                    output reg pwm_out,
                    output convert);
                    
reg [width - 1 : 0] count;
parameter count_max = 32'hFFFF_FFFF;
//Maximum count is equal to 100% Duty Cycle


always @ (posedge clk) begin
    if(reset == 1'b1) begin
        count <= 0;
    end
    
    else begin
        if(convert == 1'b1) begin
            count <= 0;
        end
        else begin
            count <= count + 1;
        end
        if(count < signal_in) begin
            pwm_out <= 1'b1;
        end
        else begin
            pwm_out <= 1'b0;
        end
    
        end
    
    end

assign convert = (count == count_max) ? 1'b1 : 1'b0;                       
                   
endmodule
