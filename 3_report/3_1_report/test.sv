module test;
    logic [2:0] a,b;
    logic s;
    comp comp(a,b,s);
    initial begin  
        $dumpfile("raddr.vcd");
        $dumpvars(0,test);
        a = 6;
        b= 4;
        #10
        a = 1;
        b = 3;
        #10
        a = 3;
        b = 3;
        #10
        a = 2;
        b = 4;
        #10
        $finish;
    end
endmodule
