module timeAndDateClock_tb();

	reg clk, clkEn1Hz, nReset, setTimeAndDate_in;
	reg [43:0] timeAndDate_In; 
	wire [43:0] timeAndDate_Out;


	timeAndDateClock DUT(
		.clk(clk),
		.clkEn1Hz(clkEn1Hz),
		.nReset(nReset),
		.setTimeAndDate_in(setTimeAndDate_in),
		.timeAndDate_In(timeAndDate_In),
		.timeAndDate_Out(timeAndDate_Out)

	);

	//----------------------------------------------------------
	 // create a 50Mhz clock
	 always
	 #10 clk = ~clk; // every ten nanoseconds invert
	 //-----------------------------------------------------------
	 // initial blocks are sequential and start at time 
	 initial
	 begin
	 $display($time, " << Starting the Simulation >>");
	 clkEn1Hz = 1'b1;
	 clk = 1'b0;
	 timeAndDate_In = {
			24'b0, 	//Rest
			2'b2,		//Hours high-digit
			4'b3,		//Hours low-digit
			3'b5,		//Minute high-digit
			4'b9,		//Minute low-digit
			3'b5,		//Second high-digit
			4'b9		//Second low-digit
	 };
	 nReset = 1'b0;
	 setTimeAndDate_in = 1'b1;
	 # 25 setTimeAndDate_in = 1'b0;
	 

	 
	 

	 end


endmodule