module test;
    logic in,clk,rst;
    logic out;
    always #5 clk = ~clk;
    chat chat(in,clk,rst,out);
    initial begin  
        $dumpfile("chat.vcd");
        $dumpvars(0,test);
        in = 1;
        clk = 0;
        rst = 1;
        #10
        rst = 0;
        in = 1;
        #10
        in = 0;
        #10
        in = 1;
        #10
        in = 0;
        #10
        in = 1;
        #10
        in = 1;
        #10
        in = 1;
        #10
        in = 0;
        #10
        in = 1;
        #10
        in = 1;
        #10
        in = 1;
        #10
        in = 0;
        #10
        in = 1;
        #10
        in = 1;
        #10
        in = 1;
        #10
        in = 0;
        #10
        in = 0;
        #10
        in = 0;
        #10
        in = 0;
        #10
        in = 0;
        #10
        in = 0;
        #10
        in = 0;
        #10
        in = 1;
        rst = 1;
        #10
        in = 1;
        rst = 0;
        #10
        in = 1;
        #10
        in = 1;
        #10
        in = 0;
        #10
        in = 0;
        #10
        in = 1;
        #10
        in = 0;
        #10
        in = 0;
        $finish;
    end
endmodule

