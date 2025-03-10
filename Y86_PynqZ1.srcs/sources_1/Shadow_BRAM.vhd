
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
        ADDRA:              IN      std_logic_vector(10 downto 0);     
        DINA :              IN      std_logic_vector(31 downto 0);     
        DOUTA:              OUT     std_logic_vector(31 downto 0);     
        CLKA :              IN      std_logic;                         
      --Port B
        ENB  :              IN      std_logic;                         
        WEB  :              IN      std_logic_vector( 1 downto 0);     
        ADDRB:              IN      std_logic_vector(12 downto 0);     
        DINB :              IN      std_logic_vector(15 downto 0);     
        valM:               OUT     std_logic_vector(bwmem-1 downto 0);
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

COMPONENT blk_mem_gen_0 IS
    PORT (
      --Port A
        CLKA :              in      std_logic;
        ENA  :              in      std_logic;
        WEA  :              in      std_logic_vector( 3 downto 0);
        ADDRA:              in      std_logic_vector(10 downto 0);
        DINA :              in      std_logic_vector(31 downto 0);
        DOUTA:              out     std_logic_vector(31 downto 0);
      --Port B
        CLKB :              in      std_logic;
        ENB  :              in      std_logic;
        WEB  :              in      std_logic_vector( 1 downto 0);
        ADDRB:              in      std_logic_vector(12 downto 0);
        DINB :              in      std_logic_vector(15 downto 0);
        DOUTB:              out     std_logic_vector( 7 downto 0)
        );
    END COMPONENT;

----------------------------------------------------------------------------
-- CONSTANTS & SIGNALS
--------------------------- 7 ----- 9 --------------------------------------

signal addr1:                       unsigned(12 downto 0);
signal addr2:                       unsigned(12 downto 0);
signal addr3:                       unsigned(12 downto 0);

signal DOUT_B0:                     std_logic_vector(7 downto 0);
signal DOUT_B1:                     std_logic_vector(7 downto 0);
signal DOUT_B2:                     std_logic_vector(7 downto 0);
signal DOUT_B3:                     std_logic_vector(7 downto 0);

----------------------------------------------------------------------------

begin

----------------------------------------------------------------------------
-- PROCESSES AND CONNECTIONS
--------------------------- 7 ----- 9 --------------------------------------

addr1 <= unsigned(ADDRB) + 1;
addr2 <= unsigned(ADDRB) + 2;
addr3 <= unsigned(ADDRB) + 3;

valM <= DOUT_B3 & DOUT_B2 & DOUT_B1 & DOUT_B0;

----------------------------------------------------------------------------
-- PORT MAPS Shadow_BRAM
--------------------------- 7 ----- 9 --------------------------------------

bmg0:
blk_mem_gen_0
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
        ADDRB                       => ADDRB,
        DINB                        => DINB,
        DOUTB                       => DOUT_B0,
        CLKB                        => CLKB
        );

bmg1:
blk_mem_gen_0
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
        ADDRB                       => std_logic_vector(addr1),
        DINB                        => DINB,
        DOUTB                       => DOUT_B1,
        CLKB                        => CLKB
        );

bmg2:
blk_mem_gen_0
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
        ADDRB                       => std_logic_vector(addr2),
        DINB                        => DINB,
        DOUTB                       => DOUT_B2,
        CLKB                        => CLKB
        );

bmg3:
blk_mem_gen_0
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
        ADDRB                       => std_logic_vector(addr3),
        DINB                        => DINB,
        DOUTB                       => DOUT_B3,
        CLKB                        => CLKB
        );

----------------------------------------------------------------------------

end Behavioral;

-- END --
