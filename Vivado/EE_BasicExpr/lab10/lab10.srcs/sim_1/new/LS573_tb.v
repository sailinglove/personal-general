`timescale 1ns / 1ps

module LS573_tb();

    reg [7:0] D;
    reg LE, OE_L;
    wire [7:0] O;

    LS573_be inst_LS573( .D(D), .LE(LE), .OE_L(OE_L), .O(O) );

    initial begin
        LE = 1;
        OE_L = 0;
        D = 8'b0;
        #10;

        D = 8'b0101_0101;
        #10;

        LE = 0;
        #10;
        
        D = 8'b1010_1010;
        #10;

        OE_L = 1;
        #10;

        OE_L = 0;
        LE = 1;
        #10;
    end

endmodule
