%
O09353 (IPS WEB X RENISHAW V3.11 FOR NGC)
(PROBE - WEB X AXIS)
(G65P9353W114.D2.K.6)
G103 P1
#3001= 0
G04 P250
IF [ #3001 LT 200 ] GOTO999 (TEST RUNNING IN GRAPHICS)
#27= 10 (DEFAULT Q IN MM)
#30= 10 (STAND OFF)
#161= 556 (START CALIBRATION VARIABLE)
IF [ #23 GE 110 ] GOTO3
#23= #23 - 53
N3
IF [ #[ #161 ] EQ 0 ] GOTO91 (CHECK CAL)
IF [ #[ #161 ] EQ #0 ] GOTO91
G43 H#3026
G65 P9832
#30= #30 * #179
(TOUCH TOP DOWN BY DIA)
IF [ #6 NE #0 ] GOTO4
#10= #5043 - #5083
#12= #5043 - #5083 - #30
M79 G31 Z#12 F [ 1016. * #179 ]
G01 Z#10
#6= #5063 - #5083 - [ #556 * 2 ]
GOTO5
N4
(WEB)
#6= #5043 - #5083 - ABS[ #6 ]
N5
G65 P9812 X#7 Z#6 Q#17
G103 P1
N7
#190= #190 + #5041
G31 X [ #190 ] F [ 1016. * #179 ]
#190= #190 + #24
G65 P9732 S#23 W1.
G65 P9833
GOTO999
N91 #3000= 11 (OMP40 NOT CALIBRATED)
N999
(G04 P1.0)
M99





%