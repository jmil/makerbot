#!/usr/bin/python
#
"""Taste Delay Tester Script

Generates GCode which will draw lines with varying start/stop delays in order to determine optimum delay for printing.

Usage: python taste_tester.py [options]

Options:
  -h, --help					show this help
  --z-height					the Z height to start at in mm.  default 0.25
  --z-feedrate					the Z axis feedrate in mm/min.  default 150
  --xy-feedrate					the XY axes feedrate in mm/min. default 3000
  --size					the width/height of the raft in mm. default 80
  --spacing					spacing between rows/columns in mm. default 5
  --stop-delay					the delay after the relief valve opens before movement in milliseconds.  default 150
  --min-delay					the minimum delay for printing a dot in milliseconds. default 10
  --max-delay					the maximum delay for printing a dot in milliseconds. default 100
"""

from math import *
import sys
import getopt

class TasteDelay:
	"Class to handle generating frosting code."
	def __init__(self, start_z, z, feedrate, width, spacing, stop_delay, min_delay, max_delay):

		self.current_x = 0
		self.current_y = 0
		self.current_z = 0

		self.start_height = start_z
		self.z_feedrate = z
		self.xy_feedrate = feedrate
		self.width = width
		self.spacing = spacing
		self.stop_delay = stop_delay
		self.min_delay = min_delay
		self.max_delay = max_delay

		self.rows = int(width/spacing)
		self.columns = int(width/spacing)
		self.delay_increment = (self.max_delay - self.min_delay) / float(self.rows-1)

	def getDelay(self, line):
		return self.min_delay + self.delay_increment * line


	def generate(self):
		"Generate the actual GCode"
		print "(After you run the script, use the reference below to determine delays.)"
		print "(Starting from the top, the dot lines were printed at the following delays:)"
		
		for i in range(self.rows):
			line = i+1
			print "(#%d - %d milliseconds)" % (line, self.getDelay(i))

		print

		print "G21 (metric ftw)"
		print "G90 (absolute mode)"
		print "G92 X0 Y0 Z0 (zero all axes)"
		self.go_to_point(0, 0, self.start_height, self.z_feedrate)
		print	
	
		for i in range(self.rows):
			x_start = -self.width/2
			y_point = self.width/2 - (self.spacing * i)
			dot_delay = self.getDelay(i);
			
			for j in range(self.columns):

				print "(dot at %.2f, %.2f)" % (x_start, y_point)
				self.go_to_point(x_start, y_point, self.start_height, self.xy_feedrate)
				print("M106 (pressure on)")
				print("G4 P%d (wait %d ms)") % (dot_delay, dot_delay)
				print("M107 (pressure off)");
				print("M126 (relief valve open)")
				print("G4 P%d (wait %d ms)") % (self.stop_delay, self.stop_delay)
				print("M127 (relief valve close)")
				print("");
								
				x_start = x_start + self.spacing

		print "M107 (pressure off)"
		print "M126 (relief open)"
		self.go_to_point(self.current_x, self.current_y, 10, self.z_feedrate)
		self.go_to_point(0, 0, 25, self.xy_feedrate)
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
		opts, args = getopt.getopt(argv, '', [
			'help',
			'max-delay=',
			'min-delay=',
			'size=',
			'spacing=',
			'stop-delay=',
			'xy-feedrate=',
			'z-height=',
			'z-feedrate='
		])
	except getopt.GetoptError:
		usage()
		sys.exit(2)
        
	min_delay = 10
	max_delay = 100
	size = 80
	spacing = 5
	stop_delay = 150
	xy_feedrate = 3000
	z_height = 0.25
	z_feedrate = 150

	for opt, arg in opts:
		if opt in ("-h", "--help"):
			usage()
			sys.exit()
		elif opt in ("--max-delay"):
			max_delay = float(arg)
		elif opt in ("--min-delay"):
			min_delay = float(arg)
		elif opt in ("--size"):
			size = float(arg)
		elif opt in ("--spacing"):
			spacing = float(arg)
		elif opt in ("--start-delay"):
			start_delay = float(arg)
		elif opt in ("--start-delay-increment"):
			start_delay_increment = float(arg)
		elif opt in ("--stop-delay"):
			stop_delay = float(arg)
		elif opt in ("--stop-delay-increment"):
			stop_delay_increment = float(arg)
		elif opt in ("--xy-feedrate"):
			xy_feedrate = float(arg)
		elif opt in ("--z-height"):
			z_height = float(arg)
		elif opt in ("--z-feedrate"):
			z_feedrate = float(arg)

	tasty = TasteDelay(z_height, z_feedrate, xy_feedrate, size, spacing, stop_delay, min_delay, max_delay)
	tasty.generate()

def usage():
    print __doc__

if __name__ == "__main__":
	main(sys.argv[1:])
