( taste-tester.py )
(After you run the script, use the reference below to determine speeds.)
(Starting from the top, the lines were printed at the following speeds:)
(#1 - 2000.00 mm/min)
(#2 - 2133.00 mm/min)
(#3 - 2266.00 mm/min)
(#4 - 2399.00 mm/min)
(#5 - 2532.00 mm/min)
(#6 - 2665.00 mm/min)
(#7 - 2798.00 mm/min)
(#8 - 2931.00 mm/min)
(#9 - 3064.00 mm/min)
(#10 - 3197.00 mm/min)
(#11 - 3330.00 mm/min)
(#12 - 3463.00 mm/min)
(#13 - 3596.00 mm/min)
(#14 - 3729.00 mm/min)
(#15 - 3862.00 mm/min)
(#16 - 3995.00 mm/min)

G21 (metric ftw)
G90 (absolute mode)
G92 X0 Y0 Z0 (zero all axes)
G1 X0.00 Y0.00 Z0.25 F150.0

(line from -40.00 to 40.00 at 2000.00)
G1 X-40.00 Y40.00 Z0.25 F2000.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y40.00 Z0.25 F2000.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 2133.00)
G1 X-40.00 Y35.00 Z0.25 F2133.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y35.00 Z0.25 F2133.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 2266.00)
G1 X-40.00 Y30.00 Z0.25 F2266.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y30.00 Z0.25 F2266.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 2399.00)
G1 X-40.00 Y25.00 Z0.25 F2399.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y25.00 Z0.25 F2399.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 2532.00)
G1 X-40.00 Y20.00 Z0.25 F2532.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y20.00 Z0.25 F2532.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 2665.00)
G1 X-40.00 Y15.00 Z0.25 F2665.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y15.00 Z0.25 F2665.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 2798.00)
G1 X-40.00 Y10.00 Z0.25 F2798.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y10.00 Z0.25 F2798.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 2931.00)
G1 X-40.00 Y5.00 Z0.25 F2931.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y5.00 Z0.25 F2931.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 3064.00)
G1 X-40.00 Y0.00 Z0.25 F3064.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y0.00 Z0.25 F3064.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 3197.00)
G1 X-40.00 Y-5.00 Z0.25 F3197.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y-5.00 Z0.25 F3197.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 3330.00)
G1 X-40.00 Y-10.00 Z0.25 F3330.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y-10.00 Z0.25 F3330.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 3463.00)
G1 X-40.00 Y-15.00 Z0.25 F3463.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y-15.00 Z0.25 F3463.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 3596.00)
G1 X-40.00 Y-20.00 Z0.25 F3596.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y-20.00 Z0.25 F3596.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 3729.00)
G1 X-40.00 Y-25.00 Z0.25 F3729.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y-25.00 Z0.25 F3729.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 3862.00)
G1 X-40.00 Y-30.00 Z0.25 F3862.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y-30.00 Z0.25 F3862.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

(line from -40.00 to 40.00 at 3995.00)
G1 X-40.00 Y-35.00 Z0.25 F3995.0
M106 (pressure on)
G4 P25 (wait 25ms)
G1 X40.00 Y-35.00 Z0.25 F3995.0
M107 (pressure off)
M126 (relief valve open)
G4 P150 (wait 150ms)
M127 (relief valve close)

M107 (pressure off)
M126 (relief open)
G1 X40.00 Y-35.00 Z10.00 F150.0
G1 X0.00 Y0.00 Z25.00 F4000.0
M18 (drives off)
M127
