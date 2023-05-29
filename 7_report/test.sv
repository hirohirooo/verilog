`timescale 1ns/10ps
module test;
	wire b;
	reg a,clk, rst;
	ex ex(a, b, clk, rst);
	always #5 clk = ~clk;
initial begin
	$dumpfile("*.vcd");
	$dumpvars(0, test);
clk = 0;
rst = 1;
a= 0;
#20
rst = 0;
#10
a= 1;
#30
a = 0;
#50
a = 1;
#10
$finish;
end
endmodule
