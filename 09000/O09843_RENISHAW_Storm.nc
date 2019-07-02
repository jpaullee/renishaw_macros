%
O09843 (XY PLANE ANGLE RENISHAW V3.11 FOR NGC)
G103 P1
#3001= 0
G04 P250
IF [ #3001 LT 200 ] GOTO999 (TEST RUNNING IN GRAPHICS)
M98 P9724
G65 P9725 A1.
#27= #5041
#28= #5042
#5= 185
WHILE [ #5 LE 199 ] DO1
#[ #5 ]= #0
#5= #5 + 1
END1
N1
IF [ #17 NE #0 ] GOTO2
#17= 10.0 * #179
N2
IF [ #7 EQ #0 ] GOTO8
IF [ #24 EQ #0 ] GOTO4
(X AXIS)
IF [ #25 NE #0 ] GOTO9
IF [ #1 NE #0 ] GOTO3
#1= 90.0
N3
#14= TAN[ 90 - #1 ] * #7 / 2 (X STEP)
#15= #7 / 2 (Y STEP)
G65 P9810 X [ #27 + #14 ] Y [ #28 + #15 ] F#169
G65 P9726 X [ #24 + #14 ] Q [ #17 ] F#169 S #[ #161 ]
IF [ #199 NE 0 ] GOTO11
#30= #174 ( X1)
G65 P9810 X [ #27 - #14 ] Y [ #28 - #15 ] F#169
G65 P9726 X [ #24 - #14 ] Q [ #17 ] F#169 S #[ #161 ]
IF [ #199 NE 0 ] GOTO11
#31= #174 ( X2)
G00 X#27 Y#28
#29= #31 - #30
G65 P9731 Y#7 X - #29 (ATAN)
#16= #168
GOTO6
N4
(Y AXIS)
IF [ #25 EQ #0 ] GOTO10
IF [ #1 NE #0 ] GOTO5
#1= 0
N5
#14= #7 / 2 (X STEP)
#15= TAN[ #1 ] * #7 / 2 (Y STEP)
G65 P9810 X [ #27 + #14 ] Y [ #28 + #15 ] F#169
G65 P9726 Y [ #25 + #15 ] Q [ #17 ] F#169 S #[ #161 + 1 ]
IF [ #199 NE 0 ] GOTO11
#30= #175 ( Y1)
G65 P9810 X [ #27 - #14 ] Y [ #28 - #15 ] F#169
G65 P9726 Y [ #25 - #15 ] Q [ #17 ] F#169 S #[ #161 + 1 ]
IF [ #199 NE 0 ] GOTO11
#31= #175 ( Y2)
G00 X#27 Y#28
#29= #31 - #30
G65 P9731 Y - #29 X#7 (ATAN)
#16= #168
N6
#189= #16 (ANGLE)
#193= #29 (HEIGHT DIFF)
#194= #16 - #1 (ANGLE ERROR)
IF [ #23 EQ #0 ] GOTO7
G65 P9730 A [ #1 ] Q#2 W#23
N7
IF [ #2 EQ #0 ] GOTO13
IF [ ABS[ #194 ] LT #2 ] GOTO13
#[ 3006 - [ [ #170 AND 8 ] / 8 * 6 ] ]= 1 (OUT OF TOL)
GOTO13
N8
#3000= 91 (D INPUT MISSING)
N9
#3000= 91 (XY INPUT MIXED)
N10
#3000= 91 (XY INPUT MISSING)
N11
G00 X#27 Y#28
IF [ #199 EQ 2 ] GOTO12
IF [ #199 EQ 4 ] GOTO12
#3000= 92 (UNEXPECTED SURFACE FOUND)
N12
#3000= 93 (SURFACE NOT FOUND)
N13
N999
G103
(G04 P1.0)
M99





%