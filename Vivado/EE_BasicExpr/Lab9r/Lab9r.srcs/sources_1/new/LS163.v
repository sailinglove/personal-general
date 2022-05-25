// 4-bit counter with carry
module LS163(
    input CLK,
    input CLR_L,LD_L,
    input ENP, ENT,
    input [3:0] D,
    output reg [3:0] Q,
    output reg RCO
    );

    always @(posedge CLK)
        if (!CLR_L)
            Q <= 4'b0;
        else if (!LD_L)
            Q <= D;
        else if (ENP && ENT)
            Q <= Q + 1'b1;
        else
            Q <= Q;
    
    always @(Q or ENT)
        if (ENT && (Q == 4'b1111))
            RCO <= 1'b1;
        else
            RCO <= 1'b0;

endmodule