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
  --width=...						width (X) of the surface to mill in MM
  --height=...					height (Y) of the surface to mill in MM
  --bit-diameter=...		diameter of your milling bit in MM (default 3.125mm)
  --speed=...						feedrate to mill the surface in MM (default 100mm/min)
  --depth=...						how deep to mill into the surface in MM (default 0.5mm)
  --overlap=...					overlap between passes in MM (default 10% of diameter)
  --increment=...				when milling with multiple passes, how deep to go each time (default 0.1mm)
"""

from math import *
import sys
import getopt

class SurfaceMill:
	"Class to do the thermistor maths"
	def __init__(self, diameter, width, height, speed, depth, overlap, increment):
		self.diameter = diameter         # diameter of the bit
		self.radius = diameter/2         # radius of the bit
		self.width = width               # width of the surface to mill
		self.height = height             # height of the surface to mill
		self.speed = speed               # feedrate to mill at
		self.depth = depth               # depth to mill to
		self.overlap = overlap           # amount of overlap between passes
		self.increment = increment

	def generate(self):
		"Generate the actual GCode"
		columns = int(floor(self.width / (self.diameter - self.overlap))) + 1
		
		if self.depth == self.increment:
			z_steps = 0
		else:
			z_steps = abs(int(floor(self.depth / self.increment))) + 1
			
		current_z = 0
		
		print "G21 (metric ftw)"
		print "G90 (absolute mode)"
		print "G92 X0 Y0 Z0 (zero all axes)"
		
		for j in range(0, z_steps):

			current_x = 0
			current_y = 0

			#make sure we're home
			self.go_to_point(0, 0, current_z)
		
			#go down a bit for the next level
			current_z -= self.increment
			if current_z < self.depth:
				current_z = self.depth

			#first outline the box in case of major irregularities
			self.go_to_point(0, 0, current_z)
			self.go_to_point(0, self.height, current_z)
			self.go_to_point(self.width, self.height, current_z)
			self.go_to_point(self.width, 0, current_z)
			self.go_to_point(0, 0, current_z)
			
			#print all the moves we want
			for i in range(0, columns):

				#small x move
				self.go_to_point(current_x, current_y, current_z)
				
				#bix y move
				current_y = self.switch_y(current_y)
				self.go_to_point(current_x, current_y, current_z)
				
				current_x += self.diameter - self.overlap

		#end the run and go back to home
		self.go_to_point(self.width, current_y, 20)
		self.go_to_point(0, 0, 20)
		print "M18 (drives off)"
		
	def go_to_point(self, x, y, z):
		"Output a move to a point"
		print "G1 X%.2f Y%.2f Z%.2f F%.1f" % (x, y, z, self.speed)

	def switch_y(self, y):
		"Switch between y values"
		#switch between y max and min
		if y == 0:
			return self.height
		else:
			return 0

def main(argv):

	diameter = 2.78
	width = 0.0
	height = 0.0
	speed = 350.0
	depth = -0.5
	overlap = 0.0
	increment = 0.1
	
	try:
		opts, args = getopt.getopt(argv, "h", ["help", "bit-diameter=", "width=", "height=", "speed=", "depth=", "overlap=", "increment="])
	except getopt.GetoptError:
		usage()
		sys.exit(2)
        
	for opt, arg in opts:
		if opt in ("-h", "--help"):
			usage()
			sys.exit()
		elif opt == "--bit-diameter":
			diameter = float(arg)
		elif opt == "--width":
			width = float(arg)
		elif opt == "--height":
		 	height = float(arg)
		elif opt == "--speed":
			speed = float(arg)
		elif opt == "--depth":
			depth = float(arg)
		elif opt == "--overlap":
			overlap = float(arg)
		elif opt == "--increment":
			increment = float(arg)
	
	if overlap <= 0:
		overlap = diameter * 0.1
	
	if height <= 0:
		print "Height must be greater than zero"
		return
	
	if width <= 0:
		print "Width must be greater than zero"
		return

	sm = SurfaceMill(diameter, width, height, speed, depth, overlap, increment)
	sm.generate()

def usage():
    print __doc__

if __name__ == "__main__":
	main(sys.argv[1:])
