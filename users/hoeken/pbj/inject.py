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

		self.z_feedrate = 150
		self.xy_feedrate = 3000
		self.safe_height = 0

		self.row_locations = [x*2 for x in range(50)]
		self.column_locations = self.row_locations
		#self.row_locations = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80]
		#self.column_locations = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80]

	def generate(self):
		"Generate the actual GCode"
		
		print "G21 (metric ftw)"
		print "G90 (absolute mode)"
		print "G92 X0 Y0 Z0 (zero all axes)"
		
		self.go_to_point(0, 0, 0, self.z_feedrate)
		
		for washer_y in self.row_locations:
			for washer_x in self.column_locations:

				print ("(point at %.2f, %.2f)") % (washer_x, washer_y)
				self.go_to_point(washer_x, washer_y, 0, self.xy_feedrate)
				print("M106 (pressure on)")
				print("G4 P50 (wait 50ms)")
				print("M107 (pressure off)");
				print("M126 (relief valve open)")
				print("G4 P150 (wait 150ms)")
				print("M127 (relief valve close)")

		print "M107"
		print "M126"
		self.go_to_point(self.current_x, self.current_y, 10, self.xy_feedrate)
		self.go_to_point(0, 0, 10, self.xy_feedrate)
		print "M18 (drives off)"
		print "M127"
		
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
