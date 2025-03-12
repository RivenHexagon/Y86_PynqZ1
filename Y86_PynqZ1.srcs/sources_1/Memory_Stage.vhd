
----------------------------------------------------------------------------
-- Company:      Riven Hexagon
-- Copyright:    © 2025 Riven Hexagon
-- Engineer:     Kolja Sacharow
-- 
-- Create Date:  27.02.2025
-- Module Name:  Memory_Stage
-- Project Name: Pynq_Y86

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

entity Memory_Stage is
    port (
        RS:                 in      std_logic;
        CLK:                in      std_logic;
        valP:               in      std_logic_vector(bwAddr-1 downto 0);
        valA:               in      std_logic_vector(bwReg-1 downto 0);
        valE:               in      std_logic_vector(bwReg-1 downto 0);
        icode:              in      std_logic_vector(3 downto 0);
        instr_valid:        in      std_logic;
        imem_error:         in      std_logic;

        BRAM_PORTA_0_addr:  in      std_logic_vector (bwAddr-1 downto 0 );
        BRAM_PORTA_0_clk:   in      std_logic;                       
        BRAM_PORTA_0_din:   in      std_logic_vector ( 31 downto 0 );
        BRAM_PORTA_0_en:    in      std_logic;                       
        BRAM_PORTA_0_rst:   in      std_logic;                       
        BRAM_PORTA_0_we:    in      std_logic_vector ( 3 downto 0 ); 

        BRAM_PORTA_0_dout:  out     std_logic_vector ( 31 downto 0 );
        valM:               out     std_logic_vector(bwMem-1 downto 0);
        status:             out     std_logic_vector(1 downto 0) --p14/400
        );
    end Memory_Stage;

architecture Behavioral of Memory_Stage is

----------------------------------------------------------------------------
-- SIGNALS
--------------------------- 7 ----- 9 --------------------------------------

--        BRAM_dout:          in      std_logic_vector(bwMem-1 downto 0);
--        BRAM_RST:           out     std_logic;
--        BRAM_EN:            out     std_logic;
--        BRAM_WE:            out     std_logic_vector(3 downto 0);
--        BRAM_CLK:           out     std_logic;
--        BRAM_addr:          out     std_logic_vector(bwAddr-1 downto 0);
--        BRAM_din:           out     std_logic_vector(bwMem-1 downto 0)

----------------------------------------------------------------------------
-- COMPONENTS
--------------------------- 7 ----- 9 --------------------------------------

COMPONENT SEQ_BRAM IS
    PORT (
      --Port A
        ENA  :              IN      std_logic;  --opt port             
        WEA  :              IN      std_logic_vector( 3 downto 0);     
        ADDRA:              IN      std_logic_vector(bwAddr-1 downto 0);     
        DINA :              IN      std_logic_vector(31 downto 0);     
        DOUTA:              OUT     std_logic_vector(31 downto 0);     
        CLKA :              IN      std_logic;                         
      --Port B
        ENB  :              IN      std_logic;  --opt port             
        WEB  :              IN      std_logic_vector( 3 downto 0);     
        ADDRB:              IN      std_logic_vector(bwAddr-1 downto 0);     
        DINB :              IN      std_logic_vector(31 downto 0);     
        valM:               OUT     std_logic_vector(bwmem-1 downto 0);
        CLKB :              IN      std_logic        
        );
    END COMPONENT;

----------------------------------------------------------------------------
-- CONSTANTS & SIGNALS
--------------------------- 7 ----- 9 --------------------------------------

signal DIN_B:                       std_logic_vector(bwReg-1 downto 0);
signal ADDR_B:                      std_logic_vector(bwAddr-1 downto 0);

----------------------------------------------------------------------------

begin

----------------------------------------------------------------------------
-- PROCESSES AND CONNECTIONS
--------------------------- 7 ----- 9 --------------------------------------

DIN_B                       <= (others => '0'); --valA or valP
ADDR_B                      <= valP; --valE or valA
STATUS                      <= "00"; --AOK 0,HLT 1 ,ADR 2, INS 3

----------------------------------------------------------------------------
-- PORT MAPS
--------------------------- 7 ----- 9 --------------------------------------

BRAM_inst:
SEQ_BRAM
    PORT MAP (
      --Port A
        ENA                         => BRAM_PORTA_0_en,
        WEA                         => BRAM_PORTA_0_we,
        ADDRA                       => BRAM_PORTA_0_addr,
        DINA                        => BRAM_PORTA_0_din,
        DOUTA                       => BRAM_PORTA_0_dout,
        CLKA                        => BRAM_PORTA_0_clk,
      --Port B
        ENB                         => '1', 
        WEB                         => (others => '0'),
        ADDRB                       => ADDR_B,
        DINB                        => DIN_B,
        valM                        => valM,
        CLKB                        => clk
        );

----------------------------------------------------------------------------

end Behavioral;

-- END --
