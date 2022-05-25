module test(
    output reg [3:0] o
    );
    
    initial o = 4'b1111;
    
    initial o <= o + 1;
    
endmodule
