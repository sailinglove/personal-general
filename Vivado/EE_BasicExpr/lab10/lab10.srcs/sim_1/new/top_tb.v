`timescale 1ns / 1ps

module top_tb();

    parameter CLK_PERIOD = 2000;

    reg clk, rst;
    reg nFlag;
    wire EnSample, ClearInt, SigOn, RefOn;
    wire [7:0] Dout;

    // generate 500kHz clock
    always begin
        #1000;
        clk = !clk;
    end

    top inst_top(
        .clk(clk), .rst(rst),
        .nFlag(nFlag),
        .EnSample(EnSample), .ClearInt(ClearInt),
        .SigOn(SigOn), .RefOn(RefOn),
        .Dout(Dout)
    );

    initial begin
        //set initials
        clk = 0;
        rst = 0;
        nFlag = 1;
        #(CLK_PERIOD);

        // reset system
        rst = 1;
        #(2*CLK_PERIOD);
        rst = 0;
        #(2*CLK_PERIOD);

        // wait until charge complete
        while (RefOn == 0) begin
            #(CLK_PERIOD);
        end
        // discharge for 130 beats
        #(130*CLK_PERIOD);
        nFlag = 0;
        #(CLK_PERIOD);
        nFlag = 1;

        // charge 256 beats (same as while loop)
        #(256*CLK_PERIOD);
        // discharge 250 beats
        #(250*CLK_PERIOD);
        nFlag = 0;
        #(CLK_PERIOD);
        nFlag = 1;

        // wait until charge complete
        while (RefOn == 0) begin
            #(CLK_PERIOD);
        end
        // discharge for 50 beats
        #(50*CLK_PERIOD);
        nFlag = 0;
        #(CLK_PERIOD);
        nFlag = 1;

        //exp10.5.7: 0.32V step change
        for (integer i = 0; i < 256; i = i + 32) begin
            while (RefOn == 0) begin
                #(CLK_PERIOD);
            end
            #(i*CLK_PERIOD);
            nFlag = 0;
            #(CLK_PERIOD);
            nFlag = 1;
        end
    end
endmodule
