#include "PrimitiveTests.hpp"
#include <Eigen/Core>
// Eigen/Array is required to support vector::operator==.
// Strange but true!
#include <Eigen/Array>
#include <iostream>

using namespace std;
USING_PART_OF_NAMESPACE_EIGEN

Vector3d makeTestPoint(double x, double y, double z) {
  return Vector3d(x,y,z);
}
		   
void PrimitivesTestSuite::constructionTest() {
  Vector3d p = makeTestPoint(1.0,-2.0,3.0);
  TEST_ASSERT(p[0] == 1.0);
  TEST_ASSERT(p[1] == -2.0);
  TEST_ASSERT(p[2] == 3.0);

  Matrix3d m = Matrix3d::Identity();
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      TEST_ASSERT(m(i,j) == ((i==j)?1.0:0.0));
    }
  }

  Vector3d p2 = m * p;
  TEST_ASSERT(p==p2);
}

void PrimitivesTestSuite::scalingTest() {
  const double testScale = 2.5;
  Matrix3d m = Matrix3d::Identity() * testScale;
  Vector3d p = makeTestPoint(1.0,-2.0,3.0);
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      TEST_ASSERT(m(i,j) == ((i==j)?testScale:0.0));
    }
  }
  Vector3d p2 = m * p;
  TEST_ASSERT(p2 == makeTestPoint(2.5,-5.0,7.5));
}

void PrimitivesTestSuite::rotationTest() {
}
