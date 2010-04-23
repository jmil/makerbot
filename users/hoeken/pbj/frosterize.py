#!/usr/bin/python
#
"""Frosterize

Generates GCode which will control the MakerBot Frostruder to draw an image using varying sized beads of deposited material.

Usage: python frosterizer.py [options] file

Options:
  -h, --help						show this help
  --z-feedrate						the Z axis feedrate in mm/min.  default 150
  --xy-feedrate						the XY axes feedrate in mm/min. default 3500
  --width						the maximum width of the build surface. default 80.
"""

from math import *
import sys
import getopt
from PIL import Image
from PIL import ImageOps
from PIL import ImageEnhance

class Frosterizer:
	"Class to handle generating frosting code."
	def __init__(self, img_path, z, xy, width):

		self.file = img_path
		self.current_x = 0
		self.current_y = 0
		self.current_z = 0

		self.z_feedrate = z
		self.xy_feedrate = xy
		self.print_feedrate = xy
		self.safe_height = 0
		
		self.max_width = float(width)
		self.multiplier = width / self.max_width

		self.load_image()

	def load_image(self):
		self.image = Image.open(self.file)
		self.image = ImageOps.grayscale(self.image)
		
		brightness = ImageEnhance.Brightness(self.image)
		contrast = ImageEnhance.Contrast(self.image)
	 	self.image = contrast.enhance(20.0)
		self.image = brightness.enhance(2.0)
		
		ratio = 1.0
		if (self.image.size[0] > self.image.size[1]):
			ratio = self.max_width / self.image.size[0]
		else:
			ratio = self.max_width / self.image.size[1]

		self.image = self.image.resize((int(self.image.size[0]*ratio), int(self.image.size[1]*ratio)))
		self.image.save(self.file + ".resized.png")
		self.pixels = self.image.load()
		
	def test_pixel(self, x, y):
		if (x >= self.image.size[0]):
			return False
				
		#print "pixel at %d, %d = %d" % (x, y, self.pixels[x,y])
		if self.pixels[x, y] >= 127:
			#print "false"
			return True
		else:
			#print "true"
			return False
		
	def generate(self):
		"Generate the actual GCode"
		
		print "G21 (metric ftw)"
		print "G90 (absolute mode)"
		print "G92 X0 Y0 Z0 (zero all axes)"
		
		self.go_to_point(0, 0, 0, self.z_feedrate)
		
		for y in range(self.image.size[1]):
			x = 0
			while x < self.image.size[0]:
				if (self.test_pixel(x, y)):
					if (self.test_pixel(x+1, y)):
						start = x
						end = x
						while self.test_pixel(end, y):
							end = end+1
						print "(line from %.2f to %.2f at %.2f)" % (start, end, y)
						self.go_to_point(start*self.multiplier, y*self.multiplier, 0, self.xy_feedrate)
						print("M106 (pressure on)")
						print("G4 P25 (wait 25ms)")
						self.go_to_point(end*self.multiplier, y*self.multiplier, 0, self.print_feedrate)
						print("M107 (pressure off)");
						print("M126 (relief valve open)")
						print("G4 P150 (wait 150ms)")
						print("M127 (relief valve close)")

						x = end
					else:
						print ("(dot at %.2f, %.2f)") % (x, y)
						self.go_to_point(x*self.multiplier, y*self.multiplier, 0, self.xy_feedrate)
						print("M106 (pressure on)")
						print("G4 P50 (wait 50ms)")
						print("M107 (pressure off)");
						print("M126 (relief valve open)")
						print("G4 P150 (wait 150ms)")
						print("M127 (relief valve close)")
				x = x+1
			self.go_to_point(self.current_x, self.current_y+self.multiplier*2, 0, self.xy_feedrate)


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
		opts, args = getopt.getopt(argv, "h", ["help", "z-feedrate", "xy-feedrate", "width"])
	except getopt.GetoptError:
		usage()
		sys.exit(2)
        
	z_feedrate = 150
	xy_feedrate = 3500
	width = 80

	for opt, arg in opts:
		if opt in ("-h", "--help"):
			usage()
			sys.exit()
		elif opt in ("--z-feedrate"):
			z_feedrate = int(arg)
		elif opt in ("-xy-feedrate"):
			xy_feedrate = int(arg)
		elif opt in ("--width"):
			width = int(arg)

	frosty = Frosterizer(argv[0], z_feedrate, xy_feedrate, width)
	frosty.generate()

def usage():
    print __doc__

if __name__ == "__main__":
	main(sys.argv[1:])
