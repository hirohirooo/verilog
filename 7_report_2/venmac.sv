module venmac (a,b,c,can,coin,clk,rst);
    input a,b,clk,rst;
    output logic can;
    output logic [3:0] coin,c;

    always_ff @(posedge clk) begin
        if(rst) c <= 0;
        else begin
            c += a;
            c += 5*b;
        end
    end

    always_comb begin
        if(c < 5) begin
            coin = 0;
            can = 0;
        end
        else begin
            coin = c - 5;
            can = 1;
        end
    end

endmodule