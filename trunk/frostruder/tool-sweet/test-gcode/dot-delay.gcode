( taste-delay.py --line-length=0 )
(After you run the script, use the reference below to determine delays.)
(Starting from the top, the dot lines were printed at the following delays:)
(#1 - 10 milliseconds)
(#2 - 16 milliseconds)
(#3 - 22 milliseconds)
(#4 - 28 milliseconds)
(#5 - 34 milliseconds)
(#6 - 40 milliseconds)
(#7 - 46 milliseconds)
(#8 - 52 milliseconds)
(#9 - 58 milliseconds)
(#10 - 64 milliseconds)
(#11 - 70 milliseconds)
(#12 - 76 milliseconds)
(#13 - 82 milliseconds)
(#14 - 88 milliseconds)
(#15 - 94 milliseconds)
(#16 - 100 milliseconds)

G21 (metric ftw)
G90 (absolute mode)
G92 X0 Y0 Z0 (zero all axes)
G1 X0.00 Y0.00 Z0.25 F150.0

(dot at -40.00, 40.00)
G1 X-40.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X-40.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, 40.00)
G1 X-35.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X-35.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, 40.00)
G1 X-30.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X-30.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, 40.00)
G1 X-25.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X-25.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, 40.00)
G1 X-20.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X-20.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, 40.00)
G1 X-15.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X-15.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, 40.00)
G1 X-10.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X-10.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, 40.00)
G1 X-5.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X-5.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, 40.00)
G1 X0.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X0.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, 40.00)
G1 X5.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X5.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, 40.00)
G1 X10.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X10.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, 40.00)
G1 X15.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X15.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, 40.00)
G1 X20.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X20.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, 40.00)
G1 X25.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X25.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, 40.00)
G1 X30.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X30.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, 40.00)
G1 X35.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P10 (wait 10 ms)
G1 X35.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, 35.00)
G1 X-40.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X-40.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, 35.00)
G1 X-35.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X-35.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, 35.00)
G1 X-30.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X-30.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, 35.00)
G1 X-25.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X-25.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, 35.00)
G1 X-20.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X-20.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, 35.00)
G1 X-15.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X-15.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, 35.00)
G1 X-10.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X-10.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, 35.00)
G1 X-5.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X-5.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, 35.00)
G1 X0.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X0.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, 35.00)
G1 X5.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X5.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, 35.00)
G1 X10.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X10.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, 35.00)
G1 X15.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X15.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, 35.00)
G1 X20.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X20.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, 35.00)
G1 X25.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X25.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, 35.00)
G1 X30.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X30.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, 35.00)
G1 X35.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P16 (wait 16 ms)
G1 X35.00 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, 30.00)
G1 X-40.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X-40.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, 30.00)
G1 X-35.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X-35.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, 30.00)
G1 X-30.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X-30.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, 30.00)
G1 X-25.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X-25.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, 30.00)
G1 X-20.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X-20.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, 30.00)
G1 X-15.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X-15.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, 30.00)
G1 X-10.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X-10.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, 30.00)
G1 X-5.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X-5.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, 30.00)
G1 X0.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X0.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, 30.00)
G1 X5.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X5.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, 30.00)
G1 X10.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X10.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, 30.00)
G1 X15.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X15.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, 30.00)
G1 X20.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X20.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, 30.00)
G1 X25.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X25.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, 30.00)
G1 X30.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X30.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, 30.00)
G1 X35.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P22 (wait 22 ms)
G1 X35.00 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, 25.00)
G1 X-40.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X-40.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, 25.00)
G1 X-35.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X-35.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, 25.00)
G1 X-30.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X-30.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, 25.00)
G1 X-25.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X-25.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, 25.00)
G1 X-20.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X-20.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, 25.00)
G1 X-15.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X-15.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, 25.00)
G1 X-10.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X-10.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, 25.00)
G1 X-5.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X-5.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, 25.00)
G1 X0.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X0.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, 25.00)
G1 X5.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X5.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, 25.00)
G1 X10.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X10.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, 25.00)
G1 X15.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X15.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, 25.00)
G1 X20.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X20.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, 25.00)
G1 X25.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X25.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, 25.00)
G1 X30.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X30.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, 25.00)
G1 X35.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P28 (wait 28 ms)
G1 X35.00 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, 20.00)
G1 X-40.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X-40.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, 20.00)
G1 X-35.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X-35.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, 20.00)
G1 X-30.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X-30.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, 20.00)
G1 X-25.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X-25.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, 20.00)
G1 X-20.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X-20.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, 20.00)
G1 X-15.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X-15.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, 20.00)
G1 X-10.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X-10.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, 20.00)
G1 X-5.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X-5.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, 20.00)
G1 X0.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X0.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, 20.00)
G1 X5.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X5.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, 20.00)
G1 X10.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X10.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, 20.00)
G1 X15.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X15.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, 20.00)
G1 X20.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X20.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, 20.00)
G1 X25.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X25.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, 20.00)
G1 X30.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X30.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, 20.00)
G1 X35.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P34 (wait 34 ms)
G1 X35.00 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, 15.00)
G1 X-40.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X-40.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, 15.00)
G1 X-35.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X-35.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, 15.00)
G1 X-30.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X-30.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, 15.00)
G1 X-25.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X-25.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, 15.00)
G1 X-20.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X-20.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, 15.00)
G1 X-15.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X-15.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, 15.00)
G1 X-10.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X-10.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, 15.00)
G1 X-5.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X-5.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, 15.00)
G1 X0.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X0.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, 15.00)
G1 X5.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X5.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, 15.00)
G1 X10.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X10.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, 15.00)
G1 X15.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X15.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, 15.00)
G1 X20.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X20.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, 15.00)
G1 X25.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X25.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, 15.00)
G1 X30.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X30.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, 15.00)
G1 X35.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P40 (wait 40 ms)
G1 X35.00 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, 10.00)
G1 X-40.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X-40.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, 10.00)
G1 X-35.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X-35.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, 10.00)
G1 X-30.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X-30.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, 10.00)
G1 X-25.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X-25.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, 10.00)
G1 X-20.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X-20.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, 10.00)
G1 X-15.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X-15.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, 10.00)
G1 X-10.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X-10.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, 10.00)
G1 X-5.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X-5.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, 10.00)
G1 X0.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X0.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, 10.00)
G1 X5.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X5.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, 10.00)
G1 X10.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X10.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, 10.00)
G1 X15.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X15.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, 10.00)
G1 X20.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X20.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, 10.00)
G1 X25.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X25.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, 10.00)
G1 X30.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X30.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, 10.00)
G1 X35.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P46 (wait 46 ms)
G1 X35.00 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, 5.00)
G1 X-40.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X-40.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, 5.00)
G1 X-35.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X-35.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, 5.00)
G1 X-30.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X-30.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, 5.00)
G1 X-25.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X-25.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, 5.00)
G1 X-20.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X-20.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, 5.00)
G1 X-15.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X-15.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, 5.00)
G1 X-10.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X-10.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, 5.00)
G1 X-5.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X-5.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, 5.00)
G1 X0.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X0.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, 5.00)
G1 X5.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X5.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, 5.00)
G1 X10.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X10.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, 5.00)
G1 X15.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X15.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, 5.00)
G1 X20.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X20.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, 5.00)
G1 X25.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X25.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, 5.00)
G1 X30.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X30.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, 5.00)
G1 X35.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P52 (wait 52 ms)
G1 X35.00 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, 0.00)
G1 X-40.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X-40.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, 0.00)
G1 X-35.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X-35.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, 0.00)
G1 X-30.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X-30.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, 0.00)
G1 X-25.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X-25.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, 0.00)
G1 X-20.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X-20.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, 0.00)
G1 X-15.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X-15.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, 0.00)
G1 X-10.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X-10.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, 0.00)
G1 X-5.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X-5.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, 0.00)
G1 X0.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X0.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, 0.00)
G1 X5.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X5.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, 0.00)
G1 X10.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X10.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, 0.00)
G1 X15.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X15.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, 0.00)
G1 X20.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X20.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, 0.00)
G1 X25.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X25.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, 0.00)
G1 X30.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X30.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, 0.00)
G1 X35.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P58 (wait 58 ms)
G1 X35.00 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, -5.00)
G1 X-40.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X-40.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, -5.00)
G1 X-35.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X-35.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, -5.00)
G1 X-30.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X-30.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, -5.00)
G1 X-25.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X-25.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, -5.00)
G1 X-20.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X-20.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, -5.00)
G1 X-15.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X-15.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, -5.00)
G1 X-10.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X-10.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, -5.00)
G1 X-5.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X-5.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, -5.00)
G1 X0.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X0.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, -5.00)
G1 X5.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X5.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, -5.00)
G1 X10.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X10.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, -5.00)
G1 X15.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X15.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, -5.00)
G1 X20.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X20.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, -5.00)
G1 X25.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X25.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, -5.00)
G1 X30.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X30.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, -5.00)
G1 X35.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P64 (wait 64 ms)
G1 X35.00 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, -10.00)
G1 X-40.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X-40.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, -10.00)
G1 X-35.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X-35.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, -10.00)
G1 X-30.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X-30.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, -10.00)
G1 X-25.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X-25.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, -10.00)
G1 X-20.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X-20.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, -10.00)
G1 X-15.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X-15.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, -10.00)
G1 X-10.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X-10.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, -10.00)
G1 X-5.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X-5.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, -10.00)
G1 X0.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X0.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, -10.00)
G1 X5.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X5.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, -10.00)
G1 X10.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X10.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, -10.00)
G1 X15.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X15.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, -10.00)
G1 X20.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X20.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, -10.00)
G1 X25.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X25.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, -10.00)
G1 X30.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X30.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, -10.00)
G1 X35.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P70 (wait 70 ms)
G1 X35.00 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, -15.00)
G1 X-40.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X-40.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, -15.00)
G1 X-35.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X-35.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, -15.00)
G1 X-30.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X-30.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, -15.00)
G1 X-25.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X-25.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, -15.00)
G1 X-20.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X-20.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, -15.00)
G1 X-15.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X-15.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, -15.00)
G1 X-10.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X-10.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, -15.00)
G1 X-5.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X-5.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, -15.00)
G1 X0.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X0.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, -15.00)
G1 X5.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X5.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, -15.00)
G1 X10.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X10.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, -15.00)
G1 X15.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X15.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, -15.00)
G1 X20.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X20.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, -15.00)
G1 X25.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X25.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, -15.00)
G1 X30.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X30.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, -15.00)
G1 X35.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P76 (wait 76 ms)
G1 X35.00 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, -20.00)
G1 X-40.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X-40.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, -20.00)
G1 X-35.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X-35.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, -20.00)
G1 X-30.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X-30.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, -20.00)
G1 X-25.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X-25.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, -20.00)
G1 X-20.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X-20.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, -20.00)
G1 X-15.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X-15.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, -20.00)
G1 X-10.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X-10.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, -20.00)
G1 X-5.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X-5.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, -20.00)
G1 X0.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X0.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, -20.00)
G1 X5.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X5.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, -20.00)
G1 X10.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X10.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, -20.00)
G1 X15.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X15.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, -20.00)
G1 X20.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X20.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, -20.00)
G1 X25.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X25.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, -20.00)
G1 X30.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X30.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, -20.00)
G1 X35.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P82 (wait 82 ms)
G1 X35.00 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, -25.00)
G1 X-40.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X-40.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, -25.00)
G1 X-35.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X-35.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, -25.00)
G1 X-30.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X-30.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, -25.00)
G1 X-25.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X-25.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, -25.00)
G1 X-20.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X-20.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, -25.00)
G1 X-15.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X-15.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, -25.00)
G1 X-10.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X-10.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, -25.00)
G1 X-5.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X-5.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, -25.00)
G1 X0.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X0.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, -25.00)
G1 X5.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X5.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, -25.00)
G1 X10.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X10.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, -25.00)
G1 X15.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X15.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, -25.00)
G1 X20.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X20.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, -25.00)
G1 X25.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X25.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, -25.00)
G1 X30.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X30.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, -25.00)
G1 X35.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P88 (wait 88 ms)
G1 X35.00 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, -30.00)
G1 X-40.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X-40.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, -30.00)
G1 X-35.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X-35.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, -30.00)
G1 X-30.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X-30.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, -30.00)
G1 X-25.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X-25.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, -30.00)
G1 X-20.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X-20.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, -30.00)
G1 X-15.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X-15.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, -30.00)
G1 X-10.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X-10.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, -30.00)
G1 X-5.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X-5.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, -30.00)
G1 X0.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X0.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, -30.00)
G1 X5.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X5.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, -30.00)
G1 X10.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X10.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, -30.00)
G1 X15.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X15.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, -30.00)
G1 X20.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X20.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, -30.00)
G1 X25.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X25.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, -30.00)
G1 X30.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X30.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, -30.00)
G1 X35.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P94 (wait 94 ms)
G1 X35.00 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -40.00, -35.00)
G1 X-40.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X-40.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -35.00, -35.00)
G1 X-35.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X-35.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -30.00, -35.00)
G1 X-30.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X-30.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -25.00, -35.00)
G1 X-25.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X-25.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -20.00, -35.00)
G1 X-20.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X-20.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -15.00, -35.00)
G1 X-15.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X-15.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -10.00, -35.00)
G1 X-10.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X-10.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at -5.00, -35.00)
G1 X-5.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X-5.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 0.00, -35.00)
G1 X0.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X0.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 5.00, -35.00)
G1 X5.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X5.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 10.00, -35.00)
G1 X10.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X10.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 15.00, -35.00)
G1 X15.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X15.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 20.00, -35.00)
G1 X20.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X20.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 25.00, -35.00)
G1 X25.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X25.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 30.00, -35.00)
G1 X30.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X30.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

(dot at 35.00, -35.00)
G1 X35.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P100 (wait 100 ms)
G1 X35.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150 ms)
M127 (relief valve close)

M107 (pressure off)
M126 (relief open)
G1 X35.00 Y-35.00 Z10.00 F150.0
G1 X0.00 Y0.00 Z25.00 F3000.0
M18 (drives off)
M127
