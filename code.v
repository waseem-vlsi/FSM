

module FSM_Lamp(
input clock,
output reg [2:0]lamp);

parameter S0 = 0, S1 = 1, S2 = 2; // for states
parameter RED = 3'b100, GREEN = 3'b010, YELLOW = 3'b001; // for outputs

reg [1:0]state;

always@(posedge clock)
begin 
case(state)
S0 : begin 
    lamp <= GREEN;
    state <= S1;
    end
S1 : begin 
    lamp <= YELLOW;
    state <= S2;
    end
S2 : begin 
    lamp <= RED;
    state <= S0;
    end 
    
default : begin 
    lamp <= RED;
    state <= S0; 
    end 
    
endcase
end 


endmodule
