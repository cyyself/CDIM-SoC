`timescale 1ns / 1ps
`include "config.h"
module apb_uart_wrapper(
    input                       clk,
    input                       rst_n,
    input  [`LID         -1 :0] axi_s_awid,
    input  [`Lawaddr     -1 :0] axi_s_awaddr,
    input  [`Lawlen      -1 :0] axi_s_awlen,
    input  [`Lawsize     -1 :0] axi_s_awsize,
    input  [`Lawburst    -1 :0] axi_s_awburst,
    input  [`Lawlock     -1 :0] axi_s_awlock,
    input  [`Lawcache    -1 :0] axi_s_awcache,
    input  [`Lawprot     -1 :0] axi_s_awprot,
    input                       axi_s_awvalid,
    output                      axi_s_awready,
    input  [`LID         -1 :0] axi_s_wid,
    input  [`Lwdata      -1 :0] axi_s_wdata,
    input  [`Lwstrb      -1 :0] axi_s_wstrb,
    input                       axi_s_wlast,
    input                       axi_s_wvalid,
    output                      axi_s_wready,
    output [`LID         -1 :0] axi_s_bid,
    output [`Lbresp      -1 :0] axi_s_bresp,
    output                      axi_s_bvalid,
    input                       axi_s_bready,
    input  [`LID         -1 :0] axi_s_arid,
    input  [`Laraddr     -1 :0] axi_s_araddr,
    input  [`Larlen      -1 :0] axi_s_arlen,
    input  [`Larsize     -1 :0] axi_s_arsize,
    input  [`Larburst    -1 :0] axi_s_arburst,
    input  [`Larlock     -1 :0] axi_s_arlock,
    input  [`Larcache    -1 :0] axi_s_arcache,
    input  [`Larprot     -1 :0] axi_s_arprot,
    input                       axi_s_arvalid,
    output                      axi_s_arready,
    output [`LID         -1 :0] axi_s_rid,
    output [`Lrdata      -1 :0] axi_s_rdata,
    output [`Lrresp      -1 :0] axi_s_rresp,
    output                      axi_s_rlast,
    output                      axi_s_rvalid,
    input                       axi_s_rready,
    inout                       UART_TX,
    inout                       UART_RX,
    output                      UART_int
);

parameter ADDR_APB = 20,
          DATA_APB = 8,
          L_ADDR = 64,
          L_ID   = 8,
          L_DATA = 128,
          L_MASK = 16;

wire                    apb_psel_cpu;
wire                    apb_enab_cpu;
wire                    apb_rw_cpu;
wire [ADDR_APB-1 :0]    apb_addr_cpu;
wire [DATA_APB-1:0]     apb_datai_cpu;
wire [DATA_APB-1:0]     apb_datao_cpu;

axi2apb_bridge AA_axi2apb_bridge_cpu 
(
.clk                (clk                ),
.rst_n              (rst_n              ),
.axi_s_awid         (axi_s_awid         ),
.axi_s_awaddr       (axi_s_awaddr       ),
.axi_s_awlen        (axi_s_awlen        ),
.axi_s_awsize       (axi_s_awsize       ),
.axi_s_awburst      (axi_s_awburst      ),
.axi_s_awlock       (axi_s_awlock       ),
.axi_s_awcache      (axi_s_awcache      ),
.axi_s_awprot       (axi_s_awprot       ),
.axi_s_awvalid      (axi_s_awvalid      ),
.axi_s_awready      (axi_s_awready      ),
.axi_s_wid          (axi_s_wid          ),
.axi_s_wdata        (axi_s_wdata        ),
.axi_s_wstrb        (axi_s_wstrb        ),
.axi_s_wlast        (axi_s_wlast        ),
.axi_s_wvalid       (axi_s_wvalid       ),
.axi_s_wready       (axi_s_wready       ),
.axi_s_bid          (axi_s_bid          ),
.axi_s_bresp        (axi_s_bresp        ),
.axi_s_bvalid       (axi_s_bvalid       ),
.axi_s_bready       (axi_s_bready       ),
.axi_s_arid         (axi_s_arid         ),
.axi_s_araddr       (axi_s_araddr       ),
.axi_s_arlen        (axi_s_arlen        ),
.axi_s_arsize       (axi_s_arsize       ),
.axi_s_arburst      (axi_s_arburst      ),
.axi_s_arlock       (axi_s_arlock       ),
.axi_s_arcache      (axi_s_arcache      ),
.axi_s_arprot       (axi_s_arprot       ),
.axi_s_arvalid      (axi_s_arvalid      ),
.axi_s_arready      (axi_s_arready      ),
.axi_s_rid          (axi_s_rid          ),
.axi_s_rdata        (axi_s_rdata        ),
.axi_s_rresp        (axi_s_rresp        ),
.axi_s_rlast        (axi_s_rlast        ),
.axi_s_rvalid       (axi_s_rvalid       ),
.axi_s_rready       (axi_s_rready       ),

.apb_word_trans     (1'b0               ),
.apb_high_24b_rd    (24'b0              ),
.apb_high_24b_wr    (                   ),
.apb_valid_cpu      (                   ),
.cpu_grant          (1'b1               ),

.apb_clk            (                   ),
.apb_reset_n        (                   ),
.reg_psel           (apb_psel_cpu       ),
.reg_enable         (apb_enab_cpu       ),
.reg_rw             (apb_rw_cpu         ),
.reg_addr           (apb_addr_cpu       ),
.reg_datai          (apb_datai_cpu      ),
.reg_datao          (apb_datao_cpu      ),
.reg_ready_1        (1'b1               )
);

wire uart0_txd_i;
wire uart0_txd_o;
wire uart0_txd_oe;

wire uart0_rxd_i;
wire uart0_rxd_o;
wire uart0_rxd_oe;

UART_TOP uart0
(
.PCLK              (clk               ),
.clk_carrier       (1'b0              ),
.PRST_             (rst_n             ),
.PSEL              (apb_psel_cpu      ),
.PENABLE           (apb_enab_cpu      ),
.PADDR             (apb_addr_cpu[7:0] ),
.PWRITE            (apb_rw_cpu        ),
.PWDATA            (apb_datai_cpu     ),
.URT_PRDATA        (apb_datao_cpu     ),
.INT               (UART_int          ),
.TXD_o             (uart0_txd_o       ),
.TXD_i             (uart0_txd_i       ),
.TXD_oe            (uart0_txd_oe      ),
.RXD_o             (uart0_rxd_o       ),
.RXD_i             (uart0_rxd_i       ),
.RXD_oe            (uart0_rxd_oe      ),
.RTS               (                  ),
.CTS               (1'b0              ),
.DSR               (1'b0              ),
.DCD               (1'b0              ),
.DTR               (                  ),
.RI                (1'b0              )
);


IOBUF iobuf_tx(
    .I(uart0_txd_o),
    .O(uart0_txd_i),
    .T(uart0_txd_oe),
    .IO(UART_TX)
);

IOBUF iobuf_rx(
    .I(uart0_rxd_o),
    .O(uart0_rxd_i),
    .T(uart0_rxd_oe),
    .IO(UART_RX)
);

endmodule
