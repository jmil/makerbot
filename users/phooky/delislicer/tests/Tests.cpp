#include "PrimitiveTests.hpp"

int main() {
  PrimitivesTestSuite pt;
  Test::TextOutput output(Test::TextOutput::Verbose);
  return pt.run(output)?0:1;
}
