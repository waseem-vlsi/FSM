
module SnackVend_tb();
    reg clk;
    reg rst;
    reg [2:0] coin_in;
    wire out_nickel;
    wire out_dime;
    wire dispense_item;
    wire out_return;
    wire [2:0] state_cur;
    wire [2:0] state_nxt;
    SnackVend dut(
        .clk(clk),
        .rst(rst),
        .coin_in(coin_in),
        .out_nickel(out_nickel),
        .out_dime(out_dime),
        .dispense_item(dispense_item),
        .out_return(out_return),
        .state_cur(state_cur),
        .state_nxt(state_nxt)
    );
    initial begin
        clk = 0;
        rst = 1;
        coin_in = 3'b000;
        #20 rst = 0;
        #20 coin_in = 3'b001;
        #20 coin_in = 3'b000;
        #40 coin_in = 3'b001;
        #20 coin_in = 3'b000;
        #40 coin_in = 3'b010;
        #20 coin_in = 3'b000;
        #40 coin_in = 3'b100;
        #20 coin_in = 3'b000;
        #40 coin_in = 3'b010;
        #20 coin_in = 3'b000;
        #40 coin_in = 3'b001;
        #20 coin_in = 3'b000;
        #40 coin_in = 3'b100;
        #50 $finish;
    end
    always #5 clk = ~clk;
    initial begin

        $display("time\tclk\trst\tcoin\tstate_cur\tstate_nxt\tnickel\tdime\treturn\tdispense");
        $monitor("%0dns\t%b\t%b\t%03b\t%03b\t%03b\t%b\t%b\t%b\t%b",$time,clk,rst,coin_in,state_cur,state_nxt,out_nickel,out_dime,out_return,dispense_item);
    end
endmodule
