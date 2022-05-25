// 6-channel NOT Gate
module CD4069(
    input A, B, C, D, E, F,
    output G, H, I, J, K, L
    );
    
    assign G = !A;
    assign H = !B;
    assign I = !C;
    assign J = !D;
    assign K = !E;
    assign L = !F;
    
endmodule
