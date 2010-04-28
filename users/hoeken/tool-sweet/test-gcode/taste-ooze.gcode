( taste-ooze.py )
(After you run the script, use the reference below to determine optimum turnoff distance.)
(Starting from the top, the lines were printed at the following turnoff distances:)
(#1 - 1.00mm / 20.00 ms)
(#2 - 1.27mm / 25.33 ms)
(#3 - 1.53mm / 30.67 ms)
(#4 - 1.80mm / 36.00 ms)
(#5 - 2.07mm / 41.33 ms)
(#6 - 2.33mm / 46.67 ms)
(#7 - 2.60mm / 52.00 ms)
(#8 - 2.87mm / 57.33 ms)
(#9 - 3.13mm / 62.67 ms)
(#10 - 3.40mm / 68.00 ms)
(#11 - 3.67mm / 73.33 ms)
(#12 - 3.93mm / 78.67 ms)
(#13 - 4.20mm / 84.00 ms)
(#14 - 4.47mm / 89.33 ms)
(#15 - 4.73mm / 94.67 ms)
(#16 - 5.00mm / 100.00 ms)

G21 (metric ftw)
G90 (absolute mode)
G92 X0 Y0 Z0 (zero all axes)
G1 X0.00 Y0.00 Z0.25 F150.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y40.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X39.00 Y40.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y40.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y35.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X38.73 Y35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y35.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y30.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X38.47 Y30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y30.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y25.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X38.20 Y25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y25.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y20.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X37.93 Y20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y20.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y15.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X37.67 Y15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y15.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y10.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X37.40 Y10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y10.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y5.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X37.13 Y5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y5.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y0.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y0.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X36.87 Y0.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y0.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y-5.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y-5.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X36.60 Y-5.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y-5.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y-10.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y-10.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X36.33 Y-10.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y-10.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y-15.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y-15.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X36.07 Y-15.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y-15.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y-20.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y-20.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X35.80 Y-20.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y-20.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y-25.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y-25.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X35.53 Y-25.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y-25.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y-30.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y-30.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X35.27 Y-30.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y-30.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y-35.00 Z0.25 F3000.0

(line from -40.00 to 40.00 at 3000.00)
G1 X-40.00 Y-35.00 Z0.25 F3000.0
M106 (pressure on)
G4 P25 (wait 25 ms)
G1 X35.00 Y-35.00 Z0.25 F3000.0
M107 (pressure off)
M126 (relief valve open)
G1 X40.00 Y-35.00 Z0.25 F3000.0
G4 P150 (wait 150 ms)
M127 (relief valve close)
G1 X40.00 Y-40.00 Z0.25 F3000.0

M107 (pressure off)
M126 (relief open)
G1 X40.00 Y-40.00 Z10.00 F150.0
G1 X0.00 Y0.00 Z25.00 F3000.0
M18 (drives off)
M127
