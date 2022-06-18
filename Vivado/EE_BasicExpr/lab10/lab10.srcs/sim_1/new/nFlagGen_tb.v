`timescale 1ns / 1ps

module nFlagGen_tb();

    // 500kHz, 2000us
    parameter CLK_PERIOD = 2000;

    reg clk, rst;
    reg SigOn, RefOn;
    reg [7:0] sw;
    wire nFlag;

    //generate clock
    always begin
        #(CLK_PERIOD / 2);
        clk = !clk;
    end

    nFlagGen nFlagGen_inst(
        .clk(clk), .rst(rst),
        .SigOn(SigOn), .RefOn(RefOn),
        .sw(sw),
        .nFlag(nFlag)
    );

    initial begin
        // set initials
        clk = 1;
        rst = 0;
        SigOn = 0;
        RefOn = 0;
        sw = 8'b0;
        #(CLK_PERIOD);

        // reset module
        rst = 1;
        #(CLK_PERIOD);
        rst = 0;
        #(CLK_PERIOD);

        SigOn = 1;
        #(255*CLK_PERIOD);
        SigOn = 0;
        sw = 8'd30;
        RefOn = 1;
        #(30*CLK_PERIOD);
        RefOn = 0;

        #(CLK_PERIOD);

        SigOn = 1;
        #(255*CLK_PERIOD);
        SigOn = 0;
        sw = 8'd100;
        RefOn = 1;
        #(100*CLK_PERIOD);
        RefOn = 0;
    end

endmodule
