`timescale 1ns / 1ps

module tb;
    parameter width = 8;
    parameter depth = 32;
    parameter a_full = 31;

    reg clk, rst_n, wr, rd;
    reg [width-1:0] data_in;
    wire [width-1:0] data_out;
    wire full, empty, almost_full;

    fifo #(width, depth, a_full) dut (
        .clk(clk),
        .rst_n(rst_n),
        .wr(wr),
        .rd(rd),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty),
        .almost_full(almost_full)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        clk = 0; rst_n = 0; wr = 0; rd = 0; data_in = 0;
        #12 rst_n = 1;

        // Test 1: Burst Write until Full
        repeat(depth) begin
            @(posedge clk);
            if (!full) begin
                wr <= 1;
                data_in <= data_in + 1;
            end
        end
        @(posedge clk) wr <= 0;
        #20;

        // Test 2: Burst Read until Empty
        repeat(depth) begin
            @(posedge clk);
            if (!empty) rd <= 1;
        end
        @(posedge clk) rd <= 0;
        #20;

        // Test 3: Simultaneous Read and Write
        @(posedge clk);
        wr <= 1; rd <= 1; data_in <= 8'hFF;
        #10;
        wr <= 0; rd <= 0;

        #50 $finish;
    end

    initial begin
        $monitor("Time=%0t | wr=%b rd=%b | in=%h out=%h | F=%b E=%b AF=%b", 
                 $time, wr, rd, data_in, data_out, full, empty, almost_full);
    end
endmodule