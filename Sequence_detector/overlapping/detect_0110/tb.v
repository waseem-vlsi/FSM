
module sequence_detector_overlap_tb();
    reg clock, reset;
    reg X;
    wire Y;

    sequence_detector_overlap dut(.clock(clock), .reset(reset), .X(X), .Y(Y));

    initial begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end

    initial begin
        reset = 1'b1;
        #15 reset = 1'b0;
        #12 X = 0; #10 X = 0; #10 X = 1; #10 X = 1;
        #10 X = 0; #10 X = 1; #10 X = 1; #10 X = 0;
        #10 X = 0; #10 X = 1; #10 X = 1; #10 X = 0;
        #10 X = 0; #10 X = 1; #10 X = 1; #10 X = 0;
        #10 $finish;
    end
endmodule

