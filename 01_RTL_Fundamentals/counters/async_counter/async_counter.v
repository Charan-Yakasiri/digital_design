module counter #(
    parameter  width= 4
)(
    input clk,
    input rst_n,
    output reg [width-1:0]counter
);

    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            counter <= {width{1'b0}};
        end
        else begin
            counter <= counter +1'b1;
        end
    end
endmodule