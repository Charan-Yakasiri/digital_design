module pipo #(
    parameter N=4
)(
    input clk,rst_n,
    input [N-1:0]data,
    output reg [N-1:0]q
);
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            q<={N{1'b0}};
        end
        else begin
            q<=data;
        end
    end
endmodule