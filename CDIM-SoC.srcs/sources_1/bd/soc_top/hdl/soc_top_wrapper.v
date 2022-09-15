//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Thu Sep 15 22:19:20 2022
//Host        : cyy-pc running 64-bit Debian GNU/Linux bookworm/sid
//Command     : generate_target soc_top_wrapper.bd
//Design      : soc_top_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module soc_top_wrapper
   (DDR3_0_addr,
    DDR3_0_ba,
    DDR3_0_cas_n,
    DDR3_0_ck_n,
    DDR3_0_ck_p,
    DDR3_0_cke,
    DDR3_0_dm,
    DDR3_0_dq,
    DDR3_0_dqs_n,
    DDR3_0_dqs_p,
    DDR3_0_odt,
    DDR3_0_ras_n,
    DDR3_0_reset_n,
    DDR3_0_we_n,
    MDIO_0_mdc,
    MDIO_0_mdio_io,
    UART_RX,
    UART_TX,
    clk,
    mcoll_0,
    mcrs_0,
    mrxclk_0,
    mrxd_0,
    mrxdv_0,
    mrxerr_0,
    mtxclk_0,
    mtxd_0,
    mtxen_0,
    mtxerr_0,
    phy_rstn);
  output [12:0]DDR3_0_addr;
  output [2:0]DDR3_0_ba;
  output DDR3_0_cas_n;
  output [0:0]DDR3_0_ck_n;
  output [0:0]DDR3_0_ck_p;
  output [0:0]DDR3_0_cke;
  output [1:0]DDR3_0_dm;
  inout [15:0]DDR3_0_dq;
  inout [1:0]DDR3_0_dqs_n;
  inout [1:0]DDR3_0_dqs_p;
  output [0:0]DDR3_0_odt;
  output DDR3_0_ras_n;
  output DDR3_0_reset_n;
  output DDR3_0_we_n;
  output MDIO_0_mdc;
  inout MDIO_0_mdio_io;
  inout UART_RX;
  inout UART_TX;
  input clk;
  input mcoll_0;
  input mcrs_0;
  input mrxclk_0;
  input [3:0]mrxd_0;
  input mrxdv_0;
  input mrxerr_0;
  input mtxclk_0;
  output [3:0]mtxd_0;
  output mtxen_0;
  output [0:0]mtxerr_0;
  output phy_rstn;

  wire [12:0]DDR3_0_addr;
  wire [2:0]DDR3_0_ba;
  wire DDR3_0_cas_n;
  wire [0:0]DDR3_0_ck_n;
  wire [0:0]DDR3_0_ck_p;
  wire [0:0]DDR3_0_cke;
  wire [1:0]DDR3_0_dm;
  wire [15:0]DDR3_0_dq;
  wire [1:0]DDR3_0_dqs_n;
  wire [1:0]DDR3_0_dqs_p;
  wire [0:0]DDR3_0_odt;
  wire DDR3_0_ras_n;
  wire DDR3_0_reset_n;
  wire DDR3_0_we_n;
  wire MDIO_0_mdc;
  wire MDIO_0_mdio_i;
  wire MDIO_0_mdio_io;
  wire MDIO_0_mdio_o;
  wire MDIO_0_mdio_t;
  wire UART_RX;
  wire UART_TX;
  wire clk;
  wire mcoll_0;
  wire mcrs_0;
  wire mrxclk_0;
  wire [3:0]mrxd_0;
  wire mrxdv_0;
  wire mrxerr_0;
  wire mtxclk_0;
  wire [3:0]mtxd_0;
  wire mtxen_0;
  wire [0:0]mtxerr_0;
  wire phy_rstn;

  IOBUF MDIO_0_mdio_iobuf
       (.I(MDIO_0_mdio_o),
        .IO(MDIO_0_mdio_io),
        .O(MDIO_0_mdio_i),
        .T(MDIO_0_mdio_t));
  soc_top soc_top_i
       (.DDR3_0_addr(DDR3_0_addr),
        .DDR3_0_ba(DDR3_0_ba),
        .DDR3_0_cas_n(DDR3_0_cas_n),
        .DDR3_0_ck_n(DDR3_0_ck_n),
        .DDR3_0_ck_p(DDR3_0_ck_p),
        .DDR3_0_cke(DDR3_0_cke),
        .DDR3_0_dm(DDR3_0_dm),
        .DDR3_0_dq(DDR3_0_dq),
        .DDR3_0_dqs_n(DDR3_0_dqs_n),
        .DDR3_0_dqs_p(DDR3_0_dqs_p),
        .DDR3_0_odt(DDR3_0_odt),
        .DDR3_0_ras_n(DDR3_0_ras_n),
        .DDR3_0_reset_n(DDR3_0_reset_n),
        .DDR3_0_we_n(DDR3_0_we_n),
        .MDIO_0_mdc(MDIO_0_mdc),
        .MDIO_0_mdio_i(MDIO_0_mdio_i),
        .MDIO_0_mdio_o(MDIO_0_mdio_o),
        .MDIO_0_mdio_t(MDIO_0_mdio_t),
        .UART_RX(UART_RX),
        .UART_TX(UART_TX),
        .clk(clk),
        .mcoll_0(mcoll_0),
        .mcrs_0(mcrs_0),
        .mrxclk_0(mrxclk_0),
        .mrxd_0(mrxd_0),
        .mrxdv_0(mrxdv_0),
        .mrxerr_0(mrxerr_0),
        .mtxclk_0(mtxclk_0),
        .mtxd_0(mtxd_0),
        .mtxen_0(mtxen_0),
        .mtxerr_0(mtxerr_0),
        .phy_rstn(phy_rstn));
endmodule
