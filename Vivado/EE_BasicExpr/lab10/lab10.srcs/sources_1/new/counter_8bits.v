module counter_8bits(
    input CLK,
    input CLR_L,
    input LD_L,
    input ENP,
    input ENT,
    input [7:0] D,
    output [7:0] Q,
    output RCO
    );

    wire carry1, carry2;

    LS163 counter_LSBs(
            .CLK(CLK), .CLR_L(CLR_L), .LD_L(LD_L), .ENP(ENP), .ENT(ENT),
            .D(D[3:0]), .Q(Q[3:0]), .RCO(carry1)
        ),
        counter_MSBs(
            .CLK(CLK), .CLR_L(CLR_L), .LD_L(LD_L), .ENP(carry1), .ENT(ENT),
            .D(D[7:4]), .Q(Q[7:4]), .RCO(carry2)
        );
    
    // RCO only valid when both carry1 and carry2 are valid
    and carry_out(RCO, carry1, carry2);

endmodule