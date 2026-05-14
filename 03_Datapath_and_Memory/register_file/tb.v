`timescale 1ns / 1ps

module tb;
    reg clk, we;
    reg [4:0] w_addr, rs1, rs2;
    reg [31:0] data;
    wire [31:0] rs1_data, rs2_data;

    register_file dut (
        .clk(clk),
        .we(we),
        .w_addr(w_addr),
        .rs1(rs1),
        .rs2(rs2),
        .data(data),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);

        clk = 0; we = 0; w_addr = 0; rs1 = 0; rs2 = 0; data = 0;
        #12;

        // Test 1: Write to x1 and x2
        we = 1; w_addr = 5'd1; data = 32'hAAAA_AAAA; #10;
        we = 1; w_addr = 5'd2; data = 32'h5555_5555; #10;
        we = 0;

        // Test 2: Read x1 and x2
        rs1 = 5'd1; rs2 = 5'd2; #10;

        // Test 3: Verify x0 is hardwired to 0
        we = 1; w_addr = 5'd0; data = 32'hFFFF_FFFF; #10;
        rs1 = 5'd0; #10;

        // Test 4: Internal Forwarding (Read and Write same address)
        we = 1; w_addr = 5'd5; data = 32'h1234_5678; rs1 = 5'd5; #10;
        
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0t | we=%b w_addr=%d data=%h | rs1=%d d1=%h | rs2=%d d2=%h", 
                 $time, we, w_addr, data, rs1, rs1_data, rs2, rs2_data);
    end
endmodule