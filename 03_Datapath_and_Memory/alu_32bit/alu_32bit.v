module alu(
    input  [31:0] a, b,
    input  [2:0]  sel,
    output reg [31:0] out,
    output reg C,
    output reg V,
    output reg Z
);

    localparam ADD    = 3'b000;
    localparam SUB    = 3'b001;
    localparam BAND   = 3'b010;
    localparam BOR    = 3'b011;
    localparam BXOR   = 3'b100;
    localparam BNOT   = 3'b101;
    localparam LSHIFT = 3'b110;
    localparam RSHIFT = 3'b111;

    wire [31:0] b_mux;
    wire cin;
    wire [31:0] sum;
    wire c31; 
    wire c32; 


    assign cin   = (sel == SUB);
    assign b_mux = (sel == SUB) ? ~b : b;

    assign {c31, sum[30:0]} = a[30:0] + b_mux[30:0] + cin;
    assign {c32, sum[31]}   = a[31] + b_mux[31] + c31;

    always @(*) begin
        out = 32'b0;
        C   = 1'b0;
        V   = 1'b0;
        
        case(sel)
            ADD, SUB: begin
                out = sum;
                C   = c32;
                V   = c31 ^ c32; 
            end
            BAND:   out = a & b;
            BOR:    out = a | b;
            BXOR:   out = a ^ b;
            BNOT:   out = ~a;
            LSHIFT: out = a << b;
            RSHIFT: out = a >> b;
            default: out = 32'b0;
        endcase

        Z = (out == 32'b0);
    end

endmodule