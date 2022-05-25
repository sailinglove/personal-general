`timescale 1ns / 1ps

module Receiver#(parameter SYS_FREQ = 100_000_000
)(
    input clk, rst, sys_rst,
    input Din,
    output [7:0] Dout,
    output a
    );
    wire bclk;
    wire [7:0] temp_dout;
    wire [3:0] state, Q0, Q1, Q2;
    wire s0N, s1N, s2N, s3N, Q1_3N, rstN, sys_rstN;
    wire rst1, rst2,rst_register;
    assign a = 1'b1;
    and (rst1, sys_rstN, !(state[0]&!Din));
    and (rst2, sys_rstN, s0N, s1N, s3N);
    and (rst_register, sys_rstN, s0N);
    not (rstN, rst);
    not (sys_rstN, sys_rst);
    not (s0N, state[0]);
    not (s1N, state[1]);
    not (s2N, state[2]);
    not (s3N, state[3]);
    //not (Q1_3N, Q1[3]);
    //ϵͳʱ��1
    BaudGen sys_clk(
        .Clock(clk), .Reset(rst),
        .Bclk16(bclk)   
    );
    //���벢���Ĵ���
    shift_register_74LS164 my_register(
        .A(Din), .B(Din), //��������
        .cp(Q0[3]),   //ʱ��
        .MR(rst_register),   //master reset(�͵�ƽ��Ч)
        .Q(temp_dout)//�������
    );
    //�Ĵ���
    Register dreg(
        .clk(bclk), .rst(1'b1), .set(sys_rstN), .sel(state[3]),
        .Din(temp_dout), .Dout(Dout)
    );
    //ϵͳʱ��2
    counter_74LS163 counterblk(
        .clk(bclk),
        .SR(sys_rstN), //rst
        .CET(1'b1), .CEP(1'b1),
        .PE(1'b1),//load
        .P(4'b0001),//input
        .Q(Q0), .TC()//output
    );
    //������1
    counter_74LS163 counter1(
        .clk(bclk),
        .SR(rst1), //rst
        .CET(s0N), .CEP(s0N),
        .PE(1'b1),//load
        .P(4'b0001),//input
        .Q(Q1), .TC()//output
    );
    //������2
    counter_74LS163 counter2(
        .clk(Q1[3]),
        .SR(rst2), //rst
        .CET(state[2]), .CEP(state[2]),
        .PE(1'b1),//load
        .P(4'b0),//input
        .Q(Q2), .TC()//output
    );
    //״̬������
    state_controller my_statecontroller(
        .clk(bclk), .rst(sys_rst),
        .D(Din), .e1(Q1[3]), .e2(Q2[3]),
        .state(state)
    );
endmodule
