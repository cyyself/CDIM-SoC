/*------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Copyright (c) 2016, Loongson Technology Corporation Limited.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this 
list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, 
this list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.

3. Neither the name of Loongson Technology Corporation Limited nor the names of 
its contributors may be used to endorse or promote products derived from this 
software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
DISCLAIMED. IN NO EVENT SHALL LOONGSON TECHNOLOGY CORPORATION LIMITED BE LIABLE
TO ANY PARTY FOR DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--------------------------------------------------------------------------------
------------------------------------------------------------------------------*/

`define TIMER_ADDR     16'he000   //32'h1faf_e000 
module confreg(
    input aclk,
    input aresetn,

    input  [3 :0] s_awid,
    input  [31:0] s_awaddr,
    input  [7 :0] s_awlen,
    input  [2 :0] s_awsize,
    input  [1 :0] s_awburst,
    input         s_awlock,
    input  [3 :0] s_awcache,
    input  [2 :0] s_awprot,
    input         s_awvalid,
    output        s_awready,
    input  [31:0] s_wdata,
    input  [3 :0] s_wstrb,
    input         s_wlast,
    input         s_wvalid,
    output reg    s_wready,
    output [3 :0] s_bid,
    output [1 :0] s_bresp,
    output        s_bvalid,
    input         s_bready,
    input  [3 :0] s_arid,
    input  [31:0] s_araddr,
    input  [7 :0] s_arlen,
    input  [2 :0] s_arsize,
    input  [1 :0] s_arburst,
    input         s_arlock,
    input  [3 :0] s_arcache,
    input  [2 :0] s_arprot,
    input         s_arvalid,
    output        s_arready,
    output [3 :0] s_rid,
    output [31:0] s_rdata,
    output [1 :0] s_rresp,
    output        s_rlast,
    output        s_rvalid,
    input         s_rready
);
    
reg  [31:0] timer;

reg busy,write,R_or_W;

wire ar_enter = s_arvalid & s_arready;
wire r_retire = s_rvalid & s_rready & s_rlast;
wire aw_enter = s_awvalid & s_awready;
wire w_enter  = s_wvalid & s_wready & s_wlast;
wire b_retire = s_bvalid & s_bready;

assign s_arready = ~busy & (!R_or_W| !s_awvalid);
assign s_awready = ~busy & ( R_or_W| !s_arvalid);

always@(posedge aclk)
    if(~aresetn) busy <= 1'b0;
    else if(ar_enter|aw_enter) busy <= 1'b1;
    else if(r_retire|b_retire) busy <= 1'b0;

reg [3 :0] buf_id;
reg [31:0] buf_addr;
reg [7 :0] buf_len;
reg [2 :0] buf_size;
reg [1 :0] buf_burst;
reg        buf_lock;
reg [3 :0] buf_cache;
reg [2 :0] buf_prot;

always@(posedge aclk)
    if(~aresetn) begin
        R_or_W      <= 1'b0;
        buf_id      <= 'b0;
        buf_addr    <= 'b0;
        buf_len     <= 'b0;
        buf_size    <= 'b0;
        buf_burst   <= 'b0;
        buf_lock    <= 'b0;
        buf_cache   <= 'b0;
        buf_prot    <= 'b0;
    end
    else
    if(ar_enter | aw_enter) begin
        R_or_W      <= ar_enter;
        buf_id      <= ar_enter ? s_arid   : s_awid   ;
        buf_addr    <= ar_enter ? s_araddr : s_awaddr ;
        buf_len     <= ar_enter ? s_arlen  : s_awlen  ;
        buf_size    <= ar_enter ? s_arsize : s_awsize ;
        buf_burst   <= ar_enter ? s_arburst: s_awburst;
        buf_lock    <= ar_enter ? s_arlock : s_awlock ;
        buf_cache   <= ar_enter ? s_arcache: s_awcache;
        buf_prot    <= ar_enter ? s_arprot : s_awprot ;
    end

always@(posedge aclk)
    if(~aresetn) write <= 1'b0;
    else if(aw_enter) write <= 1'b1;
    else if(ar_enter)  write <= 1'b0;

always@(posedge aclk)
    if(~aresetn) s_wready <= 1'b0;
    else if(aw_enter) s_wready <= 1'b1;
    else if(w_enter & s_wlast) s_wready <= 1'b0;

reg [31:0] s_rdata;
reg s_rvalid,s_rlast;
wire [31:0] rdata_d = buf_addr[15:0] == `TIMER_ADDR ? timer     : 32'd0;

always@(posedge aclk)
    if(~aresetn) begin
        s_rdata  <= 'b0;
        s_rvalid <= 1'b0;
        s_rlast  <= 1'b0;
    end
    else if(busy & !write & !r_retire)
    begin
        s_rdata <= rdata_d;
        s_rvalid <= 1'b1;
        s_rlast <= 1'b1; 
    end
    else if(r_retire)
    begin
        s_rvalid <= 1'b0;
    end

reg s_bvalid;
always@(posedge aclk)   
    if(~aresetn) s_bvalid <= 1'b0;
    else if(w_enter) s_bvalid <= 1'b1;
    else if(b_retire) s_bvalid <= 1'b0;

assign s_rid   = buf_id;
assign s_bid   = buf_id;
assign s_bresp = 2'b0;
assign s_rresp = 2'b0;

//-------------------------------{timer}begin----------------------------//
wire write_timer = w_enter & (buf_addr[15:0]==`TIMER_ADDR);
always @(posedge aclk)
begin
    if(!aresetn)
    begin
        timer <= 32'd0;
    end
    else if (write_timer)
    begin
        timer <= s_wdata[31:0];
    end
    else
    begin
        timer <= timer + 1'b1;
    end
end
//--------------------------------{timer}end-----------------------------//

endmodule
