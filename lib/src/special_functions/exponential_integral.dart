import 'dart:math';

import '../constants.dart';

/// Computes the generalized Exponential Integral function (En).
///
/// This implementation of the computation of the Exponential Integral function
/// follows the derivation in "Handbook of Mathematical Functions, Applied
/// Mathematics Series, Volume 55", Abramowitz, M., and Stegun, I.A. 1964,
/// reprinted 1968 by Dover Publications, New York), Chapters 6, 7, and 26.
/// AND "Advanced mathematical methods for scientists and engineers", Bender,
/// Carl M.; Steven A. Orszag (1978). page 253
///
/// for x > 1  uses continued fraction approach that is often used to compute incomplete gamma.
/// for 0 < x <= 1 uses Taylor series expansion
///
/// Our unit tests suggest that the accuracy of the Exponential Integral
/// function is correct up to 13 floating point digits.
double exponentialIntegral(double x, int n) {
  //parameter validation
  if (n < 0 || x < 0.0) {
    throw ArgumentError("x and n must be positive: x=${x}, n=${n}");
  }

  const double epsilon = 0.00000000000000001;
  int maxIterations = 100;
  int i, ii;
  double ndbl = n.toDouble();
  double result;
  double nearDoubleMin =
      1e-100; //needs a very small value that is not quite as small as the lowest value double can take
  double factorial = 1.0;
  double del;
  double psi;
  double a, b, c, d, h; //variables for continued fraction

  //special cases
  if (n == 0) {
    return exp(-1.0 * x) / x;
  } else if (x == 0.0) {
    return 1.0 / (ndbl - 1.0);
  }
  //general cases
  //continued fraction for large x
  if (x > 1.0) {
    b = x + n.toDouble();
    c = 1.0 / nearDoubleMin;
    d = 1.0 / b;
    h = d;
    for (i = 1; i <= maxIterations; i++) {
      a = -1.0 * i.toDouble() * ((ndbl - 1.0) + i.toDouble());
      b += 2.0;
      d = 1.0 / (a * d + b);
      c = b + a / c;
      del = c * d;
      h = h * del;
      if ((del - 1.0).abs() < epsilon) {
        return h * exp(-x);
      }
    }

    throw ArgumentError(
        "continued fraction failed to converge for x=${x}, n=${n})");
  } else {
    //series computation for small x
    result = ((ndbl - 1.0) != 0
        ? 1.0 / (ndbl - 1.0)
        : (-1.0 * log(x) - eulerMascheroni)); //Set first term.
    for (i = 1; i <= maxIterations; i++) {
      factorial *= (-1.0 * x / (i.toDouble()));
      if (i != (ndbl - 1.0)) {
        del = -factorial / (i - (ndbl - 1.0));
      } else {
        psi = -1.0 * eulerMascheroni;
        for (ii = 1; ii <= (ndbl - 1.0); ii++) {
          psi += (1.0 / ii.toDouble());
        }
        del = factorial * (-1.0 * log(x) + psi);
      }
      result += del;
      if (del.abs() < result.abs() * epsilon) {
        return result;
      }
    }

    throw ArgumentError("series failed to converge for x=${x}, n=${n})");
  }
}
