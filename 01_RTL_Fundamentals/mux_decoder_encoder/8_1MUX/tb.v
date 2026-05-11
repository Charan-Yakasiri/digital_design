`timescale 1ns / 1ps

module tb;
    parameter width = 4;

    reg [width*8-1:0] d;
    reg [2:0] sel;
    wire [width-1:0] out;

    mux8_1 #(width) dut (
        .d(d),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Fill d with recognizable pattern: 0, 1, 2, 3, 4, 5, 6, 7
        // d = {4'h7, 4'h6, 4'h5, 4'h4, 4'h3, 4'h2, 4'h1, 4'h0}
        d = 32'h76543210; 
        
        // Loop through all 8 channels
        sel = 3'b000; #10;
        sel = 3'b001; #10;
        sel = 3'b010; #10;
        sel = 3'b011; #10;
        sel = 3'b100; #10;
        sel = 3'b101; #10;
        sel = 3'b110; #10;
        sel = 3'b111; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | sel=%d | out=%h", $time, sel, out);
    end
endmodule