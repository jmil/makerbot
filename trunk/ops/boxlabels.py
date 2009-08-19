#!/usr/bin/python
from optparse import OptionParser

import sys

from reportlab.pdfgen import canvas
from reportlab.rl_config import defaultPageSize
from reportlab.lib.units import inch
from reportlab.lib.pagesizes import letter
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont

LABEL_ROWS = 2
LABEL_COLUMNS = 1


pdfmetrics.registerFont(TTFont('DesignerBlock', 'fonts/DESIB___.TTF'))
pdfmetrics.registerFont(TTFont('Sans', 'fonts/FreeSans.ttf'))
pdfmetrics.registerFont(TTFont('Barcode', 'fonts/IDAutomationHC39L.ttf'))

logoImage="makerbot-logo.png"
logoSize=[2611.0,212.0]

class BoxLabel:
    def __init__(this, boxNum, rackNum, shelfNum,
                 size = [8.5*inch,5.5*inch]):
        this.boxNum = boxNum
        this.rackNum = rackNum
        this.shelfNum = shelfNum
        this.centerline = size[0]/2.0
        this.spacing = 9
        this.size = size
        this.debug = False

    def reset(this):
        pass

    def drawBox(this,c,text,barcode):
        boxsize = [4.25*inch,2.75*inch]
        margin = 0.125*inch
        c.saveState()
        c.translate(margin,margin)
        boxsize = [x-(2*margin) for x in boxsize]
        c.setLineWidth(margin/4)
        c.rect(0,0,boxsize[0],boxsize[1])
        c.translate(margin,margin)
        boxsize = [x-(2*margin) for x in boxsize]
        centerline = boxsize[0] / 2
        c.setFont('Barcode',20)
        c.drawCentredString(centerline,0.15*boxsize[1],barcode)
        c.setFont('Sans',20)
        c.drawCentredString(centerline,0.85*boxsize[1],text)
        c.restoreState()

    def draw(this,context):
        if (this.debug):
            context.rect(0,0,this.size[0],this.size[1])
        this.doDraw = 1
        this.drawInternal(context)

    def drawInternal(this,context):
        this.reset()
        context.saveState()
        c.translate(this.size[0]/2,0)
        rackHuman = "RACK %d SHELF %d" % (this.rackNum,this.shelfNum)
        rackBar = "RK-%03d-SH-%03d" % (this.rackNum,this.shelfNum)
        this.drawBox(context,rackHuman,rackBar)
        c.translate(0,this.size[1]/2)
        this.drawBox(context,
                     "BOX #%d" % (this.boxNum),
                     "BOX-%04d" % (this.boxNum))
        context.restoreState()


if __name__ == '__main__':
    parser = OptionParser()
    parser.add_option("-b", "--box", dest="box",
                      action="append",
                      type="string",
                      help="Box number, rack number, shelf number (comma-delimited, no spaces)")
    parser.add_option("-o", "--output", dest="output",
                      action="store",
                      type="string",
                      default="-",
                      help='output file name (use "-" for stdout)(defaults to stdout)')
    parser.add_option("--debug", dest="debug",
                      action="store_true",
                      default=False)

    (options, args) = parser.parse_args()

    # Validation please
    if not options.box:
        print "At least one box needs to be specified."
        sys.exit(-1)

    if (options.output == "-"):
        c = canvas.Canvas(sys.stdout,pagesize=letter)
    else:
        c = canvas.Canvas(options.output,pagesize=letter)
    top = 1
    for boxopt in options.box:
        if (top == -1):
            top = 1
            c.showPage()
        (boxnum,racknum,shelfnum) = [int(x) for x in boxopt.split(',')]
        label = BoxLabel(boxnum,racknum,shelfnum)
        label.debug = options.debug
        c.saveState()
        if (top == 1):
            c.translate(0,5.5*inch)
        top = top - 1
        label.draw(c)
        c.restoreState()
    c.showPage()
    c.save()
