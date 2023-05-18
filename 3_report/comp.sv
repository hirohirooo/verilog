//大小を求めるモジュール
module comp(input [2:0] a,b,output logic result);
    logic [2:0] s;
    logic co;
    sub sub(a,b,s,co);
    always_comb begin
        if(co) result = 1;
        else result = 0;
    end

endmodule