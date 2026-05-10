module d_ff_sync(
    input clk,rst_n,
    input d,
    output reg q
);
    always @(posedge clk)begin
        if(!rst_n) begin
            q<=0;
        end
        else begin
            q<=d;
        end
    end
endmodule