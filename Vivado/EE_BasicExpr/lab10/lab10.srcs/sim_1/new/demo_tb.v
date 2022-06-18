`timescale 1ns / 1ps

module demo_tb();

    // 500kHz, 2us
    parameter CLK_PERIOD = 2000;

    reg clk, rst;
    reg [7:0] sw;               //simulated analog voltage input
    wire EnSample, ClearInt;
    wire SigOn, RefOn;
    wire [7:0] led;             //quantized digital voltage output

    // FPGA onboard 100MHz, 10ns clock
    always begin
        #5;
        clk = !clk;
    end

    demo inst_demo(
        .clk(clk), .rst(rst), .sw(sw),
        .EnSample(EnSample), .ClearInt(ClearInt),
        .SigOn(SigOn), .RefOn(RefOn), .led(led)
    );

    initial begin
        // set initials
        clk = 0;
        rst = 0;
        sw = 8'b0;
        #CLK_PERIOD;

        // reset system
        rst = 1;
        #(2*CLK_PERIOD);
        rst = 0;

        // try some data
        sw = 8'd30;
        #(2*CLK_PERIOD);
        #((256+30+10)*CLK_PERIOD);

        sw = 8'd100;
        #((256+100+10)*CLK_PERIOD);

        sw = 8'd240;
        #((256+240+10)*CLK_PERIOD);
    end
endmodule
