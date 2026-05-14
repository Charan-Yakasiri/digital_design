module register_file(
    input clk,
    input we,
    input [4:0] w_addr, rs1, rs2,
    input [31:0] data,
    output [31:0] rs1_data,
    output [31:0] rs2_data
);
    reg [31:0] mem [0:31];

    // Sequential Write Port
    always @ (posedge clk) begin
        if (we && (w_addr != 5'd0)) begin
            mem[w_addr] <= data;
        end
    end

    // Combinational Read Ports
    assign rs1_data = (rs1 == 5'd0) ? 32'd0 :
                (we && (w_addr==rs1)) ? data : mem[rs1];
    assign rs2_data = (rs2 == 5'd0) ? 32'd0 :
                (we && (w_addr==rs2)) ? data : mem[rs2];

endmodule
