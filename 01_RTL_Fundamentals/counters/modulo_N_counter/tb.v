module tb;

    parameter N = 10;
    reg clk;
    reg rst_n;
    wire [$clog2(N)-1:0] counter;

    modulo #(.N(N)) dut (
        .clk(clk),
        .rst_n(rst_n),
        .counter(counter)
    );

    always #5 clk = ~clk;

    
    initial begin

        clk = 0;
        rst_n = 0;

        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        #15 rst_n = 1;
        #250;

        $display("Final count: %d", counter);
        $finish;
    end

    initial begin
        $monitor("Time: %t | Reset: %b | Count: %d", $time, rst_n, counter);
    end

endmodule