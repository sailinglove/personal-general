`timescale 1ns / 1ps

module clk_500k_tb();

    reg clk;
    wire new_clk;
    
    always begin
        #5;
        clk <= !clk;
    end
    
    clk_500k inst_clk_500k( .clk(clk), .new_clk(new_clk) );
    
    initial clk = 1;

endmodule
