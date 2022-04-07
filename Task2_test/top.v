// created 17.07.2018 by Cecilia Hoeffler
// template for experiment 2

module top 
(
							input clock_5,
							input reset,
							input key1,
							output wire [7:0] LED
				
				);
				
wire enable;

wire [7:0] count;
 
clkEnable enb(
	.clock_5(clock_5),
	.reset(reset),
	.enable_out(enable)
	);
	

updown_counter counter(
	.up_down(key1),
	.CLOCK(clock_5),
	.enable(enable),
	.reset(reset),
	.count_out(LED)
	);
	
endmodule
