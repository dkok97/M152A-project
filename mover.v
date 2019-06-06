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
	output reg collide2,
   output wire [2:0] input_score1,
	output wire [2:0] input_score2
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
	
	reg [2:0] s1;
	reg [2:0] s2;
	
	assign input_score1 = s1;
	assign input_score2 = s2;
        
    always @(posedge clk or posedge clr)
    begin
        if (clr) 
        begin
            dot_x <= (hbp + hfp)/2;
            dot_y <= (vbp + vfp)/2;
            //dot_x <= 675;
            delta_x <= 4'b0111;
            // delta_y <= 4'b0011;
				delta_y <= 0;
            reverse_x <= 0;
            reverse_y <= 0;
            collide1 <= 0;
            collide2 <= 0;
				s1 <= 0;
				s2 <= 0;
        end

		else 
        begin
            if (prev_clk_cursor == 0 && clk_cursor == 1) 
            begin

                //------------GOAL 1-----------------------------------------
		        if ((dot_x >= left_cen_xlb && dot_x <= left_cen_xub) && (dot_y >= left_cen_ylb && dot_y <= left_cen_yub))
		        begin
                 collide1 <=1;
//			        dot_x <= 327;
//			        dot_y <= 271;
			        delta_x <= 0;
			        delta_y <= 0;
		        end
                else collide1 <=0;
                //-----------------------------------------------------------

                //------------GOAL 2-----------------------------------------
		        if ((dot_x >= right_cen_xlb && dot_x <= right_cen_xub) && (dot_y >= right_cen_ylb && dot_y <= right_cen_yub))
		        begin
                 collide2 <=1;
//			        dot_x <= 600;
//			        dot_y <= 271;
			        delta_x <= 0;
			        delta_y <= 0;
		        end
                else collide2 <=0;
                //-----------------------------------------------------------

                //------------COLLISION OF BALL1/BALL2 AND PUCK--------------
                if (collide1 == 0 && collide2 == 0) begin 
					 
						 if (((ball1_x - dot_x)*(ball1_x - dot_x) + (ball1_y - dot_y)*(ball1_y - dot_y)) <= 700) 
						 begin
							  delta_x <= delta_x + (dot_x - ball1_x);
							  delta_y <= delta_y + (dot_y - ball1_y);
						 end

						 else if (((ball2_x - dot_x)*(ball2_x - dot_x) + (ball2_y - dot_y)*(ball2_y - dot_y)) <= 700) 
						 begin
							  delta_x <= delta_x + (dot_x - ball2_x);
							  delta_y <= delta_y + (dot_y - ball2_y);
						 end
			  
						 else
						 begin
							  delta_x <= delta_x;
							  delta_y <= delta_y;
						 end
						 //-----------------------------------------------------------
			  
						 //------------------REFLECTION OFF OF WALL-------------------
						 if (dot_y > y_upper) 
						 begin
							  reverse_y <= 1;
						 end
						 else if (dot_y < y_lower) 
						 begin
							  reverse_y <= 0;
						 end
						 else if (dot_x > x_upper) 
						 begin
							  reverse_x <= 1;
						 end
						 else if (dot_x  < x_lower) 
						 begin
							  reverse_x <= 0;
						 end
						 else 
						 begin
							  reverse_x <= reverse_x;
							  reverse_y  <= reverse_y;
						 end
						 //-----------------------------------------------------------

						 //------------------MOVE BALL--------------------------------
						 if (reverse_x==0) dot_x <= dot_x + delta_x;
						 else dot_x <= dot_x - delta_x;
		 
						 if (reverse_y==0) dot_y <= dot_y + delta_y;
						 else dot_y <= dot_y - delta_y;
						 //-----------------------------------------------------------
					end 
					else if(collide1 == 1) begin
						dot_x <= 327;
						dot_y <= 271;
						collide1 <= 0;
						s1 <= s1 + 1;
					end
					else if (collide2 == 1) begin 
						dot_x <= 600;
						dot_y <= 271;
						collide2 <= 0;
						s2 <= s2 + 1;
					end
					else begin
						dot_x <= dot_x;
						dot_y <= dot_y;
					end
					if (s1 == 5 || s2 == 5) begin
							dot_x <= (hbp + hfp)/2;
							dot_y <= (vbp + vfp)/2;
							delta_x <= 0;
							delta_y <= 0;
							reverse_x <= 0;
							reverse_y <= 0;
							collide1 <= 0;
							collide2 <= 0;
							s1 <= 0;
							s2 <= 0;
					end
					else begin
							dot_x <= dot_x;
							dot_y <= dot_y;
							delta_x <= delta_x;
							delta_y <= delta_y;
							reverse_x <= reverse_x;
							reverse_y <= reverse_y;
							collide1 <= collide1;
							collide2 <= collide2;
							s1 <= s1;
							s2 <= s2;
					end
            end
	    end
    end
endmodule