module FSM(
    input clk, rst,
    input D,
    input cntSD, cntT,
    output BaudEN, RegEN
    );
    
    wire D_L, cntSD_L, cntT_L;
    wire S0D, S1D, S0, S1, S0_L, S1_L;
    wire [2:0] S0DOR, S1DOR;
    
    CD4069 inst_CD4069(.A(D),   .B(cntSD),   .C(cntT),   .D(S0),   .E(S1),   .F(1),
                       .G(D_L), .H(cntSD_L), .I(cntT_L), .J(S0_L), .K(S1_L), .L()
                       );
    
    LS74 S0_S1_LS74(.CLK1(clk), .CLK2(clk),
                   .D1(S0D), .D2(S1D),
                   .CLR1_L(rst), .CLR2_L(rst),
                   .Q1(S0), .Q2(S1),
                   .Q1_L(S0_L), .Q2_L(S1_L)
                   );
                   
    CD4075 S0DOR_S1DOR_CD4075(.A(S0DOR[0]), .B(S0DOR[1]), .C(S0DOR[2]),
                              .D(S1DOR[0]), .E(S0DOR[1]), .F(S0DOR[2]),
                              .G(1), .H(1), .I(1),
                              .J(S0D), .K(S1D), .L()
                              );
    
    CD4082 S0DOR0_BaudAND_CD4082(.A(S0_L), .B(S1), .C(D_L), .D(cntSD),
                                 .E(S0_L), .F(S1), .G(D_L), .H(cntSD),
                                 .J(S0DOR[0]), .K(BaudEN)
                                 );
                        
    CD4073 S0DOR1_S0DOR2_S1DOR0_CD4073(.A(S0), .B(S1), .C(1),
                                       .D(S0), .E(S1_L), .F(D_L),
                                       .G(S0_L), .H(S1_L), .I(D_L),
                                       .J(S0DOR[1]), .K(S0DOR[2]), .L(S1DOR[0])
                                       );
    
    CD4073 S1DOR1_S1DOR2_RegENAND_CD4073(.A(S0_L), .B(S1), .C(D_L),
                                         .D(S0), .E(S1), .F(cntT_L),
                                         .G(S0), .H(S1), .I(cntT_L),
                                         .J(S1DOR[1]), .K(S1DOR[2]), .L(RegEN)
                                         );
    
endmodule
