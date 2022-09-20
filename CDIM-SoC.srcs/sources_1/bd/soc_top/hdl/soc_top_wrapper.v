//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Wed Sep 21 00:07:46 2022
//Host        : cyy-pc running 64-bit Debian GNU/Linux bookworm/sid
//Command     : generate_target soc_top_wrapper.bd
//Design      : soc_top_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module soc_top_wrapper
   (DDR2_0_addr,
    DDR2_0_ba,
    DDR2_0_cas_n,
    DDR2_0_ck_n,
    DDR2_0_ck_p,
    DDR2_0_cke,
    DDR2_0_cs_n,
    DDR2_0_dm,
    DDR2_0_dq,
    DDR2_0_dqs_n,
    DDR2_0_dqs_p,
    DDR2_0_odt,
    DDR2_0_ras_n,
    DDR2_0_we_n,
    MDIO_0_mdc,
    MDIO_0_mdio_io,
    RMII_PHY_M_0_clk,
    RMII_PHY_M_0_crs_dv,
    RMII_PHY_M_0_phy_rst_n,
    RMII_PHY_M_0_rx_er,
    RMII_PHY_M_0_rxd,
    RMII_PHY_M_0_tx_en,
    RMII_PHY_M_0_txd,
    SPI_CS,
    SPI_MISO,
    SPI_MOSI,
    UART_RX,
    UART_TX,
    clk,
    init_calib_complete_0,
    mmcm_locked_0,
    resetn);
  output [12:0]DDR2_0_addr;
  output [2:0]DDR2_0_ba;
  output DDR2_0_cas_n;
  output [0:0]DDR2_0_ck_n;
  output [0:0]DDR2_0_ck_p;
  output [0:0]DDR2_0_cke;
  output [0:0]DDR2_0_cs_n;
  output [1:0]DDR2_0_dm;
  inout [15:0]DDR2_0_dq;
  inout [1:0]DDR2_0_dqs_n;
  inout [1:0]DDR2_0_dqs_p;
  output [0:0]DDR2_0_odt;
  output DDR2_0_ras_n;
  output DDR2_0_we_n;
  output MDIO_0_mdc;
  inout MDIO_0_mdio_io;
  output RMII_PHY_M_0_clk;
  input RMII_PHY_M_0_crs_dv;
  output RMII_PHY_M_0_phy_rst_n;
  input RMII_PHY_M_0_rx_er;
  input [1:0]RMII_PHY_M_0_rxd;
  output RMII_PHY_M_0_tx_en;
  output [1:0]RMII_PHY_M_0_txd;
  output SPI_CS;
  inout SPI_MISO;
  inout SPI_MOSI;
  inout UART_RX;
  inout UART_TX;
  input clk;
  output init_calib_complete_0;
  output mmcm_locked_0;
  input resetn;

  wire [12:0]DDR2_0_addr;
  wire [2:0]DDR2_0_ba;
  wire DDR2_0_cas_n;
  wire [0:0]DDR2_0_ck_n;
  wire [0:0]DDR2_0_ck_p;
  wire [0:0]DDR2_0_cke;
  wire [0:0]DDR2_0_cs_n;
  wire [1:0]DDR2_0_dm;
  wire [15:0]DDR2_0_dq;
  wire [1:0]DDR2_0_dqs_n;
  wire [1:0]DDR2_0_dqs_p;
  wire [0:0]DDR2_0_odt;
  wire DDR2_0_ras_n;
  wire DDR2_0_we_n;
  wire MDIO_0_mdc;
  wire MDIO_0_mdio_i;
  wire MDIO_0_mdio_io;
  wire MDIO_0_mdio_o;
  wire MDIO_0_mdio_t;
  wire RMII_PHY_M_0_clk;
  wire RMII_PHY_M_0_crs_dv;
  wire RMII_PHY_M_0_phy_rst_n;
  wire RMII_PHY_M_0_rx_er;
  wire [1:0]RMII_PHY_M_0_rxd;
  wire RMII_PHY_M_0_tx_en;
  wire [1:0]RMII_PHY_M_0_txd;
  wire SPI_CS;
  wire SPI_MISO;
  wire SPI_MOSI;
  wire UART_RX;
  wire UART_TX;
  wire clk;
  wire init_calib_complete_0;
  wire mmcm_locked_0;
  wire resetn;

  IOBUF MDIO_0_mdio_iobuf
       (.I(MDIO_0_mdio_o),
        .IO(MDIO_0_mdio_io),
        .O(MDIO_0_mdio_i),
        .T(MDIO_0_mdio_t));
  soc_top soc_top_i
       (.DDR2_0_addr(DDR2_0_addr),
        .DDR2_0_ba(DDR2_0_ba),
        .DDR2_0_cas_n(DDR2_0_cas_n),
        .DDR2_0_ck_n(DDR2_0_ck_n),
        .DDR2_0_ck_p(DDR2_0_ck_p),
        .DDR2_0_cke(DDR2_0_cke),
        .DDR2_0_cs_n(DDR2_0_cs_n),
        .DDR2_0_dm(DDR2_0_dm),
        .DDR2_0_dq(DDR2_0_dq),
        .DDR2_0_dqs_n(DDR2_0_dqs_n),
        .DDR2_0_dqs_p(DDR2_0_dqs_p),
        .DDR2_0_odt(DDR2_0_odt),
        .DDR2_0_ras_n(DDR2_0_ras_n),
        .DDR2_0_we_n(DDR2_0_we_n),
        .MDIO_0_mdc(MDIO_0_mdc),
        .MDIO_0_mdio_i(MDIO_0_mdio_i),
        .MDIO_0_mdio_o(MDIO_0_mdio_o),
        .MDIO_0_mdio_t(MDIO_0_mdio_t),
        .RMII_PHY_M_0_clk(RMII_PHY_M_0_clk),
        .RMII_PHY_M_0_crs_dv(RMII_PHY_M_0_crs_dv),
        .RMII_PHY_M_0_phy_rst_n(RMII_PHY_M_0_phy_rst_n),
        .RMII_PHY_M_0_rx_er(RMII_PHY_M_0_rx_er),
        .RMII_PHY_M_0_rxd(RMII_PHY_M_0_rxd),
        .RMII_PHY_M_0_tx_en(RMII_PHY_M_0_tx_en),
        .RMII_PHY_M_0_txd(RMII_PHY_M_0_txd),
        .SPI_CS(SPI_CS),
        .SPI_MISO(SPI_MISO),
        .SPI_MOSI(SPI_MOSI),
        .UART_RX(UART_RX),
        .UART_TX(UART_TX),
        .clk(clk),
        .init_calib_complete_0(init_calib_complete_0),
        .mmcm_locked_0(mmcm_locked_0),
        .resetn(resetn));
endmodule
