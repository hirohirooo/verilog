all: 
	iverilog -g2012 *.sv test.v
	vvp a.out
	open *.vcd

wave: 
	open *.vcd

syn:
	yosys *.ys

synsim:
	iverilog -gspecify -T typ gate.v test.v osu018_stdcells.v
	vvp a.out
	open *.vcd
fresh:
	rm gate.v fibo.vcd a.out synth.v
