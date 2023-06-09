module alu(input [15:0] a,b,input [2:0] op,output logic [15:0] r);
    enum {ADD, TRU, SET0,SET1,SET2,SET3,SUB} OPTYPE;
    always_comb begin
        case(op)
        //synopsys full_case parallel_case
        ADD: r = a+b;
        TRU: r = a;
        SET0: r = 0;
        SET1: r = 1;
        SET2: r = 2;
        SET3: r = 3;
        SUB: r = a-b;
        endcase
    end
endmodule
