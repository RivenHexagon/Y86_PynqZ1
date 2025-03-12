
----------------------------------------------------------------------------
-- Company:      Riven Hexagon
-- Copyright:    © 2025 Riven Hexagon
-- Engineer:     Kolja Sacharow
-- 
-- Create Date:  25.02.2025
-- Module Name:  Fetch_Stage
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

entity Fetch_Stage is
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
        valC:               out     std_logic_vector(bwReg-1  downto 0);
        valP:               out     std_logic_vector(bwAddr-1 downto 0)
        );
    end Fetch_Stage;


architecture Behavioral of Fetch_Stage is

----------------------------------------------------------------------------
-- COMPONENTS
--------------------------- 7 ----- 9 --------------------------------------

component Status_Control_Signals is
    port (
        icode:              in      std_logic_vector(3 downto 0);
        BRAM_addr:          in      std_logic_vector(bwAddr-1 downto 0);

        need_regIDs:        out     std_logic;
        need_valC:          out     std_logic;
        instr_valid:        out     std_logic;
        imem_error:         out     std_logic
        );
    end component;


component ProgCnt_Increment is
    port (
        RS:                 in      std_logic;
        CLK:                in      std_logic;
        HLT:                in      std_logic;
        need_regIDs:        in      std_logic;
        need_valC:          in      std_logic;

        valP:               out     std_logic_vector(bwAddr-1 downto 0)
        );
    end component;

----------------------------------------------------------------------------
-- CONSTANTS & SIGNALS
--------------------------- 7 ----- 9 --------------------------------------



----------------------------------------------------------------------------

begin

----------------------------------------------------------------------------
-- PROCESSES AND CONNECTIONS
--------------------------- 7 ----- 9 --------------------------------------

icode                       <= valM(3 downto 0);
ifunc                       <= valM(7 downto 4);

srcA                        <= valM(11 downto  8)      when 
                               need_regIDs = '1'       else
                               HCL_constants(FNONE);
srcB                        <= valM(15 downto 12)      when
                               need_regIDs = '1'       else
                               HCL_constants(FNONE);
valC                        <= valM(bwMem-1 downto 16) when 
                               need_regIDs = '1'       else
                               valM(bwMem-9 downto 8);

----------------------------------------------------------------------------
-- PORT MAPS
--------------------------- 7 ----- 9 --------------------------------------

Status_Control_Signals_inst:
Status_Control_Signals
    port map (
        icode                       => icode,
        BRAM_addr                   => valP,

        need_regIDs                 => need_regIDs,
        need_valC                   => need_valC,
        instr_valid                 => instr_valid,
        imem_error                  => imem_error
        );


ProgCnt_Increment_inst:
ProgCnt_Increment
    port map (
        RS                          => RS,
        CLK                         => CLK,
        HLT                         => '0',
        need_regIDs                 => need_regIDs,
        need_valC                   => need_valC,

        valP                        => valP
        );

------------------------------------------------------------------------

end Behavioral;

-- END --
