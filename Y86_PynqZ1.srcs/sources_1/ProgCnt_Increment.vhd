
----------------------------------------------------------------------------
-- Company:      Riven Hexagon
-- Copyright:    © 2025 Riven Hexagon
-- Engineer:     Kolja Sacharow
-- 
-- Create Date:  24.02.2025
-- Module Name:  ProgCnt_Increment
-- Project Name: Pynq_Y86

-- Description:  
-- For PC value p, need_regids value r, and need_valC value i, the incremen-
-- ter generates the value p= p + 1 + r + bwReg/8*i.
-- Resets to 0 and starts over when BRAM_DEPTH is reached.
----------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
library pkg_Pynq_Y86;
use work.pkg_Pynq_Y86.ALL;

Library UNISIM;
use UNISIM.vcomponents.all;

----------------------------------------------------------------------------

entity ProgCnt_Increment is
    port (
        RS:                 in      std_logic;
        CLK:                in      std_logic;
        HLT:                in      std_logic;
        need_regIDs:        in      std_logic;
        need_valC:          in      std_logic;

        valP:               out     std_logic_vector(bwAddr-1 downto 0)
        );
    end ProgCnt_Increment;


architecture Behavioral of ProgCnt_Increment is

----------------------------------------------------------------------------
-- COMPONENTS
--------------------------- 7 ----- 9 --------------------------------------



----------------------------------------------------------------------------
-- SIGNALS
--------------------------- 7 ----- 9 --------------------------------------

signal PROGRAM_CNTR:                unsigned(bwY86-1 downto 0)
                                    := to_unsigned(0,bwY86);
signal COUNTER:                     unsigned(bwY86-1 downto 0)
                                    := to_unsigned(0,bwY86);
signal BcIDs:                       unsigned(bwY86-1 downto 0)
                                    := to_unsigned(0,bwY86);
signal BcVal:                       unsigned(bwY86-1 downto 0)
                                    := to_unsigned(0,bwY86);
signal BcIDs_i:                     integer;
signal BcVal_i:                     integer;
signal RS_i:                        std_logic;
signal slow_step:                   std_logic;
signal step_by_cnt:                 std_logic;
signal EN_PC:                       std_logic;

signal NEW_PC:                      unsigned(bwAddr-1 downto 0)
                                    := to_unsigned(0,bwAddr);

----------------------------------------------------------------------------

begin

----------------------------------------------------------------------------
-- PROCESSES AND CONNECTIONS
--------------------------- 7 ----- 9 --------------------------------------

valP                        <= std_logic_vector(PROGRAM_CNTR);

RS_i                        <= RS;
--EN_PC                       <= (step_by_cnt or not slow_step) and not HLT;
EN_PC                       <= step_by_cnt;

BcIDs_i                     <= 1       when need_regIDs = '1' else 0;
BcVal_i                     <= bwReg/8 when need_valC   = '1' else 0;--bit width reg/8

BcIDs                       <= to_unsigned(BcIDs_i, bwAddr);
BcVal                       <= to_unsigned(BcVal_i, bwAddr);         --bit width reg/8

NEW_PC                      <= PROGRAM_CNTR + 1;-- + BcIDs + BcVal;

----------------------------------------------------------------------------

ProgramCounterUpdate:
process(CLK)
    begin
        if rising_edge(CLK) then
            if RS_i = '1' then
                PROGRAM_CNTR                 <= (others => '0');
            else 
                if EN_PC = '1' then
                    if PROGRAM_CNTR < BRAM_DEPTH-1 then
                        PROGRAM_CNTR         <= NEW_PC;
                    else
                        PROGRAM_CNTR         <= (others => '0');
                    end if;
                end if;
            end if;
        end if;
    end process;

----------------------------------------------------------------------------

slowStepCounter:
process(CLK)
    begin
        if rising_edge(CLK) then
            if RS_i = '1' then
                COUNTER                 <= (others => '0');
                step_by_cnt             <= '0';
            else
                if COUNTER < COUNTER_MAX-1 then
                    COUNTER             <= COUNTER + 1;
                    step_by_cnt         <= '0';
                else
                    COUNTER             <= (others => '0');
                    step_by_cnt         <= '1';
                    
                end if;
            end if;
        end if;
    end process;

----------------------------------------------------------------------------
-- PORT MAPS
--------------------------- 7 ----- 9 --------------------------------------



----------------------------------------------------------------------------

end Behavioral;

-- END --
