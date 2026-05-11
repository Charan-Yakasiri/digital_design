module p_encoder(
    input [3:0]d,
    output reg [1:0]o,
    output reg valid
);
    always @(*)begin
        o = 2'b00;
        valid = 1'b1;
        casez (d)
            4'b1??? : o = 2'b11;
            4'b01?? : o = 2'b10;
            4'b001? : o = 2'b01;
            4'b0001 : o = 2'b00;
            default : begin
                o = 2'b00;
                valid = 1'b0;
            end
        endcase
    end 
endmodule