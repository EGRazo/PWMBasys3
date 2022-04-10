`timescale 1ns / 1ps
/*

    This is the module for holding the lut containing the possible duty cycle values
Unedited Table doing a whole 310Hz Sine Wave, values are split among 110 entries    
SinLut[0] = 0;
SinLut[0] =-0.0574136;
SinLut[0] =-0.114638;
SinLut[0] =-0.171484;
SinLut[0] =-0.227764;
SinLut[0] =-0.283293;
SinLut[0] =-0.337887;
SinLut[0] =-0.391367;
SinLut[0] =-0.443555;
SinLut[0] =-0.494281;
SinLut[0] =-0.543375;
SinLut[0] =-0.590677;
SinLut[0] =-0.63603;
SinLut[0] =-0.679285;
SinLut[0] =-0.720299;
SinLut[0] =-0.758937;
SinLut[0] =-0.79507;
SinLut[0] =-0.828581;
SinLut[0] =-0.859359;
SinLut[0] =-0.887301;
SinLut[0] =-0.912316;
SinLut[0] =-0.934321;
SinLut[0] =-0.953244;
SinLut[0] =-0.969022;
SinLut[0] =-0.981603;
SinLut[0] =-0.990946;
SinLut[0] =-0.99702;
SinLut[0] =-0.999804;
SinLut[0] =-0.999291;
SinLut[0] =-0.99548;
SinLut[0] =-0.988385;
SinLut[0] =-0.97803;
SinLut[0] =-0.964448;
SinLut[0] =-0.947684;
SinLut[0] =-0.927794;
SinLut[0] =-0.904843;
SinLut[0] =-0.878906;
SinLut[0] =-0.850071;
SinLut[0] =-0.81843;
SinLut[0] =-0.78409;
SinLut[0] =-0.747163;
SinLut[0] =-0.707771;
SinLut[0] =-0.666044;
SinLut[0] =-0.62212;
SinLut[0] =-0.576144;
SinLut[0] =-0.528266;
SinLut[0] =-0.478646;
SinLut[0] =-0.427447;
SinLut[0] =-0.374838;
SinLut[0] =-0.320992;
SinLut[0] =-0.266087;
SinLut[0] =-0.210304;
SinLut[0] =-0.153828;
SinLut[0] =-0.0968437;
SinLut[0] =-0.0395402;
SinLut[0] =0.0178938;
SinLut[0] =0.0752687;
SinLut[0] =0.132395;
SinLut[0] =0.189085;
SinLut[0] =0.245151;
SinLut[0] =0.300408;
SinLut[0] =0.354675;
SinLut[0] =0.407771;
SinLut[0] =0.459522;
SinLut[0] =0.509757;
SinLut[0] =0.55831;
SinLut[0] =0.605021;
SinLut[0] =0.649736;
SinLut[0] =0.692308;
SinLut[0] =0.732596;
SinLut[0] =0.770467;
SinLut[0] =0.805796;
SinLut[0] =0.838467;
SinLut[0] =0.868371;
SinLut[0] =0.895411;
SinLut[0] =0.919497;
SinLut[0] =0.940549;
SinLut[0] =0.958499;
SinLut[0] =0.973286;
SinLut[0] =0.984863;
SinLut[0] =0.99319;
SinLut[0] =0.998241;
SinLut[0] =0.999998;
SinLut[0] =0.998457;
SinLut[0] =0.993621;
SinLut[0] =0.985508;
SinLut[0] =0.974143;
SinLut[0] =0.959564;
SinLut[0] =0.94182;
SinLut[0] =0.920969;
SinLut[0] =0.897079;
SinLut[0] =0.87023;
SinLut[0] =0.84051;
SinLut[0] =0.808017;
SinLut[0] =0.772859;
SinLut[0] =0.735151;
SinLut[0] =0.695017;
SinLut[0] =0.652591;
SinLut[0] =0.608011;
SinLut[0] =0.561426;
SinLut[0] =0.512989;
SinLut[0] =0.462859;
SinLut[0] =0.411202;
SinLut[0] =0.358189;
SinLut[0] =0.303994;
SinLut[0] =0.248796;
SinLut[0] =0.192777;
SinLut[0] =0.136122;
SinLut[0] =0.0790185;
SinLut[0] =0.021654;
SinLut[0] =-0.0357819;

*/

module DutyCycle( input index,
                    output reg [0 : 31] DutyOut);
                    
reg [0 : 31] SinLut [ 0 : 120];
reg [0 : 31] counter;

initial begin
$readmemb("sineLUT.mem", SinLut);
counter = 32'b1;
end

always @(posedge index) begin

   counter <= counter + 32'd1;   
   if(counter == 32'd100) begin
    counter <= 32'd1;
   end
    DutyOut <= SinLut[counter];
end

endmodule
