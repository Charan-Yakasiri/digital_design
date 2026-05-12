`timescale 1ns / 1ps

module tb;
    reg clk, rst_n, in;
    wire out;

    moore dut (
        .clk(clk),
        .rst_n(rst_n),
        .in(in),
        .out(out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Initialize
        clk = 0; rst_n = 0; in = 0;
        #12 rst_n = 1;

        // Sequence to reach s5: 1 -> 0 -> 0 -> 1 -> 0
        @(posedge clk) in <= 1; // -> s1
        @(posedge clk) in <= 0; // -> s2
        @(posedge clk) in <= 0; // -> s3
        @(posedge clk) in <= 1; // -> s4
        @(posedge clk) in <= 0; // -> s5
        
        // Hold at s5 for one cycle, then transition
        @(posedge clk) in <= 0; // -> s3
        
        #200 $finish;
    end

    initial begin
        $monitor("Time=%0t | State=%d | In=%b | Out=%b", 
                 $time, dut.st, in, out);
    end
endmodule