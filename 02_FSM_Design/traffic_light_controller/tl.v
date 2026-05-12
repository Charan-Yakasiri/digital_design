module tl(
    input clk,rst,input x,
    output reg [2:0]hw,cy
);
    // traffic signals
    parameter red = 3'b001;
    parameter yellow = 3'b010;
    parameter green = 3'b100;

    // states
    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 = 3'b100;

    // delay
    parameter y_d = 4;
    parameter r_d = 2;
    // state variables
    reg [2:0] st, n_st;
    reg [3:0] count;

    // state 
    always @(posedge clk or posedge rst)begin
        if(rst) begin
            st<=s0;
        end
        else begin
            if(st!=n_st) count <=0; //counter reset only when the next state is achieved
            else count<=count+4'd1; //counter increment
            st<=n_st;
        end
    end

    // next state logic
    always @(*)begin
        case(st)
            s0 : n_st = x ? s1 : s0;
            s1 : n_st = (count == y_d)? s2:s1;
            s2 : n_st = x ? s2 : s3;
            s3 : n_st = (count == y_d) ? s4:s3;
            s4 : n_st = (count==r_d) ? s0:s4;
            default : n_st = s0;
        endcase
    end

    // output logic
    always @(*)begin
        case(st)
            s0 : {hw,cy} = {green,red};
            s1 : {hw,cy} = {yellow,red};
            s2 : {hw,cy} = {red,green};
            s3 : {hw,cy} = {red,yellow};
            s4 : {hw,cy} = {red,red};
            default : {hw,cy} = {green,red};
        endcase
    end


endmodule