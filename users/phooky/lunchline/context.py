class GCodeContext:
    def __init__(self):
        self.drawing = False
        self.start_codes = []
        self.stop_codes = []
        # delay between startup and start of extrusion
        self.startup_lag = 0.0
        self.stop_lag = 0.0
        self.draw_speed = 500.0
        self.travel_speed = 1000.0
        self.last = None
        self.codes = []
    def start(self):
        if not self.drawing:
            self.codes.extend(self.start_codes)
            self.drawing = True
    def stop(self):
        if self.drawing:
            self.codes.extend(self.stop_codes)
            self.drawing = False
    def draw_line_to(self,x,y,stop=True):
        if self.last == (x,y):
            return
        self.start()
        self.codes.append("G1 X%f Y%f F%f" % (x,y,self.draw_speed))
        self.last = (x,y)
        if stop:
            self.stop()
    def travel_to(self,x,y,start=True):
        if self.last == (x,y):
            return
        self.stop()
        self.codes.append("G1 X%f Y%f F%f" % (x,y,self.travel_speed))
        self.last = (x,y)
        if start:
            self.start()

    
