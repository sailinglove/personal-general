// serial-in parallel-out shift register
module LS164(
    input CP,
    input DSA, DSB,
    input MR_L,
    output reg [7:0] Q
    );
    
    always @*
        if (MR_L == 0)
            Q <= 7'b0;
    
    always @(posedge CP)
        Q <= {Q[6:0], DSA && DSB};

endmodule
