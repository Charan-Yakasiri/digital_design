`timescale 1ns / 1ps

module tb;
    parameter width = 4;

    reg [width-1:0] a, b;
    reg sel;
    wire [width-1:0] out;

    mux2_1 #(width) dut (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Initialize inputs
        a = 4'hA; b = 4'hB; sel = 0; #10;
        
        // Switch to input B
        sel = 1; #10;
        
        // Test different values
        a = 4'h5; b = 4'hC; sel = 0; #10;
        sel = 1; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | sel=%b | a=%h | b=%h | out=%h", 
                 $time, sel, a, b, out);
    end
endmodule