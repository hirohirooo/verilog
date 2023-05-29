module ex(
    input a, 
    output logic b, 
    input clk, 
    input rst
    );
    logic [1:0] s,ns;
    always @(posedge clk) begin
        if(rst) begin
            s <= 0;
        end else begin
            s <= ns;
        end
    end
    always @* begin
        b = 0;
        ns = s;
        case(s)
            2'b00:begin
                b = 1;
                ns = 2'b01;
            end
            2'b01:begin
                b = 0;
                if(a) ns = 2'b00;
                else ns = 2'b11;
            end
            2'b11:begin
                if(a) b = 1;
                else b = 0;
                ns = 2'b00;
            end
        endcase
    end
endmodule

