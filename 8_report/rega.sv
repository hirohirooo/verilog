module rega(input logic [1:0] arad,brad, output logic [15:0] a,b,input we,input logic [1:0] wad,input [15:0] wd,input clk,rst);
    logic [15:0] regar [3:0];
    always_ff @(posedge clk) begin
        if(we) regar[wad] <= wd;
    end
    assign a = regar[arad];
    assign b = regar[brad]; 
endmodule
