module CLA7bit(A, B, S);
    //Inputs
    input [6:0] A, B;

    //Outputs
    output [7:0] S;

    //Connections 
    wire [6:0] P, G;
    wire [7:0] C;


    //Getting the carry bits
    assign C[0] = 1'b0;
    assign C[1] = G[0];
    assign C[2] = G[1] | (P[1] & G[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]);
    assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]);
    assign C[5] = G[4] | (P[4] & G[3]) | (P[4] & P[3] & G[2]) | (P[4] & P[3] & P[2] & G[1]) | (P[4] & P[3] & P[2] & P[1] & G[0]);
    assign C[6] = G[5] | (P[5] & G[4]) | (P[5] & P[4] & G[3]) | (P[5] & P[4] & P[3] & G[2]) | (P[5] & P[4] & P[3] & P[2] & G[1]) | (P[5] & P[4] & P[3] & P[2] & P[1] & G[0]);
    assign C[7] = G[6] | (P[6] & G[5]) | (P[6] & P[5] & G[4]) | (P[6] & P[5] & P[4] & G[3]) | (P[6] & P[5] & P[4] & P[3] & G[2]) | (P[6] & P[5] & P[4] & P[3] & P[2] & G[1]) | (P[6] & P[5] & P[4] & P[3] & P[2] & P[1] & G[0]);

    //Using the 1-bit full adders
    CLAFA fa0 (.A(A[0]), .B(B[0]), .C(C[0]), .S(S[0]), .P(P[0]), .G(G[0]));
    CLAFA fa1 (.A(A[1]), .B(B[1]), .C(C[1]), .S(S[1]), .P(P[1]), .G(G[1]));
    CLAFA fa2 (.A(A[2]), .B(B[2]), .C(C[2]), .S(S[2]), .P(P[2]), .G(G[2]));
    CLAFA fa3 (.A(A[3]), .B(B[3]), .C(C[3]), .S(S[3]), .P(P[3]), .G(G[3]));
    CLAFA fa4 (.A(A[4]), .B(B[4]), .C(C[4]), .S(S[4]), .P(P[4]), .G(G[4]));
    CLAFA fa5 (.A(A[5]), .B(B[5]), .C(C[5]), .S(S[5]), .P(P[5]), .G(G[5]));
    CLAFA fa6 (.A(A[6]), .B(B[6]), .C(C[6]), .S(S[6]), .P(P[6]), .G(G[6]));

    assign S[7] = C[7];

    
endmodule