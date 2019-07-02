%
O09731 (#[#161+9] LOAD/ATAN)
IF [ #24 NE #0 ] GOTO6
#2= 30 (ANG INC)
#3= ROUND[ #1 / #2 ] (ANG NO)
#4= 0 (COUNT)
#5= 0
N1
IF [ #5 EQ 1 ] GOTO2
#[ #161 + 9 ]= #[ #161 ]
#5= 1
GOTO3
N2
#[ #161 + 9 ]= #[ #161 + 1 ]
#5= 0
N3
IF [ #4 GT 12 ] GOTO4
IF [ ABS[ #3 ] EQ #4 ] GOTO10
#4= #4 + 3
GOTO1
N4 (V ANGS)
IF [ #3 LT 0 ] GOTO5
#[ #161 + 9 ]= #[ #161 + 9 + #3 - [ FIX [ #3 / 3 ] * 1 ] ]
GOTO10
N5
#[ #161 + 9 ]= #[ #161 + 9 + 12 + #3 - [ FIX[ [ 12 + #3 ] / 3 ] * 1 ] ]
GOTO10
N6 (ATAN)
#24= [ ROUND[ #24 * 10000 ] ] / 10000
#25= [ ROUND[ #25 * 10000 ] ] / 10000
IF [ #24 NE 0 ] GOTO7
#168= 90
IF [ #25 GE 0 ] GOTO10
#168= -90
GOTO10
N7
IF [ #25 NE 0 ] GOTO8
#168= 0
IF [ #24 GE 0 ] GOTO10
#168= 180
GOTO10
N8
#168= ATAN[ ABS[ #25 ] / ABS[ #24 ] ]
IF [ #24 GE 0 ] GOTO9
#168= 180 - #168
N9
IF [ #25 GE 0 ] GOTO10
#168= - #168
N10
(G04 P1.0)
M99





%