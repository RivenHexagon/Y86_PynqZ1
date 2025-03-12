
----------------------------------------------------------------------------
-- Company:      Riven Hexagon
-- Copyright:    © 2025 Riven Hexagon
-- Engineer:     Kolja Sacharow
-- 
-- Create Date:  10.05.2025
-- Module Name:  SEQ_BRAM
-- Project Name: Pynq_Y86

-- Description:  
-- 
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library pkg_Pynq_Y86;
use work.pkg_Pynq_Y86.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

----------------------------------------------------------------------------

entity SEQ_BRAM is
    port (
      --Port A
        ENA  :              IN      std_logic;                         
        WEA  :              IN      std_logic_vector( 3 downto 0);     
        ADDRA:              IN      std_logic_vector(10 downto 0);     
        DINA :              IN      std_logic_vector(31 downto 0);     
        DOUTA:              OUT     std_logic_vector(31 downto 0);     
        CLKA :              IN      std_logic;                         
      --Port B
        ENB  :              IN      std_logic;                         
        WEB  :              IN      std_logic_vector( 3 downto 0);     
        ADDRB:              IN      std_logic_vector(10 downto 0);     
        DINB :              IN      std_logic_vector(31 downto 0);     
        valM:               OUT     std_logic_vector(bwmem-1 downto 0);
        CLKB :              IN      std_logic                
        );
    end SEQ_BRAM;

architecture Behavioral of SEQ_BRAM is

----------------------------------------------------------------------------
-- SIGNALS
--------------------------- 7 ----- 9 --------------------------------------



----------------------------------------------------------------------------
-- COMPONENTS
--------------------------- 7 ----- 9 --------------------------------------

Component blk_mem_gen_1 is
    port (
      --Port A
        CLKA :              in      std_logic;
        ENA  :              in      std_logic;
        WEA  :              in      std_logic_vector(  3 downto 0);
        ADDRA:              in      std_logic_vector(bwAddr-1 downto 0);
        DINA :              in      std_logic_vector( 31 downto 0);
        DOUTA:              out     std_logic_vector( 31 downto 0);
      --Port B
        CLKB :              in      std_logic;
        ENB  :              in      std_logic;
        WEB  :              in      std_logic_vector(  3 downto 0);
        ADDRB:              in      std_logic_vector( 10 downto 0);
        DINB :              in      std_logic_vector( 31 downto 0);
        DOUTB:              out     std_logic_vector(127 downto 0)
        );
    END COMPONENT;

----------------------------------------------------------------------------
-- CONSTANTS & SIGNALS
--------------------------- 7 ----- 9 --------------------------------------

signal ADDRBi:                      std_logic_vector(10 downto 0);
signal DOUTB:                       std_logic_vector(127 downto 0);

----------------------------------------------------------------------------

begin

----------------------------------------------------------------------------
-- PROCESSES AND CONNECTIONS
--------------------------- 7 ----- 9 --------------------------------------

ADDRBi  <= ADDRB(10 downto 2) & "00";

with ADDRB(1 downto 0) select
    valM <= DOUTB(47 downto  0)  when "00",
            DOUTB(55 downto  8)  when "01",
            DOUTB(63 downto 16)  when "10",
            DOUTB(71 downto 24)  when "11",
                (others => '0')  when others;

----------------------------------------------------------------------------
-- PORT MAPS SEQ_BRAM
--------------------------- 7 ----- 9 --------------------------------------

DualPortBRAM:
blk_mem_gen_1
    PORT MAP (
      --Port A
        ENA                         => ENA,
        WEA                         => WEA,
        ADDRA                       => ADDRA,
        DINA                        => DINA,
        DOUTA                       => DOUTA,
        CLKA                        => CLKA,
      --Port B
        ENB                         => ENB,
        WEB                         => WEB,
        ADDRB                       => ADDRBi,
        DINB                        => DINB,
        DOUTB                       => DOUTB,
        CLKB                        => CLKB
        );

----------------------------------------------------------------------------

end Behavioral;

-- END --
