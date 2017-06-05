library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity AND2 is
Port ( in1 : in std_logic; in2 : in std_logic; out1 : out std_logic);
end AND2;
architecture AND2 of AND2 is
begin
out1 <= in1 and in2;
end AND2;
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FullAdd is
Port(X: in STD_LOGIC; Y: in STD_LOGIC; Cin: in STD_LOGIC;
SUM: out STD_LOGIC; C: out STD_LOGIC);
end FullAdd;
architecture Fadd of FullAdd is
begin
SUM <= (X xor Y xor Cin);
C <= ((X and Y) or ((X xor Y) and Cin));
end Fadd;
library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity mult is
port(A:in STD_LOGIC_VECTOR(2 downto 0);
     B:in STD_LOGIC_VECTOR(2 downto 0);
     P:out STD_LOGIC_VECTOR(6 downto 0));
end mult;

architecture mult1 of mult is
component AND2 Port ( in1 : in std_logic; in2 : in std_logic;
out1 : out std_logic);
end component;
component FullAdd Port(X: in STD_LOGIC; Y: in STD_LOGIC;
Cin: in STD_LOGIC; SUM: out STD_LOGIC;
C: out STD_LOGIC);
end component;
signal A0B0,A1B0,A2B0,A0B1,A1B1,A2B1,A0B2,A1B2,A2B2,C1,S1,C2,C3,C4,S2,C5,S3,C6,C7:STD_LOGIC;

begin
ND0:AND2 port map(B(0),A(0),p(0));
ND1:AND2 port map(B(0),A(1),A1B0);
ND2:AND2 port map(B(0),A(2),A2B0);
ND3:AND2 port map(B(1),A(0),A0B1);
ND4:AND2 port map(B(1),A(1),A1B1);
ND5:AND2 port map(B(1),A(2),A2B1);
ND6:AND2 port map(B(2),A(0),A0B2);
ND7:AND2 port map(B(2),A(1),A1B2);
ND8:AND2 port map(B(2),A(2),A2B2);
FA0:FullAdd port map(A1B0,A0B1,'0',P(1),C1);
FA1:FullAdd port map(A1B1,A2B0,C1,S1,C3);
FA2:FullAdd port map(A0B2,S1,'0',P(2),C2);
FA3:FullAdd port map(C3,C2,'0',S2,C4);
FA4:FullAdd port map(A1B2,A2B1,S2,P(3),C5);
FA5:FullAdd port map(C5,C4,'0',S3,C6);
FA6:FullAdd port map(A2B2,S3,'0',P(4),C7);
FA7:FullAdd port map(C6,C7,'0',P(5),P(6));
end mult1;
