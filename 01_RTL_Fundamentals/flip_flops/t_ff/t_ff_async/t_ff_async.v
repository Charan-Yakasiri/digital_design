module t_ff_async(
    input clk,rst_n,
    input t,
    output reg q
);
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n) begin
            q<=0;
        end
        else begin
            if(t==0) q<=q;
            else q<=~q;
        end
    end
endmodule