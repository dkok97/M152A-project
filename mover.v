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
    input wire prev_clk_cursor,
    input wire clk_cursor
    );

    parameter hbp = 144;
    parameter hfp = 784;
    parameter vbp = 31;
    parameter vfp = 511;
    
    parameter x_lower = 234;
    parameter y_lower = 111;
    parameter x_upper = 694;
    parameter y_upper = 431;
    
    reg [3:0] delta_x;
    reg [3:0] delta_y; 
    
//    reg reverse_x = 0;
//    reg reverse_y = 0;
// 
        
    always @(posedge clk)
    begin
        if (clr) begin
            dot_x <= (hbp + hfp)/2;
            dot_y <= (vbp + vfp)/2;
            delta_x <= 4'b0111;
            delta_y <= 4'b0011;
        end
    if (prev_clk_cursor == 0 && clk_cursor == 1) begin
    
         if ((dot_y > y_upper) || (dot_y < y_lower)) begin
              delta_y <= -delta_y;
//            reverse_y <= ~reverse_y;
         end
         else if ((dot_x > x_upper) || (dot_x  < x_lower)) begin
//            reverse_x <= ~reverse_x;
                delta_x <= -delta_x;
         end
         else begin
//            reverse_x <= reverse_x;
//            reverse_y  <= reverse_y;
            delta_y  <= delta_y;
            delta_x  <= delta_x;
         end
         dot_x <= dot_x + delta_x;
         dot_y <= dot_y + delta_y;

//         if (reverse_x==0) dot_x <= dot_x + delta_x;
//         else dot_x <= dot_x - delta_x;
//         
//         if (reverse_y==0) dot_y <= dot_y + delta_y;
//         else dot_y <= dot_y - delta_y;


    end

end
    
    

endmodule
