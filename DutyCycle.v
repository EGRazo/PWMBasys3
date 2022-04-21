`timescale 1ns / 1ps

module DutyCycle( input indexFlag,
                    output reg [0 : 31] DutyOut);
                    
reg [0 : 31] SinLut [ 0 : 110];
reg [0 : 31] counter;

initial begin
SinLut[0] = 0;
SinLut[1] = 143.534;
SinLut[2] = 286.595;
SinLut[3] = 428.71;
SinLut[4] = 569.41;
SinLut[5] = 708.233;
SinLut[6] = 844.718;
SinLut[7] = 978.417;
SinLut[8] = 1108.89;
SinLut[9] = 1235.7;
SinLut[10] = 1358.44;
SinLut[11] = 1476.69;
SinLut[12] = 1590.08;
SinLut[13] = 1698.21;
SinLut[14] = 1800.75;
SinLut[15] = 1897.34;
SinLut[16] = 1987.68;
SinLut[17] = 2071.45;
SinLut[18] = 2148.4;
SinLut[19] = 2218.25;
SinLut[20] = 2280.79;
SinLut[21] = 2335.8;
SinLut[22] = 2383.11;
SinLut[23] = 2422.56;
SinLut[24] = 2454.01;
SinLut[25] = 2477.37;
SinLut[26] = 2492.55;
SinLut[27] = 2499;
SinLut[28] = 2498;
SinLut[29] = 2488.7;
SinLut[30] = 2470.96;
SinLut[31] = 2445.07;
SinLut[32] = 2411.12;
SinLut[33] = 2369.21;
SinLut[34] = 2319.48;
SinLut[35] = 2262.11;
SinLut[36] = 2197.27;
SinLut[37] = 2125.18;
SinLut[38] = 2046.08;
SinLut[39] = 1960.23;
SinLut[40] = 1867.91;
SinLut[41] = 1769.43;
SinLut[42] = 1665.11;
SinLut[43] = 1555.3;
SinLut[44] = 1440.36;
SinLut[45] = 1320.67;
SinLut[46] = 1196.62;
SinLut[47] = 1068.62;
SinLut[48] = 937.095;
SinLut[49] = 802.48;
SinLut[50] = 665.217;
SinLut[51] = 525.761;
SinLut[52] = 384.569;
SinLut[53] = 242.109;
SinLut[54] = 98.8504;
SinLut[55] = 44.7345;
SinLut[56] = 188.172;
SinLut[57] = 330.988;
SinLut[58] = 472.713;
SinLut[59] = 612.878;
SinLut[60] = 751.021;
SinLut[61] = 886.687;
SinLut[62] = 1019.43;
SinLut[63] = 1148.8;
SinLut[64] = 1274.39;
SinLut[65] = 1395.77;
SinLut[66] = 1512.55;
SinLut[67] = 1624.34;
SinLut[68] = 1730.77;
SinLut[69] = 1831.49;
SinLut[70] = 1926.17;
SinLut[71] = 2014.49;
SinLut[72] = 2096.17;
SinLut[73] = 2170.93;
SinLut[74] = 2238.53;
SinLut[75] = 2298.74;
SinLut[76] = 2351.37;
SinLut[77] = 2396.25;
SinLut[78] = 2433.22;
SinLut[79] = 2462.16;
SinLut[80] = 2482.98;
SinLut[81] = 2495.6;
SinLut[82] = 2499;
SinLut[83] = 2496.14;
SinLut[84] = 2484.05;
SinLut[85] = 2463.77;
SinLut[86] = 2435.36;
SinLut[87] = 2398.91;
SinLut[88] = 2354.55;
SinLut[89] = 2302.42;
SinLut[90] = 2242.7;
SinLut[91] = 2175.58;
SinLut[92] = 2101.28;
SinLut[93] = 2020.04;
SinLut[94] = 1932.15;
SinLut[95] = 1837.88;
SinLut[96] = 1737.54;
SinLut[97] = 1631.48;
SinLut[98] = 1520.03;
SinLut[99] = 1403.56;
SinLut[100] = 1282.47;
SinLut[101] = 1157.15;
SinLut[102] = 1028;
SinLut[103] = 895.472;
SinLut[104] = 759.984;
SinLut[105] = 621.989;
SinLut[106] = 481.942;
SinLut[107] = 340.306;
SinLut[108] = 197.546;
SinLut[109] = 54.135;
SinLut[110] = 89.4547;
counter = 32'b0;
DutyOut = SinLut[0];
end

always @(posedge indexFlag) begin

    //DutyOut = SinLut value * OCRA Value
   if(counter == 32'd111) begin
    counter = 32'd0;
   end
    DutyOut = SinLut[counter];
    counter = counter + 32'd1;  
end

endmodule
