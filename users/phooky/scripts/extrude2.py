#!/usr/bin/env python
#
# Plaqinator takes a 2d image and turns it into a 3D mesh
# suitable for fabrication.
#
# the image is oriented so that the long axis is parallel to the X
# axis, the short edge is parallel to the Z axis, and the pixel value
# is used to produce the Y offset.

__author__ = 'Jonathan Mayer <jonathan.mayer@gmail.com>'

# depends on the Python Imaging Library
from PIL import Image
from PIL import ImageOps
from optparse import OptionParser

# depends on py-gts
import gts

import sys

def simp(coords):
  """Ugh, don't ask."""
  str = ""
  for t in range(0,3):
    if (coords[t] < 0.5):
      str = str + "0"
    else:
      str = str + "1"
  return str

MAX_DIM = 160

class HeightMap:
  def __init__(self, filename, mm_x=40.0, mm_y=0.0, mm_depth=3.0):
    self.filename = filename
    rawImage = Image.open(filename)
    self.im = ImageOps.grayscale(rawImage) # winnow down to one channel
    self.pix = self.im.load()
    #resize-- max dim ~160 px?
    ratio = 1.0
    if self.im.size[0] > self.im.size[1]:
      if self.im.size[0] > MAX_DIM:
        ratio = float(self.im.size[0])/MAX_DIM
    else:
      if self.im.size[1] > MAX_DIM:
        ratio = MAX_DIM/float(self.im.size[1])
    if ratio != 1.0:
      print self.im.size[0],self.im.size[0]*ratio
      self.im.resize((self.im.size[0]*ratio,self.im.size[1]*ratio))

    self.pixels_x, self.pixels_y = self.im.size
    print "image size x=",self.pixels_x," y=",self.pixels_y
        
    self.min_val, self.max_val = self.im.getextrema()
    print "extrema",self.min_val,self.max_val
    self.mm_x = mm_x
    if mm_y:
      self.mm_y = mm_y
    else:
      # keep aspect ratio
      self.mm_y = self.mm_x * self.pixels_y / self.pixels_x
    self.mm_depth = mm_depth
    self.surf = gts.Surface()

  def GetDisplacement(self, x, y):
    revy = self.pixels_y - y - 1
    value = float(self.pix[x, revy])
    fraction = (value - self.min_val) / float(self.max_val - self.min_val)
    fraction = fraction - 0.30;
    return self.mm_depth * (fraction)

  def x_to_px(self, x):
    return x * self.mm_x / self.pixels_x

  def y_to_pz(self, y):
    return y * self.mm_y / self.pixels_y


  # square is defined by 4 vertexes, described counterclockwise facing
  # from the outside of the surface (right-hand rule, normal points out)
  #
  # Looking down at the square from the outside:
  #      D----C
  #      |   /|
  #      |  / |
  #      | /  |
  #      |/   |
  #      A----B
  #
  # The square is then attached to surface s.
  def AddSquare(self, s, va, vb, vc, vd, revert=0):
    # currently implemented lamely: two triangles:  ABC, ACD.  
    # FIXME: this should be 4 triangles with an interpolated midpoint.

    # create ABC triangle, counterclockwise
    eab = gts.Edge(va,vb)  # the order of the Vertexes here is
    ebc = gts.Edge(vb,vc)  # important, and determine the direction
    eca = gts.Edge(vc,va)  # of the normal vector.
    f1 = gts.Face(eab,ebc,eca)  # ccw

    # create ACD triangle, counterclockwise
    eac = gts.Edge(va,vc)
    ecd = gts.Edge(vc,vd)
    eda = gts.Edge(vd,va)
    f2 = gts.Face(eac,ecd,eda)  # ccw
    # create two triangles.  Assume left-hand rule for computing normal
    # from the ordering of the edges.  Assume the normal points out of
    # the surface of a solid object.  So we traverse the edges clockwise,
    # looking at the face from the outside.
    if revert:
      # turn around, bright eyes.
      f1.revert()
      f2.revert()
    # add faces to object
    for face in [f1, f2]:
      if not face.is_compatible(s):
        print "surprise!"  # this should never happen if order of edge
        face.revert()      # construction above is correct.
      s.add(face)  # will only collapse edges if normals are correct

  def MakeVertexMap(self):
    # pre-create all of our vertex objects.  I was having a hard time
    # getting GTS to collapse my intersecting edges.  Re-using the same
    # vector object for each edge seems to have solved the problem.
    # However, the issue might've been my normal vectors, so I'm not
    # 100% certain.
    self.top = []  # all the vertexes on the front of the plaque
    self.bottom = []  # all the vertexes on the back of the plaque
    for x in range(0, self.pixels_x):
      col = []  # column of top-face points
      bcol = []  # column of back-face points
      for y in range(0, self.pixels_y):
        pz = self.y_to_pz(y)
        px = self.x_to_px(x)
        py = self.GetDisplacement(x, y)
        if py < 0.0:
          py = 0.0
        print 'make.top', x, y, py
        col.append(gts.Vertex(px,-pz,py))
        bcol.append(gts.Vertex(px,-pz,0.0))
      # append:
      self.top.append(col)  
      self.bottom.append(bcol)

  def MakeSurface(self):
    print "knitting the surface"
    # paint in the top:
    for x in range(0, self.pixels_x-1):
      for y in range(0, self.pixels_y-1):
        self.AddSquare(self.surf,
                       self.top[x][y],
                       self.top[x][y+1],
                       self.top[x+1][y+1],
                       self.top[x+1][y])
        self.AddSquare(self.surf,
                       self.bottom[x][y],
                       self.bottom[x+1][y],
                       self.bottom[x+1][y+1],
                       self.bottom[x][y+1])
            

  # def MakeBottom(self):
  #   print "gluing on the bottom"
  #   # paint in the top:
  #   for x in range(0, self.pixels_x-1):
  #     for y in range(0, self.pixels_y-1):
  #       self.AddSquare(self.surf,
  #                      self.bottom[x][y],
  #                      self.bottom[x+1][y],
  #                      self.bottom[x+1][y+1],
  #                      self.bottom[x][y+1])

  def MakeSides(self):
    surf = self.surf
    # paint in the sides:
    print "doing the top and bottom sides"
    for x in range(0, self.pixels_x-1):
      y = 0
      self.AddSquare(self.surf,
                     self.bottom[x][y],
                     self.top[x][y],
                     self.top[x+1][y],
                     self.bottom[x+1][y])
      y = self.pixels_y-1
      self.AddSquare(self.surf,
                     self.bottom[x][y],
                     self.bottom[x+1][y],
                     self.top[x+1][y],
                     self.top[x][y])
    print "doing the left and right sides"
    for y in range(0, self.pixels_y-1):
      x = 0
      self.AddSquare(self.surf,
                     self.bottom[x][y],
                     self.bottom[x][y+1],
                     self.top[x][y+1],
                     self.top[x][y])
      x = self.pixels_x-1
      self.AddSquare(self.surf,
                     self.bottom[x][y],
                     self.top[x][y],
                     self.top[x][y+1],
                     self.bottom[x][y+1])

    # okay
    return

  def Render(self):
    #self.pixels_x = 8
    #self.pixels_y = 8
    self.MakeVertexMap()
    self.MakeSurface()
    self.MakeSides()
    #self.MakeBottom()
    print "Cleaning up the mesh"
    self.surf.cleanup()
    print "All done!  volume =",self.surf.volume()

    # verify that we did this crazy thing right:
    if (self.surf.volume() <= 0):
      print "Error: we did the crazy thing wrong!"
    if not self.surf.is_orientable():
      print "Error: not orientable"
    if not self.surf.is_manifold():
      print "Error: not manifold."
    if not self.surf.is_closed():
      print "Error: not closed."

  def Write(self, filename):
    f = open(filename, "w")
    self.surf.write(f)
    f.close()

optparser = OptionParser(usage="%prog [options] input_path [output_path]")
(options,arguments) = optparser.parse_args()

if len(arguments) < 1:
  print "No input path provided."
  optparser.usage()
  sys.exit(1)

f_in = arguments[0]
if len(arguments) > 1:
  f_out = arguments[1]
else:
  f_out = f_in + ".gts"

hm = HeightMap(f_in)
hm.Render()
hm.Write(f_out)
