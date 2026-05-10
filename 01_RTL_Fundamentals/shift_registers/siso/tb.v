`timescale 1ns / 1ps

module tb;
    parameter N = 4;

    reg clk, rst_n, data, load;
    wire q;

    siso #(N) dut (
        .clk(clk),
        .rst_n(rst_n),
        .data(data),
        .load(load),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        clk = 0; rst_n = 0; data = 0; load = 0;
        #12 rst_n = 1;

        // Shift in 4 bits: 1011
        @(negedge clk) data = 1;
        @(negedge clk) data = 1;
        @(negedge clk) data = 0;
        @(negedge clk) data = 1;
        
        // Shift in 0s to push the last bits out
        data = 0; #40;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | data_in=%b | q_out=%b", 
                 $time, rst_n, data, q);
    end
endmodule