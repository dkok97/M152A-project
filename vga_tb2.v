`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:53:45 06/06/2019
// Design Name:   vga640x480
// Module Name:   /home/parallels/Desktop/midnight/M152A-project/vga_tb2.v
// Project Name:  NERP_demo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga640x480
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vga_tb2;

	// Inputs
	reg clk;
	reg dclk;
	reg clr;
	reg [9:0] joy_x_1;
	reg [9:0] joy_y_1;
	reg [9:0] joy_x_2;
	reg [9:0] joy_y_2;
	reg [1:0] state;
	reg butUp;
	reg butDown;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;
	wire [9:0] dot_x_1;
	wire [9:0] dot_y_1;
	wire [9:0] dot_x_2;
	wire [9:0] dot_y_2;
	wire [9:0] puck_x;
	wire [9:0] puck_y;
	wire collide1;
	wire collide2;
	wire [2:0] out_score1;
	wire [2:0] out_score2;
	wire [2:0] movescore_1;
	wire [2:0] movescore_2;

	// Instantiate the Unit Under Test (UUT)
	vga640x480 uut (
		.clk(clk), 
		.dclk(dclk), 
		.clr(clr), 
		.hsync(hsync), 
		.vsync(vsync), 
		.red(red), 
		.green(green), 
		.blue(blue), 
		.joy_x_1(joy_x_1), 
		.joy_y_1(joy_y_1), 
		.joy_x_2(joy_x_2), 
		.joy_y_2(joy_y_2), 
		.dot_x_1(dot_x_1), 
		.dot_y_1(dot_y_1), 
		.dot_x_2(dot_x_2), 
		.dot_y_2(dot_y_2), 
		.puck_x(puck_x), 
		.puck_y(puck_y), 
		.collide1(collide1), 
		.collide2(collide2), 
		.state(state), 
		.butUp(butUp), 
		.butDown(butDown), 
		.out_score1(out_score1), 
		.out_score2(out_score2), 
		.movescore_1(movescore_1), 
		.movescore_2(movescore_2)
	);
	
	always #5 clk=~clk;
	always #20 dclk=~dclk;

	initial begin
		// Initialize Inputs
		clk = 0;
		dclk = 0;
		clr = 0;
		joy_x_1 = 0;
		joy_y_1 = 0;
		joy_x_2 = 0;
		joy_y_2 = 0;
		state = 0;
		butUp = 0;
		butDown = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		clr = 1;
		#200
		clr = 0;
	end
      
endmodule

