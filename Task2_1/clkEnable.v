// created 17.07.2018 by Cecilia Hoeffler
// template for experiment 2
//you should be able to reduce the frequency of the clock with this module


module clkEnable(
			input clock_5,
			input reset,
			output reg enable_out
			);
							
			parameter freq_divider = 24'd10000000; 
			
			reg [31:0] count;
			
			
			always @ (posedge clock_5)
				begin
					
					if(!reset)
						begin
							count = 0;
						end
					
					if(count == freq_divider)
						begin
							//enable_out <= !enable_out;
							enable_out <= 1;
							count = 0;
						end
					else
						begin
							enable_out <= 0;
							count <= count + 1;
						end
				end
			
			
endmodule