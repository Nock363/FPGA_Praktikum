// ------------------------------------------------------------------------- --
// Title         : Clockwork
// Project       : Praktikum FPGA-Entwurfstechnik
// ------------------------------------------------------------------------- --
// File          : timeAndDateClock.v
// Author        : Shutao Zhang
// Company       : IDS RWTH Aachen 
// Created       : 2018/08/16
// ------------------------------------------------------------------------- --
// Description   : Clockwork for a DCF77 radio-controlled clock
// ------------------------------------------------------------------------- --
// Revisions     :
// Date        Version  Author  Description
// 2018/08/16  1.0      SH      Created
// 2018/09/20  1.1      TS      Clean up, comments
// ------------------------------------------------------------------------- --

module timeAndDateClock(input clk,                // global 10Mhz clock
                        input clkEn1Hz,           // 1Hz clock
                        input nReset,             // asynchronous reset (active low)  
                        input setTimeAndDate_in,  
                        input[43:0] timeAndDate_In,     
                        output reg[43:0] timeAndDate_Out);   

// ---------- YOUR CODE HERE ---------- 


reg [3:0] second_lowDigit = 4'b0;
reg [2:0] second_highDigit = 3'b0;

reg [3:0] minute_lowDigit = 4'b0;
reg [2:0] minute_highDigit = 3'b0;

reg [3:0] hours_lowDigit = 4'b0;
reg [1:0] hours_highDigit = 2'b0;


always @ (posedge clk)
	begin
	if(clkEn1Hz)
		begin
		
	
		
	
			if(setTimeAndDate_in)
				begin
					timeAndDate_Out = timeAndDate_In;
				end

			if(nReset)
				begin
					timeAndDate_Out <= 0;
				end
				
					
				
			second_lowDigit  = timeAndDate_Out[3:0];
			second_highDigit = timeAndDate_Out[6:4];
				
			minute_lowDigit = timeAndDate_Out[10:7];
			minute_highDigit = timeAndDate_Out[13:11];	
			
			hours_lowDigit = timeAndDate_Out[17:14];
			hours_highDigit = timeAndDate_Out[19:18];
			
			
			second_lowDigit = second_lowDigit + 1;
			
			
			if(second_lowDigit == 10)
				begin	
					second_lowDigit = 0;
					second_highDigit = second_highDigit + 1;
				end
			if(second_highDigit == 7)
				begin
					second_highDigit = 0;
					minute_lowDigit = minute_lowDigit + 1;
				end
			if(minute_lowDigit == 10)
				begin
					minute_lowDigit = 0;
					minute_highDigit = minute_highDigit + 1;
				end
			if(minute_highDigit == 7)
				begin
					minute_highDigit = 0;
					hours_lowDigit = hours_lowDigit + 1;
				end
			if(hours_lowDigit == 10)
				begin
					hours_lowDigit = 0;
					hours_highDigit = hours_highDigit + 1;
				end
			if(hours_highDigit == 3)
				begin
					hours_highDigit = 0;		
				end
				
					
			
		
			
			timeAndDate_Out = {
				24'b0,
				hours_highDigit,
				hours_lowDigit,
				minute_highDigit,
				minute_lowDigit,
				second_highDigit,
				second_lowDigit
				
			};
			
			//timeAndDate_Out <= timeAndDate_Out + 1;
	
		end
	end
	
	

endmodule
