`timescale 1ns / 1ps

module DFF_74LS74(
    input clk,
    input set, rst,
    input d,
    output reg q,
    output qN
    );
    
    always@ (posedge clk or posedge set or posedge rst)begin
        if(!set)      q <= 1'b1;
        else if(!rst) q <= 1'b0;
        else          q <= d; 
    end
    assign qN = ~q;
    
endmodule
