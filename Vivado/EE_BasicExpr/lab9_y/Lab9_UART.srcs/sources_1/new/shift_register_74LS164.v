`timescale 1ns / 1ps

module shift_register_74LS164(
    input A, B, //数据输入
    input cp,   //时钟
    input MR,   //master reset(低电平有效)
    output reg [7:0] Q//数据输出
    );
    
    always @(posedge cp)begin
        if(!MR)begin
            Q <= 8'b0;
        end else begin
            if(A && B) Q[0] <= 1'b1;
            else Q[0] <= 1'b0;
            Q[7:1] <= Q[6:0];
        end
    end
endmodule
