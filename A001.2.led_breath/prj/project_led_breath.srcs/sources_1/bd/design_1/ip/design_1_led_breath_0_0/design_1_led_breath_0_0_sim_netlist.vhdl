-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Mon Dec 11 23:39:44 2023
-- Host        : DESKTOP-4U8Q409 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               f:/fpga/fpga-notes/A001.2.led_breath/prj/project_led_breath.srcs/sources_1/bd/design_1/ip/design_1_led_breath_0_0/design_1_led_breath_0_0_sim_netlist.vhdl
-- Design      : design_1_led_breath_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_led_breath_0_0_led_breath is
  port (
    led : out STD_LOGIC;
    s_clk : in STD_LOGIC;
    s_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_led_breath_0_0_led_breath : entity is "led_breath";
end design_1_led_breath_0_0_led_breath;

architecture STRUCTURE of design_1_led_breath_0_0_led_breath is
  signal cnt : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \cnt[5]_i_2_n_0\ : STD_LOGIC;
  signal \cnt[7]_i_2_n_0\ : STD_LOGIC;
  signal \cnt_1ms[1]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1ms[9]_i_1_n_0\ : STD_LOGIC;
  signal \cnt_1ms[9]_i_3_n_0\ : STD_LOGIC;
  signal \cnt_1ms[9]_i_4_n_0\ : STD_LOGIC;
  signal \cnt_1ms[9]_i_5_n_0\ : STD_LOGIC;
  signal \cnt_1ms[9]_i_6_n_0\ : STD_LOGIC;
  signal cnt_1ms_reg : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal cnt_1us : STD_LOGIC;
  signal \cnt_1us[9]_i_3_n_0\ : STD_LOGIC;
  signal cnt_1us_reg : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal \cnt_reg_n_0_[0]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[1]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[2]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[3]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[4]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[5]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[6]\ : STD_LOGIC;
  signal \cnt_reg_n_0_[7]\ : STD_LOGIC;
  signal led1 : STD_LOGIC;
  signal \led1_carry_i_1__0_n_0\ : STD_LOGIC;
  signal led1_carry_i_1_n_0 : STD_LOGIC;
  signal \led1_carry_i_2__0_n_0\ : STD_LOGIC;
  signal led1_carry_i_2_n_0 : STD_LOGIC;
  signal led1_carry_i_3_n_0 : STD_LOGIC;
  signal led1_carry_i_4_n_0 : STD_LOGIC;
  signal led1_carry_i_5_n_0 : STD_LOGIC;
  signal led1_carry_i_6_n_0 : STD_LOGIC;
  signal led1_carry_i_7_n_0 : STD_LOGIC;
  signal led1_carry_i_8_n_0 : STD_LOGIC;
  signal led1_carry_n_0 : STD_LOGIC;
  signal led1_carry_n_1 : STD_LOGIC;
  signal led1_carry_n_2 : STD_LOGIC;
  signal led1_carry_n_3 : STD_LOGIC;
  signal led_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 8 downto 0 );
  signal \p_0_in__0__0\ : STD_LOGIC_VECTOR ( 8 downto 1 );
  signal NLW_led1_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_led1_carry__0_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_led1_carry__0_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt[0]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cnt[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cnt[2]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cnt[3]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \cnt[6]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt[7]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt[7]_i_2\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \cnt_1ms[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cnt_1ms[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cnt_1ms[3]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \cnt_1ms[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt_1ms[5]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt_1ms[7]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt_1ms[8]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt_1ms[9]_i_3\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cnt_1ms[9]_i_5\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cnt_1ms[9]_i_6\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \cnt_1us[2]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \cnt_1us[3]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \cnt_1us[4]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt_1us[5]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt_1us[7]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt_1us[8]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt_1us[9]_i_3\ : label is "soft_lutpair6";
begin
\cnt[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00007FFF"
    )
        port map (
      I0 => \cnt[5]_i_2_n_0\,
      I1 => \cnt_reg_n_0_[4]\,
      I2 => \cnt_reg_n_0_[5]\,
      I3 => \cnt_reg_n_0_[1]\,
      I4 => \cnt_reg_n_0_[0]\,
      O => cnt(0)
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"007FFF00"
    )
        port map (
      I0 => \cnt[5]_i_2_n_0\,
      I1 => \cnt_reg_n_0_[4]\,
      I2 => \cnt_reg_n_0_[5]\,
      I3 => \cnt_reg_n_0_[0]\,
      I4 => \cnt_reg_n_0_[1]\,
      O => cnt(1)
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \cnt_reg_n_0_[2]\,
      I1 => \cnt_reg_n_0_[0]\,
      I2 => \cnt_reg_n_0_[1]\,
      O => cnt(2)
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \cnt_reg_n_0_[3]\,
      I1 => \cnt_reg_n_0_[1]\,
      I2 => \cnt_reg_n_0_[0]\,
      I3 => \cnt_reg_n_0_[2]\,
      O => cnt(3)
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFF00000000FFFF"
    )
        port map (
      I0 => \cnt[5]_i_2_n_0\,
      I1 => \cnt_reg_n_0_[0]\,
      I2 => \cnt_reg_n_0_[5]\,
      I3 => \cnt_reg_n_0_[1]\,
      I4 => \cnt[7]_i_2_n_0\,
      I5 => \cnt_reg_n_0_[4]\,
      O => cnt(4)
    );
\cnt[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DF00FFFF00FF0000"
    )
        port map (
      I0 => \cnt[5]_i_2_n_0\,
      I1 => \cnt_reg_n_0_[0]\,
      I2 => \cnt_reg_n_0_[1]\,
      I3 => \cnt[7]_i_2_n_0\,
      I4 => \cnt_reg_n_0_[4]\,
      I5 => \cnt_reg_n_0_[5]\,
      O => cnt(5)
    );
\cnt[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0001"
    )
        port map (
      I0 => \cnt_reg_n_0_[3]\,
      I1 => \cnt_reg_n_0_[2]\,
      I2 => \cnt_reg_n_0_[6]\,
      I3 => \cnt_reg_n_0_[7]\,
      O => \cnt[5]_i_2_n_0\
    );
\cnt[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9AAA"
    )
        port map (
      I0 => \cnt_reg_n_0_[6]\,
      I1 => \cnt[7]_i_2_n_0\,
      I2 => \cnt_reg_n_0_[4]\,
      I3 => \cnt_reg_n_0_[5]\,
      O => cnt(6)
    );
\cnt[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA6AAAAA"
    )
        port map (
      I0 => \cnt_reg_n_0_[7]\,
      I1 => \cnt_reg_n_0_[5]\,
      I2 => \cnt_reg_n_0_[4]\,
      I3 => \cnt[7]_i_2_n_0\,
      I4 => \cnt_reg_n_0_[6]\,
      O => cnt(7)
    );
\cnt[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \cnt_reg_n_0_[2]\,
      I1 => \cnt_reg_n_0_[0]\,
      I2 => \cnt_reg_n_0_[1]\,
      I3 => \cnt_reg_n_0_[3]\,
      O => \cnt[7]_i_2_n_0\
    );
\cnt_1ms[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt_1ms_reg(1),
      O => \cnt_1ms[1]_i_1_n_0\
    );
\cnt_1ms[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt_1ms_reg(2),
      I1 => cnt_1ms_reg(1),
      O => \p_0_in__0__0\(1)
    );
\cnt_1ms[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => cnt_1ms_reg(3),
      I1 => cnt_1ms_reg(2),
      I2 => cnt_1ms_reg(1),
      O => \p_0_in__0__0\(2)
    );
\cnt_1ms[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => cnt_1ms_reg(1),
      I1 => cnt_1ms_reg(2),
      I2 => cnt_1ms_reg(3),
      I3 => cnt_1ms_reg(4),
      O => \p_0_in__0__0\(3)
    );
\cnt_1ms[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => cnt_1ms_reg(5),
      I1 => cnt_1ms_reg(1),
      I2 => cnt_1ms_reg(2),
      I3 => cnt_1ms_reg(3),
      I4 => cnt_1ms_reg(4),
      O => \p_0_in__0__0\(4)
    );
\cnt_1ms[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => cnt_1ms_reg(6),
      I1 => cnt_1ms_reg(4),
      I2 => cnt_1ms_reg(3),
      I3 => cnt_1ms_reg(2),
      I4 => cnt_1ms_reg(1),
      I5 => cnt_1ms_reg(5),
      O => \p_0_in__0__0\(5)
    );
\cnt_1ms[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => cnt_1ms_reg(7),
      I1 => cnt_1ms_reg(5),
      I2 => \cnt_1ms[9]_i_6_n_0\,
      I3 => cnt_1ms_reg(6),
      O => \p_0_in__0__0\(6)
    );
\cnt_1ms[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => cnt_1ms_reg(8),
      I1 => cnt_1ms_reg(6),
      I2 => \cnt_1ms[9]_i_6_n_0\,
      I3 => cnt_1ms_reg(5),
      I4 => cnt_1ms_reg(7),
      O => \p_0_in__0__0\(7)
    );
\cnt_1ms[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000004"
    )
        port map (
      I0 => \cnt_1ms[9]_i_3_n_0\,
      I1 => \cnt[5]_i_2_n_0\,
      I2 => \cnt_1ms[9]_i_4_n_0\,
      I3 => \cnt_1ms[9]_i_5_n_0\,
      I4 => cnt_1us_reg(8),
      O => \cnt_1ms[9]_i_1_n_0\
    );
\cnt_1ms[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => cnt_1ms_reg(9),
      I1 => cnt_1ms_reg(7),
      I2 => cnt_1ms_reg(5),
      I3 => \cnt_1ms[9]_i_6_n_0\,
      I4 => cnt_1ms_reg(6),
      I5 => cnt_1ms_reg(8),
      O => \p_0_in__0__0\(8)
    );
\cnt_1ms[9]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \cnt_reg_n_0_[1]\,
      I1 => \cnt_reg_n_0_[0]\,
      I2 => \cnt_reg_n_0_[5]\,
      I3 => \cnt_reg_n_0_[4]\,
      O => \cnt_1ms[9]_i_3_n_0\
    );
\cnt_1ms[9]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_1us_reg(7),
      I1 => cnt_1us_reg(6),
      I2 => cnt_1us_reg(9),
      I3 => cnt_1us_reg(5),
      O => \cnt_1ms[9]_i_4_n_0\
    );
\cnt_1ms[9]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => cnt_1us_reg(2),
      I1 => cnt_1us_reg(1),
      I2 => cnt_1us_reg(4),
      I3 => cnt_1us_reg(3),
      O => \cnt_1ms[9]_i_5_n_0\
    );
\cnt_1ms[9]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => cnt_1ms_reg(4),
      I1 => cnt_1ms_reg(3),
      I2 => cnt_1ms_reg(2),
      I3 => cnt_1ms_reg(1),
      O => \cnt_1ms[9]_i_6_n_0\
    );
\cnt_1ms_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => \cnt_1ms[9]_i_1_n_0\,
      CLR => led_i_1_n_0,
      D => \cnt_1ms[1]_i_1_n_0\,
      Q => cnt_1ms_reg(1)
    );
\cnt_1ms_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => \cnt_1ms[9]_i_1_n_0\,
      CLR => led_i_1_n_0,
      D => \p_0_in__0__0\(1),
      Q => cnt_1ms_reg(2)
    );
\cnt_1ms_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => \cnt_1ms[9]_i_1_n_0\,
      CLR => led_i_1_n_0,
      D => \p_0_in__0__0\(2),
      Q => cnt_1ms_reg(3)
    );
\cnt_1ms_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => \cnt_1ms[9]_i_1_n_0\,
      CLR => led_i_1_n_0,
      D => \p_0_in__0__0\(3),
      Q => cnt_1ms_reg(4)
    );
\cnt_1ms_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => \cnt_1ms[9]_i_1_n_0\,
      CLR => led_i_1_n_0,
      D => \p_0_in__0__0\(4),
      Q => cnt_1ms_reg(5)
    );
\cnt_1ms_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => \cnt_1ms[9]_i_1_n_0\,
      CLR => led_i_1_n_0,
      D => \p_0_in__0__0\(5),
      Q => cnt_1ms_reg(6)
    );
\cnt_1ms_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => \cnt_1ms[9]_i_1_n_0\,
      CLR => led_i_1_n_0,
      D => \p_0_in__0__0\(6),
      Q => cnt_1ms_reg(7)
    );
\cnt_1ms_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => \cnt_1ms[9]_i_1_n_0\,
      CLR => led_i_1_n_0,
      D => \p_0_in__0__0\(7),
      Q => cnt_1ms_reg(8)
    );
\cnt_1ms_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => \cnt_1ms[9]_i_1_n_0\,
      CLR => led_i_1_n_0,
      D => \p_0_in__0__0\(8),
      Q => cnt_1ms_reg(9)
    );
\cnt_1us[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt_1us_reg(1),
      O => \p_0_in__0\(0)
    );
\cnt_1us[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => cnt_1us_reg(1),
      I1 => cnt_1us_reg(2),
      O => \p_0_in__0\(1)
    );
\cnt_1us[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => cnt_1us_reg(3),
      I1 => cnt_1us_reg(1),
      I2 => cnt_1us_reg(2),
      O => \p_0_in__0\(2)
    );
\cnt_1us[4]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => cnt_1us_reg(2),
      I1 => cnt_1us_reg(1),
      I2 => cnt_1us_reg(3),
      I3 => cnt_1us_reg(4),
      O => \p_0_in__0\(3)
    );
\cnt_1us[5]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => cnt_1us_reg(5),
      I1 => cnt_1us_reg(2),
      I2 => cnt_1us_reg(1),
      I3 => cnt_1us_reg(3),
      I4 => cnt_1us_reg(4),
      O => \p_0_in__0\(4)
    );
\cnt_1us[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => cnt_1us_reg(6),
      I1 => cnt_1us_reg(4),
      I2 => cnt_1us_reg(3),
      I3 => cnt_1us_reg(1),
      I4 => cnt_1us_reg(2),
      I5 => cnt_1us_reg(5),
      O => \p_0_in__0\(5)
    );
\cnt_1us[7]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => cnt_1us_reg(7),
      I1 => cnt_1us_reg(5),
      I2 => \cnt_1us[9]_i_3_n_0\,
      I3 => cnt_1us_reg(6),
      O => \p_0_in__0\(6)
    );
\cnt_1us[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => cnt_1us_reg(8),
      I1 => cnt_1us_reg(6),
      I2 => \cnt_1us[9]_i_3_n_0\,
      I3 => cnt_1us_reg(5),
      I4 => cnt_1us_reg(7),
      O => \p_0_in__0\(7)
    );
\cnt_1us[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000002"
    )
        port map (
      I0 => \cnt[5]_i_2_n_0\,
      I1 => \cnt_reg_n_0_[4]\,
      I2 => \cnt_reg_n_0_[5]\,
      I3 => \cnt_reg_n_0_[0]\,
      I4 => \cnt_reg_n_0_[1]\,
      O => cnt_1us
    );
\cnt_1us[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => cnt_1us_reg(9),
      I1 => cnt_1us_reg(7),
      I2 => cnt_1us_reg(5),
      I3 => \cnt_1us[9]_i_3_n_0\,
      I4 => cnt_1us_reg(6),
      I5 => cnt_1us_reg(8),
      O => \p_0_in__0\(8)
    );
\cnt_1us[9]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => cnt_1us_reg(4),
      I1 => cnt_1us_reg(3),
      I2 => cnt_1us_reg(1),
      I3 => cnt_1us_reg(2),
      O => \cnt_1us[9]_i_3_n_0\
    );
\cnt_1us_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => cnt_1us,
      CLR => led_i_1_n_0,
      D => \p_0_in__0\(0),
      Q => cnt_1us_reg(1)
    );
\cnt_1us_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => cnt_1us,
      CLR => led_i_1_n_0,
      D => \p_0_in__0\(1),
      Q => cnt_1us_reg(2)
    );
\cnt_1us_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => cnt_1us,
      CLR => led_i_1_n_0,
      D => \p_0_in__0\(2),
      Q => cnt_1us_reg(3)
    );
\cnt_1us_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => cnt_1us,
      CLR => led_i_1_n_0,
      D => \p_0_in__0\(3),
      Q => cnt_1us_reg(4)
    );
\cnt_1us_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => cnt_1us,
      CLR => led_i_1_n_0,
      D => \p_0_in__0\(4),
      Q => cnt_1us_reg(5)
    );
\cnt_1us_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => cnt_1us,
      CLR => led_i_1_n_0,
      D => \p_0_in__0\(5),
      Q => cnt_1us_reg(6)
    );
\cnt_1us_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => cnt_1us,
      CLR => led_i_1_n_0,
      D => \p_0_in__0\(6),
      Q => cnt_1us_reg(7)
    );
\cnt_1us_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => cnt_1us,
      CLR => led_i_1_n_0,
      D => \p_0_in__0\(7),
      Q => cnt_1us_reg(8)
    );
\cnt_1us_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => cnt_1us,
      CLR => led_i_1_n_0,
      D => \p_0_in__0\(8),
      Q => cnt_1us_reg(9)
    );
\cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => '1',
      CLR => led_i_1_n_0,
      D => cnt(0),
      Q => \cnt_reg_n_0_[0]\
    );
\cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => '1',
      CLR => led_i_1_n_0,
      D => cnt(1),
      Q => \cnt_reg_n_0_[1]\
    );
\cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => '1',
      CLR => led_i_1_n_0,
      D => cnt(2),
      Q => \cnt_reg_n_0_[2]\
    );
\cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => '1',
      CLR => led_i_1_n_0,
      D => cnt(3),
      Q => \cnt_reg_n_0_[3]\
    );
\cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => '1',
      CLR => led_i_1_n_0,
      D => cnt(4),
      Q => \cnt_reg_n_0_[4]\
    );
\cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => '1',
      CLR => led_i_1_n_0,
      D => cnt(5),
      Q => \cnt_reg_n_0_[5]\
    );
\cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => '1',
      CLR => led_i_1_n_0,
      D => cnt(6),
      Q => \cnt_reg_n_0_[6]\
    );
\cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => s_clk,
      CE => '1',
      CLR => led_i_1_n_0,
      D => cnt(7),
      Q => \cnt_reg_n_0_[7]\
    );
led1_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => led1_carry_n_0,
      CO(2) => led1_carry_n_1,
      CO(1) => led1_carry_n_2,
      CO(0) => led1_carry_n_3,
      CYINIT => '0',
      DI(3) => led1_carry_i_1_n_0,
      DI(2) => led1_carry_i_2_n_0,
      DI(1) => led1_carry_i_3_n_0,
      DI(0) => led1_carry_i_4_n_0,
      O(3 downto 0) => NLW_led1_carry_O_UNCONNECTED(3 downto 0),
      S(3) => led1_carry_i_5_n_0,
      S(2) => led1_carry_i_6_n_0,
      S(1) => led1_carry_i_7_n_0,
      S(0) => led1_carry_i_8_n_0
    );
\led1_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => led1_carry_n_0,
      CO(3 downto 1) => \NLW_led1_carry__0_CO_UNCONNECTED\(3 downto 1),
      CO(0) => led1,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \led1_carry_i_1__0_n_0\,
      O(3 downto 2) => \NLW_led1_carry__0_O_UNCONNECTED\(3 downto 2),
      O(1) => p_0_in,
      O(0) => \NLW_led1_carry__0_O_UNCONNECTED\(0),
      S(3 downto 1) => B"001",
      S(0) => \led1_carry_i_2__0_n_0\
    );
led1_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => cnt_1us_reg(8),
      I1 => cnt_1ms_reg(8),
      I2 => cnt_1us_reg(7),
      I3 => cnt_1ms_reg(7),
      O => led1_carry_i_1_n_0
    );
\led1_carry_i_1__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => cnt_1us_reg(9),
      I1 => cnt_1ms_reg(9),
      O => \led1_carry_i_1__0_n_0\
    );
led1_carry_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => cnt_1us_reg(6),
      I1 => cnt_1ms_reg(6),
      I2 => cnt_1us_reg(5),
      I3 => cnt_1ms_reg(5),
      O => led1_carry_i_2_n_0
    );
\led1_carry_i_2__0\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => cnt_1ms_reg(9),
      I1 => cnt_1us_reg(9),
      O => \led1_carry_i_2__0_n_0\
    );
led1_carry_i_3: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => cnt_1us_reg(4),
      I1 => cnt_1ms_reg(4),
      I2 => cnt_1us_reg(3),
      I3 => cnt_1ms_reg(3),
      O => led1_carry_i_3_n_0
    );
led1_carry_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => cnt_1us_reg(2),
      I1 => cnt_1ms_reg(2),
      I2 => cnt_1us_reg(1),
      I3 => cnt_1ms_reg(1),
      O => led1_carry_i_4_n_0
    );
led1_carry_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms_reg(8),
      I1 => cnt_1us_reg(8),
      I2 => cnt_1ms_reg(7),
      I3 => cnt_1us_reg(7),
      O => led1_carry_i_5_n_0
    );
led1_carry_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms_reg(6),
      I1 => cnt_1us_reg(6),
      I2 => cnt_1ms_reg(5),
      I3 => cnt_1us_reg(5),
      O => led1_carry_i_6_n_0
    );
led1_carry_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms_reg(4),
      I1 => cnt_1us_reg(4),
      I2 => cnt_1ms_reg(3),
      I3 => cnt_1us_reg(3),
      O => led1_carry_i_7_n_0
    );
led1_carry_i_8: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => cnt_1ms_reg(2),
      I1 => cnt_1us_reg(2),
      I2 => cnt_1ms_reg(1),
      I3 => cnt_1us_reg(1),
      O => led1_carry_i_8_n_0
    );
led_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_rst,
      O => led_i_1_n_0
    );
led_reg: unisim.vcomponents.FDPE
     port map (
      C => s_clk,
      CE => '1',
      D => p_0_in,
      PRE => led_i_1_n_0,
      Q => led
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_led_breath_0_0 is
  port (
    s_clk : in STD_LOGIC;
    s_rst : in STD_LOGIC;
    led : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_led_breath_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_led_breath_0_0 : entity is "design_1_led_breath_0_0,led_breath,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_led_breath_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_led_breath_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_led_breath_0_0 : entity is "led_breath,Vivado 2019.2";
end design_1_led_breath_0_0;

architecture STRUCTURE of design_1_led_breath_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_clk : signal is "xilinx.com:signal:clock:1.0 s_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_clk : signal is "XIL_INTERFACENAME s_clk, ASSOCIATED_RESET s_rst, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_rst : signal is "xilinx.com:signal:reset:1.0 s_rst RST";
  attribute X_INTERFACE_PARAMETER of s_rst : signal is "XIL_INTERFACENAME s_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.design_1_led_breath_0_0_led_breath
     port map (
      led => led,
      s_clk => s_clk,
      s_rst => s_rst
    );
end STRUCTURE;
