//4bitの補数表現を作るmodule
module hosu(input [2:0] in,output logic [2:0] out);
    //補数表現を作成
    logic [2:0] s;
    raddr ra0(~in,3'b001,s,c);//反転して1を足す
    assign out = s;
endmodule
