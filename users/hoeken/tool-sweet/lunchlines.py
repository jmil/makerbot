from lunchline.import_dxf import DxfParser
from lunchline.context import GCodeContext
from sys import stdin

def main():
    parser = DxfParser(stdin)
    context = GCodeContext()
    parser.parse()
    for entity in parser.entities:
        entity.get_gcode(context)
    for line in context.codes:
        print line

if __name__ == "__main__":
    main()
else:
    raise RuntimeError("Lunchline the top-level script, and not meant to be imported.")



