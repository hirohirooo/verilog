`timescale 1ns/10ps
module test;
    reg a,b,rst;
    wire can;
    reg clk;
    wire [3:0] coin,c;
    always #5 clk =~clk;
    venmac venmac (a,b,c,can,coin,clk,rst);
    initial begin
    $dumpfile("state.vcd");
    $dumpvars(0,test);
    clk=0;
    rst=1;
    a=0;
    b=0;
#20
    rst =0;
#10
    a=1;
    b=0;
#10
    a=0;
    b=0;
#10
    a=1;
    b=0;
#10
    a=0;
    b=0;
#10
    a=1;
    b=0;
#10
    a=0;
    b=0;
#10
    a=1;
    b=0;
#10
    a=0;
    b=0;
#10
    a=1;
    b=0;
#10
    a=0;
    b=0;
#40
    rst=1;
#20
    rst=0;
#10
    a=0;
    b=0;
#10
    a=1;
    b=0;
#10
    a=0;
    b=0;
#10
    a=0;
    b=1;
#10
    a=0;
    b=0;
#40
    rst=1;
#20
    rst=0;
#10
    a=0;
    b=0;
#10
    a=1;
    b=0;
#10
    a=0;
    b=0;
    #10
    a=1;
    b=0;
#10
    a=0;
    b=0;
    #10
    a=1;
    b=0;
#10
    a=0;
    b=0;
#10
    a=0;
    b=1;
#10
    a=0;
    b=0;
#50
    $finish;
end
endmodule