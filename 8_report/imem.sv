module imem(input [5:0] pc,output logic [9:0] o);
    always_comb
        case(pc)
        //synopsys full_case parallel_case
        5'h00: o = 10'b0_00_010_00_01;//SET0 r0 <- 0
        5'h01: o = 10'b0_01_001_00_00;//TRU  r1 <- r0
        5'h02: o = 10'b0_00_100_00_01;//SET2 r0 <- 2
        5'h03: o = 10'b0_10_001_00_01;//TRU  r2 <- r1
        5'h04: o = 10'b0_01_001_00_00;//TRU  r1 <- r0
        5'h05: o = 10'b0_00_101_00_01;//SET3 r0 <- 3
        //ここから繰り返し
        5'h06: o = 10'b0_11_000_01_10;//ADD  r3 <- r1 + r2
        5'h07: o = 10'b0_10_001_00_01;//TRU  r2 <- r1
        5'h08: o = 10'b0_01_001_00_00;//TRU  r1 <- r0
        5'h09: o = 10'b0_00_001_00_11;//TRU  r0 <- r3
        5'h0A: o = 10'b0_11_000_01_10;//ADD  r3 <- r1 + r2
        5'h0B: o = 10'b0_10_001_00_01;//TRU  r2 <- r1
        5'h0C: o = 10'b0_01_001_00_00;//TRU  r1 <- r0
        5'h0D: o = 10'b0_00_001_00_11;//TRU  r0 <- r3
        5'h0E: o = 10'b0_11_000_01_10;//ADD  r3 <- r1 + r2
        5'h0F: o = 10'b0_10_001_00_01;//TRU  r2 <- r1
        5'h10: o = 10'b0_01_001_00_00;//TRU  r1 <- r0
        5'h11: o = 10'b0_00_001_00_11;//TRU  r0 <- r3
        5'h12: o = 10'b0_11_000_01_10;//ADD  r3 <- r1 + r2
        5'h13: o = 10'b0_10_001_00_01;//TRU  r2 <- r1
        5'h14: o = 10'b0_01_001_00_00;//TRU  r1 <- r0
        5'h15: o = 10'b0_00_001_00_11;//TRU  r0 <- r3
        5'h16: o = 10'b0_11_000_01_10;//ADD  r3 <- r1 + r2
        5'h17: o = 10'b0_10_001_00_01;//TRU  r2 <- r1
        5'h18: o = 10'b0_01_001_00_00;//TRU  r1 <- r0
        5'h19: o = 10'b0_00_001_00_11;//TRU  r0 <- r3
        5'h1A: o = 10'b0_11_000_01_10;//ADD  r3 <- r1 + r2
        5'h1B: o = 10'b0_10_001_00_01;//TRU  r2 <- r1
        5'h1C: o = 10'b0_01_001_00_00;//TRU  r1 <- r0
        5'h1D: o = 10'b0_00_001_00_11;//TRU  r0 <- r3
        5'h1E: o = 10'b1_11_000_01_10;//ADD  r3 <- r1 + r2
        endcase
endmodule

// enum {ADD, TRU, SET0,SET1,SET2,SET3,SUB} OPTYPE;
//       000  001  010  011  100  101 110
    // assign {h,wad,op,brad,arad} = o;