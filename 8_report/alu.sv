module alu(input [15:0] a, b, input [2:0] op, output logic [15:0] r);
    parameter ADD = 3'b000;
    parameter TRU = 3'b001;
    parameter SET0 = 3'b010;
    parameter SET1 = 3'b011;
    parameter SET2 = 3'b100;
    parameter SET3 = 3'b101;
    parameter SUB = 3'b110;
    
    always_comb begin
        case (op)
            ADD: r = a + b;
            TRU: r = a;
            SET0: r = 0;
            SET1: r = 1;
            SET2: r = 2;
            SET3: r = 3;
            SUB: r = a - b;
            default: r = 0; // デフォルトの動作を指定する場合はdefaultを追加
        endcase
    end
endmodule
