module mux4_1 #(
    parameter width = 4
)(
    input [width-1:0]a,b,c,d,
    input [1:0]sel,
    output reg [width-1:0]y
);
    always @(*)begin
        case(sel)
            2'b00 : y=a;
            2'b01 : y=b;
            2'b10 : y=c;
            2'b11 : y=d;
            default : y = {width{1'b0}};
        endcase
    end
endmodule