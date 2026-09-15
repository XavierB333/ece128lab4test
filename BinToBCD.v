module BintoBCD(
    input [7:0] Bin,
    input clk,
    output reg [15:0] BCD
);  
    wire i;
    
    always @(posedge clk)
    BCD = 16'b0;
    begin 

    end
endmodule