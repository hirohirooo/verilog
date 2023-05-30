module venmac (a,b,can,coin,clk,rst);
    input a,b,clk,rst;
    output logic can;
    output logic [3:0] coin;

    logic [3:0] state,nstate;

    always_ff @(posedge clk) begin
        if(rst) state <= 4'b0000;
        else state <= nstate;
    end

    always_comb begin
        nstate = state;
        can = 0;
        coin = 0;
        case({a,b})
            2'b00: begin
            end
            2'b10: begin
                case(state)
                //synopsys full_case parallel_case
                    4'b0000: begin
                        nstate = 4'b0001;
                        coin = 4'b0000;
                    end
                    4'b0001: nstate = 4'b0010;
                    4'b0010: nstate = 4'b0011;
                    4'b0011: nstate = 4'b0100;
                    4'b0100: nstate = 4'b0101;
                    4'b0101: can = 1;
                endcase
            end
            2'b01: begin
                case(state)
                //synopsys full_case parallel_case
                    4'b0000: begin
                        can =0;
                        nstate=4'b0101;
                        coin = 4'b0000;
                    end
                    4'b0001: begin
                        can =1;
                        nstate=4'b0110;
                        coin = 4'b0001;
                    end
                    4'b0010: begin
                        can =1;
                        nstate=4'b0111;
                        coin = 4'b0010; 
                    end
                    4'b0011: begin
                        can =1;
                        nstate=4'b1000;
                        coin = 4'b0011; 
                    end            
                    4'b0100: begin
                        can =1;
                        nstate=4'b1001;
                        coin = 4'b0100; 
                    end 
                endcase
            end
        endcase
    end
endmodule