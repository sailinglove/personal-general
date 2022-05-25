`timescale 1ns / 1ns

module LS163_tb();
    
    reg clk = 0;
    
    always @* begin
        #(5);
        clk <= !clk;
    end
    
    reg clr = 1, ld = 1;
    reg ent = 0, enp = 0;
    reg a = 0, b = 0, c = 0, d = 0;
    wire [3:0] q;
    wire carry;
    
    LS163 inst_LS163(.CLK(clk),
                     .CLR_L(clr), .LD_L(ld),
                     .ENT(ent), .ENP(enp),
                     .A(a), .B(b), .C(c), .D(d),
                     .QA(q[0]), .QB(q[1]), .QC(q[2]), .QD(q[3]),
                     .RCO(carry)
                     );

    initial begin
        clr = 0;
        #(10);
        clr = 1;
        #(20);
        ent = 1;
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(20);
        a = 1;
        b = 0;
        c = 1;
        d = 0;
        #(10);
        ld = 0;
        #(10);
        ld = 1;
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(20);
        a = 0;
        b = 0;
        c = 1;
        d = 1;
        #(10);
        ld = 0;
        #(10);
        ld = 1;
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(20);
        ent = 0;
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(20);
        a = 1;
        b = 0;
        c = 1;
        d = 0;
        #(10);
        ld = 0;
        #(10);
        ld = 1;
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(20);
        a = 0;
        b = 0;
        c = 1;
        d = 1;
        #(10);
        ld = 0;
        #(10);
        ld = 1;
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(10);
        enp = 1;
        #(10);
        enp = 0;
        #(20);
    end
    
endmodule
