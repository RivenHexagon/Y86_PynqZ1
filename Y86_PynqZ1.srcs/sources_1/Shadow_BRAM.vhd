
----------------------------------------------------------------------------
-- Company:      Riven Hexagon
-- Copyright:    © 2025 Riven Hexagon
-- Engineer:     Kolja Sacharow
-- 
-- Create Date:  10.05.2025
-- Module Name:  Shadow_BRAM
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

entity Shadow_BRAM is
    port (
      --Port A
        ENA  :              IN      std_logic;                         
        WEA  :              IN      std_logic_vector( 3 downto 0);     
        ADDRA:              IN      std_logic_vector(bwAddr-1 downto 0);     
        DINA :              IN      std_logic_vector(31 downto 0);     
        DOUTA:              OUT     std_logic_vector(31 downto 0);     
        CLKA :              IN      std_logic;                         
      --Port B
        ENB  :              IN      std_logic;                         
        WEB  :              IN      std_logic_vector( 3 downto 0);     
        ADDRB:              IN      std_logic_vector(bwAddr-1 downto 0);     
        DINB :              IN      std_logic_vector(bwReg-1 downto 0);     
        DOUTB:              OUT     std_logic_vector(bwFtch-1 downto 0);
        CLKB :              IN      std_logic                
        );
    end Shadow_BRAM;

architecture Behavioral of Shadow_BRAM is

----------------------------------------------------------------------------
-- SIGNALS
--------------------------- 7 ----- 9 --------------------------------------



----------------------------------------------------------------------------
-- COMPONENTS
--------------------------- 7 ----- 9 --------------------------------------

COMPONENT blk_mem_gen_1 is
    PORT (
      --Port A
        CLKA :              in      std_logic;
        ENA  :              in      std_logic;
        WEA  :              in      std_logic_vector( 3 downto 0);
        ADDRA:              in      std_logic_vector(bwAddr-1 downto 0);
        DINA :              in      std_logic_vector( 31 downto 0);
        DOUTA:              out     std_logic_vector( 31 downto 0);
      --Port B
        CLKB :              in      std_logic;
        ENB  :              in      std_logic;
        WEB  :              in      std_logic_vector( 3 downto 0);
        ADDRB:              in      std_logic_vector(bwAddr-1 downto 0);
        DINB :              in      std_logic_vector(bwReg-1 downto 0);
        DOUTB:              out     std_logic_vector(2*bwReg-1 downto 0)
        );
    END COMPONENT;

----------------------------------------------------------------------------
-- CONSTANTS & SIGNALS
--------------------------- 7 ----- 9 --------------------------------------

signal addr0:                       std_logic_vector(bwAddr-1 downto 0);
signal addr1:                       std_logic_vector(bwAddr-1 downto 0);


signal DOUTB0:                      std_logic_vector(2*bwReg-1 downto 0);
signal DOUTB1:                      std_logic_vector(2*bwReg-1 downto 0);
signal DOUTB10:                     std_logic_vector(4*bwReg-1 downto 0);
signal DOUTBi:                      std_logic_vector(bwFtch-1 downto 0);

----------------------------------------------------------------------------

begin

----------------------------------------------------------------------------
-- PROCESSES AND CONNECTIONS
--------------------------- 7 ----- 9 --------------------------------------

addr0 <= ADDRB(bwAddr-1 downto 2) & "00";
addr1 <= std_logic_vector( unsigned(ADDRB) + 8 );

DOUTB10 <= DOUTB1 & DOUTB0;

with ADDRB(1 downto 0) select
    DOUTB <= DOUTB10(bwFtch-1  downto  0)  when "00",
             DOUTB10(bwFtch+7  downto  8)  when "01",
             DOUTB10(bwFtch+15 downto 16)  when "10",
             DOUTB10(bwFtch+23 downto 24)  when "11",
                          (others => '0')  when others;

--DOUTB <= x"000000000000";

----------------------------------------------------------------------------
-- PORT MAPS Shadow_BRAM
--------------------------- 7 ----- 9 --------------------------------------

bmg0:
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
        ADDRB                       => addr0,
        DINB                        => DINB,
        DOUTB                       => DOUTB0,
        CLKB                        => CLKB
        );

bmg1:
blk_mem_gen_1
    PORT MAP (
      --Port A
        ENA                         => ENA,
        WEA                         => WEA,
        ADDRA                       => ADDRA,
        DINA                        => DINA,
        DOUTA                       => open,
        CLKA                        => CLKA,
      --Port B
        ENB                         => ENB,
        WEB                         => WEB,
        ADDRB                       => addr1,
        DINB                        => DINB,
        DOUTB                       => DOUTB1,
        CLKB                        => CLKB
        );

----------------------------------------------------------------------------

end Behavioral;

-- END --
