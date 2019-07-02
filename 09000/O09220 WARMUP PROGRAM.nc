%
O09220 (Spindle Warm-up)
(This program should be run prior to) 
(machine use if machine has been idle) 
(for more than 4 days.) 
(Cycle time: 20-minutes.) 
(This program can be used for all) 
(spindle types and may be used daily) 
(for spindle warm-up prior to high) 
(speed spindle use. Adjust spindle) 
(speed override depending on maximum) 
(spindle speed of machine: Set) 
(override at 50% for 5,000 rpm) 
(machines, set at 100% for 7,500) 
(& 10,000 rpm machines, and set at) 
(150% for 15,000 rpm machines.) 
(Derived from O02020-11/6/2017)
S500 M03 
G04 P200. 
S1000 M03 
G04 P200. 
S2500 M03 
G04 P200. 
S5000 M03 
G04 P200. 
S7500 M03 
G04 P200. 
S10000 M03 
G04 P200. 
M30 





%