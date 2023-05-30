/* Generated by Yosys 0.29 (git sha1 9c5a60eb201, clang 14.0.3 -fPIC -Os) */

(* top =  1  *)
(* src = "fifo.sv:1.1-38.10" *)
module fifo(in, we, full, out, re, empty, clk, rst);
  (* src = "fifo.sv:13.2-28.5" *)
  wire [7:0] _000_;
  wire [7:0] _001_;
  (* src = "fifo.sv:23.7-23.19" *)
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  (* force_downto = 32'd1 *)
  (* src = "fifo.sv:24.13-24.21|/opt/homebrew/bin/../share/yosys/techmap.v:270.23-270.24" *)
  wire [2:0] _086_;
  (* force_downto = 32'd1 *)
  (* src = "fifo.sv:24.13-24.21|/opt/homebrew/bin/../share/yosys/techmap.v:270.26-270.27" *)
  wire [2:0] _087_;
  (* src = "fifo.sv:8.8-8.11" *)
  input clk;
  wire clk;
  (* src = "fifo.sv:7.15-7.20" *)
  output empty;
  wire empty;
  (* src = "fifo.sv:4.15-4.19" *)
  output full;
  wire full;
  (* src = "fifo.sv:10.14-10.18" *)
  reg [2:0] head;
  (* src = "fifo.sv:10.26-10.31" *)
  wire [2:0] headi;
  (* src = "fifo.sv:2.14-2.16" *)
  input [7:0] in;
  wire [7:0] in;
  reg [7:0] \mem[0] ;
  reg [7:0] \mem[1] ;
  reg [7:0] \mem[2] ;
  reg [7:0] \mem[3] ;
  reg [7:0] \mem[4] ;
  reg [7:0] \mem[5] ;
  reg [7:0] \mem[6] ;
  reg [7:0] \mem[7] ;
  (* src = "fifo.sv:5.15-5.18" *)
  output [7:0] out;
  reg [7:0] out;
  (* src = "fifo.sv:6.8-6.10" *)
  input re;
  wire re;
  (* src = "fifo.sv:8.13-8.16" *)
  input rst;
  wire rst;
  (* src = "fifo.sv:10.20-10.24" *)
  reg [2:0] tail;
  (* src = "fifo.sv:3.8-3.10" *)
  input we;
  wire we;
  assign _086_[0] = ~tail[0];
  assign _011_ = ~(head[0] ^ tail[0]);
  assign _012_ = head[1] ^ tail[1];
  assign _013_ = _011_ & ~(_012_);
  assign _014_ = head[2] ^ tail[2];
  assign empty = _013_ & ~(_014_);
  assign _015_ = head[0] ^ tail[0];
  assign _016_ = ~tail[1];
  assign _017_ = ~(head[1] ^ head[0]);
  assign _018_ = _017_ ^ _016_;
  assign _019_ = _015_ & ~(_018_);
  assign _020_ = ~tail[2];
  assign _021_ = head[1] & head[0];
  assign _022_ = ~(_021_ ^ head[2]);
  assign _023_ = _022_ ^ _020_;
  assign full = _019_ & ~(_023_);
  assign _000_[7] = we & ~(full);
  assign _002_ = re & ~(empty);
  assign _024_ = tail[0] ? \mem[1] [0] : \mem[0] [0];
  assign _025_ = tail[0] ? \mem[3] [0] : \mem[2] [0];
  assign _026_ = tail[1] ? _025_ : _024_;
  assign _027_ = tail[0] ? \mem[5] [0] : \mem[4] [0];
  assign _028_ = tail[0] ? \mem[7] [0] : \mem[6] [0];
  assign _029_ = tail[1] ? _028_ : _027_;
  assign _001_[0] = tail[2] ? _029_ : _026_;
  assign _030_ = tail[0] ? \mem[1] [1] : \mem[0] [1];
  assign _031_ = tail[0] ? \mem[3] [1] : \mem[2] [1];
  assign _032_ = tail[1] ? _031_ : _030_;
  assign _033_ = tail[0] ? \mem[5] [1] : \mem[4] [1];
  assign _034_ = tail[0] ? \mem[7] [1] : \mem[6] [1];
  assign _035_ = tail[1] ? _034_ : _033_;
  assign _001_[1] = tail[2] ? _035_ : _032_;
  assign _036_ = tail[0] ? \mem[1] [2] : \mem[0] [2];
  assign _037_ = tail[0] ? \mem[3] [2] : \mem[2] [2];
  assign _038_ = tail[1] ? _037_ : _036_;
  assign _039_ = tail[0] ? \mem[5] [2] : \mem[4] [2];
  assign _040_ = tail[0] ? \mem[7] [2] : \mem[6] [2];
  assign _041_ = tail[1] ? _040_ : _039_;
  assign _001_[2] = tail[2] ? _041_ : _038_;
  assign _042_ = tail[0] ? \mem[1] [3] : \mem[0] [3];
  assign _043_ = tail[0] ? \mem[3] [3] : \mem[2] [3];
  assign _044_ = tail[1] ? _043_ : _042_;
  assign _045_ = tail[0] ? \mem[5] [3] : \mem[4] [3];
  assign _046_ = tail[0] ? \mem[7] [3] : \mem[6] [3];
  assign _047_ = tail[1] ? _046_ : _045_;
  assign _001_[3] = tail[2] ? _047_ : _044_;
  assign _048_ = tail[0] ? \mem[1] [4] : \mem[0] [4];
  assign _049_ = tail[0] ? \mem[3] [4] : \mem[2] [4];
  assign _050_ = tail[1] ? _049_ : _048_;
  assign _051_ = tail[0] ? \mem[5] [4] : \mem[4] [4];
  assign _052_ = tail[0] ? \mem[7] [4] : \mem[6] [4];
  assign _053_ = tail[1] ? _052_ : _051_;
  assign _001_[4] = tail[2] ? _053_ : _050_;
  assign _054_ = tail[0] ? \mem[1] [5] : \mem[0] [5];
  assign _055_ = tail[0] ? \mem[3] [5] : \mem[2] [5];
  assign _056_ = tail[1] ? _055_ : _054_;
  assign _057_ = tail[0] ? \mem[5] [5] : \mem[4] [5];
  assign _058_ = tail[0] ? \mem[7] [5] : \mem[6] [5];
  assign _059_ = tail[1] ? _058_ : _057_;
  assign _001_[5] = tail[2] ? _059_ : _056_;
  assign _060_ = tail[0] ? \mem[1] [6] : \mem[0] [6];
  assign _061_ = tail[0] ? \mem[3] [6] : \mem[2] [6];
  assign _062_ = tail[1] ? _061_ : _060_;
  assign _063_ = tail[0] ? \mem[5] [6] : \mem[4] [6];
  assign _064_ = tail[0] ? \mem[7] [6] : \mem[6] [6];
  assign _065_ = tail[1] ? _064_ : _063_;
  assign _001_[6] = tail[2] ? _065_ : _062_;
  assign _066_ = tail[0] ? \mem[1] [7] : \mem[0] [7];
  assign _067_ = tail[0] ? \mem[3] [7] : \mem[2] [7];
  assign _068_ = tail[1] ? _067_ : _066_;
  assign _069_ = tail[0] ? \mem[5] [7] : \mem[4] [7];
  assign _070_ = tail[0] ? \mem[7] [7] : \mem[6] [7];
  assign _071_ = tail[1] ? _070_ : _069_;
  assign _001_[7] = tail[2] ? _071_ : _068_;
  assign headi[0] = ~head[0];
  assign _072_ = head[2] | head[1];
  assign _073_ = head[0] & ~(_072_);
  assign _074_ = _000_[7] & ~(rst);
  assign _004_ = _074_ & _073_;
  assign headi[1] = ~_017_;
  assign headi[2] = ~_022_;
  assign _075_ = _072_ | head[0];
  assign _003_ = _074_ & ~(_075_);
  assign _076_ = head[2] | ~(head[1]);
  assign _077_ = _076_ | head[0];
  assign _005_ = _074_ & ~(_077_);
  assign _078_ = _076_ | headi[0];
  assign _006_ = _074_ & ~(_078_);
  assign _079_ = head[1] | ~(head[2]);
  assign _080_ = _079_ | head[0];
  assign _007_ = _074_ & ~(_080_);
  assign _081_ = _079_ | headi[0];
  assign _008_ = _074_ & ~(_081_);
  assign _082_ = ~(head[2] & head[1]);
  assign _083_ = _082_ | head[0];
  assign _009_ = _074_ & ~(_083_);
  assign _084_ = _082_ | headi[0];
  assign _010_ = _074_ & ~(_084_);
  assign _087_[1] = tail[1] ^ tail[0];
  assign _085_ = tail[1] & tail[0];
  assign _087_[2] = _085_ ^ tail[2];
  always @(posedge clk)
    if (_004_) \mem[1] [0] <= in[0];
  always @(posedge clk)
    if (_004_) \mem[1] [1] <= in[1];
  always @(posedge clk)
    if (_004_) \mem[1] [2] <= in[2];
  always @(posedge clk)
    if (_004_) \mem[1] [3] <= in[3];
  always @(posedge clk)
    if (_004_) \mem[1] [4] <= in[4];
  always @(posedge clk)
    if (_004_) \mem[1] [5] <= in[5];
  always @(posedge clk)
    if (_004_) \mem[1] [6] <= in[6];
  always @(posedge clk)
    if (_004_) \mem[1] [7] <= in[7];
  always @(posedge clk)
    if (_003_) \mem[0] [0] <= in[0];
  always @(posedge clk)
    if (_003_) \mem[0] [1] <= in[1];
  always @(posedge clk)
    if (_003_) \mem[0] [2] <= in[2];
  always @(posedge clk)
    if (_003_) \mem[0] [3] <= in[3];
  always @(posedge clk)
    if (_003_) \mem[0] [4] <= in[4];
  always @(posedge clk)
    if (_003_) \mem[0] [5] <= in[5];
  always @(posedge clk)
    if (_003_) \mem[0] [6] <= in[6];
  always @(posedge clk)
    if (_003_) \mem[0] [7] <= in[7];
  always @(posedge clk)
    if (_007_) \mem[4] [0] <= in[0];
  always @(posedge clk)
    if (_007_) \mem[4] [1] <= in[1];
  always @(posedge clk)
    if (_007_) \mem[4] [2] <= in[2];
  always @(posedge clk)
    if (_007_) \mem[4] [3] <= in[3];
  always @(posedge clk)
    if (_007_) \mem[4] [4] <= in[4];
  always @(posedge clk)
    if (_007_) \mem[4] [5] <= in[5];
  always @(posedge clk)
    if (_007_) \mem[4] [6] <= in[6];
  always @(posedge clk)
    if (_007_) \mem[4] [7] <= in[7];
  always @(posedge clk)
    if (_006_) \mem[3] [0] <= in[0];
  always @(posedge clk)
    if (_006_) \mem[3] [1] <= in[1];
  always @(posedge clk)
    if (_006_) \mem[3] [2] <= in[2];
  always @(posedge clk)
    if (_006_) \mem[3] [3] <= in[3];
  always @(posedge clk)
    if (_006_) \mem[3] [4] <= in[4];
  always @(posedge clk)
    if (_006_) \mem[3] [5] <= in[5];
  always @(posedge clk)
    if (_006_) \mem[3] [6] <= in[6];
  always @(posedge clk)
    if (_006_) \mem[3] [7] <= in[7];
  always @(posedge clk)
    if (_005_) \mem[2] [0] <= in[0];
  always @(posedge clk)
    if (_005_) \mem[2] [1] <= in[1];
  always @(posedge clk)
    if (_005_) \mem[2] [2] <= in[2];
  always @(posedge clk)
    if (_005_) \mem[2] [3] <= in[3];
  always @(posedge clk)
    if (_005_) \mem[2] [4] <= in[4];
  always @(posedge clk)
    if (_005_) \mem[2] [5] <= in[5];
  always @(posedge clk)
    if (_005_) \mem[2] [6] <= in[6];
  always @(posedge clk)
    if (_005_) \mem[2] [7] <= in[7];
  always @(posedge clk)
    if (rst) out[0] <= 1'h0;
    else if (_002_) out[0] <= _001_[0];
  always @(posedge clk)
    if (rst) out[1] <= 1'h0;
    else if (_002_) out[1] <= _001_[1];
  always @(posedge clk)
    if (rst) out[2] <= 1'h0;
    else if (_002_) out[2] <= _001_[2];
  always @(posedge clk)
    if (rst) out[3] <= 1'h0;
    else if (_002_) out[3] <= _001_[3];
  always @(posedge clk)
    if (rst) out[4] <= 1'h0;
    else if (_002_) out[4] <= _001_[4];
  always @(posedge clk)
    if (rst) out[5] <= 1'h0;
    else if (_002_) out[5] <= _001_[5];
  always @(posedge clk)
    if (rst) out[6] <= 1'h0;
    else if (_002_) out[6] <= _001_[6];
  always @(posedge clk)
    if (rst) out[7] <= 1'h0;
    else if (_002_) out[7] <= _001_[7];
  always @(posedge clk)
    if (_008_) \mem[5] [0] <= in[0];
  always @(posedge clk)
    if (_008_) \mem[5] [1] <= in[1];
  always @(posedge clk)
    if (_008_) \mem[5] [2] <= in[2];
  always @(posedge clk)
    if (_008_) \mem[5] [3] <= in[3];
  always @(posedge clk)
    if (_008_) \mem[5] [4] <= in[4];
  always @(posedge clk)
    if (_008_) \mem[5] [5] <= in[5];
  always @(posedge clk)
    if (_008_) \mem[5] [6] <= in[6];
  always @(posedge clk)
    if (_008_) \mem[5] [7] <= in[7];
  always @(posedge clk)
    if (_009_) \mem[6] [0] <= in[0];
  always @(posedge clk)
    if (_009_) \mem[6] [1] <= in[1];
  always @(posedge clk)
    if (_009_) \mem[6] [2] <= in[2];
  always @(posedge clk)
    if (_009_) \mem[6] [3] <= in[3];
  always @(posedge clk)
    if (_009_) \mem[6] [4] <= in[4];
  always @(posedge clk)
    if (_009_) \mem[6] [5] <= in[5];
  always @(posedge clk)
    if (_009_) \mem[6] [6] <= in[6];
  always @(posedge clk)
    if (_009_) \mem[6] [7] <= in[7];
  (* \always_ff  = 32'd1 *)
  (* src = "fifo.sv:13.2-28.5" *)
  always @(posedge clk)
    if (rst) head[0] <= 1'h0;
    else if (_000_[7]) head[0] <= headi[0];
  (* \always_ff  = 32'd1 *)
  (* src = "fifo.sv:13.2-28.5" *)
  always @(posedge clk)
    if (rst) head[1] <= 1'h0;
    else if (_000_[7]) head[1] <= headi[1];
  (* \always_ff  = 32'd1 *)
  (* src = "fifo.sv:13.2-28.5" *)
  always @(posedge clk)
    if (rst) head[2] <= 1'h0;
    else if (_000_[7]) head[2] <= headi[2];
  (* \always_ff  = 32'd1 *)
  (* src = "fifo.sv:13.2-28.5" *)
  always @(posedge clk)
    if (rst) tail[0] <= 1'h0;
    else if (_002_) tail[0] <= _086_[0];
  (* \always_ff  = 32'd1 *)
  (* src = "fifo.sv:13.2-28.5" *)
  always @(posedge clk)
    if (rst) tail[1] <= 1'h0;
    else if (_002_) tail[1] <= _087_[1];
  (* \always_ff  = 32'd1 *)
  (* src = "fifo.sv:13.2-28.5" *)
  always @(posedge clk)
    if (rst) tail[2] <= 1'h0;
    else if (_002_) tail[2] <= _087_[2];
  always @(posedge clk)
    if (_010_) \mem[7] [0] <= in[0];
  always @(posedge clk)
    if (_010_) \mem[7] [1] <= in[1];
  always @(posedge clk)
    if (_010_) \mem[7] [2] <= in[2];
  always @(posedge clk)
    if (_010_) \mem[7] [3] <= in[3];
  always @(posedge clk)
    if (_010_) \mem[7] [4] <= in[4];
  always @(posedge clk)
    if (_010_) \mem[7] [5] <= in[5];
  always @(posedge clk)
    if (_010_) \mem[7] [6] <= in[6];
  always @(posedge clk)
    if (_010_) \mem[7] [7] <= in[7];
  assign _000_[6:0] = { _000_[7], _000_[7], _000_[7], _000_[7], _000_[7], _000_[7], _000_[7] };
  assign _086_[2:1] = tail[2:1];
  assign _087_[0] = _086_[0];
endmodule