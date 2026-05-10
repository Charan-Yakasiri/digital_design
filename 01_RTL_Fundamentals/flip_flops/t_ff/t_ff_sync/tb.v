module tb;
    reg clk, rst_n, t;
    wire q;

    t_ff_sync uut (.clk(clk), .rst_n(rst_n), .t(t), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0; t = 0;
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
        #10 rst_n = 1;
        #5  t = 1;
        #2  t = 0;
        #3  t = 1;
        #10 t = 0;
        #10 rst_n = 0;
        #2  rst_n = 1;
        #10 $finish;
    end
endmodule
