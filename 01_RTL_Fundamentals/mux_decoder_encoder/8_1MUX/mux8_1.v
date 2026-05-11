module mux8_1 #(
    parameter width = 4
)(
    input [width*8-1:0]d,
    input [2:0]sel,
    output [width-1:0]out
);
    assign out = d[sel*width +: width];
endmodule