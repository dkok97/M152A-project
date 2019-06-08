module score_display(
	input wire segclk,		//7-segment clock
	input wire clr,			//asynchronous reset
  input wire [2:0] p1,
  input wire [2:0] p2,
	output reg [6:0] seg,	//7-segment display LEDs
	output reg [3:0] an		//7-segment display anode enable
	);

// constants for displaying letters on display
//parameter N = 7'b1001000;
//parameter E = 7'b0000110;
//parameter R = 7'b1001100;
//parameter P = 7'b0001100;

parameter d0 = 8'b11000000; // "0"
parameter d1 = 8'b11111001; // "1"
parameter d2 = 8'b10100100; // "2"
parameter d3 = 8'b10110000; // "3"
parameter d4 = 8'b10011001; // "4"
parameter d5 = 8'b10010010; // "5"

parameter A = 7'b0001000;
parameter B = 7'b0000000;

// Finite State Machine (FSM) states
parameter left = 2'b00;
parameter midleft = 2'b01;
parameter midright = 2'b10;
parameter right = 2'b11;

// state register
reg [1:0] state;

// FSM which cycles though every digit of the display every 2.62ms.
// This should be fast enough to trick our eyes into seeing that
// all four digits are on display at the same time.
always @(posedge segclk or posedge clr)
begin
	// reset condition
	if (clr == 1)
	begin
		seg <= 7'b1111111;
		an <= 7'b1111;
		state <= left;
	end
	// display the character for the current position
	// and then move to the next state
	else
	begin
		case(state)
			left:
			begin
                if(p1 >=5) seg <= A;
                else if(p2 >= 5) seg <= B;
                else seg <= d0;
                
				an <= 4'b0111;
				state <= midleft;
			end
			midleft:
			begin
                if(p1 >=5) seg <= A;
                else if(p2 >= 5) seg <= B;
                else begin 
                
                    case(p1)
                      0: seg <= d0;
                      1: seg <= d1;
                      2: seg <= d2;
                      3: seg <= d3;
                      4: seg <= d4;
                      5: seg <= d5;
                      default: seg <= d0;
                    endcase
                end
				an <= 4'b1011;
				state <= midright;
			end
			midright:
			begin
                if(p1 >=5) seg <= A;
                else if(p2 >= 5) seg <= B;
                else seg <= d0;
                
				an <= 4'b1101;
				state <= right;
			end
			right:
			begin
                 if(p1 >=5) seg <= A;
                else if(p2 >= 5) seg <= B;
                else begin 
                
                    case(p2)
                    
                      0: seg <= d0;
                      1: seg <= d1;
                      2: seg <= d2;
                      3: seg <= d3;
                      4: seg <= d4;
                      5: seg <= d5;
                      default: seg <= d0;
                    endcase
                end
                
				an <= 4'b1110;
				state <= left;
			end
		endcase
	end
end

endmodule
