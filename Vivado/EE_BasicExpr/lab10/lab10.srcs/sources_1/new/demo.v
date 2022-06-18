module demo(
    input clk,
    (* mark_debug = "true" *)input rst,
    // input rst,
    // simulated analog voltage input in 8 bits binary
    (* mark_debug = "true" *)input [7:0] sw,
    // input [7:0] sw,
    (* mark_debug = "true" *)output EnSample, ClearInt,
    // output EnSample, ClearInt,
    (* mark_debug = "true" *)output SigOn, RefOn,
    // output SigOn, RefOn,
    // quantized digital voltage output in 8 bits binary
    (* mark_debug = "true" *)output [7:0] led
    // output [7:0] led
    );

    (* mark_debug = "true" *)wire clk500k;
    // wire clk500k;
    clk_500k inst_clk( .clk(clk), .new_clk(clk500k) );

    (* mark_debug = "true" *)wire nFlag;
    // wire nFlag;

    nFlagGen inst_nFlagGen(
        .clk(clk500k), .rst(rst),
        .SigOn(SigOn), .RefOn(RefOn),
        .sw(sw),
        .nFlag(nFlag)
    );

    top inst_top(
        .clk(clk500k), .rst(rst),
        .nFlag(nFlag),
        .EnSample(EnSample), .ClearInt(ClearInt),
        .SigOn(SigOn), .RefOn(RefOn),
        .Dout(led)
    );

endmodule
