// DFF
module LS74(
    input CLK,
    input CLR_L, PR_L,
    input D,
    output reg Q,
    output QN
    );

    assign QN = !Q;

    always @(posedge CLK or posedge PR_L or posedge CLR_L)
        if (!PR_L)
            Q <= 1'b1;
        else if (!CLR_L)
            Q <= 1'b0;
        else
            Q <= D;

endmodule