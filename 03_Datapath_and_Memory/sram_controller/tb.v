`timescale 1ns / 1ps

module tb;
    parameter depth = 32;
    parameter width = 8;
    parameter addr  = $clog2(depth);

    reg clk, rst_n, r_rq, w_rq;
    reg [width-1:0] data_in;
    reg [addr-1:0] addr_in;
    wire ready, write_en;
    wire [width-1:0] data_out;

    sram_controller #(depth, width, addr) dut (
        .clk(clk),
        .rst_n(rst_n),
        .r_rq(r_rq),
        .w_rq(w_rq),
        .data_in(data_in),
        .addr_in(addr_in),
        .ready(ready),
        .write_en(write_en),
        .data_out(data_out)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Initialize
        clk = 0; rst_n = 0; r_rq = 0; w_rq = 0;
        data_in = 0; addr_in = 0;
        #12 rst_n = 1;

        // Wait for controller to be ready
        wait(ready);

        // --- Test 1: Write Operation ---
        @(posedge clk);
        w_rq = 1; addr_in = 5'd10; data_in = 8'hA5;
        @(posedge clk);
        w_rq = 0; 
        
        // Wait for it to finish and return to IDLE
        wait(ready);

        // --- Test 2: Read Operation ---
        @(posedge clk);
        r_rq = 1; addr_in = 5'd10;
        @(posedge clk);
        r_rq = 0;

        // Wait for it to finish
        wait(ready);
        
        // --- Test 3: Write another value ---
        @(posedge clk);
        w_rq = 1; addr_in = 5'd20; data_in = 8'h5A;
        @(posedge clk);
        w_rq = 0;
        
        wait(ready);

        #50 $finish;
    end

    initial begin
        $monitor("Time=%0t | st=%b | ready=%b | addr=%d | data_in=%h | data_out=%h | we=%b", 
                 $time, dut.st, ready, addr_in, data_in, data_out, write_en);
    end
endmodule