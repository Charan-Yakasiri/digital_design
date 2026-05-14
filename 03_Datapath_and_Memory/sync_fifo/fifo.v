module fifo #(
    parameter width = 8,
    parameter depth = 32,
    parameter a_full = 31
)(
    input clk,
    input rst_n,
    input wr,rd,
    input [width-1:0]data_in,
    output reg [width-1:0]data_out,
    output full, empty, almost_full
);
    reg [width-1:0]mem[0:depth-1];

    localparam addr_w = (depth <= 2)   ? 1 :
                        (depth <= 4)   ? 2 :
                        (depth <= 8)   ? 3 :
                        (depth <= 16)  ? 4 :
                        (depth <= 32)  ? 5 :
                        (depth <= 64)  ? 6 : 7; // Example for portability

    reg [addr_w-1:0]w_ptr,r_ptr;
    reg [addr_w:0] count;

    assign empty = (count==0);
    assign full = (count==depth);
    assign almost_full = (count>=a_full);

    // readlogic
    always @ (posedge clk)begin
        if(!rst_n)begin
            data_out<={width{1'b0}};
        end
        else if(rd && !empty)begin
            data_out <= mem[r_ptr];
        end
    end

    // write logic
    always @(posedge clk)begin
        if(wr && !full)begin
            mem[w_ptr] <=data_in;
        end
    end

    // count logic
    always @(posedge clk )begin
        if(!rst_n)begin
            w_ptr<=0;
            r_ptr<=0;
            count<=0;
        end
        else begin
            case ({wr && !full,rd && !empty})
                2'b10: begin // Write only
                    w_ptr <= (w_ptr == depth-1) ? 0 : w_ptr + 1'b1;
                    count <= count + 1'b1;
                end
                2'b01: begin // Read only
                    r_ptr <= (r_ptr == depth-1) ? 0 : r_ptr + 1'b1;
                    count <= count - 1'b1;
                end
                2'b11: begin // Simultaneous Read/Write
                    w_ptr <= (w_ptr == depth-1) ? 0 : w_ptr + 1'b1;
                    r_ptr <= (r_ptr == depth-1) ? 0 : r_ptr + 1'b1;
                    // count stays same
                end
                default: ; // Do nothing
            endcase
        end
    end
    
endmodule