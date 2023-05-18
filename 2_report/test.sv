module test(a,b);
    output b;
    input a;
    assign b = a;
endmodule

module sim;
    logic a;
    test test(a,b);
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0,sim);
        a = 0;
        #10
        a = 1;
        #15
        a = 0;
        #10
        a = 1;
        #10
        a = 0;
    $finish;
    end
endmodule