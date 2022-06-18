`timescale 1ns / 1ps

module FSM_tb();

    reg clk, Co2, nFlag, nReset;
    wire EnSample, ClearInt, Load, SigOn, RefOn, nClrCnt;

    // generate clock
    always begin
        #5;
        clk = !clk;
    end

    FSM inst_FSM(
        .clk(clk), .Co2(Co2), .nFlag(nFlag), .nReset(nReset),
        .EnSample(EnSample), .ClearInt(ClearInt), .Load(Load),
        .SigOn(SigOn), .RefOn(RefOn), .nClrCnt(nClrCnt)
    );

    initial begin
        // set initials
        clk = 1;
        Co2 = 0;
        nReset = 1;
        nFlag = 1;
        #10;

        // reset
        nReset = 0;
        #10;
        nReset = 1;
        #20;

        #20;

        Co2 = 1;
        #10;
        Co2 = 0;
        #20;

        nFlag = 0;
        #10;
        nFlag = 1;
        #20;

        #20;
    end

endmodule
