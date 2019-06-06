`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:44:56 06/05/2019
// Design Name:   vga640x480
// Module Name:   /home/parallels/Desktop/M152A-project/vga_tb.v
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

module vga_tb;

	// Inputs
	reg clk;
	reg dclk;
	reg clr;
	reg [9:0] joy_x_1;
	reg [9:0] joy_y_1;
	reg [9:0] joy_x_2;
	reg [9:0] joy_y_2;
	reg [1:0] state;
	reg btn_up;

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
		.state(state)
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

		// Wait 100 ns for global reset to finish
		#100;
		
		clr = 1;
		
		#100
		
		clr = 0;
        
		// Add stimulus here
		#100
		state = 0;
		#1000000
		state = 1;
		

	end
      
endmodule

