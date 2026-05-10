module sr_ff_async(
    input clk,rst_n,
    input S,R,
    output reg q
);
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            q<=0;
        end
        else begin
            case ({S,R})
            2'b00 : q <= q;
            2'b01 : q <= 1'b0;
            2'b10 : q <= 1'b1;
            2'b11 : q <= 1'bx;
            default : q <= 0;
        endcase
        end
    end
endmodule