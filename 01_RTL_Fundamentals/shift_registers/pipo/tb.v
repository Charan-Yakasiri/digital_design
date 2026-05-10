`timescale 1ns / 1ps

module tb;
    parameter N = 4;

    reg clk, rst_n;
    reg [N-1:0] data;
    wire [N-1:0] q;

    pipo #(N) dut (
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

        data = 4'b1010; #10;
        data = 4'b0101; #10;
        data = 4'b1111; #10;
        data = 4'b0000; #10;
        
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | data_in=%b | q_out=%b", 
                 $time, rst_n, data, q);
    end
endmodule