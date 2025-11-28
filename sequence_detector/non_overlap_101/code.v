
module Sequence_detector(
input X,clk,rst,
output reg Y);

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

reg [1:0] current_state, next_state;
always@(*)
begin 
if(rst)
begin
current_state <=S0;
end
else 
current_state <= next_state;
end

always@(*)
case(current_state)
S0:
 begin
 if(X == 1'b1)
 current_state <= S1; 
 else 
 current_state <= S0;
 end

S1:
 begin
 if(X == 1'b0)
 current_state <= S2; 
 else 
 current_state <= S1;
 end
 
 S2:
  begin
  if(X == 1'b1)
  current_state <= S3; 
  else 
  current_state <= S2;
  end
  endcase 

  always @(*)
   begin
      if (current_state == S3)
          Y <= 1'b1;   // sequence 101 detected
      else
          Y <= 1'b0;
          end
  endmodule
