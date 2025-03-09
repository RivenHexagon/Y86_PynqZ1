
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

        BRAM_PORTA_0_addr:  in      STD_LOGIC_VECTOR ( 12 downto 0 );
        BRAM_PORTA_0_clk:   in      STD_LOGIC;
        BRAM_PORTA_0_din:   in      STD_LOGIC_VECTOR ( 31 downto 0 );
        BRAM_PORTA_0_en:    in      STD_LOGIC;
        BRAM_PORTA_0_rst:   in      STD_LOGIC;
        BRAM_PORTA_0_we:    in      STD_LOGIC_VECTOR ( 3 downto 0 );

        BRAM_PORTA_0_dout:  out     STD_LOGIC_VECTOR ( 31 downto 0 );
        valM:               out     std_logic_vector(bwMem-1 downto 0)
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

COMPONENT blk_mem_gen_0 IS
    PORT (
      --Port A
        ENA  :              IN      STD_LOGIC;  --opt port
        WEA  :              IN      STD_LOGIC_VECTOR(3 DOWNTO 0);
        ADDRA:              IN      STD_LOGIC_VECTOR(10 DOWNTO 0);
        DINA :              IN      STD_LOGIC_VECTOR(31 DOWNTO 0);
        DOUTA:              OUT     STD_LOGIC_VECTOR(31 DOWNTO 0);
        CLKA :              IN      STD_LOGIC;
      --Port B
        ENB  :              IN      STD_LOGIC;  --opt port
        WEB  :              IN      STD_LOGIC_VECTOR(1 DOWNTO 0);
        ADDRB:              IN      STD_LOGIC_VECTOR(12 DOWNTO 0);
        DINB :              IN      STD_LOGIC_VECTOR(15 DOWNTO 0);
        DOUTB:              OUT     STD_LOGIC_VECTOR(7 DOWNTO 0);
        CLKB :              IN      STD_LOGIC
        );
    END COMPONENT;

----------------------------------------------------------------------------
-- CONSTANTS & SIGNALS
--------------------------- 7 ----- 9 --------------------------------------



----------------------------------------------------------------------------

begin

----------------------------------------------------------------------------
-- PROCESSES AND CONNECTIONS
--------------------------- 7 ----- 9 --------------------------------------

--BRAM_RST                    <= RS;
--BRAM_EN                     <= '1';
--BRAM_we                     <= (others => '0');
--BRAM_CLK                    <= CLK;
--BRAM_din                    <= (others => '0');
--BRAM_addr                   <= valP;

--valM                        <= BRAM_dout;

----------------------------------------------------------------------------
-- PORT MAPS
--------------------------- 7 ----- 9 --------------------------------------

bmg0:
blk_mem_gen_0
    PORT MAP (
      --Port A
        ENA                         => '1',
        WEA                         => "0000",
        ADDRA                       => BRAM_PORTA_0_addr(10 downto 0),
        DINA                        => x"00000000",
        DOUTA                       => open,
        CLKA                        => clk,--CLKA_buf,
      --Port B
        ENB                         => '1', 
        WEB                         => "00",
        ADDRB                       => x"000",
        DINB                        => x"0000",
        DOUTB                       => open,
        CLKB                        => clk--CLKB_buf
        );

bmg1:
blk_mem_gen_0
    PORT MAP (
      --Port A
        ENA                         => '1',
        WEA                         => "0000",
        ADDRA                       => "0000000000",
        DINA                        => x"00000000",
        DOUTA                       => open,
        CLKA                        => clk,--CLKA_buf,
      --Port B
        ENB                         => '1', 
        WEB                         => "00",
        ADDRB                       => x"000",
        DINB                        => x"0000",
        DOUTB                       => open,
        CLKB                        => clk--CLKB_buf
        );

----------------------------------------------------------------------------

end Behavioral;

-- END --
