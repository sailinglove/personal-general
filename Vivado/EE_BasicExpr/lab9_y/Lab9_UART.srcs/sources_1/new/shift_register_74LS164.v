`timescale 1ns / 1ps

module shift_register_74LS164(
    input A, B, //��������
    input cp,   //ʱ��
    input MR,   //master reset(�͵�ƽ��Ч)
    output reg [7:0] Q//�������
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
