module fifo(in, we, full, out, re, empty, clk, rst);
	input [7:0] in;
	input we;
	output logic full;
	output [7:0] out;
	input re;
	output logic empty;
	input clk, rst;
	logic [7:0] mem[7:0];
	logic [2:0] head, tail, headi;
	logic [7:0] out;

	always_ff @(posedge clk) begin
		if(rst) begin
			head <= 0;
			tail <= 0;
			out <= 0;
		end else begin
			if(we && ~full) begin
				head <= head + 1;
				mem[head] <= in;
			end 
			if(re && ~empty) begin
				tail <= tail + 1;
				out <= mem[tail];
			end
		end
	end

	always_comb begin
		headi = head + 1;
		if(head == tail) empty = 1'b1;
		else empty = 1'b0;
		if(headi == tail) full = 1'b1;
		else full = 1'b0;
	end

endmodule
