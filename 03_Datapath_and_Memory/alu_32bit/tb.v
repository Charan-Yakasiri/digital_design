`timescale 1ns / 1ps

module tb;
    reg [31:0] a, b;
    reg [2:0] sel;
    wire [31:0] out;
    wire C, V, Z;

    alu dut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out),
        .C(C),
        .V(V),
        .Z(Z)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        sel = 3'b000; a = 32'hFFFFFFFF; b = 32'h00000001; #10;
     
        sel = 3'b001; a = 32'd10; b = 32'd4; #10;
        
        sel = 3'b000; a = 32'h7FFFFFFF; b = 32'h00000001; #10;

        sel = 3'b010; a = 32'hAAAA_AAAA; b = 32'h5555_5555; #10;

        sel = 3'b011; a = 32'h0; b = 32'h0; #10;

        sel = 3'b110; a = 32'h1; b = 32'd4; #10;
        sel = 3'b111; a = 32'h80; b = 32'd2; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | sel=%b | a=%h | b=%h | out=%h | C=%b V=%b Z=%b", 
                 $time, sel, a, b, out, C, V, Z);
    end
endmodule