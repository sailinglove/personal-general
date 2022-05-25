// 3-channel 3-input AND Gate
module CD4073(
    input A, B, C,
    input D, E, F,
    input G, H, I,
    output J,
    output K,
    output L
    );
    
    assign J = A && B && C;
    assign K = D && E && F;
    assign L = G && H && I;
    
endmodule
