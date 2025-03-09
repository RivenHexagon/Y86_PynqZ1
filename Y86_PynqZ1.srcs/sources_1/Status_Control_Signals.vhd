
----------------------------------------------------------------------------
-- Company:      Riven Hexagon
-- Copyright:    © 2025 Riven Hexagon
-- Engineer:     Kolja Sacharow
-- 
-- Create Date:  25.02.2025
-- Module Name:  Status_Control_Signals
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

    entity Status_Control_Signals is
        port (
            icode:                  in      std_logic_vector(3 downto 0);
            BRAM_addr:              in      std_logic_vector(bwAddr-1 downto 0);

            need_regIDs:            out     std_logic;
            need_valC:              out     std_logic;
            instr_valid:            out     std_logic;
            imem_error:             out     std_logic
            );
        end Status_Control_Signals;


architecture Behavioral of Status_Control_Signals is

    ------------------------------------------------------------------------
    -- COMPONENTS
    ------------------------------- 9 ----- 11 -----------------------------



    ------------------------------------------------------------------------
    -- CONSTANTS & SIGNALS
    ------------------------------- 9 ----- 11 -----------------------------


    
    ------------------------------------------------------------------------

    begin

    ------------------------------------------------------------------------
    -- PROCESSES AND CONNECTIONS
    ------------------------------- 9 ----- 11 -----------------------------

    need_regIDs <= '1' when (icode = Instruction_Code(IRRMOVQ)) or
                            (icode = Instruction_Code(IOPL)   ) or
                            (icode = Instruction_Code(IPUSHQ) ) or
                            (icode = Instruction_Code(IPOPQ)  ) or
                            (icode = Instruction_Code(IIRMOVQ)) or
                            (icode = Instruction_Code(IRMMOVQ)) or
                            (icode = Instruction_Code(IMRMOVQ)) 
                       else '0';

    need_valC   <= '1' when (icode = Instruction_Code(IJXX  ) ) or
                            (icode = Instruction_Code(ICALL)  ) or
                            (icode = Instruction_Code(IIRMOVQ)) or
                            (icode = Instruction_Code(IRMMOVQ)) or
                            (icode = Instruction_Code(IMRMOVQ)) 
                       else '0';

    instr_valid <= '1' when (icode = Instruction_Code(IHALT)  ) or
                            (icode = Instruction_Code(INOP)   ) or
                            (icode = Instruction_Code(IRRMOVQ)) or
                            (icode = Instruction_Code(IIRMOVQ)) or
                            (icode = Instruction_Code(IRMMOVQ)) or
                            (icode = Instruction_Code(IMRMOVQ)) or
                            (icode = Instruction_Code(IOPL)   ) or
                            (icode = Instruction_Code(IJXX)   ) or
                            (icode = Instruction_Code(ICALL)  ) or
                            (icode = Instruction_Code(IRET)   ) or
                            (icode = Instruction_Code(IPUSHQ) ) or
                            (icode = Instruction_Code(IPOPQ)  ) 
                       else '0';

    imem_error  <= '0' when unsigned(BRAM_addr) < BRAM_DEPTH-1 else '1';

    ------------------------------------------------------------------------

    end Behavioral;

-- END --
