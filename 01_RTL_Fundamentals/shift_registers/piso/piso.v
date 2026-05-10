module piso #(
    parameter N = 4
)(
    input clk,rst_n,load,
    input [N-1:0]data,
    output reg q
);
    reg [N-1:0]mem;
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            q<=1'b0;
            mem <=0;
        end
        else if(load)begin
            mem <= data;
        end
        else begin
            mem <= {1'b0,mem[N-1:0]};
            q <= mem[0];
        end
    end
endmodule