import sys

class DXFEntity:
    def __init__(self,register_map):
        self.register_map = register_map
        self.load()
    def load(self):
        pass
    def get_float(self,code,default = 0.0):
        if code in self.register_map:
            return float(self.register_map[code])
        return default
    def get_gcode(self,context):
        pass
    # raise NotImplementedError()
    def gcode_travel(self,context,x,y,start=True):
        gcode = ""
        if context.last == (x,y):
            return gcode
        if context.drawing:
            gcode = gcode + context.stop_codes
            context.drawing = False
        gcode = gcode + "G1 X%f Y%f F%f\n" % (x,y,context.travel_speed)
        context.last = (x,y)
        if start and not context.drawing:
            gcode = gcode + context.start_codes
            context.drawing = True
        return gcode

class DXFLine(DXFEntity):
    def load(self):
        self.thickness = self.get_float(39)
        self.start = (self.get_float(10),self.get_float(20))
        self.end = (self.get_float(11),self.get_float(21))
    def __str__(self):
        return "Line from (%f,%f) to (%f,%f)" % \
            (self.start[0], self.start[1], self.end[0], self.end[1])
    def get_gcode(self,context):
        "Emit gcode for drawing line"
        gcode = self.gcode_travel(context,self.start[0],self.start[1])
        gcode = gcode + "G1 X%f Y%f F%f" % \
            (self.end[0], self.end[1], context.draw_speed)
        context.last = self.end
        return gcode

class DXFCircle(DXFEntity):
    def load(self):
        self.center = (self.get_float(10),self.get_float(20))
        self.radius = self.get_float(40)
    def __str__(self):
        return "Circle at (%f,%f), radius %f" % \
            (self.center[0], self.center[1], self.radius)

class DXFArc(DXFCircle):
    def load(self):
        DXFCircle.load(self)
        self.start_angle = self.get_float(50)
        self.end_angle = self.get_float(51)
    def __str__(self):
        return "Arc at (%f,%f), radius %f, from %f to %f" % \
            (self.center[0], self.center[1], self.radius, \
                 self.start_angle, self.end_angle)

class DXFEllipse(DXFEntity):
    def load(self):
        self.center = (self.get_float(10),self.get_float(20))
        # major axis relative to center
        self.major = (self.get_float(11),self.get_float(21))
        self.minor_to_major = self.get_float(40)
        self.start_param = self.get_float(50)
        self.end_param = self.get_float(51)
    def __str__(self):
        return "Ellipse at (%f,%f), major (%f,%f), minor/major %f" + \
            "start %f end %f" % \
            (self.center[0], self.center[1], self.major[0], self.major[1],
             self.minor_to_major, self.start_param, self.end_param)

class DXFPolyLine(DXFEntity):
    def load(self):
        self.segments = []
        self.thickness = self.get_float(39)
        x_coords = self.get_float(10)
        y_coords = self.get_float(20)
        assert len(x_coords) == len(y_coords)
        self.segments = \
            [(x_coords[i],y_coords[i]) for i in range(len(x_coords))]
    def __str__(self):
        return "Polyline consisting of segments:\n" + \
            map(lambda x:"(%f, %f) "%x,self.segments)
    
#todo: add peek functionality to handle end-of-point kinda stuff?
# This code is based on autodesk's DXF specification.
class GenericSection:
    entity_map = {
        "LINE" : DXFLine,
        "CIRCLE" : DXFCircle,
        "LWPOLYLINE" : DXFPolyLine,
        "ARC" : DXFArc,
        "ELLIPSE" : DXFEllipse
        }
    def __init__(self,parser):
        self.parser = parser
    def make_entity(self,map):
        type_name = map[0]
        if type_name in GenericSection.entity_map:
            constructor = GenericSection.entity_map[type_name]
            self.parser.entities.append(constructor(map))

class EntitiesSection(GenericSection):
    def __init__(self,parser):
        self.parser = parser
        print "Entities"
    def make_entity(self,map):
        GenericSection.make_entity(self,map)



class BlocksSection(GenericSection):
    pass


class DxfParser:
    section_map = {
        "ENTITIES" : EntitiesSection,
        "BLOCKS" : BlocksSection
        }

    def handle_new_section(self,data):
        if data == "SECTION":
            # We need to get the section type
            (_, name) = self.get_next_code(2)
            if name in DxfParser.section_map:
                self.section = DxfParser.section_map[name](self)
            else:
                self.section = None
        elif data == "ENDSEC":
            self.section = None

    def __init__(self, stream):
        self.stream = stream
        self.entities = []
        self.blocks = []
        self.register_map = {}
        self.section = None

    def get_next_code(self, expected_code = None):
        codeStr = self.stream.readline()
        if not codeStr:
            return
        code = int(codeStr.strip())
        value = self.stream.readline().strip()
        if expected_code:
            assert expected_code == code
        return (code,value)

    def finish_entity(self):
        if self.section:
            self.section.make_entity(self.register_map)

    def parse_next_code(self):
        code_tuple = self.get_next_code()
        if not code_tuple:
            return False
        (code,value) = code_tuple
        if code == 0:
            self.finish_entity()
            self.register_map = {}
            self.handle_new_section(value)
        if code in self.register_map:
            entry = self.register_map[code]
            if isinstance(entry, list):
                entry.append(value)
            else:
                self.register_map[code] = [entry, value]
        else:
            self.register_map[code] = value
        return True

    def parse(self):
        while self.parse_next_code():
            pass


class GCodeContext :
    def __init__(self):
        self.travel_speed = 2000
        self.draw_speed = 500
        self.start_codes = ""
        self.stop_codes = ""
        self.last = None
        self.drawing = False

parser = DxfParser(sys.stdin)
context = GCodeContext()

parser.parse()
for entity in parser.entities:
    print entity.get_gcode(context)
