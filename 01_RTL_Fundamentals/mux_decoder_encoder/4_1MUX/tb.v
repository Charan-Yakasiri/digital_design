`timescale 1ns / 1ps

module tb;
    parameter width = 4;

    reg [width-1:0] a, b, c, d;
    reg [1:0] sel;
    wire [width-1:0] y;

    mux4_1 #(width) dut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel),
        .y(y)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Assign unique values to each input
        a = 4'h1; b = 4'h2; c = 4'h3; d = 4'h4;
        
        // Test all select combinations
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        // Test with different data values
        a = 4'hF; sel = 2'b00; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | sel=%b | y=%h (a=%h, b=%h, c=%h, d=%h)", 
                 $time, sel, y, a, b, c, d);
    end
endmodule