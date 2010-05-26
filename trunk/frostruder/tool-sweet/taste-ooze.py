#!/usr/bin/python
#
# Copyright (c) 2010 MakerBot Industries
# 
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software Foundation,
# Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
#
"""Taste Ooze Tester Script

Generates GCode which will draw lines with varying ooze prevention lengths in order to determine optimum distance before end of line to stop extruding.

Usage: python taste-ooze.py [options]

Options:
  -h, --help					show this help
  --z-height					the Z height to start at in mm.  default 0.25
  --z-feedrate					the Z axis feedrate in mm/min.  default 150
  --xy-feedrate					the XY axes feedrate in mm/min. default 3000
  --size					the width/height of the raft in mm. default 80
  --spacing					spacing between rows in mm. default 5
  --min-distance				the minimum distance before the end of the line to turn off the extruder in mm.  default 1
  --max-distance				the maximum distance before the end of the line to turn off the extruder in mm.  default 5
  --start-delay					the delay after the pressure valve opens before movement in milliseconds.  default 25
  --stop-delay					the delay after the relief valve opens before movement in milliseconds.  default 150
"""

from math import *
import sys
import getopt

class TasteOoze:
	"Class to handle generating frosting code."
	def __init__(self, start_z, z_feedrate, xy_feedrate, width, spacing, min_distance, max_distance, start_delay, stop_delay):

		self.current_x = 0
		self.current_y = 0
		self.current_z = 0

		self.start_height = start_z
		self.z_feedrate = z_feedrate
		self.xy_feedrate = xy_feedrate
		self.width = width
		self.spacing = spacing
		self.min_distance = min_distance
		self.max_distance = max_distance
		self.start_delay = start_delay
		self.stop_delay = stop_delay

		self.rows = int(width/spacing)
		self.distance_increment = (self.max_distance - self.min_distance) / float(self.rows-1)

	def getTurnoffDistance(self, line):
		return self.min_distance + self.distance_increment * line

	def getTurnoffMillis(self, line):
		return self.getTurnoffDistance(line) / self.xy_feedrate * 60000.0 

	def generate(self):
		"Generate the actual GCode"
		print "(", " ".join(sys.argv), ")"
		print "(After you run the script, use the reference below to determine optimum turnoff distance.)"
		print "(Starting from the top, the lines were printed at the following turnoff distances:)"
		
		for i in range(self.rows):
			line = i+1
			print "(#%d - %.2fmm / %.2f ms)" % (line, self.getTurnoffDistance(i), self.getTurnoffMillis(i))

		print
		print "G21 (metric ftw)"
		print "G90 (absolute mode)"
		print "G92 X0 Y0 Z0 (zero all axes)"
		self.go_to_point(0, 0, self.start_height, self.z_feedrate)
		print
		
		for i in range(self.rows):
			x_start = -self.width/2
			x_end = self.width/2
			x_turnoff = x_end - self.getTurnoffDistance(i)
			y_point = self.width/2 - (self.spacing * i)
			next_y =  self.width/2 - (self.spacing * (i+1))
			
			print "(line from %.2f to %.2f at %.2f)" % (x_start, x_end, self.xy_feedrate)
			self.go_to_point(x_start, y_point, self.start_height, self.xy_feedrate)
			print("M106 (pressure on)")
			print("G4 P%d (wait %d ms)") % (self.start_delay, self.start_delay)
			self.go_to_point(x_turnoff, y_point, self.start_height, self.xy_feedrate)
			print("M107 (pressure off)");
			print("M126 (relief valve open)")
			self.go_to_point(x_end, y_point, self.start_height, self.xy_feedrate)
			print("G4 P%d (wait %d ms)") % (self.stop_delay, self.stop_delay)
			print("M127 (relief valve close)")
			self.go_to_point(x_end, next_y, self.start_height, self.xy_feedrate)
			print("");

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
			'max-distance=',
			'min-distance=',
			'size=',
			'spacing=',
			'start-delay=',
			'stop-delay=',
			'xy-feedrate=',
			'z-height=',
			'z-feedrate='
		])
	except getopt.GetoptError:
		usage()
		sys.exit(2)
        
	size = 80
	spacing = 5
	start_delay = 25
	stop_delay = 150
	xy_feedrate = 3000
	z_height = 0.25
	z_feedrate = 150
	min_distance = 1
	max_distance = 5

	for opt, arg in opts:
		if opt in ("-h", "--help"):
			usage()
			sys.exit()
		elif opt in ("--min-distance"):
			min_distance = float(arg)
		elif opt in ("--max-distance"):
			max_distance = float(arg)
		elif opt in ("--size"):
			size = float(arg)
		elif opt in ("--spacing"):
			spacing = float(arg)
		elif opt in ("--start-delay"):
			start_delay = float(arg)
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

	tasty = TasteOoze(z_height, z_feedrate, xy_feedrate, size, spacing, min_distance, max_distance, start_delay, stop_delay)
	tasty.generate()

def usage():
    print __doc__

if __name__ == "__main__":
	main(sys.argv[1:])
