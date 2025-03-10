
----------------------------------------------------------------------------
-- Company:      Riven Hexagon
-- Copyright:    © 2025 Riven Hexagon
-- Engineer:     Kolja Sacharow
-- 
-- Create Date:  27.02.2025
-- Module Name:  Fetch_Stage
-- Project Name: Pynq_Y86 Y86_PynqZ1

-- Description:  
-- Loads an updated IDELAY value on any bit change of the IDELAY_IN bits, if
-- the IDELAYE2 is configured as VAR_LOAD instead of FIXED.
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library pkg_Pynq_Y86;
use work.pkg_Pynq_Y86.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

----------------------------------------------------------------------------

entity Pynq_Y86 is
    port (
        DDR_addr         :      inout   std_logic_vector(14 downto 0);
        DDR_ba           :      inout   std_logic_vector(2 downto 0);
        DDR_cas_n        :      inout   std_logic;
        DDR_ck_n         :      inout   std_logic;
        DDR_ck_p         :      inout   std_logic;
        DDR_cke          :      inout   std_logic;
        DDR_cs_n         :      inout   std_logic;
        DDR_dm           :      inout   std_logic_vector(3 downto 0);
        DDR_dq           :      inout   std_logic_vector(31 downto 0);
        DDR_dqs_n        :      inout   std_logic_vector(3 downto 0);
        DDR_dqs_p        :      inout   std_logic_vector(3 downto 0);
        DDR_odt          :      inout   std_logic;
        DDR_ras_n        :      inout   std_logic;
        DDR_reset_n      :      inout   std_logic;
        DDR_we_n         :      inout   std_logic;
        FIXED_IO_ddr_vrn :      inout   std_logic;
        FIXED_IO_ddr_vrp :      inout   std_logic;
        FIXED_IO_mio     :      inout   std_logic_vector(53 downto 0);
        FIXED_IO_ps_clk  :      inout   std_logic;
        FIXED_IO_ps_porb :      inout   std_logic;
        FIXED_IO_ps_srstb:      inout   std_logic;
        sws_2bits_tri_i  :      in      std_logic_vector(1 downto 0);
        
        leds_4bits_tri_o:       out     std_logic_vector(3 downto 0);
        rgbleds_6bits_tri_o :   out     std_logic_vector(5 downto 0)
        );
    end Pynq_Y86;

architecture Behavioral of Pynq_Y86 is

----------------------------------------------------------------------------
-- COMPONENTS
--------------------------- 7 ----- 9 --------------------------------------

component Fetch_Stage is
    port (
        RS:                 in      std_logic;
        CLK:                in      std_logic;
        valM:               in      std_logic_vector(bwMem-1 downto 0);

        need_regIDs:        out     std_logic;
        need_valC:          out     std_logic;
        instr_valid:        out     std_logic;
        imem_error:         out     std_logic;
        icode:              out     std_logic_vector( 3 downto 0);
        ifunc:              out     std_logic_vector( 3 downto 0);
        srcA:               out     std_logic_vector( 3 downto 0);
        srcB:               out     std_logic_vector( 3 downto 0);
        valC:               out     std_logic_vector(15 downto 0);
        valP:               out     std_logic_vector(bwAddr-1 downto 0)
        );
    end component;

component Memory_Stage is
    port (
        RS:                 in      std_logic;
        CLK:                in      std_logic;
        valP:               in      std_logic_vector(bwAddr-1 downto 0);
        valA:               in      std_logic_vector(bwReg-1 downto 0);
        valE:               in      std_logic_vector(bwReg-1 downto 0);
        icode:              in      std_logic_vector(3 downto 0);
        instr_valid:        in      std_logic;
        imem_error:         in      std_logic;

        BRAM_PORTA_0_addr:  in      STD_LOGIC_VECTOR ( 12 downto 0 );
        BRAM_PORTA_0_clk:   in      STD_LOGIC;
        BRAM_PORTA_0_din:   in      STD_LOGIC_VECTOR ( 31 downto 0 );
        BRAM_PORTA_0_en:    in      STD_LOGIC;
        BRAM_PORTA_0_rst:   in      STD_LOGIC;
        BRAM_PORTA_0_we:    in      STD_LOGIC_VECTOR ( 3 downto 0 );

        BRAM_PORTA_0_dout:  out     STD_LOGIC_VECTOR ( 31 downto 0 );
        valM:               out     std_logic_vector(bwMem-1 downto 0)
        );
    end component;

component Pynq_Interface is
    port (
        sws_2bits_tri_i:    in      STD_LOGIC_VECTOR ( 1 downto 0 );
        BRAM_PORTA_0_addr:  out     STD_LOGIC_VECTOR ( 12 downto 0 );
        BRAM_PORTA_0_clk:   out     STD_LOGIC;
        BRAM_PORTA_0_din:   out     STD_LOGIC_VECTOR ( 31 downto 0 );
        BRAM_PORTA_0_dout:  in      STD_LOGIC_VECTOR ( 31 downto 0 );
        BRAM_PORTA_0_en:    out     STD_LOGIC;
        BRAM_PORTA_0_rst:   out     STD_LOGIC;
        BRAM_PORTA_0_we:    out     STD_LOGIC_VECTOR ( 3 downto 0 );
        pwm0_0:             out     STD_LOGIC;
        peripheral_aresetn_0: out   STD_LOGIC_VECTOR ( 0 to 0 );
        DDR_cas_n:          inout   STD_LOGIC;
        DDR_cke:            inout   STD_LOGIC;
        DDR_ck_n:           inout   STD_LOGIC;
        DDR_ck_p:           inout   STD_LOGIC;
        DDR_cs_n:           inout   STD_LOGIC;
        DDR_reset_n:        inout   STD_LOGIC;
        DDR_odt:            inout   STD_LOGIC;
        DDR_ras_n:          inout   STD_LOGIC;
        DDR_we_n:           inout   STD_LOGIC;
        DDR_ba:             inout   STD_LOGIC_VECTOR ( 2 downto 0 );
        DDR_addr:           inout   STD_LOGIC_VECTOR ( 14 downto 0 );
        DDR_dm:             inout   STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_dq:             inout   STD_LOGIC_VECTOR ( 31 downto 0 );
        DDR_dqs_n:          inout   STD_LOGIC_VECTOR ( 3 downto 0 );
        DDR_dqs_p:          inout   STD_LOGIC_VECTOR ( 3 downto 0 );
        FIXED_IO_mio:       inout   STD_LOGIC_VECTOR ( 53 downto 0 );
        FIXED_IO_ddr_vrn:   inout   STD_LOGIC;
        FIXED_IO_ddr_vrp:   inout   STD_LOGIC;
        FIXED_IO_ps_srstb:  inout   STD_LOGIC;
        FIXED_IO_ps_clk:    inout   STD_LOGIC;
        FIXED_IO_ps_porb:   inout   STD_LOGIC;
        FCLK_CLK0:          out     STD_LOGIC
        );
    end component Pynq_Interface;

----------------------------------------------------------------------------
-- SIGNALS
--------------------------- 7 ----- 9 --------------------------------------

signal clk:                         std_logic;
signal rstn:                        std_logic;
signal RS:                          std_logic;

signal BRAM_addr:                   std_logic_vector(12 downto 0);
signal BRAM_clk:                    std_logic;
signal BRAM_din:                    std_logic_vector(31 downto 0);
signal BRAM_dout:                   std_logic_vector(31 downto 0);
signal BRAM_en:                     std_logic;
signal BRAM_rst:                    std_logic;
signal BRAM_we:                     std_logic_vector(3 downto 0);

signal leds_i:                      std_logic_vector(3 downto 0);
signal cpu_reg0_0:                  std_logic_vector(31 downto 0);
signal pwm0_0:                      std_logic;

signal srcA:                        std_logic_vector(3 downto 0);
signal srcB:                        std_logic_vector(3 downto 0);
signal valC:                        std_logic_vector(15 downto 0);
signal valP:                        std_logic_vector(bwAddr-1 downto 0);
signal valM:                        std_logic_vector(bwMem-1 downto 0);

signal need_regIDs:                 std_logic;
signal need_valC:                   std_logic;
signal instr_valid:                 std_logic;
signal imem_error:                  std_logic;
signal icode:                       std_logic_vector(3 downto 0);
signal ifunc:                       std_logic_vector(3 downto 0);
signal fuck:                        std_logic_vector(3 downto 0);

--BRAM Port A Signals
signal BRAM_PORTA_0_addr:           std_logic_vector (12 downto 0);
signal BRAM_PORTA_0_clk:            std_logic;                      
signal BRAM_PORTA_0_din:            std_logic_vector (31 downto 0);
signal BRAM_PORTA_0_en:             std_logic;                      
signal BRAM_PORTA_0_rst:            std_logic;                      
signal BRAM_PORTA_0_we:             std_logic_vector ( 3 downto 0);
signal BRAM_PORTA_0_dout:           std_logic_vector (31 downto 0);      

----------------------------------------------------------------------------

begin

----------------------------------------------------------------------------
-- PROCESSES AND CONNECTIONS
--------------------------- 7 ----- 9 --------------------------------------
                                    
RS                          <= not RSTN;

-- LD4
rgbleds_6bits_tri_o(2)      <= pwm0_0 and BRAM_addr(0); --R
rgbleds_6bits_tri_o(1)      <= pwm0_0 and BRAM_addr(1); --G
rgbleds_6bits_tri_o(0)      <= pwm0_0 and BRAM_addr(2); --B
-- LD5
rgbleds_6bits_tri_o(5)      <= pwm0_0 and (not instr_valid);--rt
rgbleds_6bits_tri_o(4)      <= pwm0_0 and need_valC;--gn
rgbleds_6bits_tri_o(3)      <= pwm0_0 and need_regIDs;--bl

--leds_4bits_tri_o(0)        <= pwm0_0 and BRAM_addr(0);
--leds_4bits_tri_o(1)        <= pwm0_0 and BRAM_addr(1);
--leds_4bits_tri_o(2)        <= pwm0_0 and BRAM_addr(2);
--leds_4bits_tri_o(3)        <= pwm0_0 and BRAM_addr(3);

leds_4bits_tri_o(0)        <= pwm0_0 and BRAM_dout(0);
leds_4bits_tri_o(1)        <= pwm0_0 and BRAM_dout(1);
leds_4bits_tri_o(2)        <= pwm0_0 and BRAM_dout(2);
leds_4bits_tri_o(3)        <= pwm0_0 and BRAM_dout(3);

----------------------------------------------------------------------------
-- PORT MAPS
--------------------------- 7 ----- 9 --------------------------------------

Fetch_Stage_inst: 
Fetch_Stage
    port map (
        RS                          => RS,
        CLK                         => CLK,
        valM                        => valM,

        need_regIDs                 => need_regIDs,
        need_valC                   => need_valC,
        instr_valid                 => instr_valid,
        imem_error                  => imem_error,
        icode                       => icode,
        ifunc                       => ifunc,
        srcA                        => srcA,
        srcB                        => srcB,
        valC                        => valC,
        valP                        => valP
        );

----------------------------------------------------------------------------

Memory_Stage_inst:
Memory_Stage
    port map (
        RS                          => RS,
        CLK                         => CLK,
        valP                        => valP,
        valA                        => (others => '0'),
        valE                        => (others => '0'),
        icode                       => icode,
        instr_valid                 => instr_valid,
        imem_error                  => imem_error,

        BRAM_PORTA_0_addr           => BRAM_PORTA_0_addr,
        BRAM_PORTA_0_clk            => BRAM_PORTA_0_clk,
        BRAM_PORTA_0_din            => BRAM_PORTA_0_din,
        BRAM_PORTA_0_en             => BRAM_PORTA_0_en,
        BRAM_PORTA_0_rst            => BRAM_PORTA_0_rst,
        BRAM_PORTA_0_we             => BRAM_PORTA_0_we,

        BRAM_PORTA_0_dout           => BRAM_PORTA_0_dout,
        valM                        => valM
        );

----------------------------------------------------------------------------

Pynq_Interface_i:
--entity work.
Pynq_Interface
    port map (
        -- Internal connections
        BRAM_PORTA_0_addr           => BRAM_addr,
        BRAM_PORTA_0_clk            => BRAM_clk,
        BRAM_PORTA_0_din            => BRAM_din,
        BRAM_PORTA_0_dout           => BRAM_dout,
        BRAM_PORTA_0_en             => BRAM_en,
        BRAM_PORTA_0_rst            => BRAM_rst,
        BRAM_PORTA_0_we             => BRAM_we,
        peripheral_aresetn_0(0)     => rstn,
        FCLK_CLK0                   => clk,

        -- External connections
        DDR_addr                    => DDR_addr,
        DDR_ba                      => DDR_ba,
        DDR_cas_n                   => DDR_cas_n,
        DDR_ck_n                    => DDR_ck_n,
        DDR_ck_p                    => DDR_ck_p,
        DDR_cke                     => DDR_cke,
        DDR_cs_n                    => DDR_cs_n,
        DDR_dm                      => DDR_dm,
        DDR_dq                      => DDR_dq,
        DDR_dqs_n                   => DDR_dqs_n,
        DDR_dqs_p                   => DDR_dqs_p,
        DDR_odt                     => DDR_odt,
        DDR_ras_n                   => DDR_ras_n,
        DDR_reset_n                 => DDR_reset_n,
        DDR_we_n                    => DDR_we_n,
        FIXED_IO_ddr_vrn            => FIXED_IO_ddr_vrn,
        FIXED_IO_ddr_vrp            => FIXED_IO_ddr_vrp,
        FIXED_IO_mio                => FIXED_IO_mio,
        FIXED_IO_ps_clk             => FIXED_IO_ps_clk,
        FIXED_IO_ps_porb            => FIXED_IO_ps_porb,
        FIXED_IO_ps_srstb           => FIXED_IO_ps_srstb,
        pwm0_0                      => pwm0_0,
        sws_2bits_tri_i             => sws_2bits_tri_i
        );

----------------------------------------------------------------------------

end Behavioral;
