module nFlagGen(
    input clk,
    input rst,
    input SigOn, RefOn,
    input [7:0] sw,     //simulated analog voltage input
    output reg nFlag
    );

    (* mark_debug = "true" *)reg [8:0] counter = 9'b0;
    // reg [8:0] counter = 9'b0;
    wire cntEn;         //counter enable

    // only count when either SigOn or RefOn is valid
    or or_cntEN(cntEn, SigOn, RefOn);

    // wire clk500k;
    // clk_500k inst_clk( .clk(clk), .new_clk(clk500k) );

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 9'b0;
            nFlag = 1;
        end
        else
            if (cntEn) begin
                // count for charge cycle(256) + discharge cycle(sw)
                if (counter < (8'd255 + sw)) begin
                    counter <= counter + 1'b1;
                    nFlag = 1;
                end
                else begin
                    // charge and discharge cycles completed, nFlag valid
                    counter <= 9'b0;
                    nFlag = 0;
                end
            end
            else nFlag = 1;
    end

endmodule
