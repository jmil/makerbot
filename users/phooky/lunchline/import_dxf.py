import sys

#todo: add peek functionality to handle end-of-point kinda stuff?
# This code is based on autodesk's DXF specification.
class GenericSection:
    def __init__(self,parser):
        self.parser = parser
    def parse_code(self,code,value):
        pass

class HeaderSection(GenericSection):
    def parse_code(self,code,value):
        print "Header parse"


class DxfParser:
    section_map = {
        "HEADER" : HeaderSection
        }

    def handle_comment(self,data):
        print "Comment: "+data

    def handle_new_entity(self,data):
        if data == "SECTION":
            # We need to get the section type
            (_, name) = self.get_code(2)
            if name in DxfParser.section_map:
                self.stack.append(DxfParser.section_map[name](self))
            else:
                self.stack.append(GenericSection(self))
        elif data == "ENDSEC":
            self.stack.pop()
        else:
            print "Did not handle entity: "+data

    # The code map maps from integers to handlers for the tagged data.
    base_code_map = {
        999 : handle_comment,
        0 : handle_new_entity,
        }

    def __init__(self, stream):
        self.stream = stream
        self.stack = []

    def get_code(self, expected_code = None):
        codeStr = self.stream.readline()
        if not codeStr:
            return None
        code = int(codeStr.strip())
        if expected_code:
            assert expected_code == code
        value = self.stream.readline().strip()
        return (code,value)

    def parse_next_code(self):
        code_tuple = self.get_code()
        if not code_tuple:
            return False
        (code,value) = code_tuple
        for entity in reversed(self.stack):
            if entity.parse_code(code,value):
                return True
        if code in DxfParser.base_code_map:
            DxfParser.base_code_map[code](self,value)
        return True

    def parse(self):
        while self.parse_next_code():
            pass



DxfParser(sys.stdin).parse()
