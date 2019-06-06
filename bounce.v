`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:26:23 05/09/2019 
// Design Name: 
// Module Name:    bounce 
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
module bounce(
	input button,
	output button_state,
    input clk
    );
	 
reg button_state_reg = 0;
reg button_first_press = 0;

reg [31:0] counter = 0;

always @ (posedge clk)
begin
    if (button) begin
	      button_state_reg <= 0;
			button_first_press <= 1;
			counter <= counter + 1;
			if(counter >= 20000000)
			begin
				button_state_reg <= 1;
				counter <= 0;
				button_first_press <= 0;
			end

		end
	else
    begin
		if (!button_first_press) begin
            counter <= 0;
        end
        button_state_reg <= 0;
	end
end

assign button_state = button_state_reg;

endmodule
