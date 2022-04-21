This is simply a readme file to document the formulas required for the user of this program to change it properly.
This is a Sin PWM, which means it is a PWM that simulates a Sin Wave. The specific frequency of this Sin wave is 310Hz. 

DutyCycle.v

This Verilog file contains the Sin Lookup Table that is being fed into the PWM system. These values are already configured
to a 310Hz sine wave. Attached below is the C++ code used to generate the digital sin values.

This file is the interrupt code that is to be executed when the interrupt in the PWM.v file is triggered. What this file
does is increment an internal counter that outputs the digitized sin value held at that point in the lookup table.
Please refer to the PWM.v file comments about the interrupt for more details.




#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    int OCRA = 2500;
    int sinHZ = 310;
    long double sine_table[151];
    for (int index = 0; index <= 110; index++)
    {
        sine_table[index] = (std::sin((3.1415) * 2 * sinHZ * (index))) * OCRA;
	
    }

  for(int index = 0; index <= 110; index++){
    cout << "SinLut[" << index <<"] = " <<sine_table[index] << ";" << "\n";
  }
    
}

Figure 1. C++ Code that generates a Sin Lookup Table for the DutyCycle module

#include <stdio.h>

void frequency (double HZ, double *sec){
  double temp = 1 / HZ;
  *sec = (temp * 1000000) * 1000; 
}

int main(void) {
  double HZ = 0;
  double seconds = 0;

  printf("Input HZ : \n");
  scanf("%lf" , &HZ);
  frequency(HZ, &seconds);
    printf("\n%.0lf ns period", seconds);
    printf("\nOCRA = %.0lf" , (seconds / 2));
  
}

Figure 2. C code that calculates OCRA and the period of the signal 



PWM.v

This Verilog file contains the sawtooth wave generator and the comparator needed to make the PWM signal.
The sawtooth wave is generated using the counter and the OCRA parameter. That parameter is simply the 
length of the signal in ns, divided by half since this is driven by the positive edge of the clock, 
because the timescale of the entire project is 1ns/1ps. 

OCRA is set in line 30 of this file.

OCRB is the duty cycle percentage, from 0 to 100, that the PWM is going to be operating at. This will eventually be 
a parameter like OCRA, but for testing purposes is an input fed into the file using a testbench. 

The Comparator is calculated by multiplying the duty cycle percent with the value of the sin being input into the module.

The interrupt works as follows.

Once the counter hits the value of the SIN the Sawtooth waveform is being compared too, it raises the flag. With the 
Flag raised it captures the new value of SIN that will be compared once the counter resets. The counter resets once 
it reaches the maximum value, OCRA, and then lowers the flag and resets the value. We wait until the counter reaches
OCRA instead of when the SIN value changes because we are still driving this at the frequency of OCRA and not the 
Sinwave.


