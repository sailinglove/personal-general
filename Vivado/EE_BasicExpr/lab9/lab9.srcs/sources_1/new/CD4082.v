// 2-channel 4-input AND Gate
module CD4082(
    input A, B, C, D,
    input E, F, G, H,
    output J,
    output K
    );
    
    assign J = A && B && C && D;
    assign K = E && F && G && H;
    
endmodule
