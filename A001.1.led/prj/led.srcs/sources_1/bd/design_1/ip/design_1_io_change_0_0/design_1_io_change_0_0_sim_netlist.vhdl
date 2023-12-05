-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Tue Dec  5 13:29:13 2023
-- Host        : OS-20220312IFCD running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               e:/labs/zynq/fpga-notes/A001.1.led/prj/led.srcs/sources_1/bd/design_1/ip/design_1_io_change_0_0/design_1_io_change_0_0_sim_netlist.vhdl
-- Design      : design_1_io_change_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_io_change_0_0_io_change is
  port (
    led : out STD_LOGIC_VECTOR ( 3 downto 0 );
    sclk : in STD_LOGIC;
    s_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_io_change_0_0_io_change : entity is "io_change";
end design_1_io_change_0_0_io_change;

architecture STRUCTURE of design_1_io_change_0_0_io_change is
  signal cnt : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal \cnt0_carry__0_n_0\ : STD_LOGIC;
  signal \cnt0_carry__0_n_1\ : STD_LOGIC;
  signal \cnt0_carry__0_n_2\ : STD_LOGIC;
  signal \cnt0_carry__0_n_3\ : STD_LOGIC;
  signal \cnt0_carry__1_n_0\ : STD_LOGIC;
  signal \cnt0_carry__1_n_1\ : STD_LOGIC;
  signal \cnt0_carry__1_n_2\ : STD_LOGIC;
  signal \cnt0_carry__1_n_3\ : STD_LOGIC;
  signal \cnt0_carry__2_n_0\ : STD_LOGIC;
  signal \cnt0_carry__2_n_1\ : STD_LOGIC;
  signal \cnt0_carry__2_n_2\ : STD_LOGIC;
  signal \cnt0_carry__2_n_3\ : STD_LOGIC;
  signal \cnt0_carry__3_n_0\ : STD_LOGIC;
  signal \cnt0_carry__3_n_1\ : STD_LOGIC;
  signal \cnt0_carry__3_n_2\ : STD_LOGIC;
  signal \cnt0_carry__3_n_3\ : STD_LOGIC;
  signal \cnt0_carry__4_n_0\ : STD_LOGIC;
  signal \cnt0_carry__4_n_1\ : STD_LOGIC;
  signal \cnt0_carry__4_n_2\ : STD_LOGIC;
  signal \cnt0_carry__4_n_3\ : STD_LOGIC;
  signal cnt0_carry_n_0 : STD_LOGIC;
  signal cnt0_carry_n_1 : STD_LOGIC;
  signal cnt0_carry_n_2 : STD_LOGIC;
  signal cnt0_carry_n_3 : STD_LOGIC;
  signal cnt_1 : STD_LOGIC_VECTOR ( 25 downto 0 );
  signal data0 : STD_LOGIC_VECTOR ( 25 downto 1 );
  signal \^led\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \led[3]_i_2_n_0\ : STD_LOGIC;
  signal \led[3]_i_3_n_0\ : STD_LOGIC;
  signal \led[3]_i_4_n_0\ : STD_LOGIC;
  signal \led[3]_i_5_n_0\ : STD_LOGIC;
  signal \led[3]_i_6_n_0\ : STD_LOGIC;
  signal \led[3]_i_7_n_0\ : STD_LOGIC;
  signal \led[3]_i_8_n_0\ : STD_LOGIC;
  signal \led[3]_i_9_n_0\ : STD_LOGIC;
  signal led_0 : STD_LOGIC;
  signal \NLW_cnt0_carry__5_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_cnt0_carry__5_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \cnt[10]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt[11]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cnt[12]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cnt[13]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt[14]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \cnt[15]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \cnt[16]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \cnt[17]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \cnt[18]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cnt[19]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \cnt[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt[20]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \cnt[21]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \cnt[22]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \cnt[23]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cnt[24]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \cnt[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \cnt[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \cnt[5]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \cnt[6]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \cnt[7]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \cnt[8]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \cnt[9]_i_1\ : label is "soft_lutpair3";
begin
  led(3 downto 0) <= \^led\(3 downto 0);
cnt0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => cnt0_carry_n_0,
      CO(2) => cnt0_carry_n_1,
      CO(1) => cnt0_carry_n_2,
      CO(0) => cnt0_carry_n_3,
      CYINIT => cnt(0),
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(4 downto 1),
      S(3 downto 0) => cnt(4 downto 1)
    );
\cnt0_carry__0\: unisim.vcomponents.CARRY4
     port map (
      CI => cnt0_carry_n_0,
      CO(3) => \cnt0_carry__0_n_0\,
      CO(2) => \cnt0_carry__0_n_1\,
      CO(1) => \cnt0_carry__0_n_2\,
      CO(0) => \cnt0_carry__0_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(8 downto 5),
      S(3 downto 0) => cnt(8 downto 5)
    );
\cnt0_carry__1\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt0_carry__0_n_0\,
      CO(3) => \cnt0_carry__1_n_0\,
      CO(2) => \cnt0_carry__1_n_1\,
      CO(1) => \cnt0_carry__1_n_2\,
      CO(0) => \cnt0_carry__1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(12 downto 9),
      S(3 downto 0) => cnt(12 downto 9)
    );
\cnt0_carry__2\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt0_carry__1_n_0\,
      CO(3) => \cnt0_carry__2_n_0\,
      CO(2) => \cnt0_carry__2_n_1\,
      CO(1) => \cnt0_carry__2_n_2\,
      CO(0) => \cnt0_carry__2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(16 downto 13),
      S(3 downto 0) => cnt(16 downto 13)
    );
\cnt0_carry__3\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt0_carry__2_n_0\,
      CO(3) => \cnt0_carry__3_n_0\,
      CO(2) => \cnt0_carry__3_n_1\,
      CO(1) => \cnt0_carry__3_n_2\,
      CO(0) => \cnt0_carry__3_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(20 downto 17),
      S(3 downto 0) => cnt(20 downto 17)
    );
\cnt0_carry__4\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt0_carry__3_n_0\,
      CO(3) => \cnt0_carry__4_n_0\,
      CO(2) => \cnt0_carry__4_n_1\,
      CO(1) => \cnt0_carry__4_n_2\,
      CO(0) => \cnt0_carry__4_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => data0(24 downto 21),
      S(3 downto 0) => cnt(24 downto 21)
    );
\cnt0_carry__5\: unisim.vcomponents.CARRY4
     port map (
      CI => \cnt0_carry__4_n_0\,
      CO(3 downto 0) => \NLW_cnt0_carry__5_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_cnt0_carry__5_O_UNCONNECTED\(3 downto 1),
      O(0) => data0(25),
      S(3 downto 1) => B"000",
      S(0) => cnt(25)
    );
\cnt[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => cnt(0),
      O => cnt_1(0)
    );
\cnt[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(10),
      O => cnt_1(10)
    );
\cnt[11]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(11),
      O => cnt_1(11)
    );
\cnt[12]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(12),
      O => cnt_1(12)
    );
\cnt[13]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(13),
      O => cnt_1(13)
    );
\cnt[14]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(14),
      O => cnt_1(14)
    );
\cnt[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(15),
      O => cnt_1(15)
    );
\cnt[16]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(16),
      O => cnt_1(16)
    );
\cnt[17]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(17),
      O => cnt_1(17)
    );
\cnt[18]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(18),
      O => cnt_1(18)
    );
\cnt[19]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(19),
      O => cnt_1(19)
    );
\cnt[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(1),
      O => cnt_1(1)
    );
\cnt[20]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(20),
      O => cnt_1(20)
    );
\cnt[21]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(21),
      O => cnt_1(21)
    );
\cnt[22]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(22),
      O => cnt_1(22)
    );
\cnt[23]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(23),
      O => cnt_1(23)
    );
\cnt[24]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(24),
      O => cnt_1(24)
    );
\cnt[25]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(25),
      O => cnt_1(25)
    );
\cnt[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(2),
      O => cnt_1(2)
    );
\cnt[3]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(3),
      O => cnt_1(3)
    );
\cnt[4]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(4),
      O => cnt_1(4)
    );
\cnt[5]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(5),
      O => cnt_1(5)
    );
\cnt[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(6),
      O => cnt_1(6)
    );
\cnt[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(7),
      O => cnt_1(7)
    );
\cnt[8]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(8),
      O => cnt_1(8)
    );
\cnt[9]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      I1 => data0(9),
      O => cnt_1(9)
    );
\cnt_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(0),
      Q => cnt(0)
    );
\cnt_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(10),
      Q => cnt(10)
    );
\cnt_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(11),
      Q => cnt(11)
    );
\cnt_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(12),
      Q => cnt(12)
    );
\cnt_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(13),
      Q => cnt(13)
    );
\cnt_reg[14]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(14),
      Q => cnt(14)
    );
\cnt_reg[15]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(15),
      Q => cnt(15)
    );
\cnt_reg[16]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(16),
      Q => cnt(16)
    );
\cnt_reg[17]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(17),
      Q => cnt(17)
    );
\cnt_reg[18]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(18),
      Q => cnt(18)
    );
\cnt_reg[19]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(19),
      Q => cnt(19)
    );
\cnt_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(1),
      Q => cnt(1)
    );
\cnt_reg[20]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(20),
      Q => cnt(20)
    );
\cnt_reg[21]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(21),
      Q => cnt(21)
    );
\cnt_reg[22]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(22),
      Q => cnt(22)
    );
\cnt_reg[23]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(23),
      Q => cnt(23)
    );
\cnt_reg[24]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(24),
      Q => cnt(24)
    );
\cnt_reg[25]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(25),
      Q => cnt(25)
    );
\cnt_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(2),
      Q => cnt(2)
    );
\cnt_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(3),
      Q => cnt(3)
    );
\cnt_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(4),
      Q => cnt(4)
    );
\cnt_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(5),
      Q => cnt(5)
    );
\cnt_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(6),
      Q => cnt(6)
    );
\cnt_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(7),
      Q => cnt(7)
    );
\cnt_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(8),
      Q => cnt(8)
    );
\cnt_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => '1',
      CLR => \led[3]_i_2_n_0\,
      D => cnt_1(9),
      Q => cnt(9)
    );
\led[3]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \led[3]_i_3_n_0\,
      O => led_0
    );
\led[3]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => s_rst,
      O => \led[3]_i_2_n_0\
    );
\led[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \led[3]_i_4_n_0\,
      I1 => \led[3]_i_5_n_0\,
      I2 => \led[3]_i_6_n_0\,
      I3 => \led[3]_i_7_n_0\,
      I4 => \led[3]_i_8_n_0\,
      I5 => \led[3]_i_9_n_0\,
      O => \led[3]_i_3_n_0\
    );
\led[3]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FF7F"
    )
        port map (
      I0 => cnt(15),
      I1 => cnt(14),
      I2 => cnt(17),
      I3 => cnt(16),
      O => \led[3]_i_4_n_0\
    );
\led[3]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DFFF"
    )
        port map (
      I0 => cnt(19),
      I1 => cnt(18),
      I2 => cnt(21),
      I3 => cnt(20),
      O => \led[3]_i_5_n_0\
    );
\led[3]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => cnt(6),
      I1 => cnt(7),
      I2 => cnt(9),
      I3 => cnt(8),
      O => \led[3]_i_6_n_0\
    );
\led[3]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => cnt(11),
      I1 => cnt(10),
      I2 => cnt(13),
      I3 => cnt(12),
      O => \led[3]_i_7_n_0\
    );
\led[3]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => cnt(3),
      I1 => cnt(2),
      I2 => cnt(5),
      I3 => cnt(4),
      O => \led[3]_i_8_n_0\
    );
\led[3]_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFFFFFFFFFFFFFFF"
    )
        port map (
      I0 => cnt(24),
      I1 => cnt(25),
      I2 => cnt(22),
      I3 => cnt(23),
      I4 => cnt(1),
      I5 => cnt(0),
      O => \led[3]_i_9_n_0\
    );
\led_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => sclk,
      CE => led_0,
      CLR => \led[3]_i_2_n_0\,
      D => \^led\(3),
      Q => \^led\(0)
    );
\led_reg[1]\: unisim.vcomponents.FDPE
     port map (
      C => sclk,
      CE => led_0,
      D => \^led\(0),
      PRE => \led[3]_i_2_n_0\,
      Q => \^led\(1)
    );
\led_reg[2]\: unisim.vcomponents.FDPE
     port map (
      C => sclk,
      CE => led_0,
      D => \^led\(1),
      PRE => \led[3]_i_2_n_0\,
      Q => \^led\(2)
    );
\led_reg[3]\: unisim.vcomponents.FDPE
     port map (
      C => sclk,
      CE => led_0,
      D => \^led\(2),
      PRE => \led[3]_i_2_n_0\,
      Q => \^led\(3)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_io_change_0_0 is
  port (
    sclk : in STD_LOGIC;
    s_rst : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_io_change_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_io_change_0_0 : entity is "design_1_io_change_0_0,io_change,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_io_change_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_io_change_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_io_change_0_0 : entity is "io_change,Vivado 2019.2";
end design_1_io_change_0_0;

architecture STRUCTURE of design_1_io_change_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of s_rst : signal is "xilinx.com:signal:reset:1.0 s_rst RST";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of s_rst : signal is "XIL_INTERFACENAME s_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.design_1_io_change_0_0_io_change
     port map (
      led(3 downto 0) => led(3 downto 0),
      s_rst => s_rst,
      sclk => sclk
    );
end STRUCTURE;
