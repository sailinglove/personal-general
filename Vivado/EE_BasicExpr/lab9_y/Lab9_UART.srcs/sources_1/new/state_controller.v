`timescale 1ns / 1ps

module state_controller(
    input clk, rst,
    input D, e1, e2,
    output [3:0] state
    );
    wire y0, y0N, y1, y1N;
    wire la0, la1, la2, la3, la4, la5, la6;
    wire lb0, lb1;
    wire DN, e1N, e2N, rstN;
    
    DFF_74LS74 Y0(
        .clk(clk), .set(1'b1), .rst(rstN),
        .d(lb0),
        .q(y0), .qN(y0N)
    );
    
    DFF_74LS74 Y1(
        .clk(clk), .set(1'b1), .rst(rstN),
        .d(lb1),
        .q(y1), .qN(y1N)
    );
    
    not N0(DN, D);
    not N1(e1N, e1);
    not N2(e2N, e2);
    not N3(rstN, rst);
    and A0(la0, y0, y1);
    and A1(la1, e1, y0N, y1);
    and A2(la2, DN, e2, y0 , y1N);//Ôö¼Óe2
    and A3(la3, DN, y0N, y1N);
    and A4(la4, e1, y0N, y1);
    and A5(la5, e2N, y0, y1);
    and A6(la6, e1N, DN, y0N, y1);
    or B0(lb0, la0, la1, la2);
    or B1(lb1, la3, la4, la5, la6);
    and C0(state[0], y0N, y1N);
    and C1(state[1], y0N, y1 );
    and C2(state[2], y0 , y1 );
    and C3(state[3], y0 , y1N);
endmodule
