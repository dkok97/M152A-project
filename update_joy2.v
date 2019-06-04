`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:48:26 05/30/2019 
// Design Name: 
// Module Name:    update_joy 
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
module update_joy2(
    input wire clk,
    input wire clr,
    input wire prev_clk_cursor,
    input wire clk_cursor,
    input wire [9:0] joy_x,
    input wire [9:0] joy_y,
    output reg [9:0] dot_x,
    output reg [9:0] dot_y,
	input wire rst
    );
    
    parameter hbp = 144;
    parameter hfp = 784;
    parameter vbp = 31;
    parameter vfp = 511;
	parameter init_x = 724;
	parameter init_y = 271;
	parameter x_lb = 574+15;
	parameter x_ub = 734-15;
	parameter y_lb = 71+15;
	parameter y_ub = 471-15;
    
    always @(posedge clk or posedge clr)
	begin
    if (clr==1 || rst==1) 
	begin
        dot_x <= init_x;
        dot_y <= init_y;
    end
	else begin
    if (prev_clk_cursor == 0 && clk_cursor == 1) begin
        if (dot_x<x_ub)
        begin
            if (joy_x < 150) dot_x <= dot_x + 20;
            else if ( joy_x < 400) dot_x <= dot_x + 10;
        end
        if (dot_x>x_lb)
        begin
            if (joy_x > 850 && dot_x > 2) dot_x <= dot_x - 20;
            else if (joy_x > 600 && dot_x > 1) dot_x <= dot_x - 10;
        end
        
        if (dot_y>y_lb)
        begin
            if (joy_y < 150) dot_y <= dot_y - 20;
            else if (joy_y < 400) dot_y <= dot_y - 10;
        end
        if(dot_y<y_ub)
        begin
            if (joy_y > 850) dot_y <= dot_y + 20;
            else if (joy_y > 600) dot_y <= dot_y + 10;
        end
    end
    end
    end

endmodule
