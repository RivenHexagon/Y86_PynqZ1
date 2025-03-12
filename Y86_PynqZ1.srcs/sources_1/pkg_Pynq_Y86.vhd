
----------------------------------------------------------------------------
-- Company:      Entwicklungsbureau Stresing
-- Copyright:    © 2024 Entwicklungsbureau Stresing

-- @file
--! @brief      Stresing VHDL package for components library
--! @details    Create Date:  22.03.2018
--! Module Name:pkg_stresing \n 
--! Engineer:   F. Hahn, A.Meissner \n
--! use vhdl    2008 \n
--! version:    5.0.0 pkg_Pynq_Y86

-- Modules Content:
-- D Flip-Flop
-- T Flip-Flop
-- JK Flip-Flop
-- One Pulse
-- Generic Pulse
-- Dynamic Pulse
-- LUT_delay
-- Delay nCLK
-- Compare
-- Counter
-- Dynamic_CLK
-- Register Compare
-- CamToPcMux
-- MEASURE_HIGH_TIME
----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

package pkg_Pynq_Y86 is

    ------------------------------------------------------------------------
    -- ABSTRACT DATA TYPE DEFINITIONS
    ------------------------------- 9 ----- 11 -----------------------------

    constant bwY86:                         positive := 32;
    constant bwMem:                         positive := 48;
    constant bwAddr:                        positive := 11;
    constant bwReg:                         positive := 32;

    constant BRAM_DEPTH:                    positive := 12; --2048;
    constant CLK_MHZ:                       positive := 100;
    constant COUNTER_MAX:                   positive := CLK_MHZ * 800000;

    --! @brief This type is used to create vectors of vectors.
    type VECTOR_ARRAY is array (natural range <>) of std_logic_vector;

    type Instruction_Type is
       (IHALT,INOP,
        IRRMOVQ,IIRMOVQ,IRMMOVQ,IMRMOVQ,
        IOPL,
        IJXX,
        ICALL,IRET,
        IPUSHQ,IPOPQ
        );

    type Instruction_Array is 
        array(Instruction_Type) of 
        std_logic_vector(3 downto 0);

    constant Instruction_Code: Instruction_Array := (
        IHALT       => x"0", --Code for halt instruction
        INOP        => x"1", --Code for nop instruction
        IRRMOVQ     => x"2", --Code for rrmovq instruction
        IIRMOVQ     => x"3", --Code for irmovq instruction
        IRMMOVQ     => x"4", --Code for rmmovq instruction
        IMRMOVQ     => x"5", --Code for mrmovq instruction
        IOPL        => x"6", --Code for integer operation instructions
        IJXX        => x"7", --Code for jump instructions
        ICALL       => x"8", --Code for call instruction
        IRET        => x"9", --Code for ret instruction
        IPUSHQ      => x"A", --Code for pushq instruction
        IPOPQ       => x"B"  --Code for popq instruction
        );

    type HCL_constant is
       (FNONE,
        RESP, RNONE, ALUADD,
        SAOK, SADR, SINS, SHLT
        );

    type HCL_Array is 
        array(HCL_constant) of 
        std_logic_vector(3 downto 0);

    constant HCL_constants: HCL_Array := (
        FNONE       => x"0", --Default function code
        RESP        => x"4", --Register ID for %rsp
        RNONE       => x"F", --Indicates no register file access
        ALUADD      => x"0", --Function for addition operation
        SAOK        => x"1", --Status code for normal operation
        SADR        => x"2", --Status code for address exception
        SINS        => x"3", --Status code for illegal instruction exception
        SHLT        => x"4"  --Status code for halt
        );

    ------------------------------------------------------------------------
    -- PACKAGE COMPONENTS
    ------------------------------- 9 ----- 11 -----------------------------

end package pkg_Pynq_Y86;

----------------------------------------------------------------------------
-- PACKAGE BODY
----------------------------------- 9 ----- 11 -----------------------------

package body pkg_Pynq_Y86 is
 
  function reverse_vector (vector_in: in std_logic_vector)
     return std_logic_vector is
       variable result: std_logic_vector(vector_in'RANGE);
       alias vector_alias: std_logic_vector(vector_in'REVERSE_RANGE) is vector_in;
   begin
       for i in vector_alias'RANGE loop
         result(i) := vector_alias(i);
       end loop;
       return result;
     end; -- function reverse_vector
 
end package body pkg_Pynq_Y86;

-- END --
