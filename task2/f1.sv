module f1(
    input logic         clk,
    input logic         rst,
    input logic         out
);

    //Define the states
    typedef enum {IDLE, S1, S2} my_state;
    my_state current_state, next_state;

    //state registers 
    always_ff @(posedge clk, posedge rst)
        if (rst)        current_state <= IDLE;
        else            current_state <= next_state;

    //next state logic 
    always_comb 
        case(current_state)
            IDLE:   next_state = S1;
            S1:     next_state = S2;
            S2:     next_state = IDLE;
            default:next_state = IDLE;
        endcase

    //output logic
    assign out = (current_state == IDLE);
endmodule 