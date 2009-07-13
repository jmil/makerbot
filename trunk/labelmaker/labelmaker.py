#!/usr/bin/python

from reportlab.pdfgen import canvas
from reportlab.rl_config import defaultPageSize
from reportlab.lib.units import inch
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont

LABEL_ROWS = 5
LABEL_COLUMNS = 2
PAGE_HEIGHT = defaultPageSize[1]
PAGE_WIDTH = defaultPageSize[0]
LABEL_HEIGHT = PAGE_HEIGHT/float(LABEL_ROWS)
LABEL_WIDTH = PAGE_WIDTH/float(LABEL_COLUMNS)

pdfmetrics.registerFont(TTFont('DesignerBlock', 'fonts/DESIB___.TTF'))

LOGO_WIDTH=2611.0
LOGO_HEIGHT=212.0

def drawLogo(c):
    c.saveState()
    w=LABEL_WIDTH*0.9
    h=w*LOGO_HEIGHT/LOGO_WIDTH
    x=(LABEL_WIDTH-w)/2.0
    y=LABEL_HEIGHT-(h*2.0)
    c.drawImage("makerbot-logo.png",x,y,width=w,height=h)
    c.restoreState()

def drawTitle(c,title,subtitle):
    c.saveState()
    y = LABEL_HEIGHT/2.0
    x = LABEL_WIDTH/2.0
    c.setFont('DesignerBlock',24)
    c.drawCentredString(x,y,title)
    c.setFont('DesignerBlock',20)
    y -= 18
    c.drawCentredString(x,y,subtitle)
    c.restoreState()

def drawInstructions(c,url):
    c.saveState()
    y = LABEL_HEIGHT/2.0 - 35
    x = LABEL_WIDTH/2.0
    c.drawCentredString(x,y,"Instructions: "+url)
    c.restoreState()

c = canvas.Canvas("hello.pdf")
for x in range(LABEL_COLUMNS):
    for y in range(LABEL_ROWS):
        c.saveState()
        c.translate(x*LABEL_WIDTH,y*LABEL_HEIGHT)
        drawLogo(c)
        drawTitle(c,"Cupcake CNC","XY lasercut parts")
        drawInstructions(c,"http://instructions")
        c.restoreState()
c.showPage()
c.save()
