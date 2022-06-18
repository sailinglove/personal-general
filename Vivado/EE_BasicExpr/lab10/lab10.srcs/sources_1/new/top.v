module top(
    input clk, rst,
    input nFlag,
    output EnSample, ClearInt,
    output SigOn, RefOn,
    output [7:0] Dout
    );

    wire nRst;
    not not_rst(nRst, rst);

    wire Co2, nClrCnt;
    (* mark_debug = "true" *)wire Load;
    // wire Load;
    (* mark_debug = "true" *)wire [7:0] cntOut;
    // wire [7:0] cntOut;

    FSM inst_FSM(
        .clk(clk), .Co2(Co2), .nFlag(nFlag), .nReset(nRst),
        .EnSample(EnSample), .ClearInt(ClearInt), .Load(Load),
        .SigOn(SigOn), .RefOn(RefOn), .nClrCnt(nClrCnt)
    );

    counter_8bits inst_counter(
        .CLK(clk), .CLR_L(nClrCnt), .LD_L(1), .ENP(1), .ENT(1),
        .D(8'b0), .Q(cntOut), .RCO(Co2)
    );

    LS573_be inst_LS573( .clk(clk), .D(cntOut), .LE(Load), .OE_L(0), .O(Dout) );

endmodule
