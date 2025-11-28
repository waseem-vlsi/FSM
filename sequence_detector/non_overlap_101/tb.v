
module tb_Sequence_detector();
reg X,clk,rst;
wire  Y;
Sequence_detector dut(.X(X), .Y(Y), .clk(clk), .rst(rst));
initial 
begin 
clk = 1'b0;
forever 
#5 clk = ~clk;
end 

initial 
begin 

rst = 1'b1; 
#5 X = 1'b1; rst = 1'b0;
#5 X = 1'b0; rst = 1'b0;
#5 X = 1'b1; rst = 1'b0;
#5 X = 1'b0; rst = 1'b0;
#5 X = 1'b1; rst = 1'b0;
#5 X = 1'b1; rst = 1'b0;
#5 X = 1'b0; rst = 1'b0;
#5 X = 1'b1; rst = 1'b0;
#5 X = 1'b0; rst = 1'b0;
#5 X = 1'b0; rst = 1'b0;
#5 X = 1'b1; rst = 1'b0;
#10 $finish;
end 
endmodule

