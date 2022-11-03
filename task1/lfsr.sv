module lfsr (
    input logic             clk,
    input logic             rst,
    input logic             en,
    output logic [7:1]      data_out
);

logic [4:1]  sreg;

always_ff @ (posedge clk, posedge rst)
    if (rst)
        sreg <= 7'b1;
    else if (en == 1)
        sreg <= {sreg[6:1], sreg[7] ^ sreg[3]};
        //in order to get new primitive polynomial XOR 7 and 3

assign data_out = sreg;
endmodule
