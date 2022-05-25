`timescale 1ns / 1ps

module Register(
    input clk, rst, set, sel,
    input [7:0] Din,
    output [7:0] Dout
    );
    wire selN;
    wire [7:0] tempin, temp1, temp2;
    not (selN, sel);
    genvar i;
    generate
        for(i = 0; i <= 7; i = i + 1) begin: reg_gen
            and (temp1[i], sel, Din[i]);
            and (temp2[i], selN, Dout[i]);
            or (tempin[i], temp1[i], temp2[i]);
            DFF_74LS74 dff(
            .clk(clk), .rst(rst), .set(set),
            .d(tempin[i]), .q(Dout[i])
            );
        end
    endgenerate
endmodule
