#!/usr/bin/python
#
# Creates a C code lookup table for doing ADC to temperature conversion
# on a microcontroller
# based on: http://hydraraptor.blogspot.com/2007/10/measuring-temperature-easy-way.html
"""GCode Surface Milling Script

Generates GCode to mill your entire milling surface flat.

Usage: python mill_surface_flush.py [options]

Options:
  -h, --help						show this help
"""

from math import *
import sys
import getopt

class WasherDriller:
	"Class to handle generating washer drilling gcode"
	def __init__(self):

		self.current_x = 0
		self.current_y = 0
		self.current_z = 0

		self.drill_feedrate = 10
		self.drill_start = 1.5
		self.drill_end = -1
		
		self.z_feedrate = 400
		self.xy_feedrate = 200
		self.safe_height = 15

		self.row_locations = [27, 79, 131, 183]
		self.column_locations = [22, 75, 128, 181, 234, 286]
		self.holes = [[-12.375, 0], [0, 12.4], [12.875, 0], [0, -16.75]]

	def generate(self):
		"Generate the actual GCode"
		
		print "G21 (metric ftw)"
		print "G90 (absolute mode)"
		print "G92 X0 Y0 Z0 (zero all axes)"
		
		self.go_to_point(0, 0, 0, self.z_feedrate)
		
		for washer_y in self.row_locations:
			for washer_x in self.column_locations:
				for drill_coord in self.holes:
					drill_x = washer_x + drill_coord[0]
					drill_y = washer_y + drill_coord[1]

					self.go_to_point(self.current_x, self.current_y, self.safe_height, self.z_feedrate)
					self.go_to_point(drill_x, drill_y, self.safe_height, self.xy_feedrate)
					self.go_to_point(drill_x, drill_y, self.drill_start, self.z_feedrate)
					self.go_to_point(drill_x, drill_y, self.drill_end, self.drill_feedrate)
					self.go_to_point(drill_x, drill_y, self.safe_height, self.z_feedrate)

		self.go_to_point(0, 0, self.safe_height, self.xy_feedrate)
		print "M18 (drives off)"
		
	def go_to_point(self, x, y, z, feedrate):
		"Output a move to a point"
		print "G1 X%.2f Y%.2f Z%.2f F%.1f" % (x, y, z, feedrate)
		self.current_x = x
		self.current_y = y
		self.current_z = z

def main(argv):

	try:
		opts, args = getopt.getopt(argv, "h", ["help"])
	except getopt.GetoptError:
		usage()
		sys.exit(2)
        
	for opt, arg in opts:
		if opt in ("-h", "--help"):
			usage()
			sys.exit()

	wd = WasherDriller()
	wd.generate()

def usage():
    print __doc__

if __name__ == "__main__":
	main(sys.argv[1:])
