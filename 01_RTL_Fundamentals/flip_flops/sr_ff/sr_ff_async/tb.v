`timescale 1ns / 1ps

module tb;

    reg clk;
    reg rst_n;
    reg S;
    reg R;
    wire q;

    sr_ff_async uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .S(S), 
        .R(R), 
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        S = 0;
        R = 0;

        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        #10 rst_n = 1;
        
        @(posedge clk);
        S = 1; R = 0;
        
        @(posedge clk);
        S = 0; R = 0;

        @(posedge clk);
        S = 0; R = 1;

        @(posedge clk);
        S = 1; R = 1;

        @(posedge clk);
        rst_n = 0;
        
        #20;
        $finish;
    end

    initial begin
        $monitor("T=%0t | rst_n=%b | S=%b R=%b | q=%b", $time, rst_n, S, R, q);
    end

endmodule
