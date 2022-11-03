# Task 2 - Formula 1 Light Sequence

Formula 1 (F1) racing has starting light consists of a series of red lights that turn ON one by one, until all lights are ON. Then all of them turn OFF simultaneously after a random delay.

The goal of this task is to design a FSM that cycles through the sequence according to the following FSM:

<img width="672" alt="Screenshot 2022-11-03 at 11 24 14" src="https://user-images.githubusercontent.com/115703122/199708804-48bef993-da5e-4a4d-b1d1-4fe6e2b858c6.png">

Implement this state machine in SystemVerilog to drive the neopixel bar and cycle through the F1 light sequence. You should use the switch on the rotary switch with the vbdFlag() function (in mode 1) to drive the en signal as shown below:

<img width="648" alt="Screenshot 2022-11-03 at 11 24 52" src="https://user-images.githubusercontent.com/115703122/199708923-01468124-a016-4f85-9678-b20db49d8ae6.png">

