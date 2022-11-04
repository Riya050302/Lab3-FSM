# Task 2 - Formula 1 Light Sequence

Formula 1 (F1) racing has starting light consists of a series of red lights that turn ON one by one, until all lights are ON. Then all of them turn OFF simultaneously after a random delay.

The goal of this task is to design a FSM that cycles through the sequence according to the following FSM:

<img width="672" alt="Screenshot 2022-11-03 at 11 24 14" src="https://user-images.githubusercontent.com/115703122/199708804-48bef993-da5e-4a4d-b1d1-4fe6e2b858c6.png">

Implement this state machine in SystemVerilog to drive the neopixel bar and cycle through the F1 light sequence. You should use the switch on the rotary switch with the vbdFlag() function (in mode 1) to drive the en signal as shown below:

<img width="648" alt="Screenshot 2022-11-03 at 11 24 52" src="https://user-images.githubusercontent.com/115703122/199708923-01468124-a016-4f85-9678-b20db49d8ae6.png">

**Creating F1.sv file**

I began by creating a FSM module that switches between 2 states:

<img width="637" alt="Screenshot 2022-11-03 at 11 49 51" src="https://user-images.githubusercontent.com/115703122/199713332-dd5bbf53-01e3-4f2b-9856-33d4740c141f.png">

I then created the f1.sv file:

<img width="439" alt="Screenshot 2022-11-04 at 14 33 16" src="https://user-images.githubusercontent.com/115703122/200000806-e1fb9f35-4b81-4242-8b0e-657153a38094.png">

Finally, I wrote a testbench:

I had to change names to f1 for the f1.sv module
The testbench still contains code for two vbdHex() statements
The testbench still contains vbdBar() code to drive inputs into the neopixel bar

<img width="532" alt="Screenshot 2022-11-04 at 14 14 31" src="https://user-images.githubusercontent.com/115703122/199996423-484c3ae6-26c4-445b-98e0-c4c0a50a97fb.png">

OUTPUT:

Having gotten it up to 4'b1001 = 9, I pressed the encoder button three more times:

<img width="341" alt="Screenshot 2022-11-04 at 14 16 11" src="https://user-images.githubusercontent.com/115703122/199996786-98a6ae26-48c5-47c2-b36f-d76205e89552.png">




