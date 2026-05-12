module top(
    input clk,rst_btn,x,
    output reg [2:0] RGB0,RGB1
);

reg [26:0] slow_clk_count;

always @(posedge clk or posedge rst_btn) begin
    if(rst_btn) slow_clk_count <= 0;
    else slow_clk_count <= slow_clk_count + 1;
end

wire clk_slow = slow_clk_count[26]; 

wire [2:0] hw_int, cy_int;

tl dut(
    .clk(clk_slow), 
    .rst(rst_btn), 
    .x(x), 
    .hw(hw_int), 
    .cy(cy_int)
);

always @(*) begin
    case(hw_int)
        3'b100 : RGB0 = 3'b010;
        3'b001 : RGB0 = 3'b001;
        3'b010 : RGB0 = 3'b011;
        default: RGB0 = 3'b000;           
    endcase

    case(cy_int)
        3'b100 : RGB1 = 3'b010;
        3'b001 : RGB1 = 3'b001;
        3'b010 : RGB1 = 3'b011;
        default: RGB1 = 3'b000;
     endcase
end
endmodule