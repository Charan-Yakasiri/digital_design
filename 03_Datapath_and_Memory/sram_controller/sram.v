module sram_controller #(
    parameter depth = 32,
    parameter width = 8,
    parameter addr  = $clog2(depth)
)(
    input clk,
    input rst_n,
    input r_rq,
    input w_rq,
    input [width-1:0] data_in,
    input [addr-1:0]  addr_in,
    output reg ready,
    output reg write_en,
    output reg [width-1:0] data_out
);

    reg [width-1:0] mem [0:depth-1];

    localparam IDLE  = 2'b00,
               READ  = 2'b01,
               WRITE = 2'b10;

    reg [1:0] st, n_st;

    reg [addr-1:0]  addr_reg;
    reg [width-1:0] data_reg;

    // State register
    always @(posedge clk) begin
        if (!rst_n)
            st <= IDLE;
        else
            st <= n_st;
    end

    // Capture request inputs
    always @(posedge clk) begin
        if (!rst_n) begin
            addr_reg <= 0;
            data_reg <= 0;
        end
        else if (st == IDLE && (r_rq || w_rq)) begin
            addr_reg <= addr_in;
            data_reg <= data_in;
        end
    end

    // Next-state logic
    always @(*) begin
        case (st)
            IDLE: begin
                if (w_rq)
                    n_st = WRITE;
                else if (r_rq)
                    n_st = READ;
                else
                    n_st = IDLE;
            end
            READ,
            WRITE: n_st = IDLE;
            default: n_st = IDLE;
        endcase
    end

    // Sequential outputs and memory access
    always @(posedge clk) begin
        if (!rst_n) begin
            ready    <= 1'b0;
            write_en <= 1'b0;
            data_out <= {width{1'b0}};
        end
        else begin
            case (st)
                IDLE: begin
                    ready    <= 1'b1;
                    write_en <= 1'b0;
                end

                WRITE: begin
                    ready    <= 1'b0;
                    write_en <= 1'b1;
                    mem[addr_reg] <= data_reg;
                end

                READ: begin
                    ready    <= 1'b0;
                    write_en <= 1'b0;
                    data_out <= mem[addr_reg];
                end

                default: begin
                    ready    <= 1'b1;
                    write_en <= 1'b0;
                end
            endcase
        end
    end
endmodule