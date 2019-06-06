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
    input wire dclk,        //pixel clock: 25MHz
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
	 output wire collide1,
	 output wire collide2,
    input wire [1:0] state,
    input wire butUp,
    input wire butDown,
	 output wire [2:0] out_score1,
	 output wire [2:0] out_score2,
	 output wire [2:0] movescore_1, 
	 output wire [2:0]movescore_2
    );

// FSM States
parameter s0 = 0;	// splash
parameter s1 = 1;	// middle
// parameter s2 = 2;	// play
parameter s2 = 2;	// end

// Store Scores
reg [2:0] score1 = 0;
reg [2:0] score2 = 0;

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

reg up = 0;
reg down = 0;

wire [10:0] pp_start_x, pp_start_y, rom_addr_pp, rom_pix_pp;
parameter W_pp = 256;
parameter H_pp = 256;
assign pp_start_x = 336;
assign pp_start_y = 143;
assign rom_addr_pp = vc - vbp - pp_start_y;
assign rom_pix_pp = hc - hbp - pp_start_x;

//simple board params
parameter board_x1 = 194;
parameter board_x2 = 224;
parameter board_x3 = 704;
parameter board_x4 = 734;
parameter board_y1 = 71;
parameter board_y2 = 101;
parameter board_y3 = 441;
parameter board_y4 = 471;

//mid line rect
parameter mid_xlb = 454;
parameter mid_xub = 474;
parameter mid_ylb = 101;
parameter mid_yub = 441;

//left line rect
parameter left_xlb = 377;
parameter left_xub = 391;
parameter left_ylb = 101;
parameter left_yub = 441;

//right line rect
parameter right_xlb = 537;
parameter right_xub = 551;
parameter right_ylb = 101;
parameter right_yub = 441;

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

// TODO: Parameters

update_joy1 ball1 (
    .clk(clk),
    .clr(clr),
    .prev_clk_cursor(prev_clk_cursor),
    .clk_cursor(clk_cursor),
    .joy_x(joy_x_1),
    .joy_y(joy_y_1),
    .dot_x(dot_x_1),
    .dot_y(dot_y_1)
    );

update_joy2 ball2 (
    .clk(clk),
    .clr(clr),
    .prev_clk_cursor(prev_clk_cursor),
    .clk_cursor(clk_cursor),
    .joy_x(joy_x_2),
    .joy_y(joy_y_2),
    .dot_x(dot_x_2),
    .dot_y(dot_y_2)
    );

assign  out_score1 = movescore_1;
assign  out_score2 = movescore_2;


mover puck (
    .clk(clk),
    .clr(clr),
    .dot_x(puck_x),
    .dot_y(puck_y),
	.ball1_x(dot_x_1),
	.ball1_y(dot_y_1),
	.ball2_x(dot_x_2),
	.ball2_y(dot_y_2),
    .prev_clk_cursor(prev_clk_cursor),
    .clk_cursor(clk_cursor),
	.collide1(collide1),
	.collide2(collide2),
	.input_score1(movescore_1),
	.input_score2(movescore_2)
);

//---------------------------------------------------------------

    reg write_enable = 0;
    parameter RAM_WIDTH = 8;
    parameter RAM_ADDR_BITS = 16;

    (* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
    reg [RAM_WIDTH-1:0] ram_name_pp [(2**RAM_ADDR_BITS)-1:0];
    reg [RAM_WIDTH-1:0] output_data_pp;

    reg [RAM_ADDR_BITS-1:0] read_address_pp, write_address=0;
    reg [RAM_WIDTH-1:0] input_data=0;

    //  The forllowing code is only necessary if you wish to initialize the RAM
    //  contents via an external file (use $readmemb for binary data)
    initial
       $readmemh("image2.txt", ram_name_pp, 0, 256*256-1);

    always @(posedge clk) begin
       if (write_enable)
          ram_name_pp[write_address] <= input_data;
       output_data_pp <= ram_name_pp[read_address_pp];
    end

//-----------------------------------------------------------------
always @(posedge clk)
begin
	counter_cursor <= (counter_cursor == 1666666) ? 0 : counter_cursor + 1;
	if (counter_cursor == 0) clk_cursor <= ~clk_cursor;
	else clk_cursor <= clk_cursor;
	prev_clk_cursor = clk_cursor;
    
    if (butUp)
    begin
    up = 1;
    down = 0;
    end
    else
    begin
    up = up;
    down = down;
    end
    
    if (butDown) 
    begin
    up = 0;
    down = 1;
    end
    else
    begin
    up = up;
    down = down;
    end
end

always @(posedge dclk or posedge clr)
begin
	if (clr == 1)
	begin
		hc <= 0;
		vc <= 0;
		
		//movescore_1 <= 0;
		//movescore_2 <= 0;
        // hc_jump_board <= 0;
        // vc_jump_board <= 0;
        // hc_nojump <= 1;
        // vc_nojump <= 1;
	end
	else
	begin

		// keep counting until the end of the line
		if (hc < hpixels - 1)
			hc <= hc + 1;
            // if (hc_jump_board==0) hc_jump_board <= hc_jump_board + 1;
            // else
            // begin
            //     if (hc_jump_board%2==0) hc_nojump <= ~hc_nojump;
            //     if (hc_nojump==0) hc_jump_board <= hc_jump_board + 1;
            // end
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

            // if (vc_jump_board==0) vc_jump_board <= vc_jump_board + 1;
            // else
            // begin
            //     if (vc_jump_board%2==0) vc_nojump <= ~vc_nojump;
            //     if (vc_nojump==0) vc_jump_board <= vc_jump_board + 1;
            // end
		end
	end
end

assign hsync = (hc < hpulse) ? 0:1;
assign vsync = (vc < vpulse) ? 0:1;

// Test1
/*
always @(*)
begin
red = 0;
green = 0;
blue = 0;
		if ((hc>=hbp && hc<=hfp) && (vc>=vbp && vc<=vfp)) 
		begin
        if(state == s0) begin
            red = 3'b111;
			green = 3'b000;
			blue = 2'b00;
		end
		if(up) begin
			red = 3'b000;
			green = 3'b111;
            blue = 2'b00;
        end
//			if(state == s0) begin
//				red = 3'b111;
//				green = 3'b000;
//				blue = 2'b00;
//			end
//			else if(state == s1) begin
//				red = 3'b000;
//				green = 3'b111;
//				blue = 2'b00;
//			end
//			else if(state == s2) begin
//				red = 3'b000;
//				green = 3'b000;
//				blue = 2'b11;
//			end
//			else begin
//				red = 3'b111;
//				green = 3'b000;
//				blue = 2'b11;
//			end
		end
    
end
*/

//Test3

always @(*)
begin
red = 0;
green = 0;
blue = 0;
read_address_pp = {rom_pix_pp[7:0],rom_addr_pp[7:0]};
		if ((hc>=hbp && hc<=hfp) && (vc>=vbp && vc<=vfp)) 
		begin
			if(up==0 && down==0) begin
				red = 3'b111;
				green = 3'b000;
				blue = 2'b00;
			end
			else if(up==1) begin
                    // read_address_board = {rom_pix_board[7:0],rom_addr_board[7:0]};
				 // read_address_board = {temp_rom_pix_board[7:0],temp_rom_addr_board[7:0]};
				//  red = 0;
				//  green = 0;
				//  blue = 0;

					//---------------------PINK PANTHER------------------------------
					if ((hc >= pp_start_x + hbp) && (hc < pp_start_x + hbp + W_pp) && (vc >= pp_start_y + vbp) && (vc < pp_start_y + vbp + H_pp))
					begin
						if (output_data_pp[7:0]!=8'b11111111)
						begin
							red = output_data_pp[2:0];
							green = output_data_pp[5:3];
							blue = output_data_pp[7:6];
						end
					end
					else
					begin
						red = red;
						green = green;
						blue = blue;
					end
					//---------------------------------------------------------------

					//---------------------BOARD BASIC-------------------------------
					//board
					if ((hc >= board_x1 && hc <= board_x4 && vc >= board_y1 && vc <= board_y2) || (hc >= board_x1 && hc <= board_x2 && vc >= board_y1 && vc <= board_y4) || (hc >= board_x1 && hc <= board_x4 && vc >= board_y3 && vc <= board_y4) || (hc >= board_x3 && hc <= board_x4 && vc >= board_y1 && vc <= board_y4))
					begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					end

					//left line
					if ((hc >= left_xlb && hc <= left_xub) && (vc >= left_ylb && vc <= left_yub))
					begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					end

					//right line
					if ((hc >= right_xlb && hc <= right_xub) && (vc >= right_ylb && vc <= right_yub))
					begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					end

					//mid line
					if ((hc >= mid_xlb && hc <= mid_xub) && (vc >= mid_ylb && vc <= mid_yub))
					begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					end

					// TODO: center circle

					//left center rect
					if ((hc >= left_cen_xlb && hc <= left_cen_xub) && (vc >= left_cen_ylb && vc <= left_cen_yub))
					begin
					  if (collide1) begin
						 red = 3'b111;
						 green = 3'b111;
						 blue = 2'b11;
						 //score1 = score1 + 1;
					  end
					  else begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					  end
					end

					//right center rect
					if ((hc >= right_cen_xlb && hc <= right_cen_xub) && (vc >= right_cen_ylb && vc <= right_cen_yub))
					begin
					  if (collide2) begin
                        red = 3'b111;
						 green = 3'b111;
						 blue = 2'b11;
						 //score2 = score2 + 1;
					  end
					  else begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					  end
					end
					//---------------------------------------------------------------

					//--------------------INIT BALLS, PUCK---------------------------
					//puck
					if (((hc-puck_x) * (hc-puck_x) + (vc-puck_y)*(vc-puck_y)) < 100) begin
						 red = 3'b100;
						 green = 3'b010;
						 blue = 2'b11;
					end


					//ball1
					if (((hc-dot_x_1) * (hc-dot_x_1) + (vc-dot_y_1)*(vc-dot_y_1)) < 225) begin
						 red = 3'b111;
						 green = 3'b111;
						 blue = 2'b11;
					end

					//ball2
					if (((hc-dot_x_2) * (hc-dot_x_2) + (vc-dot_y_2)*(vc-dot_y_2)) < 225) begin
						 red = 3'b111;
						 green = 3'b111;
						 blue = 2'b11;
					end
					//-------------------------------------------------------------
			end
			else if(down) begin
				red = 3'b000;
				green = 3'b000;
				blue = 2'b11;
			end
			else begin
				red = 3'b111;
				green = 3'b111;
				blue = 2'b11;
			end
		end
    
end


//Test2
/*
always @(*)
begin
		if ((hc>=hbp && hc<=hfp) && (vc>=vbp && vc<=vfp)) 
		begin
			if(state == s0) begin
				red = 3'b111;
				green = 3'b000;
				blue = 2'b00;
			end
			else if(state == s1) begin
				// read_address_board = {rom_pix_board[7:0],rom_addr_board[7:0]};
				 // read_address_board = {temp_rom_pix_board[7:0],temp_rom_addr_board[7:0]};
				 red = 0;
				 green = 0;
				 blue = 0;

					//---------------------BOARD BASIC-------------------------------
					//board
					if ((hc >= board_x1 && hc <= board_x4 && vc >= board_y1 && vc <= board_y2) || (hc >= board_x1 && hc <= board_x2 && vc >= board_y1 && vc <= board_y4) || (hc >= board_x1 && hc <= board_x4 && vc >= board_y3 && vc <= board_y4) || (hc >= board_x3 && hc <= board_x4 && vc >= board_y1 && vc <= board_y4))
					begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					end

					//left line
					if ((hc >= left_xlb && hc <= left_xub) && (vc >= left_ylb && vc <= left_yub))
					begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					end

					//right line
					if ((hc >= right_xlb && hc <= right_xub) && (vc >= right_ylb && vc <= right_yub))
					begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					end

					//mid line
					if ((hc >= mid_xlb && hc <= mid_xub) && (vc >= mid_ylb && vc <= mid_yub))
					begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					end

					//left center rect
					if ((hc >= left_cen_xlb && hc <= left_cen_xub) && (vc >= left_cen_ylb && vc <= left_cen_yub))
					begin
					  if (collide1) begin
						 red = 3'b111;
						 green = 3'b111;
						 blue = 2'b11;
						 //score1 = score1 + 1;
					  end
					  else begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					  end
					end

					//right center rect
					if ((hc >= right_cen_xlb && hc <= right_cen_xub) && (vc >= right_cen_ylb && vc <= right_cen_yub))
					begin
					  if (collide2) begin
                        red = 3'b111;
						 green = 3'b111;
						 blue = 2'b11;
						 //score2 = score2 + 1;
					  end
					  else begin
						 red = 3'b010;
						 green = 3'b000;
						 blue = 2'b11;
					  end
					end
					//---------------------------------------------------------------

					//--------------------INIT BALLS, PUCK---------------------------
					//puck
					if (((hc-puck_x) * (hc-puck_x) + (vc-puck_y)*(vc-puck_y)) < 100) begin
						 red = 3'b100;
						 green = 3'b010;
						 blue = 2'b11;
					end


					//ball1
					if (((hc-dot_x_1) * (hc-dot_x_1) + (vc-dot_y_1)*(vc-dot_y_1)) < 225) begin
						 red = 3'b111;
						 green = 3'b111;
						 blue = 2'b11;
					end

					//ball2
					if (((hc-dot_x_2) * (hc-dot_x_2) + (vc-dot_y_2)*(vc-dot_y_2)) < 225) begin
						 red = 3'b111;
						 green = 3'b111;
						 blue = 2'b11;
					end
					//-------------------------------------------------------------
			end
			else if(state == s2) begin
				red = 3'b000;
				green = 3'b000;
				blue = 2'b11;
			end
			else begin
				red = 3'b111;
				green = 3'b000;
				blue = 2'b11;
			end
		end
    
end
*/



/*
always @(*)
begin
    // read_address_board = {rom_pix_board[7:0],rom_addr_board[7:0]};
    // read_address_board = {temp_rom_pix_board[7:0],temp_rom_addr_board[7:0]};
    red = 0;
    green = 0;
    blue = 0;

      //---------------------BOARD BASIC-------------------------------
      //board
      if ((hc >= board_x1 && hc <= board_x4 && vc >= board_y1 && vc <= board_y2) || (hc >= board_x1 && hc <= board_x2 && vc >= board_y1 && vc <= board_y4) || (hc >= board_x1 && hc <= board_x4 && vc >= board_y3 && vc <= board_y4) || (hc >= board_x3 && hc <= board_x4 && vc >= board_y1 && vc <= board_y4))
      begin
          red = 3'b010;
          green = 3'b000;
          blue = 2'b11;
      end

      //left line
      if ((hc >= left_xlb && hc <= left_xub) && (vc >= left_ylb && vc <= left_yub))
      begin
          red = 3'b010;
          green = 3'b000;
          blue = 2'b11;
      end

      //right line
      if ((hc >= right_xlb && hc <= right_xub) && (vc >= right_ylb && vc <= right_yub))
      begin
			 red = 3'b010;
          green = 3'b000;
          blue = 2'b11;
      end

      //mid line
      if ((hc >= mid_xlb && hc <= mid_xub) && (vc >= mid_ylb && vc <= mid_yub))
      begin
          red = 3'b010;
          green = 3'b000;
          blue = 2'b11;
      end

      //left center rect
      if ((hc >= left_cen_xlb && hc <= left_cen_xub) && (vc >= left_cen_ylb && vc <= left_cen_yub))
      begin
		  if (collide1) begin
			 red = 3'b111;
          green = 3'b111;
          blue = 2'b11;
			 score1 = score1 + 1;
		  end
		  else begin
			 red = 3'b010;
          green = 3'b000;
          blue = 2'b11;
		  end
      end

      //right center rect
      if ((hc >= right_cen_xlb && hc <= right_cen_xub) && (vc >= right_cen_ylb && vc <= right_cen_yub))
      begin
		  if (collide2) begin
		  red = 3'b111;
          green = 3'b111;
          blue = 2'b11;
			 score2 = score2 + 1;
		  end
		  else begin
			 red = 3'b010;
          green = 3'b000;
          blue = 2'b11;
		  end
      end
      //---------------------------------------------------------------

      //--------------------INIT BALLS, PUCK---------------------------
      //puck
      if (((hc-puck_x) * (hc-puck_x) + (vc-puck_y)*(vc-puck_y)) < 100) begin
          red = 3'b100;
          green = 3'b010;
          blue = 2'b11;
      end


      //ball1
      if (((hc-dot_x_1) * (hc-dot_x_1) + (vc-dot_y_1)*(vc-dot_y_1)) < 225) begin
          red = 3'b111;
          green = 3'b111;
          blue = 2'b11;
      end

      //ball2
      if (((hc-dot_x_2) * (hc-dot_x_2) + (vc-dot_y_2)*(vc-dot_y_2)) < 225) begin
          red = 3'b111;
          green = 3'b111;
          blue = 2'b11;
      end
      //-------------------------------------------------------------
    


end
*/


endmodule

//if(state == s0) begin
//      red = 3'b111;
//      green = 3'b000;
//      blue = 2'b00;
//    end
//    else if(state == s1) begin
//
//      //---------------------BOARD BASIC-------------------------------
//      //board
//      if ((hc >= board_x1 && hc <= board_x4 && vc >= board_y1 && vc <= board_y2) || (hc >= board_x1 && hc <= board_x2 && vc >= board_y1 && vc <= board_y4) || (hc >= board_x1 && hc <= board_x4 && vc >= board_y3 && vc <= board_y4) || (hc >= board_x3 && hc <= board_x4 && vc >= board_y1 && vc <= board_y4))
//      begin
//          red = 3'b010;
//          green = 3'b000;
//          blue = 2'b11;
//      end
//
//      //left line
//      if ((hc >= left_xlb && hc <= left_xub) && (vc >= left_ylb && vc <= left_yub))
//      begin
//          red = 3'b010;
//          green = 3'b000;
//          blue = 2'b11;
//      end
//
//      //right line
//      if ((hc >= right_xlb && hc <= right_xub) && (vc >= right_ylb && vc <= right_yub))
//      begin
//          red = 3'b010;
//          green = 3'b000;
//          blue = 2'b11;
//      end
//
//      //mid line
//      if ((hc >= mid_xlb && hc <= mid_xub) && (vc >= mid_ylb && vc <= mid_yub))
//      begin
//          red = 3'b010;
//          green = 3'b000;
//          blue = 2'b11;
//      end
//
//      //left center rect
//      if ((hc >= left_cen_xlb && hc <= left_cen_xub) && (vc >= left_cen_ylb && vc <= left_cen_yub))
//      begin
//          red = 3'b010;
//          green = 3'b000;
//          blue = 2'b11;
//      end
//
//      //right center rect
//      if ((hc >= right_cen_xlb && hc <= right_cen_xub) && (vc >= right_cen_ylb && vc <= right_cen_yub))
//      begin
//          red = 3'b010;
//          green = 3'b000;
//          blue = 2'b11;
//      end
//      //---------------------------------------------------------------
//
//      //--------------------INIT BALLS, PUCK---------------------------
//      //puck
//      if (((hc-puck_x) * (hc-puck_x) + (vc-puck_y)*(vc-puck_y)) < 100) begin
//          red = 3'b100;
//          green = 3'b010;
//          blue = 2'b11;
//      end
//
//
//      //ball1
//      if (((hc-dot_x_1) * (hc-dot_x_1) + (vc-dot_y_1)*(vc-dot_y_1)) < 225) begin
//          red = 3'b111;
//          green = 3'b111;
//          blue = 2'b11;
//      end
//
//      //ball2
//      if (((hc-dot_x_2) * (hc-dot_x_2) + (vc-dot_y_2)*(vc-dot_y_2)) < 225) begin
//          red = 3'b111;
//          green = 3'b111;
//          blue = 2'b11;
//      end
//      //-------------------------------------------------------------
//
//    end
//    else if(state == s2) begin
//      red = 3'b101;
//      green = 3'b01;
//      blue = 2'b10;
//    end
//	else begin 
//		red = red;
//		green = green;
//		blue = blue;
//	end
