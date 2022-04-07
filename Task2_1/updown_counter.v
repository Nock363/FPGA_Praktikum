// created 17.07.2018 by Cecilia Hoeffler
// template for experiment 2
//Up-Down- Counter, you should be able to control the LEDs via the key[0] and key[1]

module updown_counter(

		input up_down, // if up_down is ‘1’ then it counts up , else if ‘0’ it counts down
		input CLOCK,
		input enable,
		input reset,
		output reg [7:0] count_out
		

);

	

  always @ (posedge CLOCK) // on positive clock edge
		
		begin
			
		  if(!reset)
			begin
			  count_out <= 0;
				  
			end
		
		  if(enable)
			begin
			  
			  if(up_down)
				begin
					count_out <= count_out + 1;// increment counter
				end
			  else
				begin
					count_out <= count_out - 1;// decrement counter
				end
			end
		end

  

endmodule
			