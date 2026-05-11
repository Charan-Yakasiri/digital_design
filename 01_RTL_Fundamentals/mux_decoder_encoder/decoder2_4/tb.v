`timescale 1ns / 1ps

module tb;
    reg [1:0] a;
    wire [3:0] y;

    decoder2_4 dut (
        .a(a),
        .y(y)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Test all 4 combinations
        a = 2'b00; #10;
        a = 2'b01; #10;
        a = 2'b10; #10;
        a = 2'b11; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | input a=%b | output y=%b", $time, a, y);
    end
endmodule