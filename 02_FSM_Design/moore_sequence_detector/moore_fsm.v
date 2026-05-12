module moore(
    input clk,rst_n,in,
    output reg out
);
    parameter s0 = 3'd0;
    parameter s1 = 3'd1;
    parameter s2 = 3'd2;
    parameter s3 = 3'd3;
    parameter s4 = 3'd4;
    parameter s5 = 3'd5;

    reg [2:0] st , n_st;
    
    // State
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n) st<=s0;
        else begin
            st <= n_st;
        end
    end

    // next state logic
    always @(*)begin
        case(st)            
            s0 : n_st = in ? s1 : s0;
            s1 : n_st = in ? s1 : s2;
            s2 : n_st = in ? s1 : s3;
            s3 : n_st = in ? s4 : s0;
            s4 : n_st = in ? s1 : s5;
            s5 : n_st = in ? s1 : s3; 
            default : n_st = s0;
        endcase
    end

    // output logic combinational
    // always @ (*) begin
    //     case (st) 
    //         s5 : out =1'b1;
    //         default : out=1'b0;
    //     endcase
    // end
    
    // output logic sequential (prevents combinational paths)
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) 
            out <= 1'b0;
        else begin
            case (n_st) 
                s5      : out <= 1'b1;
                default : out <= 1'b0;
            endcase
        end
    end
endmodule