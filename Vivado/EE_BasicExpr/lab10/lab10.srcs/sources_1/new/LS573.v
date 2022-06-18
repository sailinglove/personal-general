module LS573(
    input [7:0] D,
    input LE, OE_L,
    output [7:0] O
    );

    wire nLE;
    wire [7:0] out, latch, load;
    not N1(nLE, LE);
    
    genvar i;
    generate
        for (i=0;i<=7;i=i+1) begin: latch_bit
            and A1(latch[i], LE, D[i]);
            and A2(load[i], nLE, O[i]);
                or O1(out[i], latch[i], load[i]);
        end
    endgenerate

    // assign O = OE_L ? 8'bZ : out;
    assign O = out;

endmodule
