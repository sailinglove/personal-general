`timescale 1ns / 1ps

module BaudGen#(parameter SYS_FREQ = 100_000_000
)(
    input Clock, Reset,
    output reg Bclk16      //Bclk16 = 16x Bclk
    //output Bclk,            //
    );
    //reg [3:0] Baud16Count;
    reg [10:0] Baud_cnt;
    reg [31:0] bps = 9_600;
    
    wire [31:0]Baud_max = ( SYS_FREQ / bps ) / 16;
    initial Bclk16 = 1'b0;
    
    always @(posedge Reset or posedge Clock)
        if(Reset) begin
            Bclk16 <= 1'b0;
            Baud_cnt <= 1'b0;
        end
        else if(Baud_cnt >= Baud_max / 2) begin
            Bclk16 <= ~Bclk16;
            Baud_cnt <= 11'b0;
        end else Baud_cnt <= Baud_cnt + 1'b1;
        
//    always @(posedge Reset or posedge Bclk16)
//        if (Reset ) Baud16Count <= 4'b0000;
//        else Baud16Count <= Baud16Count + 1;
//    assign Bclk = Baud16Count[3];
    
endmodule
