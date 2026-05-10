`timescale 1ns / 1ps

module tb;
    parameter N = 4;

    reg clk, rst_n, data;
    wire [N-1:0] q;

    sipo #(N) dut (
        .clk(clk),
        .rst_n(rst_n),
        .data(data),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        clk = 0; rst_n = 0; data = 0;
        #12 rst_n = 1;

        data = 1; #10;
        data = 0; #10;
        data = 1; #10;
        data = 1; #10;
        
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | data=%b | q=%b", $time, rst_n, data, q);
    end
endmodule