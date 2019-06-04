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
	input wire rst,
    input wire [1:0] state
    );

// FSM States
parameter s0 = 0;	// splash
parameter s1 = 1;	// middle
parameter s2 = 2;	// play
parameter s3 = 3;	// end

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
    .clk_cursor(clk_cursor)
);

//---------------------------------------------------------------

//    reg write_enable = 0;
//    parameter RAM_WIDTH = 8;
//    parameter RAM_ADDR_BITS = 15;

//    (* RAM_STYLE="{AUTO | BLOCK |  BLOCK_POWER1 | BLOCK_POWER2}" *)
//    reg [RAM_WIDTH-1:0] ram_name_board [(2**RAM_ADDR_BITS)-1:0];
//    reg [RAM_WIDTH-1:0] output_data_board;

//    reg [RAM_ADDR_BITS-1:0] read_address_board, write_address=0;
//    reg [RAM_WIDTH-1:0] input_data=0;

//    //  The forllowing code is only necessary if you wish to initialize the RAM
//    //  contents via an external file (use $readmemb for binary data)
//    initial
//       $readmemh("image2.txt", ram_name_board, 0, 181*134-1);

//    always @(posedge clk) begin
//       if (write_enable)
//          ram_name_board[write_address] <= input_data;
//       output_data_board <= ram_name_board[read_address_board];
//    end

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
        // hc_jump_board <= 0;
        // vc_jump_board <= 0;
        // hc_nojump <= 1;
        // vc_nojump <= 1;
		//$readmemb("color.txt", lines);
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

always @(*)
begin
    // read_address_board = {rom_pix_board[7:0],rom_addr_board[7:0]};
    // read_address_board = {temp_rom_pix_board[7:0],temp_rom_addr_board[7:0]};
    red = 0;
    green = 0;
    blue = 0;

    if(state == s0) begin
      red = 3'b001;
      green = 3'b010;
      blue = 2'b11;
    end
    else if(state == s1) begin

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
          red = 3'b010;
          green = 3'b000;
          blue = 2'b11;
      end

      //right center rect
      if ((hc >= right_cen_xlb && hc <= right_cen_xub) && (vc >= right_cen_ylb && vc <= right_cen_yub))
      begin
          red = 3'b010;
          green = 3'b000;
          blue = 2'b11;
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
          red = 3'b010;
          green = 3'b000;
          blue = 2'b11;
      end

      //right center rect
      if ((hc >= right_cen_xlb && hc <= right_cen_xub) && (vc >= right_cen_ylb && vc <= right_cen_yub))
      begin
          red = 3'b010;
          green = 3'b000;
          blue = 2'b11;
      end
      //---------------------------------------------------------------

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
    end
    else if(state == s3) begin
      red = 3'b101;
      green = 3'b01;
      blue = 2'b10;
    end

    endcase


end

endmodule
