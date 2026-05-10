module sipo #(
    parameter N = 4
)(
    input clk, rst_n, data,
    output reg [N-1:0]q
);
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            q<=0;
        end
        else begin
            q <= {data,q[N-1:1]};
        end
    end
endmodule