#!/usr/bin/python

from reportlab.pdfgen import canvas
from reportlab.rl_config import defaultPageSize
from reportlab.lib.units import inch
from reportlab.lib.pagesizes import letter
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont

LABEL_ROWS = 5
LABEL_COLUMNS = 2
PAGE_HEIGHT = defaultPageSize[1]
PAGE_WIDTH = defaultPageSize[0]
LABEL_HEIGHT = 2*inch
LABEL_WIDTH = 4*inch

pdfmetrics.registerFont(TTFont('DesignerBlock', 'fonts/DESIB___.TTF'))
pdfmetrics.registerFont(TTFont('Sans', 'fonts/FreeSans.ttf'))

LOGO_WIDTH=2611.0
LOGO_HEIGHT=212.0

def drawLogo(c):
    c.saveState()
    w=LABEL_WIDTH*0.8
    h=w*LOGO_HEIGHT/LOGO_WIDTH
    x=(LABEL_WIDTH-w)/2.0
    y=LABEL_HEIGHT-(h*2.0)
    c.drawImage("makerbot-logo.png",x,y,width=w,height=h)
    c.restoreState()

def drawTitle(c,title,subtitle):
    c.saveState()
    y = LABEL_HEIGHT/2.0
    x = LABEL_WIDTH/2.0
    c.setFont('DesignerBlock',20)
    c.drawCentredString(x,y,title)
    c.setFont('DesignerBlock',18)
    y -= 18
    c.drawCentredString(x,y,subtitle)
    c.restoreState()

def drawInstructions(c,url):
    c.saveState()
    y = LABEL_HEIGHT/2.0 - 35
    x = LABEL_WIDTH/2.0
    c.setFont('Sans',16)
    c.drawCentredString(x,y,"Instructions: "+url)
    c.restoreState()

c = canvas.Canvas("hello.pdf",pagesize=letter)
# sticker sheet: 8.25x10
# page size: 8.5x11
# translate up and over by .125,.5
c.translate(0.2*inch,0.4*inch)
for x in range(LABEL_COLUMNS):
    for y in range(LABEL_ROWS):
        c.saveState()
        if (x != 0):
            c.translate(LABEL_WIDTH+(0.25*inch),0)
        c.translate(0,y*LABEL_HEIGHT)
        drawLogo(c)
        drawTitle(c,"RepRap Motherboard v1.2","")
        drawInstructions(c,"make.rrrf.org/rmb-1.2")
        c.restoreState()
c.showPage()
c.save()
