# Task 3 - - Exploring the clktick.sv and the delay.sv modules

In Lecture 4 slides 9 & 10, you were introduced to the clktick.sv module. The interface signals for this module is:

<img width="658" alt="Screenshot 2022-11-04 at 10 20 58" src="https://user-images.githubusercontent.com/115703122/199949894-351223fd-7539-4015-8271-17bfe628d23b.png">

Counters are good in counting events (e.g. clock cycles).  We can also use counters to provide some form of time measurement. Here is a useful component called a “clock tick” circuit.  We are not interested in the actual count value.  What is needed, however, is that the circuit generates a  single clock pulse (i.e. lasting for one clock period) for every N+1 rising edge of the clock input signal clk. We also add an enable signal en, which must be set to ‘1’ in order to enable the internal counting circuit. Shown here is the module interface for this circuit in SystemVerilog. Note that the parameter keyword is used to define the number of bits of the internal counter (or the count value N).  This makes the module easily adaptable to different size of counter.

Clktick.sv:



Clktick_tb.cpp:



Clktick.sh:


OUTPUT:

Used metronome app to compare seconds to vbdValue input, the Vdbvalue 24 gave 60 beats per minute. The VdValue was not the same as real time this is because every computer will work at different rate and therefore takes different amount of time to simulate one cycle of the clock signal clk. 



## Challenge 

Implement the following design by combining clkctick.sv with f1_fsm.sv so that the F1 light sequence is cycle through automatically with 1 second delay per state transition:

<img width="537" alt="Screenshot 2022-11-04 at 10 39 37" src="https://user-images.githubusercontent.com/115703122/199953400-6bd22cd6-b061-459a-a61c-1965e54a017c.png">




