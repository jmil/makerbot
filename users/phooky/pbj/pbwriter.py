#!/usr/bin/env python

# GPL, etc yadda yadda

__author__ = 'Adam Mayer'

from optparse import OptionParser
import re
import math
import sys

letterStart = re.compile(r"\[([0123456789abcdef]+)\] (\S+)")

digitPattern=r"(\-?[0-9\.]+)"
lineMatch = re.compile(r"L "+",".join([digitPattern]*4))
arcMatch = re.compile(r"A "+",".join([digitPattern]*5))

letterSpacingMatch = re.compile(r"\# LetterSpacing\:\s+([0-9\.]+)")
wordSpacingMatch = re.compile(r"\# WordSpacing\:\s+([0-9\.]+)")

class Point:
    def __init__(self,x,y):
        self.x = float(x)
        self.y = float(y)

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __ne__(self,other):
        return not self.__eq__(other)

    def __repr__(self):
        return "P(%.2f,%.2f)" % (self.x, self.y)

    def flipped(self):
        return Point(self.x,10.0-self.y)
        
    def scaled(self,factor):
        return Point(self.x*factor,self.y*factor)

class Line:
    def __init__(self,p1,p2):
        self.p1 = p1
        self.p2 = p2

    def scaled(self,factor):
        return Line(self.p1.scaled(factor),self.p2.scaled(factor))

    def flipped(self):
        return Line(self.p1.flipped(),self.p2.flipped())

    def max(self):
        return Point(max(self.p1.x,self.p2.x),max(self.p1.y,self.p2.y))

    def min(self):
        return Point(min(self.p1.x,self.p2.x),min(self.p1.y,self.p2.y))

class Arc:
    def __init__(self,p,radius,start,end,cw = 1):
        self.p = p
        self.radius = float(radius)
        self.start = float(start)
        self.end = float(end)
        self.cw = cw

    def scaled(self,factor):
        return Arc(self.p.scaled(factor),self.radius*factor,self.start,self.end,self.cw)

    def flipped(self):
        start = 360-self.end
        if (start < 0):
            start = start + 360
        if (start >= 360):
            start = start - 360

        end = 360-self.start
        if (end < 0):
            end = end + 360
        if (end >= 360):
            end = end - 360
        return Arc(self.p.flipped(),self.radius,start,end,not self.cw)

    def startPoint(self):
        x = self.p.x + (self.radius * math.cos(math.radians(self.start)))
        y = self.p.y + (self.radius * math.sin(math.radians(self.start)))
        return Point(x,y)

    def offsetPoint(self):
        sp = self.startPoint()
        x = self.p.x - sp.x
        y = self.p.y - sp.y
        return Point(x,y)

    def endPoint(self):
        x = self.p.x + (self.radius * math.cos(math.radians(self.end)))
        y = self.p.y + (self.radius * math.sin(math.radians(self.end)))
        return Point(x,y)

    def clockwise(self):
        return self.clockwise

    def max(self):
        return Point(self.p.x+self.radius,self.p.y+self.radius)

    def min(self):
        return Point(self.p.x-self.radius,self.p.y-self.radius)

class CxfLetter:
    def __init__(self,f = None):
        self.segments = []
        if not f:
            return
        while 1:
            line = f.readline()
            line = line.strip()
            if line == "":
                break
            lm = lineMatch.match(line)
            if lm:
                p1 = Point(lm.group(1),lm.group(2))
                p2 = Point(lm.group(3),lm.group(4))
                self.segments.append(Line(p1,p2))
            am = arcMatch.match(line)
            if am:
                p = Point(am.group(1),am.group(2))
                self.segments.append(Arc(p,am.group(3),am.group(4),am.group(5)))

                
    def scaled(self, factor):
        rv = CxfLetter()
        for x in self.segments:
            rv.segments.append(x.scaled(factor))
        return rv

    def flipped(self):
        rv = CxfLetter()
        for x in self.segments:
            rv.segments.append(x.flipped())
        return rv

    def max(self):
        xmax = 0.0
        ymax = 0.0
        for segment in self.segments:
            p = segment.max()
            xmax = max(xmax,p.x)
            ymax = max(ymax,p.y)
        return Point(xmax,ymax)

    def min(self):
        xmin = 0.0
        ymin = 0.0
        for segment in self.segments:
            p = segment.min()
            xmin = min(xmin,p.x)
            ymin = min(ymin,p.y)
        return Point(xmin,ymin)

class CxfFont:
    def __init__(self, path,factor=1.0):
        self.path = path
        self.letterSpacing = 0.0
        self.wordSpacing = 0.0
        self.lineSpacing = 10.0 * factor
        self.map = {}
        f = open(path)
        while 1:
            line = f.readline()
            if line == "":
                break
            match = letterStart.match(line)
            if match:
                dec = int(match.group(1),16)
                self.map[dec] = CxfLetter(f).scaled(factor).flipped()
                s = self.map[dec].scaled(20.0)
            match = letterSpacingMatch.match(line)
            if match:
                self.letterSpacing = float(match.group(1))
            match = wordSpacingMatch.match(line)
            if match:
                self.wordSpacing = float(match.group(1))
        self.letterSpacing = self.letterSpacing * factor
        self.wordSpacing = self.wordSpacing * factor


    def width(self,s):
        w = 0.0
        for c in s:
            if c == ' ':
                w = w + self.wordSpacing
            else:
                letter = self.map[ord(c)]
                if letter:
                    w = w + letter.max().x
                    w = w + self.letterSpacing
        return w

    def wrap(self,text,width=90.0):
        "Return a tuple of the text that can fit and the remainder"
        w = 0.0
        rv = ""
        buf = ""
        for c in text:
            if w > width:
                buf = buf + c
                continue
            if c == ' ':
                rv = rv + buf + " "
                buf = ""
                w = w + self.wordSpacing
            else:
                buf = buf + c
                letter = self.map[ord(c)]
                if letter:
                    w = w + letter.max().x
                    w = w + self.letterSpacing
        if w < width:
            return (text,"")
        return (rv,buf)
        
                    
startCode = """
M106
G4 P40
"""

stopCode = """
M107
M126
G4 P100
M127
"""

warmupSequence = """
G21
G90
G92 X0 Y0 Z0
G00 Z0 F1500.00
"""

cooldownSequence = """
M107
M126
G4 P100
M127
G00 Z10 F200
"""

class GCode:
    def __init__(self, start=Point(0,0), size=Point(90.0,90.0)):
        self.start = start
        self.location = start
        self.size = size
        self.up = 1

    def penDownCodes(self):
        if self.up:
            self.up = 0
            return startCode
        return ""

    def penUpCodes(self):
        if not self.up:
            self.up = 1
            return stopCode
        return ""

    def moveCode(self,offset,absolute):
        (x,y) = (offset.x+absolute.x, offset.y+absolute.y)
        if self.up:
            g = "G00"
        else:
            g = "G01"
        return g+" X%.2f Y%.2f\n" % (x,y)

    def characterCodes(self, character):
        s = ""
        local = Point(0,0)
        for segment in character.segments:
            if isinstance(segment,Line):
                #print segment.p1, segment.p2
                if (local != segment.p1):
                    s = s + self.penUpCodes()
                    s = s + self.moveCode(segment.p1,self.location)
                    local = segment.p1
                s = s + self.penDownCodes()
                s = s + self.moveCode(segment.p2,self.location)
                local = segment.p2
            if isinstance(segment,Arc):
                #print segment.p1, segment.p2
                p1 = segment.startPoint()
                p2 = segment.endPoint()
                #print "local",local
                if (local != p1):
                    s = s + self.penUpCodes()
                    s = s + self.moveCode(p1,self.location)
                    local = p1
                s = s + self.penDownCodes()
                midpoint = segment.offsetPoint()
                s = s + "G03 X%.2f Y%.2f I%.2f J%.2f\n" % (p2.x+self.location.x,p2.y+self.location.y,midpoint.x,midpoint.y)
                local = p2

        s = s + self.penUpCodes()
        return s

    def startCodes(self):
        return warmupSequence

    def stopCodes(self):
        return cooldownSequence

    def stringCodes(self,font,s):
        rv = ""
        for c in s:
            x = self.location.x
            if c == ' ':
                x = x + font.wordSpacing
            else:
                letter = font.map[ord(c)]
                if letter:
                    x = x + letter.max().x
                    x = x + font.letterSpacing
                    rv = rv + self.characterCodes(letter)
            self.location = Point(x,self.location.y)
        return rv

    def nextLine(self,font):
        self.location.x = self.start.x
        self.location.y = self.location.y + font.lineSpacing


    def output(self, fontpath, text, outfile):
        outfile.write(self.startCodes())
        font = CxfFont(fontpath)
        while text != "":
            (part,text) = font.wrap(text,self.size.x-self.start.x)
            outfile.write(self.stringCodes(font,part))
            self.nextLine(font)
        outfile.write(self.stopCodes())

if __name__ == "__main__":
    optparse = OptionParser()
    optparse.add_option("-f","--font",dest="font",help="Path to .cxf font file",default="standard.cxf")
    optparse.add_option("-o","--output",dest="outpath",help="Path to output (default:stdout)",default="-")
    optparse.add_option("-x",dest="x",help="X offset in mm",default="0.0")
    optparse.add_option("-y",dest="y",help="Y offset in mm",default="0.0")
    optparse.add_option("--width",dest="w",help="target width in mm",default="90.0")
    optparse.add_option("--height",dest="h",help="target height in mm",default="90.0")
    (options,args) = optparse.parse_args()
    if (options.outpath == "-"):
        outfile = sys.stdout
    else:
        outfile = open(options.outpath,"w")
    text = " ".join(args)
    gcode = GCode(Point(float(options.x),float(options.y)),Point(float(options.w),float(options.h)))
    gcode.output(options.font,text,outfile)
