`timescale 1ns / 1ps

module controller_tb();
    reg clk, rst;
    reg D, e1, e2;
    wire [3:0] state;
    
    state_controller my_controller(
    .clk(clk), .rst(rst),
    .D(D), .e1(e1), .e2(e2),
    .state(state)
    );
    
    // Generate 100 MHz clock
    always begin
        #5;
        clk = !clk;
    end
    
    initial begin
        clk = 1'b0; rst = 1'b0;
        D = 1'b1;
        e1 = 1'b0; e2 = 1'b0;
        #100;
        rst = 1;
        #10;
        rst = 0;
        #100;
        D = 1'b0;
        #50;
        e1 = 1'b1;
        #100;
        e2 = 1'b1;
        #30;
        D = 1'b1;
    end
endmodule
