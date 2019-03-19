// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Tue Mar 19 17:22:04 2019
// Host        : daniel-XPS-15-9570 running 64-bit Ubuntu 18.04.2 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/daniel/Desktop/FPGAx/FPGA/assets/projects/Controller_v2/Project.sim/sim_1/impl/timing/xsim/Controller_TB_time_impl.v
// Design      : CONTROLLER
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "d7e9e8e1" *) 
(* NotValidForBitStream *)
module CONTROLLER
   (clk,
    sck,
    ss,
    mosi,
    miso,
    CE_pwm,
    pwm1,
    pwm2,
    led);
  input clk;
  input sck;
  input ss;
  input mosi;
  output miso;
  output CE_pwm;
  output [1:0]pwm1;
  output [1:0]pwm2;
  output [15:0]led;

  wire CE_pwm;
  wire SPI_n_1;
  wire SPI_n_2;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire control_answer;
  wire [15:0]data_controller_o;
  wire direction;
  wire [15:0]led;
  wire [15:0]led_OBUF;
  wire miso;
  wire miso_OBUF;
  wire mosi;
  wire mosi_IBUF;
  wire [1:0]p_0_in;
  wire [3:2]p_0_in__0;
  wire [7:0]p_1_in;
  wire [1:0]pwm1;
  wire [1:0]pwm1_OBUF;
  wire [1:0]pwm2;
  wire [1:0]pwm2_OBUF;
  wire ready;
  wire ready0;
  wire sck;
  wire sck_IBUF;
  wire \shift_reg_n_0_[0] ;
  wire \shift_reg_n_0_[1] ;
  wire \shift_reg_n_0_[2] ;
  wire \shift_reg_n_0_[3] ;
  wire ss;
  wire ss_IBUF;
  wire [1:0]state;
  wire \state[1]_i_1_n_0 ;
  wire w_control_answer_i_1_n_0;
  wire \w_data_too_spitop[0]_i_1_n_0 ;
  wire \w_data_too_spitop[10]_i_1_n_0 ;
  wire \w_data_too_spitop[11]_i_1_n_0 ;
  wire \w_data_too_spitop[11]_i_2_n_0 ;
  wire \w_data_too_spitop[11]_i_3_n_0 ;
  wire \w_data_too_spitop[12]_i_1_n_0 ;
  wire \w_data_too_spitop[13]_i_1_n_0 ;
  wire \w_data_too_spitop[14]_i_1_n_0 ;
  wire \w_data_too_spitop[15]_i_1_n_0 ;
  wire \w_data_too_spitop[1]_i_1_n_0 ;
  wire \w_data_too_spitop[2]_i_1_n_0 ;
  wire \w_data_too_spitop[3]_i_1_n_0 ;
  wire \w_data_too_spitop[4]_i_1_n_0 ;
  wire \w_data_too_spitop[5]_i_1_n_0 ;
  wire \w_data_too_spitop[6]_i_1_n_0 ;
  wire \w_data_too_spitop[7]_i_1_n_0 ;
  wire \w_data_too_spitop[8]_i_1_n_0 ;
  wire \w_data_too_spitop[9]_i_1_n_0 ;
  wire \w_data_too_spitop_reg[0]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[10]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[11]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[12]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[13]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[14]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[15]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[1]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[2]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[3]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[4]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[5]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[6]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[7]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[8]_lopt_replica_1 ;
  wire \w_data_too_spitop_reg[9]_lopt_replica_1 ;
  wire w_ready_pwm1_i_1_n_0;
  wire w_ready_pwm1_i_2_n_0;
  wire w_ready_pwm1_reg_n_0;
  wire w_ready_pwm2_i_1_n_0;
  wire \w_set_pwm1[7]_i_1_n_0 ;
  wire \w_set_pwm1_reg_n_0_[0] ;
  wire \w_set_pwm1_reg_n_0_[1] ;
  wire \w_set_pwm1_reg_n_0_[2] ;
  wire \w_set_pwm1_reg_n_0_[3] ;
  wire \w_set_pwm1_reg_n_0_[4] ;
  wire \w_set_pwm1_reg_n_0_[5] ;
  wire \w_set_pwm1_reg_n_0_[6] ;
  wire [7:0]w_set_pwm2;
  wire \w_set_pwm2[7]_i_1_n_0 ;

initial begin
 $sdf_annotate("Controller_TB_time_impl.sdf",,,,"tool_control");
end
  OBUF CE_pwm_OBUF_inst
       (.I(1'b1),
        .O(CE_pwm));
  PWM PWM_1
       (.Q({direction,\w_set_pwm1_reg_n_0_[6] ,\w_set_pwm1_reg_n_0_[5] ,\w_set_pwm1_reg_n_0_[4] ,\w_set_pwm1_reg_n_0_[3] ,\w_set_pwm1_reg_n_0_[2] ,\w_set_pwm1_reg_n_0_[1] ,\w_set_pwm1_reg_n_0_[0] }),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\i_shift_reg[6]_0 (w_ready_pwm1_reg_n_0),
        .pwm1_OBUF(pwm1_OBUF));
  PWM_0 PWM_2
       (.CLK(ready),
        .Q(w_set_pwm2),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .pwm2_OBUF(pwm2_OBUF));
  SPI_topmodule SPI
       (.D(SPI_n_1),
        .E(SPI_n_2),
        .Q(state),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .control_answer(control_answer),
        .\data_controller_o_reg[15]_0 (data_controller_o),
        .led_OBUF(led_OBUF),
        .miso_OBUF(miso_OBUF),
        .sck_IBUF(sck_IBUF),
        .\shift_reg[1] (mosi_IBUF),
        .ss_IBUF(ss_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[0]_inst 
       (.I(\w_data_too_spitop_reg[0]_lopt_replica_1 ),
        .O(led[0]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[10]_inst 
       (.I(\w_data_too_spitop_reg[10]_lopt_replica_1 ),
        .O(led[10]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[11]_inst 
       (.I(\w_data_too_spitop_reg[11]_lopt_replica_1 ),
        .O(led[11]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[12]_inst 
       (.I(\w_data_too_spitop_reg[12]_lopt_replica_1 ),
        .O(led[12]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[13]_inst 
       (.I(\w_data_too_spitop_reg[13]_lopt_replica_1 ),
        .O(led[13]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[14]_inst 
       (.I(\w_data_too_spitop_reg[14]_lopt_replica_1 ),
        .O(led[14]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[15]_inst 
       (.I(\w_data_too_spitop_reg[15]_lopt_replica_1 ),
        .O(led[15]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[1]_inst 
       (.I(\w_data_too_spitop_reg[1]_lopt_replica_1 ),
        .O(led[1]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[2]_inst 
       (.I(\w_data_too_spitop_reg[2]_lopt_replica_1 ),
        .O(led[2]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[3]_inst 
       (.I(\w_data_too_spitop_reg[3]_lopt_replica_1 ),
        .O(led[3]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[4]_inst 
       (.I(\w_data_too_spitop_reg[4]_lopt_replica_1 ),
        .O(led[4]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[5]_inst 
       (.I(\w_data_too_spitop_reg[5]_lopt_replica_1 ),
        .O(led[5]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[6]_inst 
       (.I(\w_data_too_spitop_reg[6]_lopt_replica_1 ),
        .O(led[6]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[7]_inst 
       (.I(\w_data_too_spitop_reg[7]_lopt_replica_1 ),
        .O(led[7]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[8]_inst 
       (.I(\w_data_too_spitop_reg[8]_lopt_replica_1 ),
        .O(led[8]));
  (* OPT_MODIFIED = "SWEEP " *) 
  OBUF \led_OBUF[9]_inst 
       (.I(\w_data_too_spitop_reg[9]_lopt_replica_1 ),
        .O(led[9]));
  OBUF miso_OBUF_inst
       (.I(miso_OBUF),
        .O(miso));
  IBUF mosi_IBUF_inst
       (.I(mosi),
        .O(mosi_IBUF));
  OBUF \pwm1_OBUF[0]_inst 
       (.I(pwm1_OBUF[0]),
        .O(pwm1[0]));
  OBUF \pwm1_OBUF[1]_inst 
       (.I(pwm1_OBUF[1]),
        .O(pwm1[1]));
  OBUF \pwm2_OBUF[0]_inst 
       (.I(pwm2_OBUF[0]),
        .O(pwm2[0]));
  OBUF \pwm2_OBUF[1]_inst 
       (.I(pwm2_OBUF[1]),
        .O(pwm2[1]));
  IBUF sck_IBUF_inst
       (.I(sck),
        .O(sck_IBUF));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[0]),
        .Q(\shift_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[10]),
        .Q(p_1_in[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[11]),
        .Q(p_1_in[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[12]),
        .Q(p_0_in[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[13]),
        .Q(p_0_in[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[14]),
        .Q(p_0_in__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[15]),
        .Q(p_0_in__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[1]),
        .Q(\shift_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[2]),
        .Q(\shift_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[3]),
        .Q(\shift_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[4]),
        .Q(p_1_in[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[5]),
        .Q(p_1_in[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[6]),
        .Q(p_1_in[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[7]),
        .Q(p_1_in[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[8]),
        .Q(p_1_in[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(SPI_n_2),
        .D(data_controller_o[9]),
        .Q(p_1_in[5]),
        .R(1'b0));
  IBUF ss_IBUF_inst
       (.I(ss),
        .O(ss_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \state[1]_i_1 
       (.I0(state[0]),
        .I1(state[1]),
        .O(\state[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(SPI_n_1),
        .Q(state[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\state[1]_i_1_n_0 ),
        .Q(state[1]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    w_control_answer_i_1
       (.I0(control_answer),
        .I1(state[0]),
        .I2(state[1]),
        .O(w_control_answer_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    w_control_answer_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(w_control_answer_i_1_n_0),
        .Q(control_answer),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h02)) 
    \w_data_too_spitop[0]_i_1 
       (.I0(\shift_reg_n_0_[0] ),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(\w_data_too_spitop[0]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \w_data_too_spitop[10]_i_1 
       (.I0(p_1_in[6]),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(\w_data_too_spitop[10]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0E00)) 
    \w_data_too_spitop[11]_i_1 
       (.I0(p_0_in__0[2]),
        .I1(p_0_in__0[3]),
        .I2(state[0]),
        .I3(state[1]),
        .O(\w_data_too_spitop[11]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    \w_data_too_spitop[11]_i_2 
       (.I0(state[1]),
        .I1(state[0]),
        .O(\w_data_too_spitop[11]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \w_data_too_spitop[11]_i_3 
       (.I0(p_1_in[7]),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(\w_data_too_spitop[11]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \w_data_too_spitop[12]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .O(\w_data_too_spitop[12]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \w_data_too_spitop[13]_i_1 
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .O(\w_data_too_spitop[13]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \w_data_too_spitop[14]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_0_in__0[2]),
        .O(\w_data_too_spitop[14]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \w_data_too_spitop[15]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_0_in__0[3]),
        .O(\w_data_too_spitop[15]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \w_data_too_spitop[1]_i_1 
       (.I0(\shift_reg_n_0_[1] ),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(\w_data_too_spitop[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \w_data_too_spitop[2]_i_1 
       (.I0(\shift_reg_n_0_[2] ),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(\w_data_too_spitop[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \w_data_too_spitop[3]_i_1 
       (.I0(\shift_reg_n_0_[3] ),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(\w_data_too_spitop[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \w_data_too_spitop[4]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_1_in[0]),
        .O(\w_data_too_spitop[4]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \w_data_too_spitop[5]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_1_in[1]),
        .O(\w_data_too_spitop[5]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \w_data_too_spitop[6]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_1_in[2]),
        .O(\w_data_too_spitop[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \w_data_too_spitop[7]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_1_in[3]),
        .O(\w_data_too_spitop[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \w_data_too_spitop[8]_i_1 
       (.I0(p_1_in[4]),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(\w_data_too_spitop[8]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h02)) 
    \w_data_too_spitop[9]_i_1 
       (.I0(p_1_in[5]),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(\w_data_too_spitop[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[0]_i_1_n_0 ),
        .Q(led_OBUF[0]),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[0]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[0]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[0]_lopt_replica_1 ),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[10]_i_1_n_0 ),
        .Q(led_OBUF[10]),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[10]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[10]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[10]_lopt_replica_1 ),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[11]_i_3_n_0 ),
        .Q(led_OBUF[11]),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[11]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[11]_i_3_n_0 ),
        .Q(\w_data_too_spitop_reg[11]_lopt_replica_1 ),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[12]_i_1_n_0 ),
        .Q(led_OBUF[12]),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[12]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[12]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[12]_lopt_replica_1 ),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[13]_i_1_n_0 ),
        .Q(led_OBUF[13]),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[13]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[13]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[13]_lopt_replica_1 ),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[14]_i_1_n_0 ),
        .Q(led_OBUF[14]),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[14]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[14]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[14]_lopt_replica_1 ),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[15]_i_1_n_0 ),
        .Q(led_OBUF[15]),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[15]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[15]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[15]_lopt_replica_1 ),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[1]_i_1_n_0 ),
        .Q(led_OBUF[1]),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[1]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[1]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[1]_lopt_replica_1 ),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[2]_i_1_n_0 ),
        .Q(led_OBUF[2]),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[2]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[2]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[2]_lopt_replica_1 ),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[3]_i_1_n_0 ),
        .Q(led_OBUF[3]),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[3]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[3]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[3]_lopt_replica_1 ),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[4]_i_1_n_0 ),
        .Q(led_OBUF[4]),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[4]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[4]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[4]_lopt_replica_1 ),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[5]_i_1_n_0 ),
        .Q(led_OBUF[5]),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[5]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[5]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[5]_lopt_replica_1 ),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[6]_i_1_n_0 ),
        .Q(led_OBUF[6]),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[6]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[6]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[6]_lopt_replica_1 ),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[7]_i_1_n_0 ),
        .Q(led_OBUF[7]),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDSE #(
    .INIT(1'b1)) 
    \w_data_too_spitop_reg[7]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[7]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[7]_lopt_replica_1 ),
        .S(\w_data_too_spitop[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[8]_i_1_n_0 ),
        .Q(led_OBUF[8]),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[8]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[8]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[8]_lopt_replica_1 ),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[9]_i_1_n_0 ),
        .Q(led_OBUF[9]),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  (* OPT_INSERTED_REPDRIVER *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  FDRE #(
    .INIT(1'b0)) 
    \w_data_too_spitop_reg[9]_lopt_replica 
       (.C(clk_IBUF_BUFG),
        .CE(\w_data_too_spitop[11]_i_2_n_0 ),
        .D(\w_data_too_spitop[9]_i_1_n_0 ),
        .Q(\w_data_too_spitop_reg[9]_lopt_replica_1 ),
        .R(\w_data_too_spitop[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h74)) 
    w_ready_pwm1_i_1
       (.I0(state[1]),
        .I1(w_ready_pwm1_i_2_n_0),
        .I2(w_ready_pwm1_reg_n_0),
        .O(w_ready_pwm1_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000408)) 
    w_ready_pwm1_i_2
       (.I0(state[0]),
        .I1(p_0_in[0]),
        .I2(p_0_in__0[2]),
        .I3(state[1]),
        .I4(p_0_in__0[3]),
        .I5(p_0_in[1]),
        .O(w_ready_pwm1_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    w_ready_pwm1_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(w_ready_pwm1_i_1_n_0),
        .Q(w_ready_pwm1_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h74)) 
    w_ready_pwm2_i_1
       (.I0(state[1]),
        .I1(ready0),
        .I2(ready),
        .O(w_ready_pwm2_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000408)) 
    w_ready_pwm2_i_2
       (.I0(state[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in__0[2]),
        .I3(state[1]),
        .I4(p_0_in__0[3]),
        .I5(p_0_in[0]),
        .O(ready0));
  FDRE #(
    .INIT(1'b0)) 
    w_ready_pwm2_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(w_ready_pwm2_i_1_n_0),
        .Q(ready),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \w_set_pwm1[7]_i_1 
       (.I0(p_0_in[1]),
        .I1(p_0_in[0]),
        .I2(p_0_in__0[2]),
        .I3(p_0_in__0[3]),
        .I4(state[0]),
        .I5(state[1]),
        .O(\w_set_pwm1[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm1_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm1[7]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(\w_set_pwm1_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm1_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm1[7]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(\w_set_pwm1_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm1_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm1[7]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(\w_set_pwm1_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm1_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm1[7]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(\w_set_pwm1_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm1_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm1[7]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(\w_set_pwm1_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm1_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm1[7]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(\w_set_pwm1_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm1_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm1[7]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(\w_set_pwm1_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm1_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm1[7]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(direction),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000000040000)) 
    \w_set_pwm2[7]_i_1 
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(p_0_in__0[2]),
        .I3(p_0_in__0[3]),
        .I4(state[0]),
        .I5(state[1]),
        .O(\w_set_pwm2[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm2_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm2[7]_i_1_n_0 ),
        .D(p_1_in[0]),
        .Q(w_set_pwm2[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm2_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm2[7]_i_1_n_0 ),
        .D(p_1_in[1]),
        .Q(w_set_pwm2[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm2_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm2[7]_i_1_n_0 ),
        .D(p_1_in[2]),
        .Q(w_set_pwm2[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm2_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm2[7]_i_1_n_0 ),
        .D(p_1_in[3]),
        .Q(w_set_pwm2[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm2_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm2[7]_i_1_n_0 ),
        .D(p_1_in[4]),
        .Q(w_set_pwm2[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm2_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm2[7]_i_1_n_0 ),
        .D(p_1_in[5]),
        .Q(w_set_pwm2[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm2_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm2[7]_i_1_n_0 ),
        .D(p_1_in[6]),
        .Q(w_set_pwm2[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_set_pwm2_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_set_pwm2[7]_i_1_n_0 ),
        .D(p_1_in[7]),
        .Q(w_set_pwm2[7]),
        .R(1'b0));
endmodule

module PWM
   (pwm1_OBUF,
    \i_shift_reg[6]_0 ,
    clk_IBUF_BUFG,
    Q);
  output [1:0]pwm1_OBUF;
  input \i_shift_reg[6]_0 ;
  input clk_IBUF_BUFG;
  input [7:0]Q;

  wire [7:0]Q;
  wire clk_IBUF_BUFG;
  wire dir_state0;
  wire dir_state_i_2_n_0;
  wire dir_state_i_3_n_0;
  wire dir_state_i_4_n_0;
  wire i__carry_i_1_n_0;
  wire i__carry_i_2_n_0;
  wire i__carry_i_3_n_0;
  wire i__carry_i_4_n_0;
  wire i__carry_i_5_n_0;
  wire i__carry_i_6_n_0;
  wire i__carry_i_7_n_0;
  wire i__carry_i_8_n_0;
  wire [6:1]i_pwm_counter;
  wire \i_pwm_counter[0]_i_1_n_0 ;
  wire \i_pwm_counter[4]_i_2_n_0 ;
  wire \i_pwm_counter[4]_i_3_n_0 ;
  wire \i_pwm_counter[4]_i_4_n_0 ;
  wire \i_pwm_counter[4]_i_5_n_0 ;
  wire \i_pwm_counter[4]_i_6_n_0 ;
  wire \i_pwm_counter[6]_i_2_n_0 ;
  wire \i_pwm_counter[6]_i_3_n_0 ;
  wire \i_pwm_counter_reg[4]_i_1_n_0 ;
  wire [6:0]i_pwm_counter_reg__0;
  wire [6:0]i_shift;
  wire \i_shift_reg[6]_0 ;
  wire [1:1]in;
  wire ja31_in;
  wire motor_state;
  wire motor_state_i_1_n_0;
  wire [1:0]pwm1_OBUF;
  wire \pwm1_OBUF[1]_inst_i_2_n_0 ;
  wire \pwm1_OBUF[1]_inst_i_3_n_0 ;
  wire temporal;
  wire [2:0]\NLW_i_pwm_counter_reg[4]_i_1_CO_UNCONNECTED ;
  wire [3:0]\NLW_i_pwm_counter_reg[6]_i_1_CO_UNCONNECTED ;
  wire [3:2]\NLW_i_pwm_counter_reg[6]_i_1_O_UNCONNECTED ;
  wire [2:0]\NLW_ja3_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [3:0]\NLW_ja3_inferred__0/i__carry_O_UNCONNECTED ;

  motor_stateFreq_1 UT
       (.CLK(temporal),
        .clk_IBUF_BUFG(clk_IBUF_BUFG));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF11F111)) 
    dir_state_i_1
       (.I0(i_pwm_counter_reg__0[0]),
        .I1(dir_state_i_2_n_0),
        .I2(i_pwm_counter_reg__0[4]),
        .I3(in),
        .I4(dir_state_i_3_n_0),
        .I5(dir_state_i_4_n_0),
        .O(dir_state0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    dir_state_i_2
       (.I0(i_pwm_counter_reg__0[5]),
        .I1(i_pwm_counter_reg__0[6]),
        .I2(i_pwm_counter_reg__0[1]),
        .I3(i_pwm_counter_reg__0[4]),
        .I4(i_pwm_counter_reg__0[3]),
        .I5(i_pwm_counter_reg__0[2]),
        .O(dir_state_i_2_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    dir_state_i_3
       (.I0(i_pwm_counter_reg__0[5]),
        .I1(i_pwm_counter_reg__0[6]),
        .O(dir_state_i_3_n_0));
  LUT5 #(
    .INIT(32'hF0F0F0B0)) 
    dir_state_i_4
       (.I0(i_pwm_counter_reg__0[1]),
        .I1(i_pwm_counter_reg__0[0]),
        .I2(in),
        .I3(i_pwm_counter_reg__0[2]),
        .I4(i_pwm_counter_reg__0[3]),
        .O(dir_state_i_4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dir_state_reg
       (.C(temporal),
        .CE(1'b1),
        .D(dir_state0),
        .Q(in),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_1
       (.I0(i_shift[6]),
        .I1(i_pwm_counter_reg__0[6]),
        .O(i__carry_i_1_n_0));
  LUT4 #(
    .INIT(16'h7510)) 
    i__carry_i_2
       (.I0(i_pwm_counter_reg__0[5]),
        .I1(i_pwm_counter_reg__0[4]),
        .I2(i_shift[4]),
        .I3(i_shift[5]),
        .O(i__carry_i_2_n_0));
  LUT4 #(
    .INIT(16'h2B0A)) 
    i__carry_i_3
       (.I0(i_shift[3]),
        .I1(i_pwm_counter_reg__0[2]),
        .I2(i_pwm_counter_reg__0[3]),
        .I3(i_shift[2]),
        .O(i__carry_i_3_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry_i_4
       (.I0(i_shift[1]),
        .I1(i_pwm_counter_reg__0[1]),
        .I2(i_shift[0]),
        .I3(i_pwm_counter_reg__0[0]),
        .O(i__carry_i_4_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_5
       (.I0(i_pwm_counter_reg__0[6]),
        .I1(i_shift[6]),
        .O(i__carry_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6
       (.I0(i_shift[5]),
        .I1(i_pwm_counter_reg__0[5]),
        .I2(i_shift[4]),
        .I3(i_pwm_counter_reg__0[4]),
        .O(i__carry_i_6_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7
       (.I0(i_pwm_counter_reg__0[3]),
        .I1(i_shift[3]),
        .I2(i_pwm_counter_reg__0[2]),
        .I3(i_shift[2]),
        .O(i__carry_i_7_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8
       (.I0(i_shift[1]),
        .I1(i_pwm_counter_reg__0[1]),
        .I2(i_shift[0]),
        .I3(i_pwm_counter_reg__0[0]),
        .O(i__carry_i_8_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \i_pwm_counter[0]_i_1 
       (.I0(i_pwm_counter_reg__0[0]),
        .O(\i_pwm_counter[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \i_pwm_counter[4]_i_2 
       (.I0(i_pwm_counter_reg__0[1]),
        .O(\i_pwm_counter[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \i_pwm_counter[4]_i_3 
       (.I0(i_pwm_counter_reg__0[3]),
        .I1(i_pwm_counter_reg__0[4]),
        .O(\i_pwm_counter[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \i_pwm_counter[4]_i_4 
       (.I0(i_pwm_counter_reg__0[2]),
        .I1(i_pwm_counter_reg__0[3]),
        .O(\i_pwm_counter[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \i_pwm_counter[4]_i_5 
       (.I0(i_pwm_counter_reg__0[1]),
        .I1(i_pwm_counter_reg__0[2]),
        .O(\i_pwm_counter[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_pwm_counter[4]_i_6 
       (.I0(i_pwm_counter_reg__0[1]),
        .I1(in),
        .O(\i_pwm_counter[4]_i_6_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \i_pwm_counter[6]_i_2 
       (.I0(i_pwm_counter_reg__0[6]),
        .I1(i_pwm_counter_reg__0[5]),
        .O(\i_pwm_counter[6]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \i_pwm_counter[6]_i_3 
       (.I0(i_pwm_counter_reg__0[4]),
        .I1(i_pwm_counter_reg__0[5]),
        .O(\i_pwm_counter[6]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[0] 
       (.C(temporal),
        .CE(1'b1),
        .D(\i_pwm_counter[0]_i_1_n_0 ),
        .Q(i_pwm_counter_reg__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[1] 
       (.C(temporal),
        .CE(1'b1),
        .D(i_pwm_counter[1]),
        .Q(i_pwm_counter_reg__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[2] 
       (.C(temporal),
        .CE(1'b1),
        .D(i_pwm_counter[2]),
        .Q(i_pwm_counter_reg__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[3] 
       (.C(temporal),
        .CE(1'b1),
        .D(i_pwm_counter[3]),
        .Q(i_pwm_counter_reg__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[4] 
       (.C(temporal),
        .CE(1'b1),
        .D(i_pwm_counter[4]),
        .Q(i_pwm_counter_reg__0[4]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \i_pwm_counter_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\i_pwm_counter_reg[4]_i_1_n_0 ,\NLW_i_pwm_counter_reg[4]_i_1_CO_UNCONNECTED [2:0]}),
        .CYINIT(i_pwm_counter_reg__0[0]),
        .DI({i_pwm_counter_reg__0[3:1],\i_pwm_counter[4]_i_2_n_0 }),
        .O(i_pwm_counter[4:1]),
        .S({\i_pwm_counter[4]_i_3_n_0 ,\i_pwm_counter[4]_i_4_n_0 ,\i_pwm_counter[4]_i_5_n_0 ,\i_pwm_counter[4]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[5] 
       (.C(temporal),
        .CE(1'b1),
        .D(i_pwm_counter[5]),
        .Q(i_pwm_counter_reg__0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[6] 
       (.C(temporal),
        .CE(1'b1),
        .D(i_pwm_counter[6]),
        .Q(i_pwm_counter_reg__0[6]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \i_pwm_counter_reg[6]_i_1 
       (.CI(\i_pwm_counter_reg[4]_i_1_n_0 ),
        .CO(\NLW_i_pwm_counter_reg[6]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,i_pwm_counter_reg__0[4]}),
        .O({\NLW_i_pwm_counter_reg[6]_i_1_O_UNCONNECTED [3:2],i_pwm_counter[6:5]}),
        .S({1'b0,1'b0,\i_pwm_counter[6]_i_2_n_0 ,\i_pwm_counter[6]_i_3_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[0] 
       (.C(\i_shift_reg[6]_0 ),
        .CE(1'b1),
        .D(Q[0]),
        .Q(i_shift[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[1] 
       (.C(\i_shift_reg[6]_0 ),
        .CE(1'b1),
        .D(Q[1]),
        .Q(i_shift[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[2] 
       (.C(\i_shift_reg[6]_0 ),
        .CE(1'b1),
        .D(Q[2]),
        .Q(i_shift[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[3] 
       (.C(\i_shift_reg[6]_0 ),
        .CE(1'b1),
        .D(Q[3]),
        .Q(i_shift[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[4] 
       (.C(\i_shift_reg[6]_0 ),
        .CE(1'b1),
        .D(Q[4]),
        .Q(i_shift[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[5] 
       (.C(\i_shift_reg[6]_0 ),
        .CE(1'b1),
        .D(Q[5]),
        .Q(i_shift[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[6] 
       (.C(\i_shift_reg[6]_0 ),
        .CE(1'b1),
        .D(Q[6]),
        .Q(i_shift[6]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \ja3_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({ja31_in,\NLW_ja3_inferred__0/i__carry_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({i__carry_i_1_n_0,i__carry_i_2_n_0,i__carry_i_3_n_0,i__carry_i_4_n_0}),
        .O(\NLW_ja3_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5_n_0,i__carry_i_6_n_0,i__carry_i_7_n_0,i__carry_i_8_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    motor_state_i_1
       (.I0(Q[7]),
        .O(motor_state_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    motor_state_reg
       (.C(\i_shift_reg[6]_0 ),
        .CE(1'b1),
        .D(motor_state_i_1_n_0),
        .Q(motor_state),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hF4)) 
    \pwm1_OBUF[0]_inst_i_1 
       (.I0(ja31_in),
        .I1(\pwm1_OBUF[1]_inst_i_2_n_0 ),
        .I2(motor_state),
        .O(pwm1_OBUF[0]));
  LUT3 #(
    .INIT(8'h4F)) 
    \pwm1_OBUF[1]_inst_i_1 
       (.I0(ja31_in),
        .I1(\pwm1_OBUF[1]_inst_i_2_n_0 ),
        .I2(motor_state),
        .O(pwm1_OBUF[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFBFFFFFFF)) 
    \pwm1_OBUF[1]_inst_i_2 
       (.I0(\pwm1_OBUF[1]_inst_i_3_n_0 ),
        .I1(i_shift[6]),
        .I2(i_shift[1]),
        .I3(i_shift[3]),
        .I4(i_shift[2]),
        .I5(dir_state_i_2_n_0),
        .O(\pwm1_OBUF[1]_inst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \pwm1_OBUF[1]_inst_i_3 
       (.I0(i_shift[5]),
        .I1(i_shift[4]),
        .I2(i_pwm_counter_reg__0[0]),
        .I3(i_shift[0]),
        .O(\pwm1_OBUF[1]_inst_i_3_n_0 ));
endmodule

(* ORIG_REF_NAME = "PWM" *) 
module PWM_0
   (pwm2_OBUF,
    CLK,
    clk_IBUF_BUFG,
    Q);
  output [1:0]pwm2_OBUF;
  input CLK;
  input clk_IBUF_BUFG;
  input [7:0]Q;

  wire CLK;
  wire [7:0]Q;
  wire UT_n_0;
  wire clk_IBUF_BUFG;
  wire dir_state_i_1__0_n_0;
  wire dir_state_i_2__0_n_0;
  wire dir_state_i_3__0_n_0;
  wire dir_state_i_4__0_n_0;
  wire dir_state_reg_n_0;
  wire i__carry_i_1__0_n_0;
  wire i__carry_i_2__0_n_0;
  wire i__carry_i_3__0_n_0;
  wire i__carry_i_4__0_n_0;
  wire i__carry_i_5__0_n_0;
  wire i__carry_i_6__0_n_0;
  wire i__carry_i_7__0_n_0;
  wire i__carry_i_8__0_n_0;
  wire \i_pwm_counter[0]_i_1__0_n_0 ;
  wire \i_pwm_counter[4]_i_2__0_n_0 ;
  wire \i_pwm_counter[4]_i_3__0_n_0 ;
  wire \i_pwm_counter[4]_i_4__0_n_0 ;
  wire \i_pwm_counter[4]_i_5__0_n_0 ;
  wire \i_pwm_counter[4]_i_6__0_n_0 ;
  wire \i_pwm_counter[6]_i_2__0_n_0 ;
  wire \i_pwm_counter[6]_i_3__0_n_0 ;
  wire [6:1]i_pwm_counter__0;
  wire \i_pwm_counter_reg[4]_i_1__0_n_0 ;
  wire [6:0]i_pwm_counter_reg__0;
  wire [6:0]i_shift;
  wire ja31_in;
  wire motor_state;
  wire motor_state_i_1__0_n_0;
  wire [1:0]pwm2_OBUF;
  wire \pwm2_OBUF[1]_inst_i_2_n_0 ;
  wire \pwm2_OBUF[1]_inst_i_3_n_0 ;
  wire [2:0]\NLW_i_pwm_counter_reg[4]_i_1__0_CO_UNCONNECTED ;
  wire [3:0]\NLW_i_pwm_counter_reg[6]_i_1__0_CO_UNCONNECTED ;
  wire [3:2]\NLW_i_pwm_counter_reg[6]_i_1__0_O_UNCONNECTED ;
  wire [2:0]\NLW_ja3_inferred__0/i__carry_CO_UNCONNECTED ;
  wire [3:0]\NLW_ja3_inferred__0/i__carry_O_UNCONNECTED ;

  motor_stateFreq UT
       (.I42(UT_n_0),
        .clk_IBUF_BUFG(clk_IBUF_BUFG));
  LUT6 #(
    .INIT(64'hFFFFFFFFFF11F111)) 
    dir_state_i_1__0
       (.I0(i_pwm_counter_reg__0[0]),
        .I1(dir_state_i_2__0_n_0),
        .I2(i_pwm_counter_reg__0[4]),
        .I3(dir_state_reg_n_0),
        .I4(dir_state_i_3__0_n_0),
        .I5(dir_state_i_4__0_n_0),
        .O(dir_state_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    dir_state_i_2__0
       (.I0(i_pwm_counter_reg__0[5]),
        .I1(i_pwm_counter_reg__0[6]),
        .I2(i_pwm_counter_reg__0[1]),
        .I3(i_pwm_counter_reg__0[4]),
        .I4(i_pwm_counter_reg__0[3]),
        .I5(i_pwm_counter_reg__0[2]),
        .O(dir_state_i_2__0_n_0));
  LUT2 #(
    .INIT(4'hE)) 
    dir_state_i_3__0
       (.I0(i_pwm_counter_reg__0[5]),
        .I1(i_pwm_counter_reg__0[6]),
        .O(dir_state_i_3__0_n_0));
  LUT5 #(
    .INIT(32'hF0F0F0B0)) 
    dir_state_i_4__0
       (.I0(i_pwm_counter_reg__0[1]),
        .I1(i_pwm_counter_reg__0[0]),
        .I2(dir_state_reg_n_0),
        .I3(i_pwm_counter_reg__0[2]),
        .I4(i_pwm_counter_reg__0[3]),
        .O(dir_state_i_4__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dir_state_reg
       (.C(UT_n_0),
        .CE(1'b1),
        .D(dir_state_i_1__0_n_0),
        .Q(dir_state_reg_n_0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    i__carry_i_1__0
       (.I0(i_shift[6]),
        .I1(i_pwm_counter_reg__0[6]),
        .O(i__carry_i_1__0_n_0));
  LUT4 #(
    .INIT(16'h7510)) 
    i__carry_i_2__0
       (.I0(i_pwm_counter_reg__0[5]),
        .I1(i_pwm_counter_reg__0[4]),
        .I2(i_shift[4]),
        .I3(i_shift[5]),
        .O(i__carry_i_2__0_n_0));
  LUT4 #(
    .INIT(16'h2B0A)) 
    i__carry_i_3__0
       (.I0(i_shift[3]),
        .I1(i_pwm_counter_reg__0[2]),
        .I2(i_pwm_counter_reg__0[3]),
        .I3(i_shift[2]),
        .O(i__carry_i_3__0_n_0));
  LUT4 #(
    .INIT(16'h22B2)) 
    i__carry_i_4__0
       (.I0(i_shift[1]),
        .I1(i_pwm_counter_reg__0[1]),
        .I2(i_shift[0]),
        .I3(i_pwm_counter_reg__0[0]),
        .O(i__carry_i_4__0_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    i__carry_i_5__0
       (.I0(i_pwm_counter_reg__0[6]),
        .I1(i_shift[6]),
        .O(i__carry_i_5__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_6__0
       (.I0(i_shift[5]),
        .I1(i_pwm_counter_reg__0[5]),
        .I2(i_shift[4]),
        .I3(i_pwm_counter_reg__0[4]),
        .O(i__carry_i_6__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_7__0
       (.I0(i_pwm_counter_reg__0[3]),
        .I1(i_shift[3]),
        .I2(i_pwm_counter_reg__0[2]),
        .I3(i_shift[2]),
        .O(i__carry_i_7__0_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    i__carry_i_8__0
       (.I0(i_shift[1]),
        .I1(i_pwm_counter_reg__0[1]),
        .I2(i_shift[0]),
        .I3(i_pwm_counter_reg__0[0]),
        .O(i__carry_i_8__0_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    \i_pwm_counter[0]_i_1__0 
       (.I0(i_pwm_counter_reg__0[0]),
        .O(\i_pwm_counter[0]_i_1__0_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \i_pwm_counter[4]_i_2__0 
       (.I0(i_pwm_counter_reg__0[1]),
        .O(\i_pwm_counter[4]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \i_pwm_counter[4]_i_3__0 
       (.I0(i_pwm_counter_reg__0[3]),
        .I1(i_pwm_counter_reg__0[4]),
        .O(\i_pwm_counter[4]_i_3__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \i_pwm_counter[4]_i_4__0 
       (.I0(i_pwm_counter_reg__0[2]),
        .I1(i_pwm_counter_reg__0[3]),
        .O(\i_pwm_counter[4]_i_4__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \i_pwm_counter[4]_i_5__0 
       (.I0(i_pwm_counter_reg__0[1]),
        .I1(i_pwm_counter_reg__0[2]),
        .O(\i_pwm_counter[4]_i_5__0_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \i_pwm_counter[4]_i_6__0 
       (.I0(i_pwm_counter_reg__0[1]),
        .I1(dir_state_reg_n_0),
        .O(\i_pwm_counter[4]_i_6__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \i_pwm_counter[6]_i_2__0 
       (.I0(i_pwm_counter_reg__0[6]),
        .I1(i_pwm_counter_reg__0[5]),
        .O(\i_pwm_counter[6]_i_2__0_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \i_pwm_counter[6]_i_3__0 
       (.I0(i_pwm_counter_reg__0[4]),
        .I1(i_pwm_counter_reg__0[5]),
        .O(\i_pwm_counter[6]_i_3__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[0] 
       (.C(UT_n_0),
        .CE(1'b1),
        .D(\i_pwm_counter[0]_i_1__0_n_0 ),
        .Q(i_pwm_counter_reg__0[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[1] 
       (.C(UT_n_0),
        .CE(1'b1),
        .D(i_pwm_counter__0[1]),
        .Q(i_pwm_counter_reg__0[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[2] 
       (.C(UT_n_0),
        .CE(1'b1),
        .D(i_pwm_counter__0[2]),
        .Q(i_pwm_counter_reg__0[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[3] 
       (.C(UT_n_0),
        .CE(1'b1),
        .D(i_pwm_counter__0[3]),
        .Q(i_pwm_counter_reg__0[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[4] 
       (.C(UT_n_0),
        .CE(1'b1),
        .D(i_pwm_counter__0[4]),
        .Q(i_pwm_counter_reg__0[4]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \i_pwm_counter_reg[4]_i_1__0 
       (.CI(1'b0),
        .CO({\i_pwm_counter_reg[4]_i_1__0_n_0 ,\NLW_i_pwm_counter_reg[4]_i_1__0_CO_UNCONNECTED [2:0]}),
        .CYINIT(i_pwm_counter_reg__0[0]),
        .DI({i_pwm_counter_reg__0[3:1],\i_pwm_counter[4]_i_2__0_n_0 }),
        .O(i_pwm_counter__0[4:1]),
        .S({\i_pwm_counter[4]_i_3__0_n_0 ,\i_pwm_counter[4]_i_4__0_n_0 ,\i_pwm_counter[4]_i_5__0_n_0 ,\i_pwm_counter[4]_i_6__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[5] 
       (.C(UT_n_0),
        .CE(1'b1),
        .D(i_pwm_counter__0[5]),
        .Q(i_pwm_counter_reg__0[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_pwm_counter_reg[6] 
       (.C(UT_n_0),
        .CE(1'b1),
        .D(i_pwm_counter__0[6]),
        .Q(i_pwm_counter_reg__0[6]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \i_pwm_counter_reg[6]_i_1__0 
       (.CI(\i_pwm_counter_reg[4]_i_1__0_n_0 ),
        .CO(\NLW_i_pwm_counter_reg[6]_i_1__0_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,i_pwm_counter_reg__0[4]}),
        .O({\NLW_i_pwm_counter_reg[6]_i_1__0_O_UNCONNECTED [3:2],i_pwm_counter__0[6:5]}),
        .S({1'b0,1'b0,\i_pwm_counter[6]_i_2__0_n_0 ,\i_pwm_counter[6]_i_3__0_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[0]),
        .Q(i_shift[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[1]),
        .Q(i_shift[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[2]),
        .Q(i_shift[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[3]),
        .Q(i_shift[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[4]),
        .Q(i_shift[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[5]),
        .Q(i_shift[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \i_shift_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(Q[6]),
        .Q(i_shift[6]),
        .R(1'b0));
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-8 {cell *THIS*}}" *) 
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 \ja3_inferred__0/i__carry 
       (.CI(1'b0),
        .CO({ja31_in,\NLW_ja3_inferred__0/i__carry_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({i__carry_i_1__0_n_0,i__carry_i_2__0_n_0,i__carry_i_3__0_n_0,i__carry_i_4__0_n_0}),
        .O(\NLW_ja3_inferred__0/i__carry_O_UNCONNECTED [3:0]),
        .S({i__carry_i_5__0_n_0,i__carry_i_6__0_n_0,i__carry_i_7__0_n_0,i__carry_i_8__0_n_0}));
  LUT1 #(
    .INIT(2'h1)) 
    motor_state_i_1__0
       (.I0(Q[7]),
        .O(motor_state_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    motor_state_reg
       (.C(CLK),
        .CE(1'b1),
        .D(motor_state_i_1__0_n_0),
        .Q(motor_state),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hF4)) 
    \pwm2_OBUF[0]_inst_i_1 
       (.I0(ja31_in),
        .I1(\pwm2_OBUF[1]_inst_i_2_n_0 ),
        .I2(motor_state),
        .O(pwm2_OBUF[0]));
  LUT3 #(
    .INIT(8'h4F)) 
    \pwm2_OBUF[1]_inst_i_1 
       (.I0(ja31_in),
        .I1(\pwm2_OBUF[1]_inst_i_2_n_0 ),
        .I2(motor_state),
        .O(pwm2_OBUF[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFBFFFFFFF)) 
    \pwm2_OBUF[1]_inst_i_2 
       (.I0(\pwm2_OBUF[1]_inst_i_3_n_0 ),
        .I1(i_shift[6]),
        .I2(i_shift[1]),
        .I3(i_shift[3]),
        .I4(i_shift[2]),
        .I5(dir_state_i_2__0_n_0),
        .O(\pwm2_OBUF[1]_inst_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h7FFF)) 
    \pwm2_OBUF[1]_inst_i_3 
       (.I0(i_shift[5]),
        .I1(i_shift[4]),
        .I2(i_pwm_counter_reg__0[0]),
        .I3(i_shift[0]),
        .O(\pwm2_OBUF[1]_inst_i_3_n_0 ));
endmodule

module SPI_slave_reci
   (shiftss,
    shiftsck,
    D,
    \w_data_too_spitop_reg[15] ,
    shiftss_0,
    clk_IBUF_BUFG,
    shiftsck_1,
    Q,
    \state_reg[0] ,
    control_answer,
    \index_reg[0]_0 ,
    state_spi,
    E,
    led_OBUF,
    \FSM_sequential_state_reci_reg[1]_0 ,
    \shift_reg[1]_0 );
  output [1:0]shiftss;
  output [0:0]shiftsck;
  output [2:0]D;
  output [15:0]\w_data_too_spitop_reg[15] ;
  input [0:0]shiftss_0;
  input clk_IBUF_BUFG;
  input [1:0]shiftsck_1;
  input [2:0]Q;
  input \state_reg[0] ;
  input control_answer;
  input \index_reg[0]_0 ;
  input state_spi;
  input [0:0]E;
  input [15:0]led_OBUF;
  input \FSM_sequential_state_reci_reg[1]_0 ;
  input [0:0]\shift_reg[1]_0 ;

  wire [2:0]D;
  wire [0:0]E;
  wire \FSM_sequential_state_reci[0]_i_1_n_0 ;
  wire \FSM_sequential_state_reci[1]_i_1_n_0 ;
  wire \FSM_sequential_state_reci[1]_i_3_n_0 ;
  wire \FSM_sequential_state_reci_reg[1]_0 ;
  wire [2:0]Q;
  wire clk_IBUF_BUFG;
  wire control_answer;
  wire [15:0]data;
  wire \data[15]_i_1_n_0 ;
  wire \index[0]_i_1_n_0 ;
  wire \index[1]_i_1_n_0 ;
  wire \index[2]_i_1__0_n_0 ;
  wire \index[3]_i_1_n_0 ;
  wire \index[3]_i_2__0_n_0 ;
  wire \index_reg[0]_0 ;
  wire \index_reg_n_0_[0] ;
  wire \index_reg_n_0_[1] ;
  wire \index_reg_n_0_[2] ;
  wire \index_reg_n_0_[3] ;
  wire [15:0]led_OBUF;
  wire [15:1]p_0_in__1;
  wire [15:1]shift;
  wire \shift[10]_i_1_n_0 ;
  wire \shift[11]_i_1_n_0 ;
  wire \shift[15]_i_2_n_0 ;
  wire \shift[8]_i_1_n_0 ;
  wire \shift[9]_i_1_n_0 ;
  wire [0:0]\shift_reg[1]_0 ;
  wire [0:0]shiftsck;
  wire [1:0]shiftsck_1;
  wire [1:0]shiftss;
  wire [0:0]shiftss_0;
  wire \state[1]_i_3_n_0 ;
  wire [1:0]state_reci;
  wire \state_reg[0] ;
  wire state_spi;
  wire state_spi_0;
  wire state_spi_i_1_n_0;
  wire [15:0]\w_data_too_spitop_reg[15] ;

  LUT6 #(
    .INIT(64'h00000000FFFED555)) 
    \FSM_sequential_state_reci[0]_i_1 
       (.I0(state_reci[1]),
        .I1(shiftsck_1[1]),
        .I2(shiftsck),
        .I3(shiftsck_1[0]),
        .I4(state_reci[0]),
        .I5(state_spi_0),
        .O(\FSM_sequential_state_reci[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000FF8A)) 
    \FSM_sequential_state_reci[1]_i_1 
       (.I0(state_reci[0]),
        .I1(state_reci[1]),
        .I2(\FSM_sequential_state_reci_reg[1]_0 ),
        .I3(\FSM_sequential_state_reci[1]_i_3_n_0 ),
        .I4(state_spi_0),
        .O(\FSM_sequential_state_reci[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000002AAAAAAAA)) 
    \FSM_sequential_state_reci[1]_i_3 
       (.I0(state_reci[1]),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .I5(\index_reg[0]_0 ),
        .O(\FSM_sequential_state_reci[1]_i_3_n_0 ));
  (* FSM_ENCODED_STATES = "start:00,done:11,waiting:01,changesignal:10" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reci_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state_reci[0]_i_1_n_0 ),
        .Q(state_reci[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "start:00,done:11,waiting:01,changesignal:10" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reci_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state_reci[1]_i_1_n_0 ),
        .Q(state_reci[1]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000001)) 
    \data[15]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\data[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(\shift_reg[1]_0 ),
        .Q(data[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[10]),
        .Q(data[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[11]),
        .Q(data[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[12]),
        .Q(data[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[13]),
        .Q(data[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[14]),
        .Q(data[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[15]),
        .Q(data[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[1]),
        .Q(data[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[2]),
        .Q(data[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[3]),
        .Q(data[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[4]),
        .Q(data[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[5]),
        .Q(data[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[6]),
        .Q(data[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[7]),
        .Q(data[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[8]),
        .Q(data[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\data[15]_i_1_n_0 ),
        .D(shift[9]),
        .Q(data[9]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \index[0]_i_1 
       (.I0(state_reci[1]),
        .I1(\index_reg_n_0_[0] ),
        .O(\index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'hD7)) 
    \index[1]_i_1 
       (.I0(state_reci[1]),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .O(\index[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'hE1FF)) 
    \index[2]_i_1__0 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(state_reci[1]),
        .O(\index[2]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'h01)) 
    \index[3]_i_1 
       (.I0(\FSM_sequential_state_reci[1]_i_3_n_0 ),
        .I1(state_reci[0]),
        .I2(state_spi_0),
        .O(\index[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hFE01FFFF)) 
    \index[3]_i_2__0 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[2] ),
        .I3(\index_reg_n_0_[3] ),
        .I4(state_reci[1]),
        .O(\index[3]_i_2__0_n_0 ));
  FDRE #(
    .INIT(1'b1)) 
    \index_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[3]_i_1_n_0 ),
        .D(\index[0]_i_1_n_0 ),
        .Q(\index_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \index_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[3]_i_1_n_0 ),
        .D(\index[1]_i_1_n_0 ),
        .Q(\index_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \index_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[3]_i_1_n_0 ),
        .D(\index[2]_i_1__0_n_0 ),
        .Q(\index_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \index_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[3]_i_1_n_0 ),
        .D(\index[3]_i_2__0_n_0 ),
        .Q(\index_reg_n_0_[3] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00040000)) 
    \shift[10]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\shift[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00400000)) 
    \shift[11]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\shift[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00001000)) 
    \shift[12]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\shift[15]_i_2_n_0 ),
        .O(p_0_in__1[12]));
  LUT5 #(
    .INIT(32'h00004000)) 
    \shift[13]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\shift[15]_i_2_n_0 ),
        .O(p_0_in__1[13]));
  LUT5 #(
    .INIT(32'h00004000)) 
    \shift[14]_i_1 
       (.I0(\index_reg_n_0_[0] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\shift[15]_i_2_n_0 ),
        .O(p_0_in__1[14]));
  LUT5 #(
    .INIT(32'h00008000)) 
    \shift[15]_i_1 
       (.I0(\index_reg_n_0_[1] ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\shift[15]_i_2_n_0 ),
        .O(p_0_in__1[15]));
  LUT6 #(
    .INIT(64'hFDFFFFFFFFFFFFFF)) 
    \shift[15]_i_2 
       (.I0(state_reci[1]),
        .I1(state_spi_0),
        .I2(state_reci[0]),
        .I3(shiftsck_1[0]),
        .I4(shiftsck),
        .I5(shiftsck_1[1]),
        .O(\shift[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000004)) 
    \shift[1]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(p_0_in__1[1]));
  LUT5 #(
    .INIT(32'h00000004)) 
    \shift[2]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(p_0_in__1[2]));
  LUT5 #(
    .INIT(32'h00000040)) 
    \shift[3]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(p_0_in__1[3]));
  LUT5 #(
    .INIT(32'h00000100)) 
    \shift[4]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(p_0_in__1[4]));
  LUT5 #(
    .INIT(32'h00000400)) 
    \shift[5]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(p_0_in__1[5]));
  LUT5 #(
    .INIT(32'h00000400)) 
    \shift[6]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(p_0_in__1[6]));
  LUT5 #(
    .INIT(32'h00004000)) 
    \shift[7]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(p_0_in__1[7]));
  LUT5 #(
    .INIT(32'h00010000)) 
    \shift[8]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\shift[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    \shift[9]_i_1 
       (.I0(\shift[15]_i_2_n_0 ),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\shift[9]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[10]_i_1_n_0 ),
        .D(\shift_reg[1]_0 ),
        .Q(shift[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[11]_i_1_n_0 ),
        .D(\shift_reg[1]_0 ),
        .Q(shift[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[12]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[13]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[14]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[15]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[1]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[2]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[3]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[4]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[5]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[6]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(p_0_in__1[7]),
        .D(\shift_reg[1]_0 ),
        .Q(shift[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[8]_i_1_n_0 ),
        .D(\shift_reg[1]_0 ),
        .Q(shift[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[9]_i_1_n_0 ),
        .D(\shift_reg[1]_0 ),
        .Q(shift[9]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftsck_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shiftsck_1[0]),
        .Q(shiftsck),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \shiftss_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shiftss_0),
        .Q(shiftss[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \shiftss_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shiftss[0]),
        .Q(shiftss[1]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h000000000000EEE2)) 
    \state[0]_i_1 
       (.I0(\state[1]_i_3_n_0 ),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(control_answer),
        .I4(\state_reg[0] ),
        .I5(Q[2]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h1414141414141404)) 
    \state[1]_i_1__0 
       (.I0(Q[2]),
        .I1(\state_reg[0] ),
        .I2(Q[1]),
        .I3(\state[1]_i_3_n_0 ),
        .I4(control_answer),
        .I5(Q[0]),
        .O(D[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \state[1]_i_3 
       (.I0(state_spi_0),
        .I1(state_spi),
        .O(\state[1]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h8F80)) 
    \state[2]_i_1 
       (.I0(state_spi_0),
        .I1(state_spi),
        .I2(Q[2]),
        .I3(E),
        .O(D[2]));
  LUT4 #(
    .INIT(16'hEAA8)) 
    state_spi_i_1
       (.I0(state_spi_0),
        .I1(shiftss[1]),
        .I2(shiftss_0),
        .I3(shiftss[0]),
        .O(state_spi_i_1_n_0));
  FDRE #(
    .INIT(1'b1)) 
    state_spi_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(state_spi_i_1_n_0),
        .Q(state_spi_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[0]_i_1 
       (.I0(led_OBUF[0]),
        .I1(Q[1]),
        .I2(data[0]),
        .O(\w_data_too_spitop_reg[15] [0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[10]_i_1 
       (.I0(led_OBUF[10]),
        .I1(Q[1]),
        .I2(data[10]),
        .O(\w_data_too_spitop_reg[15] [10]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[11]_i_1 
       (.I0(led_OBUF[11]),
        .I1(Q[1]),
        .I2(data[11]),
        .O(\w_data_too_spitop_reg[15] [11]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[12]_i_1 
       (.I0(led_OBUF[12]),
        .I1(Q[1]),
        .I2(data[12]),
        .O(\w_data_too_spitop_reg[15] [12]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[13]_i_1 
       (.I0(led_OBUF[13]),
        .I1(Q[1]),
        .I2(data[13]),
        .O(\w_data_too_spitop_reg[15] [13]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[14]_i_1 
       (.I0(led_OBUF[14]),
        .I1(Q[1]),
        .I2(data[14]),
        .O(\w_data_too_spitop_reg[15] [14]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[15]_i_2 
       (.I0(led_OBUF[15]),
        .I1(Q[1]),
        .I2(data[15]),
        .O(\w_data_too_spitop_reg[15] [15]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[1]_i_1 
       (.I0(led_OBUF[1]),
        .I1(Q[1]),
        .I2(data[1]),
        .O(\w_data_too_spitop_reg[15] [1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[2]_i_1 
       (.I0(led_OBUF[2]),
        .I1(Q[1]),
        .I2(data[2]),
        .O(\w_data_too_spitop_reg[15] [2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[3]_i_1 
       (.I0(led_OBUF[3]),
        .I1(Q[1]),
        .I2(data[3]),
        .O(\w_data_too_spitop_reg[15] [3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[4]_i_1 
       (.I0(led_OBUF[4]),
        .I1(Q[1]),
        .I2(data[4]),
        .O(\w_data_too_spitop_reg[15] [4]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[5]_i_1 
       (.I0(led_OBUF[5]),
        .I1(Q[1]),
        .I2(data[5]),
        .O(\w_data_too_spitop_reg[15] [5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[6]_i_1 
       (.I0(led_OBUF[6]),
        .I1(Q[1]),
        .I2(data[6]),
        .O(\w_data_too_spitop_reg[15] [6]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[7]_i_1 
       (.I0(led_OBUF[7]),
        .I1(Q[1]),
        .I2(data[7]),
        .O(\w_data_too_spitop_reg[15] [7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[8]_i_1 
       (.I0(led_OBUF[8]),
        .I1(Q[1]),
        .I2(data[8]),
        .O(\w_data_too_spitop_reg[15] [8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \w_shift[9]_i_1 
       (.I0(led_OBUF[9]),
        .I1(Q[1]),
        .I2(data[9]),
        .O(\w_data_too_spitop_reg[15] [9]));
endmodule

module SPI_slave_trns
   (miso_OBUF,
    state_spi,
    shiftsck,
    shiftss,
    \shiftsck_reg[2]_0 ,
    \shiftsck_reg[2]_1 ,
    clk_IBUF_BUFG,
    sck_IBUF,
    ss_IBUF,
    shiftsck_0,
    shiftss_1,
    Q);
  output miso_OBUF;
  output state_spi;
  output [1:0]shiftsck;
  output [0:0]shiftss;
  output \shiftsck_reg[2]_0 ;
  output \shiftsck_reg[2]_1 ;
  input clk_IBUF_BUFG;
  input sck_IBUF;
  input ss_IBUF;
  input [0:0]shiftsck_0;
  input [1:0]shiftss_1;
  input [15:0]Q;

  wire \FSM_sequential_state_trns[0]_i_1_n_0 ;
  wire \FSM_sequential_state_trns[1]_i_1_n_0 ;
  wire \FSM_sequential_state_trns[1]_i_2_n_0 ;
  wire [15:0]Q;
  wire clk_IBUF_BUFG;
  wire \index[0]_i_1__0_n_0 ;
  wire \index[1]_i_1__0_n_0 ;
  wire \index[2]_i_1_n_0 ;
  wire \index[3]_i_1__0_n_0 ;
  wire \index[3]_i_2_n_0 ;
  wire \index[3]_i_3_n_0 ;
  wire \index_reg_n_0_[0] ;
  wire \index_reg_n_0_[1] ;
  wire \index_reg_n_0_[2] ;
  wire \index_reg_n_0_[3] ;
  wire miso_OBUF;
  wire miso_i_1_n_0;
  wire miso_i_2_n_0;
  wire miso_i_5_n_0;
  wire miso_i_6_n_0;
  wire miso_i_7_n_0;
  wire miso_i_8_n_0;
  wire miso_reg_i_3_n_0;
  wire miso_reg_i_4_n_0;
  wire sck_IBUF;
  wire \shift[15]_i_1__0_n_0 ;
  wire \shift_reg_n_0_[0] ;
  wire \shift_reg_n_0_[10] ;
  wire \shift_reg_n_0_[11] ;
  wire \shift_reg_n_0_[12] ;
  wire \shift_reg_n_0_[13] ;
  wire \shift_reg_n_0_[14] ;
  wire \shift_reg_n_0_[15] ;
  wire \shift_reg_n_0_[1] ;
  wire \shift_reg_n_0_[2] ;
  wire \shift_reg_n_0_[3] ;
  wire \shift_reg_n_0_[4] ;
  wire \shift_reg_n_0_[5] ;
  wire \shift_reg_n_0_[6] ;
  wire \shift_reg_n_0_[7] ;
  wire \shift_reg_n_0_[8] ;
  wire \shift_reg_n_0_[9] ;
  wire [1:0]shiftsck;
  wire [0:0]shiftsck_0;
  wire \shiftsck_reg[2]_0 ;
  wire \shiftsck_reg[2]_1 ;
  wire [0:0]shiftss;
  wire [1:0]shiftss_1;
  wire ss_IBUF;
  wire state_spi;
  wire state_spi_i_1__0_n_0;
  wire [1:0]state_trns__0;

  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_sequential_state_reci[1]_i_2 
       (.I0(shiftsck[1]),
        .I1(shiftsck_0),
        .I2(shiftsck[0]),
        .O(\shiftsck_reg[2]_0 ));
  LUT3 #(
    .INIT(8'h80)) 
    \FSM_sequential_state_reci[1]_i_4 
       (.I0(shiftsck[1]),
        .I1(shiftsck_0),
        .I2(shiftsck[0]),
        .O(\shiftsck_reg[2]_1 ));
  LUT6 #(
    .INIT(64'h00000000FF017FFF)) 
    \FSM_sequential_state_trns[0]_i_1 
       (.I0(shiftsck[0]),
        .I1(shiftsck_0),
        .I2(shiftsck[1]),
        .I3(state_trns__0[0]),
        .I4(state_trns__0[1]),
        .I5(state_spi),
        .O(\FSM_sequential_state_trns[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h00000000EAAA0000)) 
    \FSM_sequential_state_trns[1]_i_1 
       (.I0(state_trns__0[1]),
        .I1(shiftsck[0]),
        .I2(shiftsck_0),
        .I3(shiftsck[1]),
        .I4(\FSM_sequential_state_trns[1]_i_2_n_0 ),
        .I5(state_spi),
        .O(\FSM_sequential_state_trns[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hECECECEE)) 
    \FSM_sequential_state_trns[1]_i_2 
       (.I0(state_trns__0[1]),
        .I1(state_trns__0[0]),
        .I2(\shiftsck_reg[2]_0 ),
        .I3(\index_reg_n_0_[3] ),
        .I4(\index[3]_i_3_n_0 ),
        .O(\FSM_sequential_state_trns[1]_i_2_n_0 ));
  (* FSM_ENCODED_STATES = "start:00,done:11,waiting:01,changesignal:10" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_trns_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state_trns[0]_i_1_n_0 ),
        .Q(state_trns__0[0]),
        .R(1'b0));
  (* FSM_ENCODED_STATES = "start:00,done:11,waiting:01,changesignal:10" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_trns_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_sequential_state_trns[1]_i_1_n_0 ),
        .Q(state_trns__0[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \index[0]_i_1__0 
       (.I0(state_trns__0[1]),
        .I1(\index_reg_n_0_[0] ),
        .O(\index[0]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hD7)) 
    \index[1]_i_1__0 
       (.I0(state_trns__0[1]),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .O(\index[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFD57)) 
    \index[2]_i_1 
       (.I0(state_trns__0[1]),
        .I1(\index_reg_n_0_[0] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[2] ),
        .O(\index[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0000005400005555)) 
    \index[3]_i_1__0 
       (.I0(state_spi),
        .I1(\index[3]_i_3_n_0 ),
        .I2(\index_reg_n_0_[3] ),
        .I3(\shiftsck_reg[2]_0 ),
        .I4(state_trns__0[0]),
        .I5(state_trns__0[1]),
        .O(\index[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hFFFD5557)) 
    \index[3]_i_2 
       (.I0(state_trns__0[1]),
        .I1(\index_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\index_reg_n_0_[0] ),
        .I4(\index_reg_n_0_[3] ),
        .O(\index[3]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hFE)) 
    \index[3]_i_3 
       (.I0(\index_reg_n_0_[2] ),
        .I1(\index_reg_n_0_[1] ),
        .I2(\index_reg_n_0_[0] ),
        .O(\index[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \index_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[3]_i_1__0_n_0 ),
        .D(\index[0]_i_1__0_n_0 ),
        .Q(\index_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \index_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[3]_i_1__0_n_0 ),
        .D(\index[1]_i_1__0_n_0 ),
        .Q(\index_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \index_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[3]_i_1__0_n_0 ),
        .D(\index[2]_i_1_n_0 ),
        .Q(\index_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \index_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\index[3]_i_1__0_n_0 ),
        .D(\index[3]_i_2_n_0 ),
        .Q(\index_reg_n_0_[3] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00005557)) 
    miso_i_1
       (.I0(state_trns__0[1]),
        .I1(shiftsck[1]),
        .I2(shiftsck_0),
        .I3(shiftsck[0]),
        .I4(state_trns__0[0]),
        .O(miso_i_1_n_0));
  LUT5 #(
    .INIT(32'hB8FFB800)) 
    miso_i_2
       (.I0(miso_reg_i_3_n_0),
        .I1(\index_reg_n_0_[3] ),
        .I2(miso_reg_i_4_n_0),
        .I3(state_trns__0[1]),
        .I4(Q[15]),
        .O(miso_i_2_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    miso_i_5
       (.I0(\shift_reg_n_0_[11] ),
        .I1(\shift_reg_n_0_[10] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\shift_reg_n_0_[9] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\shift_reg_n_0_[8] ),
        .O(miso_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    miso_i_6
       (.I0(\shift_reg_n_0_[15] ),
        .I1(\shift_reg_n_0_[14] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\shift_reg_n_0_[13] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\shift_reg_n_0_[12] ),
        .O(miso_i_6_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    miso_i_7
       (.I0(\shift_reg_n_0_[3] ),
        .I1(\shift_reg_n_0_[2] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\shift_reg_n_0_[1] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\shift_reg_n_0_[0] ),
        .O(miso_i_7_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    miso_i_8
       (.I0(\shift_reg_n_0_[7] ),
        .I1(\shift_reg_n_0_[6] ),
        .I2(\index_reg_n_0_[1] ),
        .I3(\shift_reg_n_0_[5] ),
        .I4(\index_reg_n_0_[0] ),
        .I5(\shift_reg_n_0_[4] ),
        .O(miso_i_8_n_0));
  FDRE #(
    .INIT(1'b0)) 
    miso_reg
       (.C(clk_IBUF_BUFG),
        .CE(miso_i_1_n_0),
        .D(miso_i_2_n_0),
        .Q(miso_OBUF),
        .R(state_spi));
  MUXF7 miso_reg_i_3
       (.I0(miso_i_5_n_0),
        .I1(miso_i_6_n_0),
        .O(miso_reg_i_3_n_0),
        .S(\index_reg_n_0_[2] ));
  MUXF7 miso_reg_i_4
       (.I0(miso_i_7_n_0),
        .I1(miso_i_8_n_0),
        .O(miso_reg_i_4_n_0),
        .S(\index_reg_n_0_[2] ));
  LUT3 #(
    .INIT(8'h01)) 
    \shift[15]_i_1__0 
       (.I0(state_trns__0[0]),
        .I1(state_trns__0[1]),
        .I2(state_spi),
        .O(\shift[15]_i_1__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[0]),
        .Q(\shift_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[10]),
        .Q(\shift_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[11]),
        .Q(\shift_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[12]),
        .Q(\shift_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[13]),
        .Q(\shift_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[14]),
        .Q(\shift_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[15]),
        .Q(\shift_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[1]),
        .Q(\shift_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[2]),
        .Q(\shift_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[3]),
        .Q(\shift_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[4]),
        .Q(\shift_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[5]),
        .Q(\shift_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[6]),
        .Q(\shift_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[7]),
        .Q(\shift_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[8]),
        .Q(\shift_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shift_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\shift[15]_i_1__0_n_0 ),
        .D(Q[9]),
        .Q(\shift_reg_n_0_[9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftsck_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(sck_IBUF),
        .Q(shiftsck[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \shiftsck_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(shiftsck_0),
        .Q(shiftsck[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b1)) 
    \shiftss_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(ss_IBUF),
        .Q(shiftss),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hEAA8)) 
    state_spi_i_1__0
       (.I0(state_spi),
        .I1(shiftss_1[1]),
        .I2(shiftss),
        .I3(shiftss_1[0]),
        .O(state_spi_i_1__0_n_0));
  FDRE #(
    .INIT(1'b1)) 
    state_spi_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(state_spi_i_1__0_n_0),
        .Q(state_spi),
        .R(1'b0));
endmodule

module SPI_topmodule
   (miso_OBUF,
    D,
    E,
    \data_controller_o_reg[15]_0 ,
    clk_IBUF_BUFG,
    sck_IBUF,
    ss_IBUF,
    Q,
    control_answer,
    \shift_reg[1] ,
    led_OBUF);
  output miso_OBUF;
  output [0:0]D;
  output [0:0]E;
  output [15:0]\data_controller_o_reg[15]_0 ;
  input clk_IBUF_BUFG;
  input sck_IBUF;
  input ss_IBUF;
  input [1:0]Q;
  input control_answer;
  input [0:0]\shift_reg[1] ;
  input [15:0]led_OBUF;

  wire [0:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  wire URECI_n_10;
  wire URECI_n_11;
  wire URECI_n_12;
  wire URECI_n_13;
  wire URECI_n_14;
  wire URECI_n_15;
  wire URECI_n_16;
  wire URECI_n_17;
  wire URECI_n_18;
  wire URECI_n_19;
  wire URECI_n_20;
  wire URECI_n_21;
  wire URECI_n_4;
  wire URECI_n_6;
  wire URECI_n_7;
  wire URECI_n_8;
  wire URECI_n_9;
  wire UTRNS_n_5;
  wire UTRNS_n_6;
  wire clk_IBUF_BUFG;
  wire control_answer;
  wire \data_controller_o[15]_i_1_n_0 ;
  wire \data_controller_o[15]_i_2_n_0 ;
  wire \data_controller_o[15]_i_3_n_0 ;
  wire [15:0]\data_controller_o_reg[15]_0 ;
  wire [15:0]led_OBUF;
  wire miso_OBUF;
  wire sck_IBUF;
  wire [0:0]\shift_reg[1] ;
  wire [1:1]shiftsck;
  wire [2:0]shiftsck_1;
  wire [2:1]shiftss;
  wire [0:0]shiftss_0;
  wire spi_signa;
  wire spi_signa_i_1_n_0;
  wire ss_IBUF;
  wire [2:0]state;
  wire \state[1]_i_2_n_0 ;
  wire \state_reg_n_0_[0] ;
  wire \state_reg_n_0_[1] ;
  wire \state_reg_n_0_[2] ;
  wire state_spi;
  wire [3:0]w_cs_data;
  wire \w_cs_data[1]_i_2_n_0 ;
  wire \w_cs_data[1]_i_3_n_0 ;
  wire \w_cs_data[3]_i_1_n_0 ;
  wire \w_cs_data[3]_i_3_n_0 ;
  wire \w_cs_data[3]_i_4_n_0 ;
  wire \w_cs_data[3]_i_5_n_0 ;
  wire \w_cs_data[3]_i_6_n_0 ;
  wire \w_cs_data_reg_n_0_[0] ;
  wire \w_cs_data_reg_n_0_[1] ;
  wire \w_cs_data_reg_n_0_[2] ;
  wire \w_cs_data_reg_n_0_[3] ;
  wire [1:0]w_cs_index;
  wire \w_cs_index[0]_i_1_n_0 ;
  wire \w_cs_index[1]_i_1_n_0 ;
  wire [15:0]w_shift;
  wire \w_shift[15]_i_1_n_0 ;
  wire \w_trns_data[15]_i_1_n_0 ;
  wire \w_trns_data_reg_n_0_[0] ;
  wire \w_trns_data_reg_n_0_[10] ;
  wire \w_trns_data_reg_n_0_[11] ;
  wire \w_trns_data_reg_n_0_[12] ;
  wire \w_trns_data_reg_n_0_[13] ;
  wire \w_trns_data_reg_n_0_[14] ;
  wire \w_trns_data_reg_n_0_[15] ;
  wire \w_trns_data_reg_n_0_[1] ;
  wire \w_trns_data_reg_n_0_[2] ;
  wire \w_trns_data_reg_n_0_[3] ;
  wire \w_trns_data_reg_n_0_[4] ;
  wire \w_trns_data_reg_n_0_[5] ;
  wire \w_trns_data_reg_n_0_[6] ;
  wire \w_trns_data_reg_n_0_[7] ;
  wire \w_trns_data_reg_n_0_[8] ;
  wire \w_trns_data_reg_n_0_[9] ;

  SPI_slave_reci URECI
       (.D({state[2],URECI_n_4,state[0]}),
        .E(\w_trns_data[15]_i_1_n_0 ),
        .\FSM_sequential_state_reci_reg[1]_0 (UTRNS_n_5),
        .Q({\state_reg_n_0_[2] ,\state_reg_n_0_[1] ,\state_reg_n_0_[0] }),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .control_answer(control_answer),
        .\index_reg[0]_0 (UTRNS_n_6),
        .led_OBUF(led_OBUF),
        .\shift_reg[1]_0 (\shift_reg[1] ),
        .shiftsck(shiftsck),
        .shiftsck_1({shiftsck_1[2],shiftsck_1[0]}),
        .shiftss(shiftss),
        .shiftss_0(shiftss_0),
        .\state_reg[0] (\state[1]_i_2_n_0 ),
        .state_spi(state_spi),
        .\w_data_too_spitop_reg[15] ({URECI_n_6,URECI_n_7,URECI_n_8,URECI_n_9,URECI_n_10,URECI_n_11,URECI_n_12,URECI_n_13,URECI_n_14,URECI_n_15,URECI_n_16,URECI_n_17,URECI_n_18,URECI_n_19,URECI_n_20,URECI_n_21}));
  SPI_slave_trns UTRNS
       (.Q({\w_trns_data_reg_n_0_[15] ,\w_trns_data_reg_n_0_[14] ,\w_trns_data_reg_n_0_[13] ,\w_trns_data_reg_n_0_[12] ,\w_trns_data_reg_n_0_[11] ,\w_trns_data_reg_n_0_[10] ,\w_trns_data_reg_n_0_[9] ,\w_trns_data_reg_n_0_[8] ,\w_trns_data_reg_n_0_[7] ,\w_trns_data_reg_n_0_[6] ,\w_trns_data_reg_n_0_[5] ,\w_trns_data_reg_n_0_[4] ,\w_trns_data_reg_n_0_[3] ,\w_trns_data_reg_n_0_[2] ,\w_trns_data_reg_n_0_[1] ,\w_trns_data_reg_n_0_[0] }),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .miso_OBUF(miso_OBUF),
        .sck_IBUF(sck_IBUF),
        .shiftsck({shiftsck_1[2],shiftsck_1[0]}),
        .shiftsck_0(shiftsck),
        .\shiftsck_reg[2]_0 (UTRNS_n_5),
        .\shiftsck_reg[2]_1 (UTRNS_n_6),
        .shiftss(shiftss_0),
        .shiftss_1(shiftss),
        .ss_IBUF(ss_IBUF),
        .state_spi(state_spi));
  LUT6 #(
    .INIT(64'hBEFFFFBE00000000)) 
    \data_controller_o[15]_i_1 
       (.I0(\data_controller_o[15]_i_3_n_0 ),
        .I1(w_shift[1]),
        .I2(\w_cs_data_reg_n_0_[1] ),
        .I3(w_shift[0]),
        .I4(\w_cs_data_reg_n_0_[0] ),
        .I5(\data_controller_o[15]_i_2_n_0 ),
        .O(\data_controller_o[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \data_controller_o[15]_i_2 
       (.I0(w_cs_index[1]),
        .I1(w_cs_index[0]),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[1] ),
        .O(\data_controller_o[15]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \data_controller_o[15]_i_3 
       (.I0(w_shift[2]),
        .I1(\w_cs_data_reg_n_0_[2] ),
        .I2(w_shift[3]),
        .I3(\w_cs_data_reg_n_0_[3] ),
        .O(\data_controller_o[15]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[0]),
        .Q(\data_controller_o_reg[15]_0 [0]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[10]),
        .Q(\data_controller_o_reg[15]_0 [10]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[11]),
        .Q(\data_controller_o_reg[15]_0 [11]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[12]),
        .Q(\data_controller_o_reg[15]_0 [12]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[13]),
        .Q(\data_controller_o_reg[15]_0 [13]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[14]),
        .Q(\data_controller_o_reg[15]_0 [14]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[15]),
        .Q(\data_controller_o_reg[15]_0 [15]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[1]),
        .Q(\data_controller_o_reg[15]_0 [1]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[2]),
        .Q(\data_controller_o_reg[15]_0 [2]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[3]),
        .Q(\data_controller_o_reg[15]_0 [3]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[4]),
        .Q(\data_controller_o_reg[15]_0 [4]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[5]),
        .Q(\data_controller_o_reg[15]_0 [5]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[6]),
        .Q(\data_controller_o_reg[15]_0 [6]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[7]),
        .Q(\data_controller_o_reg[15]_0 [7]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[8]),
        .Q(\data_controller_o_reg[15]_0 [8]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \data_controller_o_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\data_controller_o[15]_i_2_n_0 ),
        .D(w_shift[9]),
        .Q(\data_controller_o_reg[15]_0 [9]),
        .R(\data_controller_o[15]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h04)) 
    \shift[15]_i_1__1 
       (.I0(Q[0]),
        .I1(spi_signa),
        .I2(Q[1]),
        .O(E));
  LUT6 #(
    .INIT(64'hFFFFCCCC10000000)) 
    spi_signa_i_1
       (.I0(\state_reg_n_0_[1] ),
        .I1(\state_reg_n_0_[2] ),
        .I2(w_cs_index[1]),
        .I3(w_cs_index[0]),
        .I4(\state_reg_n_0_[0] ),
        .I5(spi_signa),
        .O(spi_signa_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    spi_signa_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(spi_signa_i_1_n_0),
        .Q(spi_signa),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h0E)) 
    \state[0]_i_1__0 
       (.I0(Q[1]),
        .I1(spi_signa),
        .I2(Q[0]),
        .O(D));
  LUT3 #(
    .INIT(8'h80)) 
    \state[1]_i_2 
       (.I0(\state_reg_n_0_[0] ),
        .I1(w_cs_index[0]),
        .I2(w_cs_index[1]),
        .O(\state[1]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(state[0]),
        .Q(\state_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(URECI_n_4),
        .Q(\state_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(state[2]),
        .Q(\state_reg_n_0_[2] ),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h03F3FC0C0AFAFA0A)) 
    \w_cs_data[0]_i_1 
       (.I0(w_shift[12]),
        .I1(w_shift[8]),
        .I2(w_cs_index[1]),
        .I3(w_shift[4]),
        .I4(\w_cs_data_reg_n_0_[1] ),
        .I5(w_cs_index[0]),
        .O(w_cs_data[0]));
  LUT6 #(
    .INIT(64'hFE0202FE02FEFE02)) 
    \w_cs_data[1]_i_1 
       (.I0(w_shift[13]),
        .I1(w_cs_index[1]),
        .I2(w_cs_index[0]),
        .I3(\w_cs_data[1]_i_2_n_0 ),
        .I4(\w_cs_data[1]_i_3_n_0 ),
        .I5(\w_cs_data_reg_n_0_[2] ),
        .O(w_cs_data[1]));
  LUT4 #(
    .INIT(16'hE200)) 
    \w_cs_data[1]_i_2 
       (.I0(w_shift[8]),
        .I1(w_cs_index[1]),
        .I2(w_shift[4]),
        .I3(\w_cs_data_reg_n_0_[1] ),
        .O(\w_cs_data[1]_i_2_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \w_cs_data[1]_i_3 
       (.I0(w_shift[5]),
        .I1(w_cs_index[1]),
        .I2(w_shift[9]),
        .O(\w_cs_data[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFE0202FE02FEFE02)) 
    \w_cs_data[2]_i_1 
       (.I0(w_shift[14]),
        .I1(w_cs_index[1]),
        .I2(w_cs_index[0]),
        .I3(\w_cs_data[3]_i_6_n_0 ),
        .I4(\w_cs_data[3]_i_5_n_0 ),
        .I5(\w_cs_data_reg_n_0_[3] ),
        .O(w_cs_data[2]));
  LUT3 #(
    .INIT(8'h2A)) 
    \w_cs_data[3]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(w_cs_index[0]),
        .I2(w_cs_index[1]),
        .O(\w_cs_data[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8B8B8BB88BB8B8B8)) 
    \w_cs_data[3]_i_2 
       (.I0(w_shift[15]),
        .I1(\w_cs_data[3]_i_3_n_0 ),
        .I2(\w_cs_data[3]_i_4_n_0 ),
        .I3(\w_cs_data[3]_i_5_n_0 ),
        .I4(\w_cs_data_reg_n_0_[3] ),
        .I5(\w_cs_data[3]_i_6_n_0 ),
        .O(w_cs_data[3]));
  LUT2 #(
    .INIT(4'h1)) 
    \w_cs_data[3]_i_3 
       (.I0(w_cs_index[1]),
        .I1(w_cs_index[0]),
        .O(\w_cs_data[3]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h56A6)) 
    \w_cs_data[3]_i_4 
       (.I0(\w_cs_data_reg_n_0_[0] ),
        .I1(w_shift[11]),
        .I2(w_cs_index[1]),
        .I3(w_shift[7]),
        .O(\w_cs_data[3]_i_4_n_0 ));
  LUT3 #(
    .INIT(8'hB8)) 
    \w_cs_data[3]_i_5 
       (.I0(w_shift[6]),
        .I1(w_cs_index[1]),
        .I2(w_shift[10]),
        .O(\w_cs_data[3]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hEEE888E8)) 
    \w_cs_data[3]_i_6 
       (.I0(\w_cs_data_reg_n_0_[2] ),
        .I1(\w_cs_data[1]_i_2_n_0 ),
        .I2(w_shift[9]),
        .I3(w_cs_index[1]),
        .I4(w_shift[5]),
        .O(\w_cs_data[3]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_cs_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_cs_data[3]_i_1_n_0 ),
        .D(w_cs_data[0]),
        .Q(\w_cs_data_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_cs_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_cs_data[3]_i_1_n_0 ),
        .D(w_cs_data[1]),
        .Q(\w_cs_data_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_cs_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_cs_data[3]_i_1_n_0 ),
        .D(w_cs_data[2]),
        .Q(\w_cs_data_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_cs_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_cs_data[3]_i_1_n_0 ),
        .D(w_cs_data[3]),
        .Q(\w_cs_data_reg_n_0_[3] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'hC2)) 
    \w_cs_index[0]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(\state_reg_n_0_[2] ),
        .I2(w_cs_index[0]),
        .O(\w_cs_index[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT4 #(
    .INIT(16'hF208)) 
    \w_cs_index[1]_i_1 
       (.I0(\state_reg_n_0_[0] ),
        .I1(w_cs_index[0]),
        .I2(\state_reg_n_0_[2] ),
        .I3(w_cs_index[1]),
        .O(\w_cs_index[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_cs_index_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\w_cs_index[0]_i_1_n_0 ),
        .Q(w_cs_index[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_cs_index_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\w_cs_index[1]_i_1_n_0 ),
        .Q(w_cs_index[1]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h000D)) 
    \w_shift[15]_i_1 
       (.I0(\state_reg_n_0_[1] ),
        .I1(control_answer),
        .I2(\state_reg_n_0_[0] ),
        .I3(\state_reg_n_0_[2] ),
        .O(\w_shift[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_21),
        .Q(w_shift[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_11),
        .Q(w_shift[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_10),
        .Q(w_shift[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_9),
        .Q(w_shift[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_8),
        .Q(w_shift[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_7),
        .Q(w_shift[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_6),
        .Q(w_shift[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_20),
        .Q(w_shift[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_19),
        .Q(w_shift[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_18),
        .Q(w_shift[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_17),
        .Q(w_shift[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_16),
        .Q(w_shift[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_15),
        .Q(w_shift[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_14),
        .Q(w_shift[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_13),
        .Q(w_shift[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_shift_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_shift[15]_i_1_n_0 ),
        .D(URECI_n_12),
        .Q(w_shift[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h8000)) 
    \w_trns_data[15]_i_1 
       (.I0(w_cs_index[0]),
        .I1(w_cs_index[1]),
        .I2(\state_reg_n_0_[1] ),
        .I3(\state_reg_n_0_[0] ),
        .O(\w_trns_data[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(\w_cs_data_reg_n_0_[0] ),
        .Q(\w_trns_data_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[10]),
        .Q(\w_trns_data_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[11]),
        .Q(\w_trns_data_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[12]),
        .Q(\w_trns_data_reg_n_0_[12] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[13]),
        .Q(\w_trns_data_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[14]),
        .Q(\w_trns_data_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[15]),
        .Q(\w_trns_data_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(\w_cs_data_reg_n_0_[1] ),
        .Q(\w_trns_data_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(\w_cs_data_reg_n_0_[2] ),
        .Q(\w_trns_data_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(\w_cs_data_reg_n_0_[3] ),
        .Q(\w_trns_data_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[4]),
        .Q(\w_trns_data_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[5]),
        .Q(\w_trns_data_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[6]),
        .Q(\w_trns_data_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[7]),
        .Q(\w_trns_data_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[8]),
        .Q(\w_trns_data_reg_n_0_[8] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \w_trns_data_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\w_trns_data[15]_i_1_n_0 ),
        .D(w_shift[9]),
        .Q(\w_trns_data_reg_n_0_[9] ),
        .R(1'b0));
endmodule

module motor_stateFreq
   (I42,
    clk_IBUF_BUFG);
  output I42;
  input clk_IBUF_BUFG;

  wire I42;
  wire clk_IBUF_BUFG;
  wire [0:0]counter;
  wire counter0_carry__0_n_0;
  wire counter0_carry__0_n_4;
  wire counter0_carry__0_n_5;
  wire counter0_carry__0_n_6;
  wire counter0_carry__0_n_7;
  wire counter0_carry__1_n_0;
  wire counter0_carry__1_n_4;
  wire counter0_carry__1_n_5;
  wire counter0_carry__1_n_6;
  wire counter0_carry__1_n_7;
  wire counter0_carry__2_n_7;
  wire counter0_carry_n_0;
  wire counter0_carry_n_4;
  wire counter0_carry_n_5;
  wire counter0_carry_n_6;
  wire counter0_carry_n_7;
  wire \counter[13]_i_3__0_n_0 ;
  wire \counter[13]_i_4__0_n_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[10] ;
  wire \counter_reg_n_0_[11] ;
  wire \counter_reg_n_0_[12] ;
  wire \counter_reg_n_0_[13] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire \counter_reg_n_0_[6] ;
  wire \counter_reg_n_0_[7] ;
  wire \counter_reg_n_0_[8] ;
  wire \counter_reg_n_0_[9] ;
  wire temporal;
  wire temporal_i_1__0_n_0;
  wire [2:0]NLW_counter0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_counter0_carry__0_CO_UNCONNECTED;
  wire [2:0]NLW_counter0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_counter0_carry__2_CO_UNCONNECTED;
  wire [3:1]NLW_counter0_carry__2_O_UNCONNECTED;

  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 counter0_carry
       (.CI(1'b0),
        .CO({counter0_carry_n_0,NLW_counter0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(\counter_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0_carry_n_4,counter0_carry_n_5,counter0_carry_n_6,counter0_carry_n_7}),
        .S({\counter_reg_n_0_[4] ,\counter_reg_n_0_[3] ,\counter_reg_n_0_[2] ,\counter_reg_n_0_[1] }));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,NLW_counter0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0_carry__0_n_4,counter0_carry__0_n_5,counter0_carry__0_n_6,counter0_carry__0_n_7}),
        .S({\counter_reg_n_0_[8] ,\counter_reg_n_0_[7] ,\counter_reg_n_0_[6] ,\counter_reg_n_0_[5] }));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,NLW_counter0_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0_carry__1_n_4,counter0_carry__1_n_5,counter0_carry__1_n_6,counter0_carry__1_n_7}),
        .S({\counter_reg_n_0_[12] ,\counter_reg_n_0_[11] ,\counter_reg_n_0_[10] ,\counter_reg_n_0_[9] }));
  CARRY4 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CO(NLW_counter0_carry__2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_counter0_carry__2_O_UNCONNECTED[3:1],counter0_carry__2_n_7}),
        .S({1'b0,1'b0,1'b0,\counter_reg_n_0_[13] }));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1__0 
       (.I0(\counter_reg_n_0_[0] ),
        .O(counter));
  (* OPT_MODIFIED = "RETARGET " *) 
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \counter[13]_i_2__0 
       (.I0(\counter[13]_i_3__0_n_0 ),
        .I1(\counter_reg_n_0_[3] ),
        .I2(\counter_reg_n_0_[2] ),
        .I3(\counter_reg_n_0_[5] ),
        .I4(\counter_reg_n_0_[4] ),
        .I5(\counter[13]_i_4__0_n_0 ),
        .O(temporal));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \counter[13]_i_3__0 
       (.I0(\counter_reg_n_0_[7] ),
        .I1(\counter_reg_n_0_[6] ),
        .I2(\counter_reg_n_0_[9] ),
        .I3(\counter_reg_n_0_[8] ),
        .O(\counter[13]_i_3__0_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFFFFFFFFFF)) 
    \counter[13]_i_4__0 
       (.I0(\counter_reg_n_0_[12] ),
        .I1(\counter_reg_n_0_[13] ),
        .I2(\counter_reg_n_0_[11] ),
        .I3(\counter_reg_n_0_[10] ),
        .I4(\counter_reg_n_0_[1] ),
        .I5(\counter_reg_n_0_[0] ),
        .O(\counter[13]_i_4__0_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter),
        .Q(\counter_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry__1_n_6),
        .Q(\counter_reg_n_0_[10] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry__1_n_5),
        .Q(\counter_reg_n_0_[11] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry__1_n_4),
        .Q(\counter_reg_n_0_[12] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry__2_n_7),
        .Q(\counter_reg_n_0_[13] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry_n_7),
        .Q(\counter_reg_n_0_[1] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry_n_6),
        .Q(\counter_reg_n_0_[2] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry_n_5),
        .Q(\counter_reg_n_0_[3] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry_n_4),
        .Q(\counter_reg_n_0_[4] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry__0_n_7),
        .Q(\counter_reg_n_0_[5] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry__0_n_6),
        .Q(\counter_reg_n_0_[6] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry__0_n_5),
        .Q(\counter_reg_n_0_[7] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry__0_n_4),
        .Q(\counter_reg_n_0_[8] ),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter0_carry__1_n_7),
        .Q(\counter_reg_n_0_[9] ),
        .R(temporal));
  (* OPT_MODIFIED = "RETARGET " *) 
  LUT2 #(
    .INIT(4'h6)) 
    temporal_i_1__0
       (.I0(temporal),
        .I1(I42),
        .O(temporal_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    temporal_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(temporal_i_1__0_n_0),
        .Q(I42),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "motor_stateFreq" *) 
module motor_stateFreq_1
   (CLK,
    clk_IBUF_BUFG);
  output CLK;
  input clk_IBUF_BUFG;

  wire CLK;
  wire clk_IBUF_BUFG;
  wire [13:0]counter;
  wire counter0_carry__0_n_0;
  wire counter0_carry__1_n_0;
  wire counter0_carry_n_0;
  wire \counter[13]_i_3_n_0 ;
  wire \counter[13]_i_4_n_0 ;
  wire [0:0]counter_0;
  wire [13:1]data0;
  wire temporal;
  wire temporal_i_1_n_0;
  wire [2:0]NLW_counter0_carry_CO_UNCONNECTED;
  wire [2:0]NLW_counter0_carry__0_CO_UNCONNECTED;
  wire [2:0]NLW_counter0_carry__1_CO_UNCONNECTED;
  wire [3:0]NLW_counter0_carry__2_CO_UNCONNECTED;
  wire [3:1]NLW_counter0_carry__2_O_UNCONNECTED;

  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 counter0_carry
       (.CI(1'b0),
        .CO({counter0_carry_n_0,NLW_counter0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(counter[4:1]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,NLW_counter0_carry__0_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(counter[8:5]));
  (* OPT_MODIFIED = "SWEEP " *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,NLW_counter0_carry__1_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(counter[12:9]));
  CARRY4 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CO(NLW_counter0_carry__2_CO_UNCONNECTED[3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_counter0_carry__2_O_UNCONNECTED[3:1],data0[13]}),
        .S({1'b0,1'b0,1'b0,counter[13]}));
  LUT1 #(
    .INIT(2'h1)) 
    \counter[0]_i_1 
       (.I0(counter[0]),
        .O(counter_0));
  (* OPT_MODIFIED = "RETARGET " *) 
  LUT6 #(
    .INIT(64'h0000000000000040)) 
    \counter[13]_i_2 
       (.I0(\counter[13]_i_3_n_0 ),
        .I1(counter[3]),
        .I2(counter[2]),
        .I3(counter[5]),
        .I4(counter[4]),
        .I5(\counter[13]_i_4_n_0 ),
        .O(temporal));
  LUT4 #(
    .INIT(16'hEFFF)) 
    \counter[13]_i_3 
       (.I0(counter[7]),
        .I1(counter[6]),
        .I2(counter[9]),
        .I3(counter[8]),
        .O(\counter[13]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFFFFFFFFFF)) 
    \counter[13]_i_4 
       (.I0(counter[12]),
        .I1(counter[13]),
        .I2(counter[11]),
        .I3(counter[10]),
        .I4(counter[1]),
        .I5(counter[0]),
        .O(\counter[13]_i_4_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(counter_0),
        .Q(counter[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[10]),
        .Q(counter[10]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[11]),
        .Q(counter[11]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[12]),
        .Q(counter[12]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[13]),
        .Q(counter[13]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[1]),
        .Q(counter[1]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[2]),
        .Q(counter[2]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[3]),
        .Q(counter[3]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[4]),
        .Q(counter[4]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[5]),
        .Q(counter[5]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[6]),
        .Q(counter[6]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[7]),
        .Q(counter[7]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[8]),
        .Q(counter[8]),
        .R(temporal));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(data0[9]),
        .Q(counter[9]),
        .R(temporal));
  (* OPT_MODIFIED = "RETARGET " *) 
  LUT2 #(
    .INIT(4'h6)) 
    temporal_i_1
       (.I0(temporal),
        .I1(CLK),
        .O(temporal_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    temporal_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(temporal_i_1_n_0),
        .Q(CLK),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
