
module SnackVend(
    input        clk,
    input        rst,
    input  [2:0] coin_in,
    output reg   out_nickel,
    output reg   out_dime,
    output reg   dispense_item,
    output reg   out_return,
    output reg [2:0] state_cur,
    output reg [2:0] state_nxt
);
    localparam ST0 = 3'd0;
    localparam ST1 = 3'd1;
    localparam ST2 = 3'd2;
    localparam ST3 = 3'd3;
    localparam ST4 = 3'd4;
    localparam ST5 = 3'd5;
    initial begin
        state_cur = ST0;
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state_cur    <= ST0;
            out_nickel   <= 1'b0;
            out_return   <= 1'b0;
            out_dime     <= 1'b0;
            dispense_item<= 1'b0;
        end
        else begin
            state_cur <= state_nxt;
        end
    end
    always @(*) begin
        state_nxt     = state_cur;
        out_nickel    = 1'b0;
        out_dime      = 1'b0;
        dispense_item = 1'b0;
        out_return    = 1'b0;
        case (state_cur)
            ST0: begin
                if (coin_in == 3'b001) begin
                    state_nxt = ST1;
                end
                else if (coin_in == 3'b010) begin
                    state_nxt = ST2;
                end
                else if (coin_in == 3'b100) begin
                    state_nxt     = ST0;
                    out_return    = 1'b1;
                    dispense_item = 1'b1;
                end
                else begin
                    state_nxt = ST0;
                end
            end
            ST1: begin
                if (coin_in == 3'b001) begin
                    state_nxt = ST2;
                end
                else if (coin_in == 3'b010) begin
                    state_nxt = ST3;
                end
                else if (coin_in == 3'b100) begin
                    state_nxt     = ST0;
                    out_nickel    = 1'b1;
                    dispense_item = 1'b1;
                end
                else begin
                    state_nxt = ST1;
                end
            end
            ST2: begin
                if (coin_in == 3'b001) begin
                    state_nxt = ST3;
                end
                else if (coin_in == 3'b010) begin
                    state_nxt = ST4;
                end
                else if (coin_in == 3'b100) begin
                    state_nxt     = ST0;
                    out_dime      = 1'b1;
                    dispense_item = 1'b1;
                end
                else begin
                    state_nxt = ST2;
                end
            end
            ST3: begin
                if (coin_in == 3'b001) begin
                    state_nxt = ST4;
                end
                else if (coin_in == 3'b010) begin
                    state_nxt     = ST0;
                    dispense_item = 1'b1;
                end
                else if (coin_in == 3'b100) begin
                    state_nxt     = ST0;
                    out_nickel    = 1'b1;
                    out_dime      = 1'b1;
                    dispense_item = 1'b1;
                end
                else begin
                    state_nxt = ST3;
                end
            end
            ST4: begin
                if (coin_in == 3'b001) begin
                    state_nxt     = ST0;
                    dispense_item = 1'b1;
                end
                else if (coin_in == 3'b010) begin
                    state_nxt     = ST0;
                    out_nickel    = 1'b1;
                    dispense_item = 1'b1;
                end
                else if (coin_in == 3'b100) begin
                    state_nxt = ST4;
                    out_dime  = 1'b1;
                    out_return= 1'b1;
                    dispense_item = 1'b1;
                end
                else begin
                    state_nxt = ST4;
                end
            end
            default: begin
                state_nxt     = ST0;
                out_nickel    = 1'b0;
                out_dime      = 1'b0;
                dispense_item = 1'b0;
                out_return    = 1'b0;
            end
        endcase
    end
endmodule
