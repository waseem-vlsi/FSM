
module sequence_detector_overlap(
    input   clock,
    input   reset,
    input   X,
    output reg  Y
);


    parameter [1:0] S0 = 2'b00,
                     S1 = 2'b01,
                     S2 = 2'b10,
                     S3 = 2'b11;

    reg [1:0] PS, NS;

    always @(posedge clock or posedge reset) begin
        if (reset)
            PS <= S0;
        else
            PS <= NS;
    end

    always @(*) begin
   
        NS = S0;
        Y  = 1'b0;

        case (PS)
            S0: begin
                Y  = X ? 1'b0 : 1'b0;
                NS = X ? S0 : S1;
            end

            S1: begin
                Y  = X ? 1'b0 : 1'b0;
                NS = X ? S2 : S1;
            end

            S2: begin
                Y  = X ? 1'b0 : 1'b0;
                NS = X ? S3 : S1;
            end

            S3: begin
                Y  = X ? 1'b0 : 1'b1; 
                NS = X ? S0 : S1;
            end

            default: begin
                NS = S0;
                Y  = 1'b0;
            end
        endcase
    end
endmodule
