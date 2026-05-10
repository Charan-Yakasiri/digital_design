`timescale 1ns / 1ps

module tb;

parameter width = 4;
reg clk,rst_n;
wire [width-1:0]counter;

counter #(
        .width(width)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .counter(counter)
    );

    initial begin
        forever begin
            #5 clk = ~clk;
        end
    end


    initial begin
        clk =0;
        rst_n = 0;

        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        #10;
        rst_n = 1;


        #200;
        $finish;
    end
endmodule