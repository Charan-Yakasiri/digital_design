`timescale 1ns / 1ps

module tb;
    reg [3:0] d;
    wire [1:0] o;
    wire valid;

    p_encoder dut (
        .d(d),
        .o(o),
        .valid(valid)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        // Test priority (Highest bit 1xxx)
        d = 4'b1010; #10;
        
        // Test next priority (01xx)
        d = 4'b0111; #10;
        
        // Test lower priority (001x)
        d = 4'b0010; #10;
        
        // Test lowest bit (0001)
        d = 4'b0001; #10;
        
        // Test invalid case (0000)
        d = 4'b0000; #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | d=%b | o=%b | valid=%b", $time, d, o, valid);
    end
endmodule