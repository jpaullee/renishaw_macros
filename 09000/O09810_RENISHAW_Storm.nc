%
O09810 (PROTECTED POSN RENISHAW V3.11 FOR NGC)
G103 P1
#3001= 0
G04 P250
IF [ #3001 LT 200 ] GOTO999 (TEST RUNNING IN GRAPHICS)
G65 P9724
G65 P9725 A1.
IF [ #9 NE #0 ] GOTO3
IF [ #167 NE #0 ] GOTO2
#3000= 88 (NO FEED RATE)
N2
#9= #167
N3
#167= #9
#198= 0
N4
G31 X#24 Y#25 Z#26 F#9
IF [ #24 EQ #0 ] GOTO5
IF [ ABS[ #5041 - [ #24 ] ] GT #173 ] GOTO8
N5
IF [ #25 EQ #0 ] GOTO6
IF [ ABS[ #5042 - [ #25 ] ] GT #173 ] GOTO8
N6
IF [ #26 EQ #0 ] GOTO7
IF [ ABS[ [ #5043 - #166 ] - [ #26 ] ] GT #173 ] GOTO8
N7
GOTO9
N8
#198= 7.
IF [ #13 EQ 1. ] GOTO9
#3000= 86 (PATH OBSTRUCTED)
N9
N999
G103
(G04 P1.0)
M99





%