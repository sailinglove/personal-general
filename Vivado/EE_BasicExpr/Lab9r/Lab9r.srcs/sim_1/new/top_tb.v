`timescale 1ns / 1ps

module top_tb#(
    parameter SYS_FREQ = 100_000_000,
    parameter bps = 9_600
)();
    reg clk, rst, sys_rst;
    reg Din;
    wire [7:0] Dout;
    
    Top inst_top(
        .clk(clk), .rst(rst), .sys_rst(sys_rst),
        .Din(Din),
        .Dout(Dout)
    );
    
    // Generate 100 MHz clock
    always begin
        #5;
        clk = !clk;
    end
    
    localparam bx = SYS_FREQ / bps;//bx*10 is BaudGen Clock
    
    initial begin
        clk = 1'b0; rst = 1'b0; sys_rst = 1'b0;
        Din = 1'b1;
        #100;
        rst = 1'b1;
        #(bx * 10);
        rst = 1'b0;
        #(bx * 10);
        sys_rst = 1'b1;
        #(bx * 10 *3);
        sys_rst = 1'b0;
        #(bx * 30);
        repeat (10) begin
        Din = 1'b0;//???¦Ë
        #(bx * 10);
        Din = 1'b1;//1. 1
        #(bx * 10);
        Din = 1'b0;//2. 0
        #(bx * 10);
        Din = 1'b1;//3. 1
        #(bx * 10);
        Din = 1'b0;//4. 0
        #(bx * 10);
        Din = 1'b1;//5. 1
        #(bx * 10);
        Din = 1'b1;//6. 1
        #(bx * 10);
        Din = 1'b0;//7. 0
        #(bx * 10);
        Din = 1'b0;//8. 0
        #(bx * 10);
        Din = 1'b1;//??¦Ë
        #(bx * 10);
        end
//        Din = 1'b0;//???¦Ë
//        #(bx * 10);
//        Din = 1'b1;//1. 1
//        #(bx * 10);
//        Din = 1'b0;//2. 0
//        #(bx * 10);
//        Din = 1'b1;//3. 1
//        #(bx * 10);
//        Din = 1'b0;//4. 0
//        #(bx * 10);
//        Din = 1'b1;//5. 1
//        #(bx * 10);
//        Din = 1'b1;//6. 1
//        #(bx * 10);
//        Din = 1'b0;//7. 0
//        #(bx * 10);
//        Din = 1'b0;//8. 0
//        #(bx * 10);
//        Din = 1'b1;//??¦Ë
    end
endmodule