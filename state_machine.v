module state_machine(
	clk,
	start,
	score,
	p1,
	p2,
	cur_state
);

	input clk;
	input wire start, score;
	input wire[2:0] p1, p2;

	parameter s0 = 0;	// splash
	parameter s1 = 1;	// middle
	parameter s2 = 2;	// play
	parameter s3 = 3;	// end

	output reg[1:0] cur_state = s0;
	reg[1:0] next_state;

	always @(*) begin
		case(cur_state)

			0: begin
				if (start) next_state <= s1;
				else next_state <= cur_state;
			end

			1: begin
				next_state <= s2;
			end

			2: begin
				if(p1 < 5 && p2 < 5) next_state <= s1;
				else if(p1 >= 5 || p2 >= 5) next_state <= s3;
				else next_state <= cur_state;
			end

			3: begin
				if(start) next_state <= s0;
				else next_state <= cur_state;
      end

			default: next_state <= s0;
		endcase
	end

	always @(posedge clk) begin
		cur_state <= next_state;
	end
endmodule
