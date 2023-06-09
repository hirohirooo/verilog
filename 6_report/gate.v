/* Generated by Yosys 0.29 (git sha1 9c5a60eb201, clang 14.0.3 -fPIC -Os) */

(* top =  1  *)
(* src = "venmac.sv:1.1-66.10" *)
module venmac(a, b, can, coin, clk, rst);
  wire _000_;
  wire _001_;
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
  (* src = "venmac.sv:2.11-2.12" *)
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  (* src = "venmac.sv:2.13-2.14" *)
  wire _048_;
  (* src = "venmac.sv:3.18-3.21" *)
  wire _049_;
  (* src = "venmac.sv:4.24-4.28" *)
  wire _050_;
  (* src = "venmac.sv:4.24-4.28" *)
  wire _051_;
  (* src = "venmac.sv:4.24-4.28" *)
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
  (* src = "venmac.sv:2.19-2.22" *)
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  (* src = "venmac.sv:2.11-2.12" *)
  input a;
  wire a;
  (* src = "venmac.sv:2.13-2.14" *)
  input b;
  wire b;
  (* src = "venmac.sv:3.18-3.21" *)
  output can;
  wire can;
  (* src = "venmac.sv:2.15-2.18" *)
  input clk;
  wire clk;
  (* src = "venmac.sv:4.24-4.28" *)
  output [3:0] coin;
  wire [3:0] coin;
  (* src = "venmac.sv:2.19-2.22" *)
  input rst;
  wire rst;
  (* onehot = 32'd1 *)
  (* unused_bits = "1 4 6 9" *)
  wire [9:0] state;
  INVX1 _083_ (
    .A(_048_),
    .Y(_053_)
  );
  INVX1 _084_ (
    .A(_041_),
    .Y(_054_)
  );
  INVX1 _085_ (
    .A(_079_),
    .Y(_055_)
  );
  INVX1 _086_ (
    .A(_076_),
    .Y(_056_)
  );
  INVX1 _087_ (
    .A(_080_),
    .Y(_057_)
  );
  INVX1 _088_ (
    .A(_077_),
    .Y(_058_)
  );
  INVX1 _089_ (
    .A(_082_),
    .Y(_059_)
  );
  INVX1 _090_ (
    .A(_078_),
    .Y(_060_)
  );
  NOR2X1 _091_ (
    .A(_048_),
    .B(_054_),
    .Y(_061_)
  );
  NOR3X1 _092_ (
    .A(_048_),
    .B(_054_),
    .C(_076_),
    .Y(_062_)
  );
  NAND2X1 _093_ (
    .A(_080_),
    .B(_062_),
    .Y(_063_)
  );
  NOR2X1 _094_ (
    .A(_053_),
    .B(_041_),
    .Y(_064_)
  );
  OAI21X1 _095_ (
    .A(_053_),
    .B(_041_),
    .C(_056_),
    .Y(_065_)
  );
  OR2X1 _096_ (
    .A(_061_),
    .B(_065_),
    .Y(_066_)
  );
  OAI21X1 _097_ (
    .A(_055_),
    .B(_066_),
    .C(_063_),
    .Y(_044_)
  );
  NAND2X1 _098_ (
    .A(_077_),
    .B(_062_),
    .Y(_067_)
  );
  OAI21X1 _099_ (
    .A(_057_),
    .B(_066_),
    .C(_067_),
    .Y(_045_)
  );
  NAND2X1 _100_ (
    .A(_079_),
    .B(_062_),
    .Y(_068_)
  );
  OAI21X1 _101_ (
    .A(_059_),
    .B(_066_),
    .C(_068_),
    .Y(_047_)
  );
  NAND2X1 _102_ (
    .A(_082_),
    .B(_062_),
    .Y(_069_)
  );
  OAI21X1 _103_ (
    .A(_060_),
    .B(_066_),
    .C(_069_),
    .Y(_043_)
  );
  NAND2X1 _104_ (
    .A(_081_),
    .B(_061_),
    .Y(_070_)
  );
  OAI21X1 _105_ (
    .A(_078_),
    .B(_081_),
    .C(_061_),
    .Y(_071_)
  );
  MUX2X1 _106_ (
    .A(_077_),
    .B(_081_),
    .S(_064_),
    .Y(_072_)
  );
  AOI21X1 _107_ (
    .A(_071_),
    .B(_072_),
    .C(_076_),
    .Y(_046_)
  );
  OAI21X1 _108_ (
    .A(_058_),
    .B(_066_),
    .C(_056_),
    .Y(_042_)
  );
  OAI21X1 _109_ (
    .A(_080_),
    .B(_082_),
    .C(_064_),
    .Y(_073_)
  );
  INVX1 _110_ (
    .A(_073_),
    .Y(_050_)
  );
  OAI21X1 _111_ (
    .A(_079_),
    .B(_082_),
    .C(_064_),
    .Y(_074_)
  );
  INVX1 _112_ (
    .A(_074_),
    .Y(_051_)
  );
  AND2X1 _113_ (
    .A(_078_),
    .B(_064_),
    .Y(_052_)
  );
  OAI21X1 _114_ (
    .A(_080_),
    .B(_078_),
    .C(_064_),
    .Y(_075_)
  );
  NAND3X1 _115_ (
    .A(_070_),
    .B(_074_),
    .C(_075_),
    .Y(_049_)
  );
  DFFPOSX1 _116_ (
    .CLK(clk),
    .D(_000_),
    .Q(state[0])
  );
  DFFPOSX1 _117_ (
    .CLK(clk),
    .D(_001_),
    .Q(state[2])
  );
  DFFPOSX1 _118_ (
    .CLK(clk),
    .D(_002_),
    .Q(state[3])
  );
  DFFPOSX1 _119_ (
    .CLK(clk),
    .D(_003_),
    .Q(state[5])
  );
  DFFPOSX1 _120_ (
    .CLK(clk),
    .D(_004_),
    .Q(state[7])
  );
  DFFPOSX1 _121_ (
    .CLK(clk),
    .D(_005_),
    .Q(state[8])
  );
  assign coin[3] = 1'h0;
  assign _048_ = b;
  assign _041_ = a;
  assign _079_ = state[3];
  assign _076_ = rst;
  assign _080_ = state[5];
  assign _002_ = _044_;
  assign _077_ = state[0];
  assign _003_ = _045_;
  assign _082_ = state[8];
  assign _005_ = _047_;
  assign _078_ = state[2];
  assign _001_ = _043_;
  assign _081_ = state[7];
  assign _004_ = _046_;
  assign _000_ = _042_;
  assign coin[0] = _050_;
  assign coin[1] = _051_;
  assign coin[2] = _052_;
  assign can = _049_;
endmodule
