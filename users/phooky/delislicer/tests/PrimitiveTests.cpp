#include "PrimitiveTests.hpp"
#include "../Primitives.h"
#include <iostream>

using namespace std;

Point3D makeTestPoint(double x, double y, double z) {
  Point3D p;
  p[0] = x; p[1] = y; p[2] = z;
  return p;
}
		   
void PrimitivesTestSuite::constructionTest() {
  Point3D p = makeTestPoint(1.0,-2.0,3.0);
  TEST_ASSERT(p[0] == 1.0);
  TEST_ASSERT(p[1] == -2.0);
  TEST_ASSERT(p[2] == 3.0);

  Matrix3D m;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      TEST_ASSERT(m[i][j] == ((i==j)?1.0:0.0));
    }
  }

  Point3D p2 = m.apply(p);
  TEST_ASSERT(p==p2);
}

void PrimitivesTestSuite::scalingTest() {
  const double testScale = 2.5;
  Matrix3D m = Matrix3D::makeScale(testScale);
  Point3D p = makeTestPoint(1.0,-2.0,3.0);
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      TEST_ASSERT(m[i][j] == ((i==j)?testScale:0.0));
    }
  }
  Point3D p2 = m.apply(p);
  TEST_ASSERT(p2 == makeTestPoint(2.5,-5.0,7.5));
}
