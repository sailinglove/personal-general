`timescale 1ns / 1ps
module FSM_tb();
    
    reg clk = 0;
    
    always @* begin
        #(5);
        clk <= !clk;
    end
    
    reg rst = 1, D = 1, cntSD = 0, cntT = 0;
    wire BaudEN, RegEN;
    
    FSM_wtf inst_FSM(.clk(clk), .rst(rst), .D(D), 
                 .cntSD(cntSD), .cntT(cntT),
                 .BaudEN(BaudEN), .RegEN(RegEN)
                 );
    
    initial begin
        #(10);
        rst = 0;
        #(10);
        rst = 1;
        #(20);
        D = 0;
        #(20);
        D = 1;
        #(20);
        D = 0;
        #(20);
        cntSD = 1;
        #(10);
        cntSD = 0;
        #(50);
        D = 1;      //1st bit
        #(80);
        D = 0;      //2nd bit
        #(80);
        D = 1;      //3rd bit
        #(80);
        D = 0;      //4th bit
        #(80);
        D = 1;      //5th bit
        #(80);
        D = 0;      //6th bit
        #(80);
        D = 1;      //7th bit
        #(80);
        cntT = 1;
        #(10);
        cntT = 0;
        #(120);
        
        #(40);
        D = 0;
        #(40);
        cntSD = 1;
        #(10);
        cntSD = 0;
        #(30);
        D = 1;      //1st bit
        #(80);
        D = 0;      //2nd bit
        #(80);
        D = 1;      //3rd bit
        #(80);
        D = 0;      //4th bit
        #(80);
        D = 1;      //5th bit
        #(80);
        D = 0;      //6th bit
        #(80);
        D = 1;      //7th bit
        cntT = 1;
        #(10);
        cntT = 0;
        #(120);
        
    end

endmodule
