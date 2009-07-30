#!/usr/bin/python
from optparse import OptionParser

import sys

from reportlab.pdfgen import canvas
from reportlab.rl_config import defaultPageSize
from reportlab.lib.units import inch
from reportlab.lib.pagesizes import letter
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont

LABEL_ROWS = 5
LABEL_COLUMNS = 2

LABEL_HEIGHT = 2*inch
LABEL_WIDTH = 4*inch

pdfmetrics.registerFont(TTFont('DesignerBlock', 'fonts/DESIB___.TTF'))
pdfmetrics.registerFont(TTFont('Sans', 'fonts/FreeSans.ttf'))
pdfmetrics.registerFont(TTFont('Barcode', 'fonts/IDAutomationHC39S.ttf'))

logoImage="makerbot-logo.png"
logoSize=[2611.0,212.0]

class Label:

    def __init__(this, title, subtitle=None, url=None, code=None,
                 size = [4*inch,2*inch]):
        this.title = title
        this.subtitle = subtitle
        this.url = url
        this.size = size
        this.code = code
        this.centerline = size[0]/2.0
        this.spacing = 10

    def reset(this):
        this.y = this.size[1] - (this.spacing + ((1.0/8.0)*inch))

    def drawText(this,c,text,font,size):
        # getAscentDescent doesn't take font sizes in the 
        # old version of reportlab, so we'll do the conversion
        # ourselves a la the version in svn.
        (a,d) = pdfmetrics.getAscentDescent(font)
        norm = size/1000.0
        (a,d) = (a*norm,d*norm)
        c.setFont(font,size)
        this.y = this.y - a
        c.drawCentredString(this.centerline,this.y,text)
        this.y = this.y - d

    def space(this,c,spacing=None):
        if spacing == None:
            spacing = this.spacing;
        this.y = this.y - spacing

    def drawLogo(this,c):
        c.saveState()
        w=this.size[0]*0.75
        h=w*logoSize[1]/logoSize[0]
        x=(this.size[0]-w)/2.0
        y=this.y - this.spacing
        c.drawImage("makerbot-logo.png",x,y,width=w,height=h)
        c.restoreState()

    def drawTitles(this,c):
        c.saveState()
        if this.title:
            this.drawText(c,this.title,'DesignerBlock',20)
        if this.subtitle:
            this.drawText(c,this.subtitle,'DesignerBlock',18)
        c.restoreState()

    def drawInstructions(this,c):
        if this.url:
            c.saveState()
            this.drawText(c,"Instructions: "+this.url,'Sans',14)
            c.restoreState()

    def drawBarcode(this,c):
        if this.code:
            c.saveState()
            this.drawText(c,'*'+this.code+'*','Barcode',14)
            c.restoreState()

    def draw(this,context):
        #context.rect(0,0,this.size[0],this.size[1])
        this.reset()
        this.drawLogo(context)
        this.space(context);
        this.drawTitles(context)
        this.space(context);
        this.drawInstructions(context)
        this.space(context);
        this.drawBarcode(context)



if __name__ == '__main__':
    parser = OptionParser()
    parser.add_option("-t", "--title", dest="title",
                      action="store",
                      type="string",
                      help="title of product (required)")
    parser.add_option("-s", "--subtitle", dest="subtitle",
                      action="store",
                      type="string",
                      help="subtitle of product")
    parser.add_option("-u", "--url", dest="url",
                      action="store",
                      type="string",
                      help="URL of instructions for product")
    parser.add_option("-c", "--code", dest="code",
                      action="store",
                      type="string",
                      help="barcode (alphanumerics only)")
    parser.add_option("-o", "--output", dest="output",
                      action="store",
                      type="string",
                      default="-",
                      help='output file name (use "-" for stdout)(defaults to stdout)')
    (options, args) = parser.parse_args()

    # Validation please
    if options.title == None:
        print "Error: you must provide a title for the label."
        parser.print_help()

    if (options.output == "-"):
        c = canvas.Canvas(sys.stdout,pagesize=letter)
    else:
        c = canvas.Canvas(options.output,pagesize=letter)
    GUTTER = (3.0/16.0) * inch
    totalWidth = (LABEL_COLUMNS*LABEL_WIDTH)+((LABEL_COLUMNS-1)*GUTTER)
    MARGIN_L = (letter[0] - totalWidth)/2.0
    totalHeight = LABEL_ROWS*LABEL_HEIGHT
    MARGIN_B = (letter[1] - totalHeight)/2.0
    # sticker sheet: 8.25x10
    # page size: 8.5x11
    # translate up and over by .125,.5
    c.translate(MARGIN_L,MARGIN_B)
    label=Label(options.title,
                subtitle = options.subtitle,
                url = options.url,
                code = options.code)

    for x in range(LABEL_COLUMNS):
        for y in range(LABEL_ROWS):
            c.saveState()
            c.translate(x*(LABEL_WIDTH+GUTTER),y*LABEL_HEIGHT)

            label.draw(c)
            c.restoreState()
    c.showPage()
    c.save()
