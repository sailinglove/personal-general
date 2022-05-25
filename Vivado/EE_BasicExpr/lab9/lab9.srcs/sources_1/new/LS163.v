// 4 bits counter
module LS163(
    input CLK,
    input CLR_L,
    input LD_L,
    input ENT, ENP,
    input A, B, C, D,
    output QA, QB, QC, QD,
    output reg RCO
    );
    
    reg [3:0] Q;
    initial Q = 4'b0;
    assign QA = Q[0], QB = Q[1], QC = Q[2], QD = Q[3];
    
    always @(posedge CLK)
        if (CLR_L == 0)
            Q <= 4'b0;
    
    always @(posedge CLK) begin
        if (!LD_L)
            Q <= {D, C, B, A};
        else if (ENP && ENT) begin
            if (Q == 4'b1111) begin
                Q <= Q + 1'b1;
                RCO <= 1;
            end
            else begin
                Q <= Q + 1'b1;
                RCO <= 0;
            end
        end
        else
            if (ENP)
                Q <= Q + 1'b1;
            else if (ENT) begin
                Q <= Q;
                RCO <= 0;
            end
            else
                Q <= Q;
    end
endmodule