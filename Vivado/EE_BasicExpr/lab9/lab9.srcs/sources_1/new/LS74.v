// 2-channel register
module LS74(
    input CLK1, CLK2,
    input D1, D2,
    input CLR1_L, CLR2_L,
    output reg Q1, Q2,
    output Q1_L, Q2_L
    );
    
    assign Q1_l = !Q1;
    assign Q2_L = !Q2;
    
    always @* begin
        if (CLR1_L == 0)
            Q1 <= 0;
        if (CLR2_L == 0)
            Q2 <= 0;
    end
    
    always @(posedge CLK1)
        Q1 <= D1;
    
    always @(posedge CLK2)
        Q2 <= D2;

endmodule
