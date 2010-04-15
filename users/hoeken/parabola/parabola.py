import sdxf

# Set your parabola's parameters here
width = 450
focus=width*.23
range=(-width/2,width/2)
delta=5
centerRadius = 5  # radius of circle marking center

d=sdxf.Drawing()

d.layers.append(sdxf.Layer(name="PARABOLA"))

def parabolaPoint(x,focus):
    return (x,(x**2)/(4*focus))

def addParabola(drawing,focus=1,range=(-5.0,5.0),delta=0.1):
    middle = sum(range)/2.0
    if (middle - range[0] < delta):
        p1 = parabolaPoint(range[0],focus)
        p2 = parabolaPoint(range[1],focus)
        drawing.append(sdxf.Line(points=[p1,p2],layer="PARABOLA"))
    else:
        addParabola(drawing,focus,(range[0],middle),delta)
        addParabola(drawing,focus,(middle,range[1]),delta)



d.append(sdxf.Circle(center=(0,focus),radius=centerRadius,layer="PARABOLA"))
addParabola(d,focus,range,delta)


d.saveas("parabola.dxf")

    
    
    
