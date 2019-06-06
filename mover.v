`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:14 05/30/2019 
// Design Name: 
// Module Name:    mover 
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
module mover(
    input wire clk,
    input wire clr,
    output reg [9:0] dot_x,
    output reg [9:0] dot_y,
	input wire [9:0] ball1_x,
	input wire [9:0] ball1_y,
	input wire [9:0] ball2_x,
	input wire [9:0] ball2_y,
    input wire prev_clk_cursor,
    input wire clk_cursor,
	output reg collide1,
	output reg collide2
    );

    parameter hbp = 144;
    parameter hfp = 784;
    parameter vbp = 31;
    parameter vfp = 511;
    
    parameter x_lower = 234;
    parameter y_lower = 111;
    parameter x_upper = 694;
    parameter y_upper = 431;
	
	
	//left center rect
parameter left_cen_xlb = 214;
parameter left_cen_xub = 234;
parameter left_cen_ylb = 246;
parameter left_cen_yub = 296;

//right center rect
parameter right_cen_xlb = 694;
parameter right_cen_xub = 714;
parameter right_cen_ylb = 246;
parameter right_cen_yub = 296;
    
    reg [3:0] delta_x;
    reg [3:0] delta_y; 
    
   reg reverse_x;
   reg reverse_y;
        
    always @(posedge clk or posedge clr)
    begin
        if (clr) begin
            dot_x <= (hbp + hfp)/2;
            dot_y <= (vbp + vfp)/2;
            delta_x <= 4'b0111;
            delta_y <= 4'b0011;
            reverse_x <= 0;
            reverse_y <= 0;
            collide1 <= 0;
            collide2 <= 0;
        end
		else begin
        if (prev_clk_cursor == 0 && clk_cursor == 1) begin
		
		 if ((dot_x >= left_cen_xlb && dot_x <= left_cen_xub) && (dot_y >= left_cen_ylb && dot_y <= left_cen_yub))
		begin
            collide1 <=1;
			 dot_x <= left_cen_xub + 20;
			 dot_y <= left_cen_ylb + 25;
			 delta_x <= 0;
			 delta_y <= 0;

		end
        else collide1 <=0;

		if ((dot_x >= right_cen_xlb && dot_x <= right_cen_xub) && (dot_y >= right_cen_ylb && dot_y <= right_cen_yub))
		begin
            collide2 <=1;
			 dot_x <= right_cen_xub + 60;
			 dot_y <= right_cen_ylb + 75;
			 delta_x <= 0;
			 delta_y <= 0;
		end
        else collide2 <=0;
		
			if (((ball1_x - dot_x)*(ball1_x - dot_x) + (ball1_y - dot_y)*(ball1_y - dot_y)) <= 700) begin
				delta_x <= delta_x + (dot_x - ball1_x);
				delta_y <= delta_y + (dot_y - ball1_y);
			end
			
			else if (((ball2_x - dot_x)*(ball2_x - dot_x) + (ball2_y - dot_y)*(ball2_y - dot_y)) <= 700) begin
				delta_x <= delta_x + (dot_x - ball2_x);
				delta_y <= delta_y + (dot_y - ball2_y);
			end
			
			else
			begin
				delta_x <= delta_x;
				delta_y <= delta_y;
			end
			
			
            if (dot_y > y_upper) begin
                reverse_y <= 1;
            end
			else if (dot_y < y_lower) begin
				reverse_y <= 0;
			end
            else if (dot_x > x_upper) begin
                reverse_x <= 1;
            end
			else if (dot_x  < x_lower) begin
				reverse_x <= 0;
			end
            else begin
                reverse_x <= reverse_x;
                reverse_y  <= reverse_y;
            end

			if (reverse_x==0) dot_x <= dot_x + delta_x;
			else dot_x <= dot_x - delta_x;
			
			if (reverse_y==0) dot_y <= dot_y + delta_y;
			else dot_y <= dot_y - delta_y;
			
    end
	end

end
    
    

endmodule