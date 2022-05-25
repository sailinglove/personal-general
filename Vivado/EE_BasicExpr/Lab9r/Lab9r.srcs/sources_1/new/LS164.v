// 8-bit serial-in parallel-out shift register
module LS164(
    input CP,
    input MR_L,
    input DSA, DSB,
    output reg [7:0] Q
    );
    
    always @(posedge CP) begin
        if (!MR_L)
            Q <= 8'b0;
        else begin
            Q[7:1] <= Q[6:0];
            if (DSA && DSB)
                Q[0] <= 1'b1;
            else
                Q[0] <= 1'b0;
        end
    end
endmodule