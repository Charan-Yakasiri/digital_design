`timescale 1ns / 1ps

module tb;
    parameter N = 4;

    reg clk, rst_n, load;
    reg [N-1:0] data;
    wire q;

    piso #(N) dut (
        .clk(clk),
        .rst_n(rst_n),
        .load(load),
        .data(data),
        .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        clk = 0; rst_n = 0; load = 0; data = 0;
        #12 rst_n = 1;

        data = 4'b1011; load = 1; #10;
        load = 0; #50;
        
        $finish;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | load=%b | data=%b | q=%b", 
                 $time, rst_n, load, data, q);
    end
endmodule