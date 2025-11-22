
module FSM_Lamp_tb();
reg clock;
wire [2:0]lamp;

FSM_Lamp dut(.clock(clock), .lamp(lamp));
initial 
begin 
clock = 1'b0;
forever 
#5 clock = ~ clock;
end 

endmodule
