`timescale 1ns / 1ps

module counter_74LS163(
    input clk,
    input SR, //
    input CET,CEP,
    input PE,
    input [3:0] P,
    output reg [3:0] Q,
    output reg TC
    );
    
    always @(posedge clk)begin
        if(!SR) Q <= 4'b0;
        else if(!PE) Q <= P;
        else if(CET && CEP) Q <= Q + 1'b1;
        else Q <= Q;
    end
    
    always @ (Q or CET) begin
        if (CET && (Q==4'b1111)) TC <= 1'b1;
        else TC <= 1'b0;
    end
endmodule
