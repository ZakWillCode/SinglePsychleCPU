module pc_add (
    input [7:0] pc_out,

    output reg [7:0] pc_plus2
);
    
    always @(*) begin
        pc_plus2 <= pc_out + 2;
    end


endmodule