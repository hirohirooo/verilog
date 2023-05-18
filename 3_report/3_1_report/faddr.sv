//加算回路
module faddr(input a,b,ci,output s,co); 
//入力a,b,繰り上がりci,出力s,繰り上がりco
    assign s = a^b^ci;
    assign co = a&b|a&ci|b&ci;
endmodule

