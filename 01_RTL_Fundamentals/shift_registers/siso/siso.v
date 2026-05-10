module siso #(
    parameter N=4
)(
    input clk,rst_n,data,load,
    output q
);
    reg [N-1:0]shift_reg;
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            shift_reg <= {N{1'b0}};
        end
        else begin
            shift_reg <= {data, shift_reg[N-1:1]};
        end
    end
    assign q = shift_reg[0];
endmodule