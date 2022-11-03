# Task 1 - 4-bit LFSR and Pseudo Random Binary Sequence

## Objectives 

- design and test a PRBS generator using a linear feedback shift register (LFSR)
- display 8-bit value on neopixel bar on Vbuddy
- specify a FSM in SystemVerilog
- design a FSM to cycle through the Formula 1 starting light sequence
- understand how the clktick.sv module works, and calibrate it for 1 sec tick period
- automatically cycle through F1 lights at 1 second interval
- optionally implement the full F1 starting light machine and test your reaction.

## Step 1 - create the component lfsr.sv

Open the Lab3-FSM folder in VS code. In folder task1, create the component lfsr.sv guided by Lecture 4 slide 14. Modify the version in the lecture notes to include an extra enable signal en, and all four bits of the shift register output are brought out as data_out[3:0]. This is your top-level circuit for this task.

<img width="502" alt="Screenshot 2022-11-02 at 23 40 06" src="https://user-images.githubusercontent.com/115703122/199622356-8fcb8e0f-c594-4d2f-b06d-e2c0cd939c65.png">

What is a LFSR:

Consider the below circuit with an initial state of the shift register set to 4’b0001. The sequence that this circuit goes through is shown in the table here. It is NOT counting binary.  Instead it is counting in a sequence that is sort of random.  This is often called a pseudo random binary sequence (PRBS).
The shift register connect this way is also known as a “Linear Feedback Shift Register” or LFSR.  There is a whole area of mathematics devoted to this type of computation, known as “finite fields” which we will not consider on this course.

<img width="749" alt="Screenshot 2022-11-03 at 10 54 16" src="https://user-images.githubusercontent.com/115703122/199703122-7df648b5-6f89-4532-b01d-11e18d444873.png">

In order to create the system verilator code for the shift register, we use the <= assignment to make sure sreg[4:1] are updated only at the end of the always block.

<img width="841" alt="Screenshot 2022-11-02 at 23 50 08" src="https://user-images.githubusercontent.com/115703122/199623309-59d35098-a660-4caf-a87c-fa01cab922da.png">

This way of specifying the right-hand side of the assignment is powerful.  We use the concatenation operation { …. } to make up four bits from sreg[3:1] and data_in (with data_in being the LSB) and assign it to sreg[4:1].

<img width="968" alt="Screenshot 2022-11-03 at 00 02 50" src="https://user-images.githubusercontent.com/115703122/199624486-a29e2384-0e93-4d10-adb9-a703c3d60e3f.png">

The LFSR system verilator code:

<img width="342" alt="Screenshot 2022-11-03 at 10 51 06" src="https://user-images.githubusercontent.com/115703122/199702452-7f31a72e-6c08-4337-a632-e5a2456a1443.png">

## Step 2 - Create the testbench for the LFSR

Create a testbench to test this 4-bit random number generator. In your testbench you should use the Vbuddy rotary encoder switch (EC11) and the vbdFlag() function in one-shot mode (i.e. using vbdSetMode(1)) to drive the en signal to step through the random sequence each time you press the switch on Vbuddy.

The SetMode function meant the flag was armed and changes the value when the flag is pressed and immediently goes to zero, without this the flag would stay high until pressed again.

**VDB FLAG MUST BE WITHIN THE FOR LOOP SETMODE DOESN'T**
VdbFlag must be initated each loop whereas the mode is set once at the beginning and then does not change.

We added a Hex display and a vbar display, and set the reset to 1 initally to get the 0001 input to be XOR'd then set it back to zero in the for loop to allow the counter to go up.

<img width="300" alt="Screenshot 2022-11-03 at 10 51 36" src="https://user-images.githubusercontent.com/115703122/199702547-f70c37fc-b867-43b4-bb7b-b6b9530462ae.png">

This produces a primative polynomial sequence:

<img width="690" alt="Screenshot 2022-11-03 at 10 59 00" src="https://user-images.githubusercontent.com/115703122/199704077-5b1239fb-8a5d-42c5-ac0a-2a0f34b5a533.png">

OUTPUT:

<img width="458" alt="Screenshot 2022-11-03 at 11 22 14" src="https://user-images.githubusercontent.com/115703122/199708485-83c35326-ae47-4ce6-bb94-90519e8ce4e8.png">

## STEP 3 -  Create the doit.sh script

<img width="601" alt="Screenshot 2022-11-03 at 10 59 50" src="https://user-images.githubusercontent.com/115703122/199704248-ca8bed30-bb14-4ef6-b6eb-2a0bb7d0a449.png">

## Challenge

Based on the primitive polynomial table in Lecture 4 slide 16, modify lfsr.sv into a 7-bit (instead of 4-bit) PRBS generator. Test your design. The 7th order primitive polynomial is:

<img width="115" alt="Screenshot 2022-11-03 at 11 00 13" src="https://user-images.githubusercontent.com/115703122/199704321-87b876cf-8354-4940-9eb2-cda836fb15f5.png">

Add an additional Hex display for 7 bits:

<img width="341" alt="Screenshot 2022-11-03 at 11 05 21" src="https://user-images.githubusercontent.com/115703122/199705328-5f9abb27-d7bb-499c-b62f-c9d6d0fa10f0.png">

Change the parameters within the system verilator code:

<img width="547" alt="Screenshot 2022-11-03 at 11 19 22" src="https://user-images.githubusercontent.com/115703122/199707891-6f664cea-5eeb-4d9f-9022-445b5f1279bb.png">

<img width="279" alt="Screenshot 2022-11-03 at 11 19 10" src="https://user-images.githubusercontent.com/115703122/199707862-fbf1e064-2f5c-4e19-ae59-7b315b582dfe.png">

