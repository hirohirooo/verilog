//3bitの加算回路
module raddr(input [2:0] a,b,output[2:0] s,output co);
    logic [2:0] c;
    assign c[0] = 0;
    faddr f0(a[0],b[0],c[0],s[0],c[1]);
    faddr f1(a[1],b[1],c[1],s[1],c[2]);
    faddr f2(a[2],b[2],c[2],s[2],co);
endmodule