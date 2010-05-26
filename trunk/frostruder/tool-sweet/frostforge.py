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
"""Frostforge.py

Converts a skeinforge generated GCode file for a Plastruder into a Frostruder compatible GCode file.

More info at: http://wiki.makerbot.com/frostforge

Usage: python frosterize.py [options] file > output.gcode

Options:
  -h, --help						show this help
  --start-delay						the delay after the pressure valve opens before movement in milliseconds.  default 50
  --stop-delay						the delay after the relief valve opens before movement in milliseconds.  default 150
"""

from math import *
import sys
import getopt
import re
import os

class Frostforge:
	"Class to handle generating frosting code."
	def __init__(self, file_path, start_delay, stop_delay):

		self.file_path = file_path
		self.start_delay = start_delay
		self.stop_delay = stop_delay
	
		self.load_file()

	def load_file(self):
		self.orig_file = open(self.file_path, 'r')
		self.tmp_file = open(self.file_path + '.tmp', 'w')	
		
	def generate(self):
		"Generate the actual GCode"
		
		self.tmp_file.write("(Frosterized version of %s)\n" % (self.file_path))
		foo = "(Call:" + " ".join(sys.argv) + ")\n\n"
		self.tmp_file.write(foo)

		for line in self.orig_file:
			if re.search("M101", line):
				self.tmp_file.write("M106 (pressure on)\n")
				self.tmp_file.write("G4 P%d (wait for startup)\n" % (self.start_delay))
				continue
			if re.search("M103", line):
				self.tmp_file.write("M107 (pressure off)\n")
				self.tmp_file.write("M126 (relief open)\n")
				self.tmp_file.write("G4 P%d (wait for pressure drop)\n" % (self.stop_delay))
				self.tmp_file.write("M127 (relief close)\n")
				continue
			if re.search("M104", line):
				continue		
			if re.search("M105", line):
				continue		
			if re.search("M108", line):
				continue

			self.tmp_file.write(line)
		
		self.tmp_file.close()
		self.orig_file.close()

		os.remove(self.file_path)
		os.rename(self.file_path+'.tmp', self.file_path)

		print "Conversion to Frostrudable GCode complete!"

def main(argv):
	
	try:
		opts, args = getopt.getopt(argv, "h", [
			"help",
			"start-delay=",
			"stop-delay=",
		])
	except getopt.GetoptError:
		usage()
		sys.exit(2)
        
	start_delay = 50
	stop_delay = 150

	for opt, arg in opts:
		if opt in ("-h", "--help"):
			usage()
			sys.exit()
		elif opt in ("--start-delay"):
			start_delay = float(arg)
		elif opt in ("--stop-delay"):
			stop_delay = float(arg)
		
	frosty = Frostforge(argv[-1], start_delay, stop_delay)
	frosty.generate()

def usage():
    print __doc__

if __name__ == "__main__":
	main(sys.argv[1:])
