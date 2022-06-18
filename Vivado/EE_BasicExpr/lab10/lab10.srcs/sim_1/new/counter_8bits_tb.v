`timescale 1ns / 1ps
module counter_8bits_tb();

    reg clk;
    reg CLR_L, LD_L;
    reg ENP, ENT;
    reg [7:0] D;
    wire [7:0] Q;
    wire RCO;

    parameter clk_period = 10;

    // generate clock
    always begin
        #5;
        clk = !clk;
    end

    counter_8bits inst_counter_8bits(
            .CLK(clk), .CLR_L(CLR_L), .LD_L(LD_L), .ENP(ENP), .ENT(ENT),
            .D(D), .Q(Q), .RCO(RCO)
        );
    
    initial begin
        // set initials
        clk = 0;
        CLR_L = 1;
        LD_L = 1;
        ENP = 0;
        ENT = 0;
        D = 8'b0;
        #10;
        
        // reset
        CLR_L = 0;
        #10;

        // start counting
        CLR_L = 1;
        ENP = 1;
        ENT = 1;
        #2600;
    end

endmodule
