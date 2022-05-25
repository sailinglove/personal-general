`timescale 1ns / 1ps

module LS164_tb();

    reg clk = 0;
    
    always @* begin
        #(5);
        clk <= !clk;
    end
    
    reg rst = 1;
    reg Din = 0;
    reg EN = 1;
    wire [7:0] Dout;

    LS164 inst_LS164(.CP(clk), .DSA(Din), .DSB(EN), .MR_L(rst), .Q(Dout));
    
    initial begin
        rst = 0;
        #(10);
        rst = 1;
        #(10);
        Din = 1;
        #(10);
        Din = 0;
        #(10);
        Din = 1;
        #(10);
        Din = 0;
        #(10);
        Din = 1;
        #(10);
        Din = 0;
        #(10);
        Din = 1;
        #(10);
        Din = 0;
        #(5);
        rst = 0;
        #(15)
        rst = 1;
        EN = 0;
        #(10);
        Din = 1;
        #(10);
        Din = 0;
        #(10);
        Din = 1;
        
    end

endmodule
