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
module update_joy(
    input wire clk,
    input wire clr,
    input wire prev_clk_cursor,
    input wire clk_cursor,
    input wire [9:0]   joy_x,
    input wire [9:0] joy_y,
    output reg [9:0] dot_x,
    output reg [9:0] dot_y
    );
    
    parameter hbp = 144;
    parameter hfp = 784;
    parameter vbp = 31;
    parameter vfp = 511;
    
    always @(posedge clk)
begin
    if (clr) begin
        dot_x <= (hbp + hfp)/2;
        dot_y <= (vbp + vfp)/2;
    end
    if (prev_clk_cursor == 0 && clk_cursor == 1) begin
    
        if (dot_x<hfp)
        begin
            if (joy_x < 150) dot_x <= dot_x + 20;
            else if ( joy_x < 400) dot_x <= dot_x + 10;
        end
        if (dot_x>hbp)
        begin
            if (joy_x > 850 && dot_x > 2) dot_x <= dot_x - 20;
            else if (joy_x > 600 && dot_x > 1) dot_x <= dot_x - 10;
        end
        
        if (dot_y>vbp)
        begin
            if (joy_y < 150) dot_y <= dot_y - 20;
            else if (joy_y < 400) dot_y <= dot_y - 10;
        end
        if(dot_y<vfp)
        begin
            if (joy_y > 850) dot_y <= dot_y + 20;
            else if (joy_y > 600) dot_y <= dot_y + 10;
        end
    end
    
    end



endmodule
