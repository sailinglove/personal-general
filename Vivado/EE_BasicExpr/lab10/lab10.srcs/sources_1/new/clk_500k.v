module clk_500k(
    input clk,
    output reg new_clk
    );

    reg [7:0] counter;

    initial begin
        new_clk = 0;
        counter = 8'b0;
    end

    always @(posedge clk) begin
        if (counter >= 8'd99) begin
            counter <= 8'b0;
            new_clk <= !new_clk;
        end
        else
            counter <= counter + 1'b1;
    end

endmodule
