#!/usr/bin/python
#
"""Taste Tester

Generates GCode which will draw a raft of varying speeds in order to determine optimum speed.

Usage: python taste_tester.py [options] file

Options:
  -h, --help						show this help
  --z-height						the Z height to start at in mm.  default 0.25
  --z-feedrate						the Z axis feedrate in mm/min.  default 150
  --feedrate-min					the XY axes feedrate minimum in mm/min. default 2000
  --feedrate-max					the XY axes feedrate minimum in mm/min. default 4000
  --size						the width/height of the raft in mm. default 80
  --spacing						spacing between lines in mm. default 5
"""

from math import *
import sys
import getopt
from PIL import Image
from PIL import ImageOps
from PIL import ImageEnhance

class TasteTester:
	"Class to handle generating frosting code."
	def __init__(self, start_z, z, min, max, width, spacing):

		self.current_x = 0
		self.current_y = 0
		self.current_z = 0

		self.z_feedrate = z
		self.min_xy = min
		self.max_xy = max
		self.width = width
		self.spacing = spacing
		self.lines = int(width/spacing)
		self.speed_bump = (max - min)/(self.lines)
		self.start_height = start_z

	def getSpeed(self, line):
		return self.min_xy + self.speed_bump*line

	def generate(self):
		"Generate the actual GCode"
		
		print "(After you run the script, use the reference below to determine speeds.)"
		print "(Starting from the top, the lines were printed at the following speeds:)"
		
		for i in range(self.lines):
			line = i+1
			print "(#%d - %.2f mm/min)" % (line, self.getSpeed(i))

		print "G21 (metric ftw)"
		print "G90 (absolute mode)"
		print "G92 X0 Y0 Z0 (zero all axes)"
		
		self.go_to_point(0, 0, self.start_height, self.z_feedrate)
		
		for i in range(self.lines):
			start = -self.width/2
			end = self.width/2
			speed = self.getSpeed(i)
			y_point = end - ((self.width / self.lines) * i)
			print "(line from %.2f to %.2f at %.2f)" % (start, end, speed)
			self.go_to_point(start, y_point, self.start_height, speed)
			print("M106 (pressure on)")
			print("G4 P25 (wait 25ms)")
			self.go_to_point(end, y_point, self.start_height, speed)
			print("M107 (pressure off)");
			print("M126 (relief valve open)")
			print("G4 P150 (wait 150ms)")
			print("M127 (relief valve close)")

		print "M107 (pressure off)"
		print "M126 (relief open)"
		self.go_to_point(self.current_x, self.current_y, 10, self.z_feedrate)
		self.go_to_point(0, 0, 10, self.max_xy)
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
		opts, args = getopt.getopt(argv, "h", ["help", "z-height", "z-feedrate" "feedrate-min", "feedrate-max", "size", "spacing"])
	except getopt.GetoptError:
		usage()
		sys.exit(2)
        
	z_height = 0.25
	z_feedrate = 150
	xy_min = 2000
	xy_max = 4000
	size = 80
	spacing = 5

	for opt, arg in opts:
		if opt in ("-h", "--help"):
			usage()
			sys.exit()
		elif opt in ("--z-height"):
			z_height = int(arg)
		elif opt in ("--z-feedrate"):
			z_feedrate = int(arg)
		elif opt in ("--feedrate-min"):
			xy_min = int(arg)
		elif opt in ("--feedrate-max"):
			xy_max = int(arg)
		elif opt in ("--size"):
			size = int(arg)
		elif opt in ("--spacing"):
			spacing = int(arg)

	tasty = TasteTester(z_height, z_feedrate, xy_min, xy_max, size, spacing)
	tasty.generate()

def usage():
    print __doc__

if __name__ == "__main__":
	main(sys.argv[1:])
