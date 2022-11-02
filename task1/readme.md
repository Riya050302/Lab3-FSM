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
