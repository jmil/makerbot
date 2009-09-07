#ifndef PRIMITIVES_H
#define PRIMITIVES_H

#include <math.h>

template <typename scalar,int dim>
class Locus
{
private:
  scalar c[dim]; // Coordinates
public:
  scalar& operator[](int idx) { return c[idx]; }
  const scalar& operator[](int idx) const { return c[idx]; }

  Locus() {
    for (int i = 0; i < dim; i++) { c[i] = 0; }
  }

  Locus operator+(const Locus& b) const {
    Locus r = *this;
    r += b;
    return r;
  }

  Locus& operator+=(const Locus& b) {
    for (int i = 0; i < dim; i++) { c[i] += b.c[i]; }
  }

  Locus operator-(const Locus& b) const {
    Locus r = *this;
    r += b;
    return r;
  }

  Locus& operator-=(const Locus& b) {
    for (int i = 0; i < dim; i++) { c[i] -= b.c[i]; }
  }

  Locus operator*(const scalar b) const {
    Locus r = *this;
    r *= b;
    return r;
  }

  Locus& operator*=(const scalar b) {
    for (int i = 0; i < dim; i++) { c[i] *= b; }
    return *this;
  }

  Locus operator/(const scalar b) const {
    Locus r = *this;
    r /= b;
    return r;
  }

  Locus& operator/=(const scalar b) {
    for (int i = 0; i < dim; i++) { c[i] /= b; }
    return *this;
  }

  scalar distance() const {
    return distance(Locus());
  }

  scalar distance(const Locus& a) const {
    scalar d2 = 0;
    for (int i = 0; i < dim; i++) { 
      scalar diff = (c[i] - a[i]);
      d2 += diff * diff;
    }
    return sqrt(d2);
  }

  bool operator==(const Locus& a) const {
    for (int i = 0; i < dim; i++) {
      if (c[i] != a[i]) return false;
    }
    return true;
  }

};

typedef Locus<double,2> Point2D;
typedef Locus<double,3> Point3D;

/// Represent affine transformations as augmented matrices
template<typename scalar,int dim>
class AffineTransformation {
private:
  scalar m[dim][dim];
  scalar b[dim];
public:
  /// Default affine transformation is the identity transform
  AffineTransformation() {
    for (int i = 0; i < dim; i++) {
      for (int j = 0; j < dim; j++) {
	m[i][j] = (i==j)?1:0;
      }
      b[i] = 0;
    }
  }

  /// Affine transformation with "v" as all non-augmented entries
  AffineTransformation(scalar v) {
    for (int i = 0; i < dim; i++) {
      for (int j = 0; j < dim; j++) {
	m[i][j] = v;
      }
      b[i] = 0;
    }
  }

  Locus<scalar,dim> apply(const Locus<scalar,dim>& x) {
    Locus<scalar,dim> r;
    for (int row = 0; row < dim; row++) {
      r[row] = 0;
      for (int col = 0; col < dim; col++) {
	r[row] += m[row][col] * x[col];
      }
      r[row] += b[row];
    }
    return r;
  }

  AffineTransformation apply(const AffineTransformation& b) {
    AffineTransformation t(0);
    for (int row = 0; row < dim; row++) {
      for (int col = 0; col < dim; col++) {
	for (int i = 0; i < dim; i++) {
	  t.m[row][col] += m[row][i] * b.m[i][col];
	}
      }
    }
    return t;
  }

  void translate(const Locus<scalar,dim>& x) {
    for (int i = 0; i < dim; i++) {
      b[i] = x[i];
    }
  }

  static AffineTransformation makeRotation(int axis, scalar radians) {
    AffineTransformation t;
    scalar c = cos(radians);
    scalar s = sin(radians) * ((axis%2)*-1);
    for (int row = 0; row < dim; row++) {
      if (row == axis) continue;
      for (int col = 0; col < dim; col++) {
	if (col == axis) continue;
	if (col == row) t.m[row][col] = c;
	else {
	  t.m[row][col] = s;
	  s = -s;
	}
      }
    }
    return t;
  }

  static AffineTransformation makeScale(scalar scale) {
    AffineTransformation t;
    for (int i = 0; i < dim; i++) {
      t.m[i][i] = scale;
    }
    return t;
  }


  AffineTransformation& rotate(int axis, scalar radians) {
    *this = apply(AffineTransformation::makeRotation(axis,radians));
    return *this;
  }

  AffineTransformation& scale(scalar radians) {
    *this = apply(AffineTransformation::makeScale(scale));
    return *this;
  }

  scalar* operator[](int idx) { return m[idx]; }
};

typedef AffineTransformation<double,2> Matrix2D;
typedef AffineTransformation<double,3> Matrix3D;

#endif // PRIMITIVES_H
