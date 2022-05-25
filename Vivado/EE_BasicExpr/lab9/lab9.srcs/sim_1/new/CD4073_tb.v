`timescale 1ns / 1ps

module CD4073_tb();
    reg A = 0, B = 0, C = 0;
    reg D = 1, E = 1, F = 1;
    reg G = 1, H = 0, I = 1;
    wire J, K, L;
    
    CD4073 inst_CD4073(.A(A), .B(B), .C(C),
                       .D(D), .E(E), .F(F),
                       .G(G), .H(H), .I(I),
                       .J(J), .K(K), .L(L));

    initial begin
        #(10);
        A = 1;
        #(10);
        B = 1;
        #(10);
        C = 1;
    end

endmodule
