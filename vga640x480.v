`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:30:38 03/19/2013 
// Design Name: 
// Module Name:    vga640x480 
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
module vga640x480(
    input wire clk,
    input wire dclk,            //pixel clock: 25MHz
    input wire clr,         //asynchronous reset
    output wire hsync,      //horizontal sync out
    output wire vsync,      //vertical sync out
    output reg [2:0] red,   //red vga output
    output reg [2:0] green, //green vga output
    output reg [1:0] blue,  //blue vga output
    input wire move_right,
    input wire move_left,
    input wire move_up,
    input wire move_down,
    input wire [9:0] joy_x_1,
    input wire [9:0] joy_y_1,
    input wire [9:0] joy_x_2,
    input wire [9:0] joy_y_2,
    output wire [9:0] dot_x_1,
    output wire [9:0] dot_y_1,
    output wire [9:0] dot_x_2,
    output wire [9:0] dot_y_2,
    );

// video structure constants
parameter hpixels = 800;// horizontal pixels per line
parameter vlines = 521; // vertical lines per frame
parameter hpulse = 96;  // hsync pulse length
parameter vpulse = 2;   // vsync pulse length
parameter hbp = 144;    // end of horizontal back porch
parameter hfp = 784;    // beginning of horizontal front porch
parameter vbp = 31;         // end of vertical back porch
parameter vfp = 511;    // beginning of vertical front porch
// active horizontal video is therefore: 784 - 144 = 640
// active vertical video is therefore: 511 - 31 = 480

// registers for storing the horizontal & vertical counters
reg [9:0] hc;
reg [9:0] vc;

//reg [9:0] init_dot_x;
//reg [9:0] init_dot_y;

reg [31:0] counter_cursor = 0;
reg clk_cursor = 0; // Ticks at 30 Hz

reg prev_dclk = 0;
reg prev_clk_cursor = 0;

update_joy ball1 (
    .clk(clk),
    .clr(clr),
    .prev_clk_cursor(prev_clk_cursor),
    .clk_cursor(clk_cursor),
    .joy_x(joy_x_1),
    .joy_y(joy_y_1),
    .dot_x(dot_x_1),
    .dot_y(dot_y_1)
    );

update_joy ball2 (
    .clk(clk),
    .clr(clr),
    .prev_clk_cursor(prev_clk_cursor),
    .clk_cursor(clk_cursor),
    .joy_x(joy_x_2),
    .joy_y(joy_y_2),
    .dot_x(dot_x_2),
    .dot_y(dot_y_2)
    );

always @(posedge clk)
begin
    if (prev_dclk==0 && dclk==1)
    begin
        counter_cursor <= (counter_cursor == 1666666) ? 0 : counter_cursor + 1;
        if (counter_cursor == 0) clk_cursor <= ~clk_cursor; 
        else clk_cursor <= clk_cursor;
    end

    if ((prev_dclk==0 && dclk==1) || clr)
    begin 
        if (clr == 1)
        begin
            hc <= 0;
            vc <= 0;
        end
        else
        begin
            // keep counting until the end of the line
            if (hc < hpixels - 1)
                hc <= hc + 1;
            else
            // When we hit the end of the line, reset the horizontal
            // counter and increment the vertical counter.
            // If vertical counter is at the end of the frame, then
            // reset that one too.
            begin
                hc <= 0;
                if (vc < vlines - 1)
                    vc <= vc + 1;
                else
                    vc <= 0;
            end
        end
    end

    prev_dclk = dclk;
    prev_clk_cursor = clk_cursor;
end

assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

always @(*)
begin
    red = 0;
    green = 0;
    blue = 0;

    if (((hc-dot_x_1) * (hc-dot_x_1) + (vc-dot_y_1)*(vc-dot_y_1)) < 225) begin
        red = 3'b111;
        green = 3'b111;
        blue = 2'b11;
    end

    if (((hc-dot_x_2) * (hc-dot_x_2) + (vc-dot_y_2)*(vc-dot_y_2)) < 225) begin
        red = 3'b111;
        green = 3'b111;
        blue = 2'b11;
    end

    
end

endmodule