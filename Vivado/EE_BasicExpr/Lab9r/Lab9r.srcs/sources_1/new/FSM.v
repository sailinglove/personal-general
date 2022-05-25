module FSM(
    input clk, rst_L,
    input D, EN1, EN2,
    output [3:0] state
    );

    wire s0, s0n, s1, s1n;
    wire s0d, s1d;
    wire s0a1, s0a2, s0a3, s1a1, s1a2, s1a3, s1a4;
    wire Dn, EN1n, EN2n;
    
    not N1(Dn, D);
    not N2(EN1n, EN1);
    not N3(EN2n, EN2);
    
    LS74 S0(.CLK(clk), .PR_L(1), .CLR_L(rst_L),
            .D(s0d), .Q(s0), .QN(s0n)
            );
    
    LS74 S1(.CLK(clk), .PR_L(1), .CLR_L(rst_L),
            .D(s1d), .Q(s1), .QN(s1n)
            );
    
    and S0A1(s0a1, s0, s1);
    and S0A2(s0a2, EN1, s0n, s1);
    and S0A3(s0a3, Dn, EN2, s0, s1n);
    and S1A1(s1a1, Dn, s0n, s1n);
    and S1A2(s1a2, EN1, s0n, s1);
    and S1A3(s1a3, EN2n, s0, s1);
    and S1A4(s1a4, EN1n, Dn, s0n, s1);
    
    or S0O(s0d, s0a1, s0a2, s0a3);
    or S1O(s1d, s1a1, s1a2, s1a3, s1a4);
    
    and A1(state[0], s0n, s1n);
    and A2(state[1], s0n, s1);
    and A3(state[2], s0, s1);
    and A4(state[3], s0, s1n);

endmodule
