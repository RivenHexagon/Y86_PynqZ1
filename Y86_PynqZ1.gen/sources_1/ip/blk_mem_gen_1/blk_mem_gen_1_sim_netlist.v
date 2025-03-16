// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Mar 13 03:04:18 2025
// Host        : Nidan running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/user0/Projects/Project-Files-Local/Xilinx/Vivado/Y86_PynqZ1/Y86_PynqZ1.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_9,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_9,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_1
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_mode = "slave BRAM_PORTA" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_mode = "slave BRAM_PORTB" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_ADDRESS_MODE BYTE_ADDRESS, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [10:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [63:0]doutb;

  wire [10:0]addra;
  wire [10:0]addrb;
  wire clka;
  wire clkb;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [63:0]doutb;
  wire ena;
  wire enb;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     11.166049 mW" *) 
  (* C_FAMILY = "zynq" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "1" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "64" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_1_blk_mem_gen_v8_4_9 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
        .regcea(1'b1),
        .regceb(1'b1),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2024.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
FPXllyX2NFs/RMngGqZy2bLYbZr92CdofeZrJOHklWXExpaPgHNYp2Lzm4MnflbnrfSkCmLwwKT5
zfRgEip7FKQ5Zhb73p0MAIADixBZ/ZRt4hQkJL0T9brm0waLHfanjnov2aCX6jN3LbQc3ujmDga6
Dd73k78u4xjRTDv1/P4=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kr7VKKvChFoiyRCReag+OvU3jnmG9pN0cv+BxhNmMKLthg/ksgNZyU3L+fQ7cmIQELtlUjwjkBAP
Jjq5RsCnHbJxj+Ys1GNhriiBsxLqxWCP8onhAVvgZN2xZFOih0UWpqlU8NVP8Eww1ohvkDgxTstC
3kDmYehxIUJjqCC/mgRZmuezqugrFdubYmBoz16tUvD17iA5qqCIMS9xSIXYp2LBNekmWEwrVqzu
R4koEo4UlXl/CEw0XY3QvMoHnlXgu6N/6sc+nxZtKSwjiMVvGnZE9UVvJPAC3Hn3zKFGlK53mmGO
Tj0dWzhwX0ahSYzkyJC/HLdbGZmriL2UNvDyFw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
CaLc9FGt3AdRHfNtGAsGFY/QEvHY1Vv4TvvgCDsdDMqiuDeLizFJDJeskBWjeKDoE2cufK8TxiBq
mySRQNJoeOKnxTiDdf+Rx6m0iR6h/YeswegYwgghpM5KVrl6mSwF3+4yEovPM7a+9ArDQ5vl+WT8
SilNGzyW0KnTwe7+szs=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cEnudSW1X71p0Xuq6jrXOxHnBku87IA0RA3zKqmeZHZM0r+9rEm5MSzX8RecnQ994yiqeyxbIH2l
fGEzUzr0ZzryS3fkf2LnJuB39f2YARW9eVCSiaeWaraZuY1l89T+h3vgdlurS/1LIraYLS1MyOXa
6F1LAcQp3W4OO4ctc3q1FRMZGldRS1biMsKwJ8Lxj8NEOm67UfgFrJNQAxbVXEfbWRWhKtwNxcTB
JbgC8j4EHkIA46mzoHloeBAL6KieplQUBjKXSSTb66rxglbFhWLy+mirROHcocu9J4ZbvTRYZEww
4lso1lqAllVLAoKYqa3WImZuSRoTbGDngBt9Lg==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rOyI+x4PlmKcVSFoN3oKgSYpVlmYxc194Ej04il/YmBg10xopy4zmtu5sdCP/uGSNYcNGWeAiw01
mNf98KyNgTUFXruHCA38qjhhEIvl4vfWWn3W3mFRxrIuwmnreT6qTvgMaxIkCdVBDP7Iy7O6WmCf
3Va5X5hnCHhtXgX5UYniBHiLjmupv63B8XMAYDH2n6mQ3H0DF7mtb7psBafd0Z6+IWUbmzwMtKrf
ZrRJBGAhNT0i1KrEjEh/rWjN7Z7N32zQ+Pl1kc5gYCQIX5McfdTdqSaRVXZ/HF90ymS7/8d5LDyj
Er+ORdcjnOn6oAyY4PuUUl4OYUHv5k+RglTe5Q==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2023_11", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bJa7kPSpDipzoJoQu1APEjc8vFLqBfQZK/grZvWijD7/FgMTerFCWLUY6n8DWeGdvjXvTeyrqCHE
2rP/H57wUqPC8tIJlGm6ZYQGjZ3TgYqLrJshDE5zYMTO//q0vuSraWvZP7A7SLuW6y7tFE/nplpx
L8gbYORx6j70okGUwnamCMS9yhFr7Z2QTJne1k4GNFGvy66URk3k5cBPl5j4/1yc4xGV+aWYl6L8
q8RorRU/CltObHKrji/jdiY1WtdGrkpRyCEFc+XNPazL9xSLLu5bz6XlvKwoks+8a5KYT/VFUovM
JbM0bpAXM8Z7rGaPuXjqXtZBg5praTZLu/WNcA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PYKBDinOGc/kIVdFzXrz2wA4/QNFxLDrQfTWfR5TjYE6bm49vrZi0bawcr9HXp4OP1+XxPLB3oCP
oV5e/rYeDln531ebt8yEg27XCoSHEX4FU8oG8aBJ8fqgWayOnAMJt025WodOxuZXbhT1zPo7J3uh
6iO9Mv7RtYE2fZ1W+G8oN//FTOEJYPWlKYnt0cDeZrN3I4rHHptZHuu7l8T+df0PYea3x6U3Mvkl
ojZ+TwQtdu0NuYY5j3QNgx3+W2XYq1M773FAnEz/deW54EjE+jf1jjrBk2pl8SYxeKuutS15oPVF
eHdqXYVcJxoUY5JH8z04lITKEnZ4oq6sYS6dog==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
tl+2vFCWZ583gQGsVC7oopz2NCKBiJ9uOHYBGzJZheOHJMqI/ehNvo25l710eBx00tztXzM30AH6
ZhAJg+kJwE2jO0MV5fmG5dnwXmLqoGEJMBs7xwWxvYK7w/0z9M0AJKD7HnuC+IiLhNU/fIxyuE+I
+vWqp//RcfY0tMMp2I2J1yEW6GUahS1ve/4JchssZ7Xu7VthoSDWXMQWATbvsUsDzeSo2+Ruz8Kq
Dc05HqEU8NgBxDPPEKLCcdKLp4byglwj7iCAtCjsPy8P18qjgb2sycFjNgmaiNMMB51WqeD+hneG
hLOue9bqVdEojkrb3q4WbsGZKz0bAGsryxslOlYHP1b8vey3yI2ixA80wyERe8d3GRIeZiSxGykH
qWxsE6x/iyi8QRb5mXZPMApA+Fln8tYmn7+1rFCm8gF4gJWhr1PsSJqTi658symGrzT0Ghjvf2QL
SvvoaeNdy0pOsWs7jLBFndd4GiFA+9K6Y33sziLToU9EvvFokENIslod

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
oYiCujFRj1F3wKsGZlHR9niEtR9MLXEVAVfy+f/3xrmpW6Ye5a+fBCvm4TH+iRQefGHNdMPnzTNW
K/pEPAS9uMJjOdFiu+APT+LYrSRnEg4W0dX5buSDGM6LBWAuMseoTMjbJJoYDGLRckJgW43E30mX
ej4823nkbfwc+Ecbrup825qLyv8RTQLNHafvJA5lSapdqXwnlOIYRmcHn+sfAh5pGv9kW9aokcdh
ObR2XYxX99rYloyvz3x0pmjxD5ILW4SQMB1IUEuuyqX6eb5IQ+kZ41hjvsHIuQH29vzpCfV9Jqha
WC5yxxK1R+cleZSKD1H1gVzbTei8uFs/91Bgeg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
urNc+S8AFPj+GVFdqJE5V7P8O6QI6MA3nkwYb8NKbYbVufnXKg6voJIRYYeYr7EOa8mrqirozWbY
Lln9SLWnkaAy2LvL/N6WahoQdCt++4RH+xe768XvSrVUFPrIwZRixqMLurc/tPov4i5P/ukZKl18
ZPZvXRzUNlvCZnMPcF+5QCQihqPbjcZ0YyGgWgX/ipTGG3sNqmylGN7qLa4Rgqu/mB5a2xVyu5Wc
911+/X3VVFx697WVaP5V0SbOzYN8R8+8B8kdznwixMA+f4lSbBXyRysVOSzYjo8bKEMqyKMVBQn9
xDmEuV0DvVWXdO7VPvWA1LuJFwS07OxeI2GCcQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QcP7fsLZxaDrG29e9HQeXfu2TsKsdyW7Yc1vWct6lbmDEfXkWMU1fFWSPIjPzRc9UOnfEu0bRn+B
D+8MWokqes3WF7txljBmgUPiNGZ8arUU6ENa/IY/Wv7iaB/ZKM5PtdnFAkjDIrYyKFCTz/U6Yzwi
hBGGarK/wYQOLzeeKRewiPTiNUL7tztWuMZ1t1msxD951EeKrwjrjcXIIuf/TzrOGUOlWgjHlnrl
4Q/lfMAnRLBNTSWG+5wWewCE8jK2X/gJ5AV4p3x1WP3+JglbxpP39l3pzedXqciZPbuz2XlFnRPV
KByaUaAShzJ56p8+0HjWebibqQdieGNPiPWW0Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 48016)
`pragma protect data_block
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
C29GS4ZwY4P3rpsRtnc8/oe/X3r0uA==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
