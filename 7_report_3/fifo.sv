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
		end else begin
      case({re,we,~full,~empty})
        4'b1001,4'b1011,4'b1101:begin
          tail <= tail + 1;
          out <= mem[tail];
        end
        4'b0110,4'b0111,4'b1110:begin
          head <= head + 1;
          mem[head] <= in;
          out <= 0;
        end
        4'b1111:begin
          tail <= tail + 1;
          out <= mem[tail];
          head <= head + 1;
          mem[head] <= in;
        end          
        default:begin
          out <= 0;
        end
      endcase
		end
	end

	always_comb begin
		headi = head + 1;
    empty = (head == tail);
		full = (headi == tail);
	end

endmodule
