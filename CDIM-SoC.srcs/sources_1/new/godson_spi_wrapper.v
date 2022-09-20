`timescale 1ns / 1ps

module godson_spi_wrapper # (
    parameter spi_addr = 16'h1fe8
)
(
    input           aclk,
    input           aresetn,
    input [3:0]     s_awlen,
    input [3:0]     s_awcache,
    input [3:0]     s_awid,
    input [31:0]    s_awaddr,
    input [2:0]     s_awsize,
    input [2:0]     s_awprot,
    input [1:0]     s_awburst,
    input [1:0]     s_awlock,
    input           s_awvalid,
    output          s_awready,

    input [3:0]     s_wid,
    input [31:0]    s_wdata,
    input [3:0]     s_wstrb,
    input           s_wlast,
    input           s_wvalid,
    output          s_wready,

    output [3:0]    s_bid,
    output [1:0]    s_bresp,
    output          s_bvalid,
    input           s_bready,

    input [3:0]     s_arlen,  
    input [3:0]     s_arcache,
    input [3:0]     s_arid,
    input [31:0]    s_araddr,
    input [2:0]     s_arsize,
    input [2:0]     s_arprot,
    input [1:0]     s_arburst,
    input [1:0]     s_arlock,
    input           s_arvalid,
    output          s_arready,

    output [3:0]    s_rid,
    output [31:0]   s_rdata,
    output [1:0]    s_rresp,
    output          s_rlast,
    output          s_rvalid,
    input           s_rready,
    
    // output          SPI_CLK,
    output          SPI_CS,
    inout           SPI_MISO,
    inout           SPI_MOSI,
    
    output          inta_o
    );
    
//spi
wire [3:0]spi_csn_o ;
wire [3:0]spi_csn_en;
wire spi_sck_o ;
wire spi_sdo_i ;
wire spi_sdo_o ;
wire spi_sdo_en;
wire spi_sdi_i ;
wire spi_sdi_o ;
wire spi_sdi_en;

IOBUF iobuf_mosi (
    .O(spi_sdo_i),
    .IO(SPI_MOSI),
    .I(spi_sdo_o),
    .T(spi_sdo_en)
);

IOBUF iobuf_miso (
    .O(spi_sdi_i),
    .IO(SPI_MISO),
    .I(spi_sdi_o),
    .T(spi_sdi_en)
);

// assign     SPI_CLK = spi_sck_o;
assign     SPI_CS  = ~spi_csn_en[0] & spi_csn_o[0];

STARTUPE2 #(
.PROG_USR("FALSE"), // Activate program event security feature. Requires encrypted bitstreams.
.SIM_CCLK_FREQ(0.0) // Set the Configuration Clock Frequency(ns) for simulation
)
STARTUPE2_inst
(
.CFGCLK(), // 1-bit output: Configuration main clock output
.CFGMCLK(), // 1-bit output: Configuration internal oscillator clock output
.EOS(), // 1-bit output: Active high output signal indicating the End Of Startup.
.PREQ(), // 1-bit output: PROGRAM request to fabric output
.CLK(0), // 1-bit input: User start-up clock input
.GSR(0), // 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
.GTS(0), // 1-bit input: Global 3-state input (GTS cannot be used for the port name)
.KEYCLEARB(0), // 1-bit input: Clear AES Decrypter Key input from Battery-Backed RAM (BBRAM)
.PACK(0), // 1-bit input: PROGRAM acknowledge input
.USRCCLKO(spi_sck_o), // 1-bit input: User CCLK input
.USRCCLKTS(0), // 1-bit input: User CCLK 3-state enable input
.USRDONEO(1), // 1-bit input: User DONE pin output control
.USRDONETS(1) // 1-bit input: User DONE 3-state enable outpu
);

spi_flash_ctrl SPI                    
(                                         
.aclk           (aclk              ),       
.aresetn        (aresetn           ),       
.spi_addr       (spi_addr          ),
.fast_startup   (1'b0              ),
.s_awid         (s_awid            ),
.s_awaddr       (s_awaddr          ),
.s_awlen        (s_awlen           ),
.s_awsize       (s_awsize          ),
.s_awburst      (s_awburst         ),
.s_awlock       (s_awlock          ),
.s_awcache      (s_awcache         ),
.s_awprot       (s_awprot          ),
.s_awvalid      (s_awvalid         ),
.s_awready      (s_awready         ),
.s_wready       (s_wready          ),
.s_wid          (s_wid             ),
.s_wdata        (s_wdata           ),
.s_wstrb        (s_wstrb           ),
.s_wlast        (s_wlast           ),
.s_wvalid       (s_wvalid          ),
.s_bid          (s_bid             ),
.s_bresp        (s_bresp           ),
.s_bvalid       (s_bvalid          ),
.s_bready       (s_bready          ),
.s_arid         (s_arid            ),
.s_araddr       (s_araddr          ),
.s_arlen        (s_arlen           ),
.s_arsize       (s_arsize          ),
.s_arburst      (s_arburst         ),
.s_arlock       (s_arlock          ),
.s_arcache      (s_arcache         ),
.s_arprot       (s_arprot          ),
.s_arvalid      (s_arvalid         ),
.s_arready      (s_arready         ),
.s_rready       (s_rready          ),
.s_rid          (s_rid             ),
.s_rdata        (s_rdata           ),
.s_rresp        (s_rresp           ),
.s_rlast        (s_rlast           ),
.s_rvalid       (s_rvalid          ),

.power_down_req (1'b0              ),
.power_down_ack (                  ),
.csn_o          (spi_csn_o         ),
.csn_en         (spi_csn_en        ), 
.sck_o          (spi_sck_o         ),
.sdo_i          (spi_sdo_i         ),
.sdo_o          (spi_sdo_o         ),
.sdo_en         (spi_sdo_en        ), // active low
.sdi_i          (spi_sdi_i         ),
.sdi_o          (spi_sdi_o         ),
.sdi_en         (spi_sdi_en        ),
.inta_o         (inta_o            )
);

endmodule
