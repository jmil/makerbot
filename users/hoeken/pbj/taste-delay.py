#!/usr/bin/python
#
"""Taste Delay Tester Script

Generates GCode which will draw lines with varying start/stop delays in order to determine optimum delay for printing.

Usage: python taste_tester.py [options]

Options:
  -h, --help									show this help
  --z-height									the Z height to start at in mm.  default 0.25
  --z-feedrate								the Z axis feedrate in mm/min.  default 150
  --xy-feedrate								the XY axes feedrate in mm/min. default 3000
  --size											the width/height of the raft in mm. default 80
  --line-length								the length of each line in mm.  default 10
  --spacing										spacing between rows/columns in mm. default 5
  --start-delay								the delay after the pressure valve opens before movement in milliseconds.  default 25
  --stop-delay								the delay after the relief valve opens before movement in milliseconds.  default 150
  --start-delay-increment			the time increment to use between rows for testing start delay.  default 1
  --stop-delay-increment			the time increment to use between rows for testing stop delay.  default 5
"""

from math import *
import sys
import getopt

class TasteDelay:
	"Class to handle generating frosting code."
	def __init__(self, start_z, z, feedrate, width, spacing, line_length, start_delay, stop_delay, start_delay_increment, stop_delay_increment):

		self.current_x = 0
		self.current_y = 0
		self.current_z = 0

		self.start_height = start_z
		self.z_feedrate = z
		self.xy_feedrate = feedrate
		self.width = width
		self.spacing = spacing
		self.line_length = line_length
		self.start_delay = start_delay
		self.start_delay_increment = start_delay_increment
		self.stop_delay = stop_delay
		self.stop_delay_increment = stop_delay_increment

		self.rows = int(width/spacing)
		self.columns = int(width/(line_length+spacing))

	def getStartDelay(self, line):
		return self.start_delay + self.start_delay_increment * line

	def getStopDelay(self, line):
		return self.stop_delay + self.stop_delay_increment * line

	def generate(self):
		"Generate the actual GCode"
		print "(After you run the script, use the reference below to determine delays.)"
		print "(Starting from the top, the lines were printed at the following delays:)"
		
		for i in range(self.rows):
			line = i+1
			print "(#%d - %d start / %d stop)" % (line, self.getStartDelay(i), self.getStopDelay(i))

		print "G21 (metric ftw)"
		print "G90 (absolute mode)"
		print "G92 X0 Y0 Z0 (zero all axes)"
		
		self.go_to_point(0, 0, self.start_height, self.z_feedrate)
		
		for i in range(self.rows):
			x_start = -self.width/2
			y_point = self.width/2 - (self.spacing * self.rows)
			
			for j in range(self.columns):

				x_end = x_start + self.line_length
				start_delay = self.getStartDelay(i);
				stop_delay = self.getStopDelay(i);
				
				print "(line from %.2f to %.2f at %.2f)" % (x_start, x_end, self.xy_feedrate)
				self.go_to_point(x_start, y_point, self.start_height, self.xy_feedrate)
				print("M106 (pressure on)")
				print("G4 P%d (wait %d ms)") % (start_delay, start_delay)
				self.go_to_point(x_end, y_point, self.start_height, self.xy_feedrate)
				print("M107 (pressure off)");
				print("M126 (relief valve open)")
				print("G4 P%d (wait %d ms)") % (stop_delay, stop_delay)
				print("M127 (relief valve close)")
				print("");
								
				x_start = x_end + self.spacing

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
			'line-length=',
			'size=',
			'spacing=',
			'start-delay=',
			'start-delay-increment=',
			'stop-delay=',
			'stop-delay-increment=',
			'xy-feedrate=',
			'z-height=',
			'z-feedrate='
		])
	except getopt.GetoptError:
		usage()
		sys.exit(2)
        
	line_length = 10
	size = 80
	spacing = 5
	start_delay = 25
	start_delay_increment = 1
	stop_delay = 150
	stop_delay_increment = 5
	xy_feedrate = 3000
	z_height = 0.25
	z_feedrate = 150

	for opt, arg in opts:
		if opt in ("-h", "--help"):
			usage()
			sys.exit()
		elif opt in ("--line-length"):
			line_length = float(arg)
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

	tasty = TasteDelay(z_height, z_feedrate, xy_feedrate, size, spacing, line_length, start_delay, stop_delay, start_delay_increment, stop_delay_increment)
	tasty.generate()

def usage():
    print __doc__

if __name__ == "__main__":
	main(sys.argv[1:])
