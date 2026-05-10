module tb;
    reg clk, rst_n, d;
    wire q;

    d_ff_async uut (.clk(clk), .rst_n(rst_n), .d(d), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0; d = 0;
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        #10 rst_n = 1;
        #5  d = 1;
        #2  d = 0;
        #3  d = 1;
        #10 d = 0;
        #10 rst_n = 0;
        #2  rst_n = 1;
        #10 $finish;
    end
endmodule
