# Task 3 -  Exploring the clktick.sv and the delay.sv modules

In Lecture 4 slides 9 & 10, you were introduced to the clktick.sv module. The interface signals for this module is:

<img width="658" alt="Screenshot 2022-11-04 at 10 20 58" src="https://user-images.githubusercontent.com/115703122/199949894-351223fd-7539-4015-8271-17bfe628d23b.png">

Counters are good in counting events (e.g. clock cycles).  We can also use counters to provide some form of time measurement. Here is a useful component called a “clock tick” circuit.  We are not interested in the actual count value.  What is needed, is that the circuit generates a  single clock pulse (i.e. lasting for one clock period) for every N+1 rising edge of the clock input signal clk.

We also add an enable signal en, which must be set to ‘1’ in order to enable the internal counting circuit. Shown here is the module interface for this circuit in SystemVerilog. Note that the parameter keyword is used to define the number of bits of the internal counter (or the count value N).  This makes the module easily adaptable to different size of counter.

**Clktick.sv:**

<img width="383" alt="Screenshot 2022-11-04 at 11 50 39" src="https://user-images.githubusercontent.com/115703122/199965970-4492c11b-a82d-4372-8bc9-5dca35d249c1.png">

- The counter will be set to N on every reset.
- When enable is high and counter != 0 the counter will decrement by 1 each clock cycle.
- Once the counter reaches 0, a tick impulse is produced and the counter is set back to N to continue cycling.
- This produces a tick every N cycles.
- N can then be edited to adjust the real time of the clock. 

The output tick has to be declared as reg because its value is updated inside the always block. Also note that instead of adding ‘1’ on each positive edge of the clock, this design uses a down counter.  The counter counts from N to 0 (hence N+1 clock cycles). When that happens, it is reset to N and the tick output is high for the next clock cycle.


**Clktick_tb.cpp:**

<img width="321" alt="Screenshot 2022-11-04 at 13 48 03" src="https://user-images.githubusercontent.com/115703122/199988019-c8e6e851-0695-4483-a8ba-0509b6979675.png">

**Clktick.sh:**

<img width="626" alt="Screenshot 2022-11-04 at 12 34 38" src="https://user-images.githubusercontent.com/115703122/199973810-4f8b04c8-b6bd-4943-a45f-de8ea991d8f7.png">

**OUTPUT:**

Used metronome app to compare seconds to vbdValue input, the Vdbvalue 24 gave 60 beats per minute. The VdValue was not the same as real time this is because every computer will work at different rate and therefore takes different amount of time to simulate one cycle of the clock signal clk. 

<img width="335" alt="Screenshot 2022-11-04 at 12 36 29" src="https://user-images.githubusercontent.com/115703122/199974123-0279b990-3d90-4074-a345-284562c25b1a.png">


## Challenge 

Implement the following design by combining clkctick.sv with f1_fsm.sv so that the F1 light sequence is cycle through automatically with 1 second delay per state transition:

<img width="537" alt="Screenshot 2022-11-04 at 10 39 37" src="https://user-images.githubusercontent.com/115703122/199953400-6bd22cd6-b061-459a-a61c-1965e54a017c.png">

I began by creating a top level module to link clktick and f1:

<img width="515" alt="Screenshot 2022-11-04 at 13 48 46" src="https://user-images.githubusercontent.com/115703122/199988188-7833db15-7507-4e71-beb9-bd45afb1fff1.png">

I then editted the inital values of the testbench from the f1 testbench:

<img width="338" alt="Screenshot 2022-11-04 at 13 49 05" src="https://user-images.githubusercontent.com/115703122/199988251-9a00cbe2-d95e-461c-9da9-0110a7ec3856.png">

OUTPUT:

<img width="306" alt="Screenshot 2022-11-04 at 12 36 41" src="https://user-images.githubusercontent.com/115703122/199974159-6496b749-ba9c-4cc3-80c0-72b135c5fbe5.png">

The ouput was an f1 light sequence that increased the light every second with the speed of the light change controlled by VdbValue().


