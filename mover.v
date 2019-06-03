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
    input wire [4:0] delta_x,
    input wire [4:0] delta_y,
    input wire prev_clk_cursor,
    input wire clk_cursor
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
        dot_x <= dot_x + delta_x;
        dot_y <= dot_y + delta_y;
    end

end
    
    

endmodule
