#include "PrimitiveTests.hpp"
#include <Eigen/Core>
// Eigen/Array is required to support vector::operator==.
// Strange but true!
#include <Eigen/Array>
#include <Eigen/Geometry>
#include <iostream>

using namespace std;
using namespace Eigen;

Vector3f makeTestPoint(double x, double y, double z) {
  return Vector3f(x,y,z);
}
		   
void PrimitivesTestSuite::constructionTest() {
  Vector3f p = makeTestPoint(1.0,-2.0,3.0);
  TEST_ASSERT(p[0] == 1.0);
  TEST_ASSERT(p[1] == -2.0);
  TEST_ASSERT(p[2] == 3.0);

  Transform3f m;
  m.setIdentity();
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      TEST_ASSERT(m(i,j) == ((i==j)?1.0:0.0));
    }
  }

  Vector3f p2 = m * p;
  TEST_ASSERT(p==p2);
}

void PrimitivesTestSuite::scalingTest() {
  const double testScale = 2.5;
  Transform3f m;
  m.setIdentity();
  m.scale(testScale);
  Vector3f p = makeTestPoint(1.0,-2.0,3.0);
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      TEST_ASSERT(m(i,j) == ((i==j)?testScale:0.0));
    }
  }
  Vector3f p2 = m * p;
  TEST_ASSERT(p2 == makeTestPoint(2.5,-5.0,7.5));
}
