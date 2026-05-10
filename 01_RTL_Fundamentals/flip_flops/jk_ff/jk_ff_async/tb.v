`timescale 1ns / 1ps

module tb;

    reg clk;
    reg rst_n;
    reg J;
    reg K;
    wire q;

    jk_ff_async uut (
        .clk(clk), 
        .rst_n(rst_n), 
        .J(J), 
        .K(K), 
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;
        J = 0;
        K = 0;

        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        #10 rst_n = 1;
        
        @(posedge clk);
        J = 1; K = 0;
        
        @(posedge clk);
        J = 0; K = 0;

        @(posedge clk);
        J = 0; K = 1;

        @(posedge clk);
        J = 1; K = 1;

        @(posedge clk);
        rst_n = 0;
        
        #20;
        $finish;
    end

    initial begin
        $monitor("T=%0t | rst_n=%b | S=%b R=%b | q=%b", $time, rst_n, J, K, q);
    end

endmodule
