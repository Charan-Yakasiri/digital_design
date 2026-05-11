module mux2_1 #(
    parameter width = 4
)(
    input [width-1:0]a,b,
    input  sel,
    output [width-1:0]out
);
    assign out = (sel)?b:a;

endmodule