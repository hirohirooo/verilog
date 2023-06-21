`include "pu.vh"
`define DEBUG
//`define DEBUG2

module dec(input [`CMDS:0] o, output logic h, we, output logic [`RASB:0] wad,
	output logic [`OPS:0] op, output logic [`RASB:0] rb, ra,
	output logic [`LICMDS:0] liop, output logic [`HALFWIDTH:0] iv,
	output logic pcwe, dmwe, dms, pcs, dstb,
	input ze, ca, sg);
/*
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 0 0 0 * * * * * * * * * 0 ; NOP (0) DSTB
// 0 0 0 0 0 0 * * * * * * * * * 1 ; HALT (1)
// 0 0 0 0 0 1 * * * * * * * * * * ; future reserved (PUSH, POP, SET(reg))
// 0 0 0 0 1 0 rw> F op--> a-> b-> ; CAL rw=ra,rb (F=0:NORM/1:DSTB) MV
// 0 0 0 0 1 1 * * * op--> a-> b-> ; EVA CAL ra,rb (F=0)/CMP ra,rb
// 0 0 0 1 0 0 f f p op--> a-> b-> ; JP/BR fp [ra op rb] (ff:NC,Z,C,S)
// 0 0 0 1 0 1 * * * * * * * * * * ; future reserved
// 0 0 0 1 1 0 F * * op--> a-> b-> ; SM [ra]=rb / SM [ra] = [ra op rb] *MM
// 0 0 0 1 1 1 rw> F op--> a-> b-> ; LM rw=[ra op rb] / LM rw=[rb] *MM
// 0 0 1 # rw> a-> im------------> ; CAL rw=ra,im (#=0:ADD/1:SUB only)
// 0 1 0 p 0 * f f im------------> ; JP/BR fp [(s)im]
// 0 1 0 * 1 0 b-> im------------> ; SM [(s)im]=rb *MM
// 0 1 0 p 1 1 f f im------------> ; JP/BR fp [PC + (s)im]
// 0 1 1 p a-> f f im------------> ; JP/BR fp [ra + (s)im]
// 1 0 0 0 rw> 0 0 0 0 0 0 0 S C Z ; LI rw,SM S:sign C:carry Z:zero
// 1 0 0 0 rw> 0 1 im------------> ; LI rw,(s)im (rw=rb) lidx=o[9:8]
// 1 0 0 0 rw> 1 0 im------------> ; LIL rw,im (rw=rb)
// 1 0 0 0 rw> 1 1 im------------> ; LIH rw,im (rw=rb)
// 1 0 0 1 rw> * * im------------> ; LM rw=[im] *MM
// 1 0 1 0 rw> a-> im------------> ; LM rw=[ra + (s)im]
// 1 0 1 1 a-> b-> im------------> ; SM [ra + (s)im]=rb
// 1 1 * * * * * * * * * * * * * * ; future reserved *MM
//ペラン数計算用に追加
//判定条件用に直値とレジスタの値で引き算,結果の書き込みなし
// 1 1 1 1 a-> * * im------------> ; CMP ra-im (SUB)
*/

	// `LIDXENUM
	// enum {UC, ZE, CA, SG} FLAGTYP;
	parameter THU=0, IMM=1, LIL=2, LIH=3;
	parameter UC=0, ZE=1, CA=2, SG=3;
	parameter ADD=0, SUB=1, THB=2, ASL=3, RSL=4, RSR=5, NAD=6, XOR=7;
	logic f1, f2;
	always @* begin
		f1 = `NEGATE;
		f2 = `NEGATE;
		case(o[9:8])
		// synopsys full_case parallel_case
		UC: begin
			f1 = `ASSERT;
			f2 = `ASSERT;
		end
		ZE: begin
			f1 = ~ze^o[7];
			f2 = ~ze^o[12];
		end
		CA: begin
			f1 = ~ca^o[7];
			f2 = ~ca^o[12];
		end
		SG: begin
			f1 = ~sg^o[7];
			f2 = ~sg^o[12];
		end
		endcase
	end
	always @* begin
		h = `NEGATE;
		ra = 0;
		rb = 0;
		op = THB;
		we = `NEGATE;
		wad = 0;
		liop = THU;
		iv = 0;
		dstb = `NEGATE;
		pcwe = `NEGATE;
		dmwe = `NEGATE;
		dms = `NEGATE;
		pcs = `NEGATE;
/*
`ifdef DEBUG
$display("*****PC[%h]we[%h]CODE:%h", test.pu.pc.pc, pcwe, o);
$display("r0[%h]1[%h]2[%h]3[%h]", test.pu.rega.regar[0], test.pu.rega.regar[1],
`endif
	test.pu.rega.regar[2], test.pu.rega.regar[3]); */
		case(o[15:13])
		// synopsys full_case parallel_case
		3'b000: begin
			case(o[12:10])
			// synopsys full_case parallel_case
			3'b000: begin
				case(o[0])
				// synopsys full_case parallel_case
				`NEGATE: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 0 0 0 * * * * * * * * * 0 ; NOP (0) DSTB
					// DO NOTHING
					dstb = `ASSERT;
`ifdef DEBUG
	$display("NOP");
`endif
				end
				`ASSERT: begin
// 0 0 0 0 0 0 * * * * * * * * * 1 ; HALT (1)
					h = `ASSERT;
`ifdef DEBUG
	$display("HALT");
`endif
				end
				endcase
			end
			3'b001: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 0 0 1 * * * * * * * * * * ; future reserved (PUSH, POP, SET(reg))
			end
			3'b010: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 0 1 0 rw> F op--> a-> b-> ; CAL rw=ra,rb (F=0:NORM/1:DSTB) MV
				wad = o[9:8];
				we = `ASSERT;
				dstb = o[7];
				op = o[6:4];
				ra = o[3:2];
				rb = o[1:0];
`ifdef DEBUG
	$display("CAL rw:%h F:%h op:%h, ra:%h, rb:%h", wad, dstb, op, ra, rb);
	$display("CAL rw=ra,rb (F=0:NORM/1:DSTB) MV");
`endif
			end
			3'b011: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 0 1 1 * * * op--> a-> b-> ; EVA CAL ra,rb (F=0)/CMP ra,rb
				op = o[6:4];
				ra = o[3:2];
				rb = o[1:0];
`ifdef DEBUG
	$display("EVA CAL op:%h, ra:%h, rb:%h", op, ra, rb);
	$display("EVA CAL ra,rb (F=0)/CMP ra,rb");
`endif
			end
			3'b100: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 1 0 0 f f p op--> a-> b-> ; JP/BR fp [ra op rb] (ff:NC,Z,C,S)
//条件分岐&レジスタの演算結果へジャンプ？
				if(f1) begin
					op=o[6:4];
					ra=o[3:2];
					rb=o[1:0];
					pcwe=1;
				end

`ifdef DEBUG
	$display("JP/BR f1:%h(Z%hC%hS%h) op:%h, ra:%h, rb:%h", f1, ze, ca, sg, op, ra, rb);
	$display("JP/BR fp [ra op rb] (ff:NC,Z,C,S)");
`endif
			end
			3'b101: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 1 0 1 * * * * * * * * * * ; future reserved
			end
			3'b110: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 1 1 0 F * * op--> a-> b-> ; SM [ra]=rb / SM [ra] = [ra op rb] *MM
				dmwe = `ASSERT;
				dstb = o[9];
				op = o[6:4];
				ra = o[3:2];
				rb = o[1:0];
`ifdef DEBUG
	$display("SM [ra]=rb / SM [ra] = [ra op rb] *MM");
	$display("SM d:%h op:%h, ra:%h, rb:%h", dstb, op, ra, rb);
`endif
			end
			3'b111: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 1 1 1 rw> F op--> a-> b-> ; LM rw=[ra op rb] / LM rw=[rb] *MM
				wad = o[9:8];
				we = `ASSERT;
				dstb = o[7];
				op = o[6:4];
				ra = o[3:2];
				rb = o[1:0];
				dms = `ASSERT;
`ifdef DEBUG
	$display("LM rw=[ra op rb] / LM rw=[rb] *MM");
	$display("SM wr:%d d:%h op:%h, ra:%h, rb:%h", wad, dstb, op, ra, rb);
`endif
			end
			endcase
		end
		3'b001: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 1 # rw> a-> im------------> ; CAL rw=ra,im (#=0:ADD/1:SUB only)
			wad = o[11:10];
			we = `ASSERT;
			ra = o[9:8];
			op = {2'b00,o[12]};
			iv = o[`HALFWIDTH:0];
			liop = IMM;
`ifdef DEBUG
	$display("CAL rw=ra,im (#=0:ADD/1:SUB only)");
	$display("CAL op#:%h wr:%h[%h], ra:%h, rb:%h, IM:%h", op, wad, we, ra, rb, iv);
`endif
		end
		3'b010: begin
			case(o[11])
			// synopsys full_case parallel_case
			`NEGATE: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 1 0 p 0 * f f im------------> ; JP/BR fp [(s)im]
//条件に応じて直値ジャンプ
				if(f2) begin
					//aluとselは初期値でok
					//aluの記述直した
					pcwe=1;
					liop=IMM;
					iv=o[7:0];
				end

`ifdef DEBUG
	$display("JP/BR fp [(s)im]");
	$display("JP/BR f2:%h(Z%hC%hS%h) liop:%h, IM:%h", f2, ze, ca, sg, liop, iv);
`endif
			end
			`ASSERT: begin
				case(o[10])
				// synopsys full_case parallel_case
				`ASSERT: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 1 0 p 1 1 f f im------------> ; JP/BR fp [PC + (s)im]
//条件に応じて相対ジャンプ
					if(f2) begin
						pcwe=1;
						//aにpcの番地を入れる
						pcs=1;
						op=ADD;
						liop=IMM;
						iv=o[7:0];
					end

`ifdef DEBUG
	$display("JP/BR fp [PC + (s)im]");
	$display("JP/BR f2:%h(Z%hC%hS%h) liop:%h, op:%h IM:%h", f2, ze, ca, sg, op, liop, iv);
`endif
				end
				`NEGATE: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 1 0 * 1 0 b-> im------------> ; SM [(s)im]=rb *MM
					rb = o[9:8];
					dmwe = `ASSERT;
					iv = o[`HALFWIDTH:0];
					liop = IMM;
`ifdef DEBUG
	$display("SM [(s)im]=rb *MM");
	$display("SM rb:%h IM:%h", rb, iv);
`endif
				end
				endcase
			end
			endcase
		end
		3'b011: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 1 1 p a-> f f im------------> ; JP/BR fp [ra + (s)im]
//条件に応じてレジスタ値との相対ジャンプ
			if(f2) begin
				pcwe=1;
				op=ADD;
				ra=o[11:10];
				liop=IMM;
				iv=o[7:0];
			end

`ifdef DEBUG
	$display("JP/BR fp [ra + (s)im]");
	$display("JP/BR f2:%h(Z%hC%hS%h) ra:%h liop:%h, op:%h IM:%h", f2, ze, ca, sg, ra, op, liop, iv);
`endif
		end
		3'b100: begin
			case(o[12])
			// synopsys full_case parallel_case
			`NEGATE: begin
				case(o[9:8])
				// synopsys full_case parallel_case
				2'b00:begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 1 0 0 0 rw> 0 0 0 0 0 0 0 S C Z ; LI rw,SM S:sign C:carry Z:zero
					wad = o[11:10];
					we = `ASSERT;
					iv = {5'h00, sg, ca, ze};
					liop = IMM;
`ifdef DEBUG
	$display("LI rw,SM S:sign C:carry Z:zero");
	$display("LI SM h(Z%hC%hS%h) wr:%h liop:%h, IM:%h", f2, ze, ca, sg, wad, liop, iv);
`endif
				end
				2'b01:begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 1 0 0 0 rw> 0 1 im------------> ; LI rw,(s)im lidx=o[9:8]
					wad = o[11:10];
					we = `ASSERT;
					iv = o[`HALFWIDTH:0];
					liop = IMM;
`ifdef DEBUG
	$display("LI rw,(s)im lidx=o[9:8]");
	$display("LI wr:%h liop:%h, IM:%h", wad, liop, iv);
`endif
				end
				2'b10:begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 1 0 0 0 rw> 1 0 im------------> ; LIL rw,im (rw=rb)
					wad = o[11:10];
					we = `ASSERT;
					rb = o[11:10];
					iv = o[`HALFWIDTH:0];
					liop = LIL;
`ifdef DEBUG
	$display("LIL rw,im (rw=rb)");
	$display("LIL wr:%h liop:%h, IM:%h (rb:%h)", wad, liop, iv, rb);
`endif
				end
				2'b11:begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 1 0 0 0 rw> 1 1 im------------> ; LIH rw,im (rw=rb)
					wad = o[11:10];
					we = `ASSERT;
					rb = o[11:10];
					iv = o[`HALFWIDTH:0];
					liop = LIH;
`ifdef DEBUG
	$display("LIH rw,im (rw=rb)");
	$display("LIH wr:%h liop:%h, IM:%h (rb:%h)", wad, liop, iv, rb);
`endif
				end
				endcase
			end
			`ASSERT: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 1 0 0 1 rw> * * im------------> ; LM rw=[im] *MM
				wad = o[11:10];
				we = `ASSERT;
				iv = o[`HALFWIDTH:0];
				liop = IMM;
				dms = `ASSERT;
`ifdef DEBUG
	$display("LM rw=[im] *MM");
	$display("LM wr:%h liop:%h, IM:%h", wad, liop, iv, rb);
`endif
			end
			endcase
		end
		3'b101: begin
			case(o[12])
			// synopsys full_case parallel_case
			`NEGATE: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 1 0 1 0 rw> a-> im------------> ; LM rw=[ra + (s)im]
				wad = o[11:10];
				we = `ASSERT;
				ra = o[9:8];
				iv = o[`HALFWIDTH:0];
				liop = IMM;
				op = ADD;
				dms = `ASSERT;
`ifdef DEBUG
	$display("LM rw=[ra + (s)im]");
	$display("LM wr:%h ra:%h, liop:%h, IM:%h ADD", wad, ra, liop, iv);
`endif
			end
			`ASSERT: begin
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 1 0 1 1 a-> b-> im------------> ; SM [ra + (s)im]=rb
				dmwe = `ASSERT;
				//変更
				ra = o[11:10];
				rb = o[9:8];
				iv = o[`HALFWIDTH:0];
				liop = IMM;
				op = ADD;
`ifdef DEBUG
	$display("SM [ra + (s)im]=rb");
	$display("SM ra:%h rb:%h liop:%h IM:%h ADD", rb, liop, iv);
`endif
			end 		
			endcase
 		end
		3'b110: begin
		end
		3'b111: begin
			case(o[12])
			`ASSERT: begin
// 1 1 1 1 a-> * * im------------> ; CMP ra-im (SUB)
				liop=IMM;
				ra=o[11:10];
				iv=o[7:0];
				op=SUB;
			end
			endcase
		end
		endcase
`ifdef DEBUG2
$display("----DEBUG----(%f)", $realtime);
$display("PC[%h]we[%h]CODE:%h", test.pu.pc.pc, pcwe, o);
$display("REGA a[%h], b[%h], w[%h](%h)", ra, rb, wad, we);
$display("ALU op[%h], dstb[%h], status Z[%h] C[%h] S[%h]", op, dstb, ze, ca, sg);
$display("SEL LIDX[%h] IM[%h] PCS[%h]", liop, iv, pcs);
$display("DMEM we[%h] sel[%h]", dmwe, dms);
$display("r0[%h]1[%h]2[%h]3[%h]", test.pu.rega.regar[0], test.pu.rega.regar[1],
	test.pu.rega.regar[2], test.pu.rega.regar[3]);
$display("-------------");
`endif
	end
endmodule