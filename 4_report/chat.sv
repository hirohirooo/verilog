module chat(input in,clk,rst,output logic out);
    logic [3:0] count;
    logic val; 

    always_ff @(negedge clk) begin
        if(rst) val <= 1;
        else begin
            if(!in) val <= 1;
            else val <= val;
        end
    end

    always_ff @(negedge clk) begin
        if(rst) count <= 4'b1111;
        else if(val) begin
            if(count != 0) count <= count - 1;            
            else count <= count;
        end
    end

    always_comb begin
        if(count==0 || count ==4'b1111) out = in; //counterが始動する前or終了した後はinをそのまま出力
        else out = 0; //counterが動いている間は0を出力
    end

endmodule
