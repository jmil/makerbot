
class Entity:
    def get_gcode(self,context):
        #raise NotImplementedError()
        return "NIE"

class Line(Entity):
    def __str__(self):
        return "Line from (%f,%f) to (%f,%f)" % \
            (self.start[0], self.start[1], self.end[0], self.end[1])
    def get_gcode(self,context):
        "Emit gcode for drawing line"
        context.travel_to(self.start[0],self.start[1])
        context.draw_line_to(self.end[0],self.end[1])

class Circle(Entity):
    def __str__(self):
        return "Circle at (%f,%f), radius %f" % \
            (self.center[0], self.center[1], self.radius)

class Arc(Entity):
    def __str__(self):
        return "Arc at (%f,%f), radius %f, from %f to %f" % \
            (self.center[0], self.center[1], self.radius, \
                 self.start_angle, self.end_angle)

class Ellipse(Entity):
    def __str__(self):
        return "Ellipse at (%f,%f), major (%f,%f), minor/major %f" + \
            "start %f end %f" % \
            (self.center[0], self.center[1], self.major[0], self.major[1],
             self.minor_to_major, self.start_param, self.end_param)

class PolyLine(Entity):
    def __str__(self):
        return "Polyline consisting of segments:\n" + \
            map(lambda x:"(%f, %f) "%x,self.segments)
    def get_gcode(self,context):
        "Emit gcode for drawing polyline"
        start = self.segments[0]
        context.travel_to(start[0],start[1])
        for segment in self.segments[1:]:
            context.draw_line_to(segment[0],segment[1])
            context.last = segment
