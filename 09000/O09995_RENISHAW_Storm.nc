%
O09995 (WIPS FOR RENISHAW RENISHAW V3.11 FOR NGC)
(05-5-2014)
G103 P1
#3001= 0
G04 P250
IF [ #3001 LT 200 ] GOTO999 (TEST RUNNING IN GRAPHICS)
#598= #0 ( CLEAR SETTINGS CHECKED 9725 FLAG )
(CHECK PROBING OPTION)
#179= 1 / 25.4
IF [ #4006 EQ 20 ] GOTO1
IF [ #4006 EQ 70 ] GOTO1
#179= 1
N1
IF [ #1 EQ 0 ] GOTO100 (AUTO)
IF [ #1 EQ 1 ] GOTO300 (MANUALLY)
IF [ #1 EQ 2 ] GOTO400 (BREAKAGE/WEAR)
#27= 10 (DEFAULT Q IN MM)
#30= 10 (STAND OFF)
IF [ #23 GE 154. ] GOTO3
IF [[ #23 GE 110. ] AND [#23 LE 129.]] THEN #23= [[[ #23 - 109. ]/100. ] + 154.]
IF [ [ #23 GE 54. ] AND [#23 LE 59.] ] THEN #23= #23 - 53
IF [[ #23 GT 129. ] AND [#23 LT 154.]] THEN #3000= 129(OFFSET OUT OF RANGE)
N3
G43 H#3026
IF [ #556 NE 0 ] GOTO31 (CHECK CAL)
IF [ #556 NE #0 ] GOTO31
#3000=106(OMP40 NEEDS CALIBRATION)
N31
G65 P9832
#30= #30 * #179
IF [ #1 EQ 10 ] GOTO500 (BORE)
IF [ #1 EQ 11 ] GOTO505 (BOSS)
IF [ #1 EQ 12 ] GOTO510 (RECTANGLE POCKET)
IF [ #1 EQ 13 ] GOTO515 (RECTANGLE BLOCK)
IF [ #1 EQ 14 ] GOTO520 (WEB X AXIS)
IF [ #1 EQ 15 ] GOTO525 (POCKET X AXIS)
IF [ #1 EQ 16 ] GOTO530 (WEB Y AXIS)
IF [ #1 EQ 17 ] GOTO535 (POCKET Y AXIS)
IF [ #1 EQ 18 ] GOTO540 (OUTSIDE CORNER)
IF [ #1 EQ 19 ] GOTO545 (INSIDE CORNER)
IF [ #1 EQ 20 ] GOTO550 (SINGLE SURFACE)
IF [ #1 EQ 21 ] GOTO555 (VICE CORNER)
GOTO800
(CHECK TOOLS WHILE ROTATING)
N100 (AUTO)
(CHECK TOOL TYPE)
G65 P9725 A3.
IF [ #2 EQ 1 ] GOTO110 (DRILL)
IF [ #2 EQ 2 ] GOTO120 (TAP)
IF [ #2 EQ 3 ] GOTO130 (SHELL MILL)
IF [ #2 EQ 4 ] GOTO140 (END MILL)
IF [ #2 EQ 5 ] GOTO150 (SPOT DRILL)
IF [ #2 EQ 6 ] GOTO160 (BALL NOSE)
IF [ #2 EQ 7 ] GOTO135 (PROBE)
GOTO900
N130 (SHELL MILL)
N140 (END MILL)
(CHECK PROBING TYPE)
G65 P9725 A3.
IF [ #3 EQ 0 ] GOTO900 (NO PROBING)
IF [ #3 EQ 1 ] GOTO125 (LENGTH ONLY ROTATING)
IF [ #3 EQ 2 ] GOTO135 (LENGTH ONLY NON-ROTATING)
IF [ #3 EQ 3 ] GOTO145 (LENGTH AND DIAMETER ROTATING)
GOTO900
N125 (LENGTH ONLY ROTATING)
G00 G90
#156= 1 (2=RADOFF,1=DIAOFF)
IF [ #20040 EQ 1 ] GOTO127 (RAD DIA) (storm)
#156= 2
N127
(OFFSET LOAD)
#[ 2000 + #20 ]= #8
#[ 2200 + #20 ]= 0
G65 P9853 B1. T#20 S [ #7 * #156 ]
GOTO900
N110 (DRILL)
N120 (TAP)
N150 (SPOT DRILL)
N160 (BALL DRILL)
(CHECK TOOLS WHILE NOT ROTATING)
N135 (NON-ROTATING TOOL)
IF [ #3 NE 1 ] GOTO138 (LENGTH ONLY ROTATING)
M04 S800
N138
G28 G91 Z0
G49
G90
#174= 0
M98 P9799
G103 P1
#27= #5021 - #5041
#30= #5022 - #5042
#31= #5023 - #5043
#3004= 0
G00 X [ #167 - #27 ] Y [ #168 - #30 ]
G65 P9855 (OTS FLASHON)
G103 P1
#3004= 2
M79 G31 Z [ - [  [ #30003.036 - 12.7  ] * #179 ] - #31 ] F [ 2032. * #179 ] (STOPS 1 INCH FROM Z STROKE) (storm)
#14= 0.5 (RESET COUNTER)
WH [ #11017 NE 0 ] DO1 (WAIT FOR STYLUS SEATED) (storm)
IF [ #14 LT 30. ] GOTO30 (MOVE UP TO 15MM OFF)
#3000= 92 (UNEXPECTED SURFACE FOUND)
N30
G01 Z [ #5063 + [ #14 * #179 ] ] F [ 2032. * #179 ] (ADJUST #14 BACK OFF STEP)
#14= #14 + 0.5
END1
G103 P1
#28= #5043 - [ 10 * #179 ]
#32= #5043 + [ 10 * #179 ]
M79 G31 Z#28 F [ 30 * #179 ]
G04 P160 (M98 P9854)
G01 Z#32 F [ 2032. * #179 ]
#3004= 0
#8= #5063 + #31 - #163
#[ 2000 + #20 ]= #8
#[ 2200 + #20 ]= 0
#6= #6 + [ #5043 - #5063 ] (ADD Z DEEP FROM DISK FACE)
G103 P1
M05
IF [ #3 NE 3 ] GOTO136
#156= 1 (2=RADOFF,1=DIAOFF)
IF [ #20040 EQ 1 ] GOTO137 (RAD DIA) (storm)
#156= 2
N137
G65 P9852 S[ #7 * #156 ] D#20 Z - [ABS[ #6] ]
N136
G91 G28 Z0
G90
GOTO900
(LENGTH AND DIAMETER MEASURE)
N145 (LENGTH AND DIAMETER MEASURE)
G00 G90
(OFFSET LOAD)
#[ 2000 + #20 ]= #8
#[ 2200 + #20 ]= 0
#[ 2400 + #20 ]= #7
#[ 2600 + #20 ]= 0
G65 P9853 B3. T#20 D#20 Z - [ ABS[ #6 ] ]
GOTO900
N170 (PROBE)
#[ 2000 + #20 ]= #8
#[ 2200 + #20 ]= 0
G65 P9853 B1. T#20
GOTO900
(MANUALLY CHECK TOOLS)
N300 (MANUALLY)
G00 G90
G65 P9855 (OTS ON)
G103 P1
G65 P9851 T#20
GOTO900
(CHECK TOOLS FOR BREAKAGE AND WEAR)
N400 (BREAKAGE/WEAR)
G28 G91 Z0
G90 G49
G00 G90
G65 P9853 B1. T#20 H#4
GOTO900
N500 (BORE)
(G65 P9351 W#23 D#7 X#8 Y#11)
G65 P9814 D#7 R#18 T#20 Q#17
G103 P1
#190= #190 + #5041
#191= #191 + #5042
G31 X [ #190 ] Y [ #191 ] F [ 1016. * #179 ]
#190= #190 + #8
#191= #191 + #11
G65 P9732 S#23 W1.
GOTO800
N505 (BOSS)
(G65 P9352 W#23 D#7 K#8 X#11 Y#4)
IF [ #8 NE #0 ] GOTO506
#10= #5043 - #5083
#12= #5043 - #5083 - #30
M79 G31 Z#12 F [ 1016. * #179 ]
G01 Z#10
#8= #5063 - #5083 - [ #556 * 2 ]
GOTO507
N506
#8= #5043 - #5083 - ABS[ #8 ]
N507
G65 P9814 D#7 Z#8 R#18 Q#17
G103 P1
#190= #190 + #5041
#191= #191 + #5042
G31 X [ #190 ] Y [ #191 ] F [ 1016. * #179 ]
#190= #190 + #11
#191= #191 + #4
G65 P9732 S#23 W1.
GOTO800
N510 (RECTANGLE POCKET)
(G65 P9351 W#23 A#7 B#8 X#11 Y#4)
G65 P9812 X#7 R#18 Q#17
#3= #190
G65 P9812 Y#8 R#18 Q#17
G103 P1
#190= #3 + #5041
#191= #191 + #5042
G31 X [ #190 ] Y [ #191 ] F [ 1016. * #179 ]
#190= #190 + #11
#191= #191 + #4
G65 P9732 S#23 W1.
GOTO800
N515 (RECTANGLE BLOCK)
(G65 P9352 W#23 A#7 B#8 K#11 X#4 Y#5)
IF [ #11 NE #0 ] GOTO516
#10= #5043 - #5083
#12= #5043 - #5083 - #30
M79 G31 Z#12 F [ 1016. * #179 ]
G01 Z#10
#11= #5063 - #5083 - [ #556 * 2 ]
GOTO517
N516
#11= #5043 - #5083 - ABS[ #11 ]
N517
G65 P9812 X#7 Q#17 Z#11
#3= #190
G65 P9812 Y#8 Q#17 Z#11
#190= #3 + #5041
#191= #191 + #5042
G31 X [ #190 ] Y [ #191 ] F [ 1016. * #179 ]
#190= #190 + #4
#191= #191 + #5
G65 P9732 S#23 W1.
GOTO800
N520 (WEB X AXIS)
(G65 P9353 W#23 D#7 X#8 K#11)
IF [ #11 NE #0 ] GOTO521
#10= #5043 - #5083
#12= #5043 - #5083 - #30
M79 G31 Z#12 F [ 1016. * #179 ]
G01 Z#10
#11= #5063 - #5083 - [ #556 * 2 ]
GOTO522
N521
#11= #5043 - #5083 - ABS[ #11 ]
N522
G65 P9812 X#7 Z#11 Q#17
G103 P1
#190= #190 + #5041
G31 X [ #190 ] F [ 1016. * #179 ]
#190= #190 + #8
G65 P9732 S#23 W1.
GOTO800
N525 (POCKET X AXIS)
(G65 P9354 W#23 D#7 X#8)
G65 P9812 X#7 R#18 Q#17
G103 P1
N7
#190= #190 + #5041
G31 X [ #190 ] F [ 1016. * #179 ]
#190= #190 + #8
G65 P9732 S#23 W1.
GOTO800
N530 (WEB Y AXIS)
(G65 P9355 W#23 D#7 Y#8 K#11)
IF [ #11 NE #0 ] GOTO531
#10= #5043 - #5083
#12= #5043 - #5083 - #30
M79 G31 Z#12 F [ 1016. * #179 ]
G01 Z#10
#11= #5063 - #5083 - [ #556 * 2 ]
GOTO532
N531
#11= #5043 - #5083 - ABS[ #11 ]
N532
G65 P9812 Y#7 Z#11 Q#17
G103 P1
#191= #191 + #5042
G31 Y [ #191 ] F [ 1016. * #179 ]
#191= #191 + #8
G65 P9732 S#23 W1.
GOTO800
N535 (POCKET Y AXIS)
(G65 P9356 W#23 D#7 Y#8)
G65 P9812 Y#7 R#18 Q#17
G103 P1
N7
#191= #191 + #5042
Y [ #191 ] F [ 1016. * #179 ]
#191= #191 + #8
G65 P9732 S#23 W1.
GOTO800
N540 (OUTSIDE CORNER)
(G65 P9358 W#23 V#7 K#8 I#11 J#4)
IF [ #7 GT 1 ] GOTO541
#14= 1 (1)
#15= 1
GOTO544
N541
IF [ #7 GT 2 ] GOTO542
#14= -1 (2)
#15= 1
GOTO544
N542
IF [ #7 GT 3 ] GOTO543
#14= -1 (3)
#15= -1
GOTO544
N543
#14= 1 (4)
#15= -1
N544
IF [ #11 NE #0 ] GOTO5445
#11= 10 * #179
N5445
IF [ #4 NE #0 ] GOTO5446
#4= 10 * #179
N5446
#31= #5041
#32= #5042
IF [ #8 EQ 0 ] GOTO5441
IF [ #8 NE #0 ] GOTO5441
M78 G31 X [ #31 + [ #556 * 2 * #14 ] ] Y [ #32 + [ #556 * 2 * #15 ] ] F [ 2032. * #179 ]
#10= #5043 - #5083
#12= #5043 - #5083 - #30
M79 G31 Z#12 F [ 1016. * #179 ]
G01 Z#10
#28= #5063 - #5083
N5441
M78 G31 X [ #31 - [ #556 * 3 * #14 ] ] Y [ #32 - [ #556 * 3 * #15 ] ] F [ 2032. * #179 ]
#10= #5043 - #5083
IF [ #8 EQ 0 ] GOTO5442
IF [ #8 NE #0 ] GOTO5442
#12= #28 - [ #556 * 2 ]
M78 G31 Z#12 F [ 1016. * #179 ]
GOTO5443
N5442
M78 G31 Z [ #10 - [ ABS[ #8 ] ] ] F [ 1016. * #179 ]
N5443
#31= #5041 + [ #30 * #14 ]
#32= #5042 + [ #30 * #15 ]
#29= #5041
M78 G31 X [ #31 + [ [ [ ABS[ #11 ] ] ] * #14 ] ] F [ 1016. * #179 ]
G65 P9811 Y#32 Q#17
G103 P1
M78 G31 X#29 F [ 1016. * #179 ] (MOVE BACK)
#3= #191
#30= #5042
M78 G31 Y [ #32 + [ [ ABS[ #4 ] ] * #15 ] ] F [ 1016. * #179 ]
G65 P9811 X#31 Q#17
G103 P1
M78 G31 Y#30 F [ 1016. * #179 ] (MOVE BACK)
M78 G31 Z#10 F [ 1016. * #179 ]
M78 G31 X [ [ #190 ] + #31 ] Y [ [ #3 ] + #32 ] F [ 2032. * #179 ]
#190= #190 + #31
#191= #3 + #32
G65 P9732 S#23 W1.
GOTO800
N545 (INSIDE CORNER)
(G65 P9357 W#23 V#7 K#8 I#11 J#4)
G103 P1
IF [ #7 GT 1 ] GOTO546
#14= -1 (1)
#15= -1
GOTO549
N546
IF [ #7 GT 2 ] GOTO547
#14= 1 (2)
#15= -1
GOTO549
N547
IF [ #7 GT 3 ] GOTO548
#14= 1 (3)
#15= 1
GOTO549
N548
#14= -1 (4)
#15= 1
N549
IF [ #11 NE #0 ] GOTO5495
#11= 10 * #179
N5495
IF [ #4 NE #0 ] GOTO5496
#4= 10 * #179
N5496
#31= #5041
#32= #5042
IF [ #8 EQ 0 ] GOTO5491
IF [ #8 NE #0 ] GOTO5491
M78 G31 X [ #31 + [ #556 * 2 * #14 ] ] Y [ #32 + [ #556 * 2 * #15 ] ] F [ 2032. * #179 ]
#10= #5043 - #5083
#12= #5043 - #5083 - #30
M79 G31 Z#12 F [ 1016. * #179 ]
G01 Z#10
#28= #5063 - #5083
N5491
M78 G31 X [ #31 - [ #556 * 3 * #14 ] ] Y [ #32 - [ #556 * 3 * #15 ] ] F [ 2032. * #179 ]
#10= #5043 - #5083
IF [ #8 EQ 0 ] GOTO5492
IF [ #8 NE #0 ] GOTO5492
#12= #28 - [ #556 * 2 ]
M78 G31 Z#12 F [ 1016. * #179 ]
GOTO5493
N5492
M78 G31 Z [ #10 - [ ABS[ #8 ] ] ] F [ 1016. * #179 ]
N5493
#31= #5041 + [ #30 * #14 ]
#32= #5042 + [ #30 * #15 ]
#29= #5041
M78 G31 X [ #31 + [ [ - [ ABS[ #11 ] ] ] * #14 ] ] F [ 1016. * #179 ]
G65 P9811 Y#32 Q#17
G103 P1
M78 G31 X#29 F [ 1016. * #179 ] (MOVE BACK)
#3= #191
#30= #5042
M78 G31 Y [ #32 + [ [ - [ ABS[ #4 ] ] ] * #15 ] ] F [ 1016. * #179 ]
G65 P9811 X#31 Q#17
G103 P1
M78 G31 Y#30 F [ 1016. * #179 ] (MOVE BACK)
M78 G31 Z#10 F [ 1016. * #179 ]
M78 G31 X [ [ #190 ] + #31 ] Y [ [ #3 ] + #32 ] F [ 2032. * #179 ]
#190= #190 + #31
#191= #3 + #32
G65 P9732 S#23 W1.
GOTO800
N550 (SINGLE SURFACE)
(G65 P9359 W#23 X#7 Y#8 Z#11)
IF [ #8 NE #0 ] GOTO551
IF [ #11 NE #0 ] GOTO552
(SET SURF X)
#14= #5041 + #7
G65 P9811 X#14 Q#17
G103 P1
#190= #190 + #14
GOTO553
N551 (SET SURF Y)
#15= #5042 + #8
G65 P9811 Y#15 Q#17
G103 P1
#191= #191 + #15
N553
G65 P9732 S#23 W1.
GOTO554
N552 (SET SURF Z)
#16= #5043 - #5083 + #11
G65 P9811 Z#16 Q#17
G103 P1
#192= #192 + #16
G65 P9732 S#23 W1. Z1.
N554
GOTO800
N555 (VICE CORNER)
(G65 P9358 W#23 V#7 K#8 I#11 J#4)
IF [ #7 GT 1 ] GOTO5541
#14= 1 (1)
#15= 1
GOTO5544
N5541
IF [ #7 GT 2 ] GOTO5542
#14= -1 (2)
#15= 1
GOTO5544
N5542
IF [ #7 GT 3 ] GOTO5543
#14= -1 (3)
#15= -1
GOTO5544
N5543
#14= 1 (4)
#15= -1
N5544
IF [ #11 NE #0 ] GOTO6445
#11= 10 * #179
N6445
IF [ #4 NE #0 ] GOTO6446
#4= 10 * #179
N6446
#31= #5041
#32= #5042
IF [ #8 EQ 0 ] GOTO6441
IF [ #8 NE #0 ] GOTO6441
M78 G31 X [ #31 + [ #556 * 2 * #14 ] ] Y [ #32 + [ #556 * 2 * #15 ] ] F [ 2032. * #179 ]
#10= #5043 - #5083
#12= #5043 - #5083 - #30
M79 G31 Z#12 F [ 1016. * #179 ]
G01 Z#10
#28= #5063 - #5083
N6441
M78 G31 X [ #31 - [ #556 * 3 * #14 ] ] Y [ #32 - [ #556 * 3 * #15 ] ] F [ 2032. * #179 ]
#10= #5043 - #5083
IF [ #8 EQ 0 ] GOTO6442
IF [ #8 NE #0 ] GOTO6442
#12= #28 - [ #556 * 2 ]
M78 G31 Z#12 F [ 1016. * #179 ]
GOTO6443
N6442
M78 G31 Z [ #10 - [ ABS[ #8 ] ] ] F [ 1016. * #179 ]
N6443
#31= #5041 + [ #30 * #14 ]
#32= #5042 + [ #30 * #15 ]
#29= #5041
M78 G31 X [ #31 + [ [ [ ABS[ #11 ] ] ] * #14 ] ] F [ 1016. * #179 ]
G65 P9811 Y#32 Q#17
G103 P1
M78 G31 X#29 F [ 1016. * #179 ] (MOVE BACK)
#3= #191
#30= #5042
M78 G31 Y [ #32 + [ [ ABS[ #4 ] ] * #15 ] ] F [ 1016. * #179 ]
G65 P9811 X#31 Q#17
G103 P1
M78 G31 Y#30 F [ 1016. * #179 ] (MOVE BACK)
M78 G31 Z#10 F [ 1016. * #179 ]
M78 G31 X [ [ #190 ] + #31 ] Y [ [ #3 ] + #32 ] F [ 2032. * #179 ]
#190= #190 + #31
#191= #3 + #32
G65 P9732 S#23 W1.
GOTO800
N800
G65 P9833 (OMP40 OFF)
GOTO999
N900
G65 P9856 (FLASH OTS OFF)
(END OF PROGRAM)
N999
G103
#598= #0 ( CLEAR SETTINGS CHECKED 9725 FLAG )
(G04 P1.0)
M99



%