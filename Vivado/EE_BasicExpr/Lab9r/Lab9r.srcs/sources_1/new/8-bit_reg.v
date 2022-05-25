`timescale 1ns / 1ps
module reg_8bit(
    input clk, rst_L, set_L, sel,
    input [7:0] Din,
    output [7:0] Dout
    );

    wire seln;
    wire [7:0] tempin, temp1, temp2;
    not N1(seln, sel);
    
    genvar i;
    generate
        for (i=0;i<=7;i=i+1) begin: reg_gen
            and A1(temp1[i], sel, Din[i]);
            and A2(temp2[i], seln, Dout[i]);
            or O1(tempin[i], temp1[i], temp2[i]);
            LS74 DFF(.CLK(clk), .CLR_L(rst_L), .PR_L(set_L),
                     .D(tempin[i]), .Q(Dout[i]), .QN()
                     );
        end
    endgenerate

endmodule
