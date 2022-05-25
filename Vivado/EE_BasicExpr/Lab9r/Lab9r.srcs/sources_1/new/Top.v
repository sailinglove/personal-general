module Top #(parameter SYS_FREQ = 100_000_000)(
    input clk, rst, sys_rst,
    input Din,
    output [7:0] Dout,
    output a
    );

    wire bclk;
    wire [7:0] temp;
    wire [3:0] state, Q0, Q1, Q2;
    wire s0n, s1n, s2n, s3n, rstn, sys_rst_n;
    wire rst1_L, rst2_L, rst_reg_L;
    
    assign a = 1;
    
    and A1(rst1_L, sys_rst_n, !(state[0] && !Din));
    and A2(rst2_L, sys_rst_n, s0n, s1n, s3n);
    and A3(rst_reg_L, sys_rst_n, s0n);
    
    not N0(s0n, state[0]);
    not N1(s1n, state[1]);
    not N2(s2n, state[2]);
    not N3(s3n, state[3]);
    
    not N4(rstn, rst);
    not N5(sys_rst_n, sys_rst);
    
    //系统时钟，16倍波特率
    BaudGen system_clk(.clk(clk), .rst(rst), .Bclk16(bclk));
    
    //波特率时钟
    LS163 baud_clk(.CLK(bclk), .CLR_L(sys_rst_n), .LD_L(1),
                   .ENP(1), .ENT(1), .D(4'b0),
                   .Q(Q0), .RCO()
                   );
    
    LS164 shift_reg(.CP(Q0[3]), .MR_L(rst_reg_L), 
                    .DSA(Din), .DSB(Din), .Q(temp)
                    );
    
    reg_8bit reg8(.clk(bclk), .rst_L(1), .set_L(sys_rst_n), .sel(state[3]),
                 .Din(temp), .Dout(Dout)
                 );
    
    LS163 counter1(.CLK(bclk), .CLR_L(rst1_L), .LD_L(1),
                   .ENP(s0n), .ENT(s0n), .D(4'b0),
                   .Q(Q1), .RCO()
                   );
    
    LS163 counter2(.CLK(Q1[3]), .CLR_L(rst2_L), .LD_L(1),
                   .ENP(state[2]), .ENT(state[2]), .D(4'b0),
                   .Q(Q2), .RCO()
                   );
    
    FSM inst_FSM(.clk(bclk), .rst_L(sys_rst_n),
                 .D(Din), .EN1(Q1[3]), .EN2(Q2[3]),
                 .state(state));

endmodule