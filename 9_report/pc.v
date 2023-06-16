`include "pu.vh"
module pc(
	input halt,
	output logic [`PCS:0] pc,
	input we,
	input [`PCS:0] rwd,
	input clk, rst);

	always @(posedge clk or posedge rst)
		if(rst) pc <= 0;
		else if(!halt) begin //haltが立つと止まる
			//ジャンプ命令
			if(we==1) pc<=rwd; //何かしら計算したrwdの値でpcを置き換える
			else pc <= pc + 1; //ほっておくとどんどん増えていく
		end
endmodule