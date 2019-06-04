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
    input wire [9:0] joy_x_1,
    input wire [9:0] joy_y_1,
    input wire [9:0] joy_x_2,
    input wire [9:0] joy_y_2,
    output wire [9:0] dot_x_1,
    output wire [9:0] dot_y_1,
    output wire [9:0] dot_x_2,
    output wire [9:0] dot_y_2,
    output wire [9:0] puck_x,
    output wire [9:0] puck_y,
	input wire rst
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

reg [7:0] lines;
reg [7:0] cur_line;

//reg [9:0] init_dot_x;
//reg [9:0] init_dot_y;

reg [31:0] counter_cursor = 0;
reg clk_cursor = 0; // Ticks at 30 Hz

reg prev_dclk = 0;
reg prev_clk_cursor = 0;

reg [2:0] r_b1 = 3'b111;
reg [2:0] g_b1 = 3'b111;
reg [2:0] b_b1 = 2'b11;

reg [2:0] r_b2 = 3'b111;
reg [2:0] g_b2 = 3'b111;
reg [2:0] b_b2 = 2'b11;

parameter W_board = 181*3;
parameter H_board = 134*3;
assign board_start_x = 50;
assign board_start_y = 40;
assign rom_addr_board = vc - vbp - board_start_y;
assign rom_pix_board = hc - hbp - board_start_x;
assign temp_rom_addr_board = rom_addr_board - vc_jump_board;
assign temp_rom_pix_board = rom_pix_board-hc_jump_board;
reg [9:0] hc_jump_board;
reg hc_nojump;
reg [9:0] vc_jump_board;
reg vc_nojump;



reg [3:0] speed_x = 4'b0111;
reg [3:0] speed_y = 4'b0011; 


update_joy1 ball1 (
    .clk(clk),
    .clr(clr),
    .prev_clk_cursor(prev_clk_cursor),
    .clk_cursor(clk_cursor),
    .joy_x(joy_x_1),
    .joy_y(joy_y_1),
    .dot_x(dot_x_1),
    .dot_y(dot_y_1),
	.rst(rst)
    );

update_joy2 ball2 (
    .clk(clk),
    .clr(clr),
    .prev_clk_cursor(prev_clk_cursor),
    .clk_cursor(clk_cursor),
    .joy_x(joy_x_2),
    .joy_y(joy_y_2),
    .dot_x(dot_x_2),
    .dot_y(dot_y_2),
	.rst(rst)
    );
    
mover puck (
    .clk(clk),
    .clr(clr),
    .dot_x(puck_x),
    .dot_y(puck_y),
    .prev_clk_cursor(prev_clk_cursor),
    .clk_cursor(clk_cursor),
    .delta_x(speed_x),
    .delta_y(speed_y)
);

//---------------------------------------------------------------
   
   reg write_enable = 0;
   parameter RAM_WIDTH = 8;
   parameter RAM_ADDR_BITS = 15;

   (* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
   reg [RAM_WIDTH-1:0] ram_name_board [(2**RAM_ADDR_BITS)-1:0];
   reg [RAM_WIDTH-1:0] output_data_board;   

   reg [RAM_ADDR_BITS-1:0] read_address_board, write_address=0;
   reg [RAM_WIDTH-1:0] input_data=0;

   //  The forllowing code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
   initial
      $readmemh("image2.txt", ram_name_board, 0, 181*134-1);

   always @(posedge clk) begin
      if (write_enable)
         ram_name_board[write_address] <= input_data;
      output_data_board <= ram_name_board[read_address_board];
   end
                        
//-----------------------------------------------------------------
always @(posedge clk)
begin
	counter_cursor <= (counter_cursor == 1666666) ? 0 : counter_cursor + 1;
	if (counter_cursor == 0) clk_cursor <= ~clk_cursor; 
	else clk_cursor <= clk_cursor;
	prev_clk_cursor = clk_cursor;
end

always @(posedge dclk or posedge clr)
begin
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
        hc_jump_board <= 0;
        vc_jump_board <= 0;
        hc_nojump <= 1;
        vc_nojump <= 1;
		//$readmemb("color.txt", lines);
	end
	else
	begin
		
		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
            if (hc_jump_board==0) hc_jump_board <= hc_jump_board + 1;
            else
            begin 
                if (hc_jump_board%2==0) hc_nojump <= ~hc_nojump;
                if (hc_nojump==0) hc_jump_board <= hc_jump_board + 1;
            end
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
            
            if (vc_jump_board==0) vc_jump_board <= vc_jump_board + 1;
            else
            begin 
                if (vc_jump_board%2==0) vc_nojump <= ~vc_nojump;
                if (vc_nojump==0) vc_jump_board <= vc_jump_board + 1;
            end
		end
	end
end

assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

always @(*)
begin
    // read_address_board = {rom_pix_board[7:0],rom_addr_board[7:0]};
    read_address_board = {temp_rom_pix_board[7:0],temp_rom_addr_board[7:0]};
    red = 0;
    green = 0;
    blue = 0;
	
	if ((hc >= board_start_x + hbp) && (hc < board_start_x + hbp + temo_W_board) && (vc >= board_start_y + vbp) && (vc < board_start_y + vbp + temp_H_board))
	begin
		red = output_data_board[2:0];
		green = output_data_board[5:3];
		blue = output_data_board[7:6];
	end
	else
	begin
		red = red;
		green = green;
		blue = blue;
	end

//    if (((dot_x_1 - dot_x_2) * (dot_x_1 - dot_x_2) + (dot_y_1 - dot_y_2) * (dot_y_1 - dot_y_2)) < 225) 
//    begin
//        r_b1 = 3'b010;
//        g_b1 = 3'b101;
//        b_b1 = 2'b00;
//    end
//    else 
//    begin
//        r_b1 = 3'b111;
//        g_b1 = 3'b111;
//        b_b1 = 2'b11;
//    end
    
//    if (((hc-puck_x) * (hc-puck_x) + (vc-puck_y)*(vc-puck_y)) < 100) begin
//        red = 3'b100;
//        green = 3'b010;
//        blue = 2'b11;
//    end
//        
    

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
    
    
//    if (hc>=hbp && hc<=211 && vc>=vbp && vc<=81)
//    begin
//        cur_line <= lines[hc-hbp+vc-vbp];
//        red = cur_line[7:5];
//        green = cur_line[4:2];
//        blue = cur_line[1:0];
//    end
    
end

endmodule