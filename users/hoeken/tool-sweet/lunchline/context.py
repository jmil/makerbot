from math import *
import sys

class GCodeContext:
    def __init__(self, z_feedrate, z_height, xy_feedrate, start_delay, stop_delay, line_width, stop_distance, file):
        
	self.z_feedrate = z_feedrate
	self.z_height = z_height
	self.xy_feedrate = xy_feedrate
	self.start_delay = start_delay
	self.stop_delay = stop_delay
	self.line_width = line_width
	self.stop_distance = stop_distance
	self.file = file
	
	self.drawing = False
        self.last = None
	self.codes = []

    def generate(self):
	print "(Lunchlined version of %s @ %.2f)" % (self.file, self.xy_feedrate)
	print "(", " ".join(sys.argv), ")"
	print "G21 (metric ftw)"
	print "G90 (absolute mode)"
	print "G92 X0 Y0 Z0 (zero all axes)"
	print "G92 Z%.2f F%.2f (go up to printing level)" % (self.z_height, self.z_feedrate)
	print

	for line in self.codes:
		print line
	
	print
	print "(end of print job)"
	print "M107"
	print "M126"
	print "G92 Z15 F%.2f (go up to finished level)" % (self.z_feedrate)
	print "G92 X0 Y0 Z15 F%.2f (go up to finished level)" % (self.z_feedrate)
	print "M18 (drives off)"
	print "M127"

    def start(self):
            self.codes.append("M106 (pressure on)")
            self.codes.append("G4 P%d (wait %dms)" % (self.start_delay, self.start_delay))

    def stop(self):
	self.codes.append("M106 (pressure off)")
	self.codes.append("M126 (relief valve open)")
	self.codes.append("G4 P%d (wait %dms)" % (self.stop_delay, self.stop_delay))
	self.codes.append("M127 (relief valve close)")

    def go_to_point(self, x, y, stop=False):
        if self.last == (x,y):
            return
        if stop:
		distance = sqrt(pow(self.last[0] - x, 2) + pow(self.last[1] - y, 2))

		if (distance >= self.stop_distance):
			pre_ratio = (distance - self.stop_distance) / distance
			
			x_distance = abs(self.last[0]-x)
			if (x > self.last[0]):
				x_pre = self.last[0] + x*pre_ratio
			else:
				x_pre = self.last[0] - x*pre_ratio
			
			y_distance = abs(self.last[1]-y)
			if (y > self.last[1]):
				y_pre = self.last[1] + y*pre_ratio
			else:
				y_pre = self.last[1] - y*pre_ratio

			self.codes.append("G1 X%.2f Y%.2f F%.2f" % (x_pre, y_pre, self.xy_feedrate))
			self.codes.append("M107 (pressure off)")
			self.codes.append("M126 (relief valve open)")
			self.codes.append("G1 X%.2f Y%.2f F%.2f" % (x, y, self.xy_feedrate))
		else:
			self.codes.append("G1 X%.2f Y%.2f F%.2f" % (x, y, self.xy_feedrate))
			self.codes.append("M107 (pressure off)")
			self.codes.append("M126 (relief valve open)")
		self.codes.append("G4 P%d (wait %dms)" % (self.stop_delay, self.stop_delay))
		self.codes.append("M127 (relief valve close)")
		self.codes.append("")
            	self.drawing = False
        else:
		self.codes.append("G1 X%.2f Y%.2f F%.2f" % (x,y, self.xy_feedrate))

	self.last = (x,y)
