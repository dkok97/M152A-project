`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    20:28:25 03/19/2013
// Design Name:
// Module Name:    NERP_demo_top
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module NERP_demo_top(
    input wire clk,         //master clock = 50MHz
    input wire clr,         //right-most pushbutton for reset
//	input wire rst,
	input wire btnU,
	output wire out_btnU,
	input wire btnD,
	output wire out_btnD,
//	output wire out_rst,
    output wire [6:0] seg,  //7-segment display LEDs
    output wire [3:0] an,   //7-segment display anode enable
    output wire dp,         //7-segment display decimal point
    output wire [2:0] red,  //red vga output - 3 bits
    output wire [2:0] green,//green vga output - 3 bits
    output wire [1:0] blue, //blue vga output - 2 bits
    output wire hsync,      //horizontal sync out
    output wire vsync,          //vertical sync out
    input MISO_1,
    output SS_1,
    output MOSI_1,
    output SCLK_1,
    input MISO_2,
    output SS_2,
    output MOSI_2,
    output SCLK_2,
    output wire [7:0] Led,
    output wire [1:0] cur_state,
	// score
	output wire [2:0] score1,
	output wire [2:0] score2
    );

// 7-segment clock interconnect
wire segclk;

// VGA display clock interconnect
wire dclk;

// disable the 7-segment decimal points
assign dp = 1;
//
//assign score1 = 0;
//assign score2 = 0;

// go from splash to start game
//bounce R(
//    .clk(clk),
//    .button(rst),
//    .button_state(out_rst)
//);

// simulate scoring
//bounce L(
//    .clk(clk),
//    .button(btnL),
//    .button_state(out_btnL)
//);

bounce U(
    .clk(clk),
    .button(btnU),
    .button_state(out_btnU)
);

bounce D(
    .clk(clk),
    .button(btnD),
    .button_state(out_btnD)
);

//if(bleft) begin
//  score_1 = score_1 + score_1;
//end
//else begin
//  score_1 = score_1;
//end

state_machine fsm (
  .clk(clk),
  .start(btnU),
  .restart(out_btnD),
  .p1(score_1),
  .p2(score_2),
  .cur_state(cur_state_2)
 );

// generate 7-segment clock & display clock
clockdiv U1(
  .clk(clk),
  .clr(clr),
  .segclk(segclk),
  .dclk(dclk)
);

	 
 wire [2:0] outscore_1, outscore2;
 assign outscore1 = score1;
 assign outscore2 = score2;

// 7-segment display controller
score_display score(
  .segclk(segclk),
  .clr(clr),
  .seg(seg),
  .an(an),
  .p1(outscore2),
  .p2(outscore1)
);

/******************************/
/*********Joystick 1***********/
/******************************/

    wire SS_1;                      // Active low
    wire MOSI_1;                    // Data transfer from master to slave
    wire SCLK_1;                    // Serial clock that controls communication

    assign MOSI_1 = 0;

    // Data read from PmodJSTK
    wire [39:0] jstkData_1;

    wire [9 : 0] joystick_y_1 = {jstkData_1[9:8], jstkData_1[23:16]};
    wire [9 : 0] joystick_x_1 = {jstkData_1[25:24], jstkData_1[39:32]};
    wire joystick_btn_right_1 = jstkData_1[1];
    wire joystick_btn_left_1 = jstkData_1[2];



    joy joy1(
        .CLK(clk),
        .sndRec(dclk),
        .MISO(MISO_1),
        .SS(SS_1),
        .SCLK(SCLK_1),
        .DOUT(jstkData_1)
    );


/******************************/
/*********Joystick 2***********/
/******************************/

    wire SS_2;                      // Active low
    wire MOSI_2;                    // Data transfer from master to slave
    wire SCLK_2;                    // Serial clock that controls communication

    assign MOSI_2 = 0;

    // Data read from PmodJSTK
    wire [39:0] jstkData_2;

    wire [9 : 0] joystick_y_2 = {jstkData_2[9:8], jstkData_2[23:16]};
    wire [9 : 0] joystick_x_2 = {jstkData_2[25:24], jstkData_2[39:32]};
    wire joystick_btn_right_2 = jstkData_2[1];
    wire joystick_btn_left_2= jstkData_2[2];

	 assign Led = joystick_y_2;

    joy joy2(
        .CLK(clk),
        .sndRec(dclk),
        .MISO(MISO_2),
        .SS(SS_2),
        .SCLK(SCLK_2),
        .DOUT(jstkData_2)
    );

	// VGA controller
	vga640x480 U3(
		 .clk(clk),
		 .dclk(dclk),
		 .clr(clr),
		 .hsync(hsync),
		 .vsync(vsync),
		 .red(red),
		 .green(green),
		 .blue(blue),
		 .joy_x_1(joystick_x_1),
		 .joy_y_1(joystick_y_1),
		 .joy_x_2(joystick_x_2),
		 .joy_y_2(joystick_y_2),
		 .state(cur_state),
         .butUp(btnU),
         .butDown(btnD),
		 .out_score1(score1),
		 .out_score2(score2)
	);

endmodule
