module LS573_be(
    input clk,
    input [7:0] D,
    input LE,
    input OE_L,
    output reg [7:0] O
    );

    always @(posedge LE or posedge OE_L) begin
        if (OE_L)
            O <= 8'bz;
        else if (LE)
            O <= D;
    end

    // always @(posedge clk) begin
    //     if (OE_L)
    //         O <= 8'bz;
    //     else if (LE)
    //         O <= D;
    // end

endmodule
