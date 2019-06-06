`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:59:50 06/04/2019
// Design Name:   state_machine
// Module Name:   C:/Users/152/M152A-project/fsm_tb.v
// Project Name:  NERP_demo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: state_machine
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsm_tb;

	// Inputs
	reg clk;
	reg start;
	reg score;
	reg [2:0] p1;
	reg [2:0] p2;

	// Outputs
	wire [1:0] cur_state;
	
	always #5 clk = ~clk;

	// Instantiate the Unit Under Test (UUT)
	state_machine uut (
		.clk(clk), 
		.start(start), 
		.p1(p1), 
		.p2(p2), 
		.cur_state(cur_state)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		start = 0;
		score = 0;
		p1 = 0;
		p2 = 0;

		// Wait 100 ns for global reset to finish
		#200;
        
		// Add stimulus here
		start = 1;
		#50
		start = 0;
		#200
		p1 = 1;
		#100
		p1 = 4;
		#100
		p1 = 5;
		#100
		start = 1;
		#50
		start = 0;

		
		

	end
      
endmodule

