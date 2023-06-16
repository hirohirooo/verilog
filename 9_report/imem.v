`include "pu.vh"
module imem(input [`PCS:0] pc, output logic [`CMDS:0] o);
	always_comb
		case(pc)
		// synopsys full_case parallel_case
		5'h00: o = 16'b0000_0000_0000_0000; // NOP

		//初期値
		5'h01: o = 16'b1000_00_10_0000_0001; //LIL
		5'h02: o = 16'b1000_00_11_0000_0000; //LIH r0 <- 1
		5'h03: o = 16'b1000_01_10_0000_0001; //LIL
		5'h04: o = 16'b1000_01_11_0000_0000; //LIH r1 <- 1
		//カウント
		5'h05: o = 16'b1000_11_10_0001_0000; //LIL
		5'h06: o = 16'b1000_11_11_0000_0000; //LIH r3 <- 16
		
		//計算
		5'h07: o = 16'b0000_10_10_0000_00_01; //r2<-a+b
		5'h08: o = 16'b0000_10_00_0010_00_01; //r0<-r1
		5'h09: o = 16'b0000_10_01_0010_00_10; //r1<-r2​
		//判定
		// 0 0 1 # rw> a-> im------------> ; CAL rw=ra,im (#=0:ADD/1:SUB only)
		5'h0a: o = 16'b0011_11_11_0000_0001;

		//ジャンプ
		// 0 1 0 p 1 1 f f im------------> ; JP/BR fp [PC + (s)im]
		5'h0b: o = 16'b010_0_11_01_1111_1100; //補数表現-4​
		// 0 0 0 0 0 0 * * * * * * * * * 1 ; HALT (1)
		5'h0c: o = 16'b0000_0000_0000_0001;
		endcase
endmodule
/*
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 0 0 0 * * * * * * * * * 0 ; NOP (0) DSTB
// 0 0 0 0 0 0 * * * * * * * * * 1 ; HALT (1)
// 0 0 0 0 0 1 * * * * * * * * * * ; future reserved (PUSH, POP, SET(reg))
// 0 0 0 0 1 0 rw> F op--> a-> b-> ; CAL rw=ra,rb (F=0:NORM/1:DSTB) MV
// 0 0 0 0 1 1 * * * op--> a-> b-> ; EVA CAL ra,rb (F=0)/CMP ra,rb
// 0 0 0 1 0 0 f f p op--> a-> b-> ; JP/BR pf [ra op rb] (ff:NC,Z,C,S)
// 0 0 0 1 0 1 * * * * * * * * * * ; future reserved
// 0 0 0 1 1 0 F * * op--> a-> b-> ; SM [ra]=rb / SM [ra] = [ra op rb] *MM
// 0 0 0 1 1 1 rw> F op--> a-> b-> ; LM rw=[ra op rb] / LM rw=[rb] *MM
// 0 0 1 # rw> a-> im------------> ; CAL rw=ra,im (#=0:ADD/1:SUB only)
// 0 1 0 p 0 * f f im------------> ; JP/BR pf [(s)im]
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
// 1 1 0 * * * * * * * * * * * * * ; future reserved *MM
// 1 1 1 * * * * * * * * * * * * * ; future reserved *MM (debug)
//
// ALU  000:ADD, 001:SUB, 010:THB, 011:ASR,
//      100:RSL, 101:RSL, 110:NAD, 111:XOR
//
// COND(ff) 00:UC 01:ZE 10:CA 11:SG
// P/N (p)  0:N(!=) 1:P(==)
//
// EX: Positive Zero => PZ
//
// SPECIALS
// F E D C B A 9 8 7 6 5 4 3 2 1 0
// 0 0 0 0 1 0 rw> 0 0 1 0 0 0 b-> ; MV rw=rb
// 1 0 0 0 rw> 0 1 0 0 0 0 0 0 0 0 ; RESET rw (LI rw=0)
// 0 0 1 0 rw> rw> 0 0 0 0 0 0 0 1 ; INC rw
// 0 0 1 1 rw> rw> 0 0 0 0 0 0 0 1 ; DEC rw
// 0 0 1 0 rw> ra> 0 0 0 0 0 0 0 1 ; INC rw=ra (rw = ra+1)
// 0 0 1 1 rw> ra> 0 0 0 0 0 0 0 1 ; DEC rw=ra (rw = ra-1)
// 0 0 0 0 1 1 * * * 0 0 1 a-> b-> ; CMP ra,rb (EVA SUB ra,rb)
*/