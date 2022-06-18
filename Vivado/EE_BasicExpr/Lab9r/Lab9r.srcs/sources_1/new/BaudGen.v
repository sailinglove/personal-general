module BaudGen #(parameter SYS_FREQ = 100_000_000
)(
    input clk, rst,
    output reg Bclk16
    );

    reg [10:0] Baud_cnt;
    reg [31:0] bps = 100_000;
    
    wire [31:0]Baud_max = ( SYS_FREQ / bps ) / 16;
    initial Bclk16 = 1'b0;
    
    always @(posedge rst or posedge clk)
        if(rst) begin
            Bclk16 <= 1'b0;
            Baud_cnt <= 1'b0;
        end
        else if(Baud_cnt >= Baud_max / 2) begin
            Bclk16 <= ~Bclk16;
            Baud_cnt <= 11'b0;
        end else Baud_cnt <= Baud_cnt + 1'b1;
    
endmodule
