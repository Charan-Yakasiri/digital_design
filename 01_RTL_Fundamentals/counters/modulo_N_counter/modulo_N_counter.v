module modulo #(
    parameter N = 10
)(
    input clk,rst_n,
    output reg [$clog2(N)-1:0] counter
);
    always @(posedge clk) begin
        if(!rst_n)begin
            counter <= {$clog2(N){1'b0}}; 
        end
        else if (counter==N-1)begin
            counter<={$clog2(N){1'b0}};
        end
        else begin
            counter <= counter + 1'b1;
        end
    end
endmodule