%
O09221 (Spindle Run-in) 
(This Program must be run prior to) 
(machine use at time of machine) 
(installation. Cycle time: 2 hours.) 
(This program can be used for all) 
(spindle types. Adjust spindle speed) 
(override depending on maximum) 
(spindle speed of machine: Set) 
(override at 50% for 5,000 rpm) 
(machines, set at 100% for 7,500) 
(& 10,000 rpm machines, and set at) 
(150% for 15,000 rpm machines.) 
(Derived from O02021-11/6/2017) 
N100 
S750 M03 
G04 P600. 
S2500 M03 
G04 P600. 
S5000 M03 
G04 P900. 
N200 
M97 P1000 L15 
M97 P2000 L15 

M30 

N1000 
S7500 M03 
G04 P30. 
S500 M03 
G04 P150. 
M99 

N2000 
S10000 M03 
G04 P30. 
S500 M03 
G04 P150. 
M99 



%