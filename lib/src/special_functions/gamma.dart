import 'dart:math' as stdmath;

import '../constants.dart' as constants;
import '../error_messages.dart' as messages;
import '../precision_equality.dart' show almostEqual;
import '../trigonometry.dart' as trig;

/// The order of the [gammaLn] approximation.
const int _gammaN = 10;

/// Auxiliary variable when evaluating the [gammaLn] function.
const double _gammaR = 10.900511;

/// Polynomial coefficients for the [gammaLn] approximation.
final List<double> _gammaDk = [
  2.48574089138753565546e-5,
  1.05142378581721974210,
  -3.45687097222016235469,
  4.51227709466894823700,
  -2.98285225323576655721,
  1.05639711577126713077,
  -1.95428773191645869583e-1,
  1.70970543404441224307e-2,
  -5.71926117404305781283e-4,
  4.63399473359905636708e-6,
  -2.71994908488607703910e-9
];

/// Computes the logarithm of the Gamma function.
///
/// This implementation of the computation of the gamma and logarithm of the gamma function follows the derivation in
///     "An Analysis Of The Lanczos Gamma Approximation", Glendon Ralph Pugh, 2004.
/// We use the implementation listed on p. 116 which achieves an accuracy of 16 floating point digits. Although 16 digit accuracy
/// should be sufficient for double values, improving accuracy is possible (see p. 126 in Pugh).
///
/// Unit tests suggest that the accuracy of the Gamma function is correct up to 14 floating point digits.
double gammaLn(double z) {
  if (z < 0.5) {
    double s = _gammaDk[0];
    for (int i = 1; i <= _gammaN; i++) {
      s += _gammaDk[i] / (i - z);
    }

    return constants.lnPi -
        stdmath.log(trig.sin(constants.pi * z)) -
        stdmath.log(s) -
        constants.logTwoSqrtEOverPi -
        ((0.5 - z) * stdmath.log((0.5 - z + _gammaR) / constants.e));
  } else {
    double s = _gammaDk[0];
    for (int i = 1; i <= _gammaN; i++) {
      s += _gammaDk[i] / (z + i - 1.0);
    }

    return stdmath.log(s) +
        constants.logTwoSqrtEOverPi +
        ((z - 0.5) * stdmath.log((z - 0.5 + _gammaR) / constants.e));
  }
}

/// Computes the Gamma function.
///
/// This implementation of the computation of the gamma and logarithm of the gamma function follows the derivation in
///     "An Analysis Of The Lanczos Gamma Approximation", Glendon Ralph Pugh, 2004.
/// We use the implementation listed on p. 116 which should achieve an accuracy of 16 floating point digits. Although 16 digit accuracy
/// should be sufficient for double values, improving accuracy is possible (see p. 126 in Pugh).
///
/// Our unit tests suggest that the accuracy of the Gamma function is correct up to 13 floating point digits.
double gamma(double z) {
  if (z < 0.5) {
    double s = _gammaDk[0];
    for (int i = 1; i <= _gammaN; i++) {
      s += _gammaDk[i] / (i - z);
    }

    return constants.pi /
        (trig.sin(constants.pi * z) *
            s *
            constants.twoSqrtEOverPi *
            stdmath.pow((0.5 - z + _gammaR) / constants.e, 0.5 - z));
  } else {
    double s = _gammaDk[0];
    for (int i = 1; i <= _gammaN; i++) {
      s += _gammaDk[i] / (z + i - 1.0);
    }

    return s *
        constants.twoSqrtEOverPi *
        stdmath.pow((z - 0.5 + _gammaR) / constants.e, z - 0.5);
  }
}

/// Returns the upper incomplete regularized gamma function
/// Q(a,x) = 1/Gamma(a) * int(exp(-t)t^(a-1),t=0..x) for real a &gt; 0, x &gt; 0.
double gammaUpperRegularized(double a, double x) {
  const double epsilon = 0.000000000000001;
  const double big = 4503599627370496.0;
  const double bigInv = 2.22044604925031308085e-16;

  if (x < 1.0 || x <= a) {
    return 1.0 - gammaLowerRegularized(a, x);
  }

  double ax = a * stdmath.log(x) - x - gammaLn(a);
  if (ax < -709.78271289338399) {
    return a < x ? 0.0 : 1.0;
  }

  ax = stdmath.exp(ax);
  double t;
  double y = 1 - a;
  double z = x + y + 1;
  double c = 0.0;
  double pkm2 = 1.0;
  double qkm2 = x;
  double pkm1 = x + 1;
  double qkm1 = z * x;
  double ans = pkm1 / qkm1;
  do {
    c = c + 1;
    y = y + 1;
    z = z + 2;
    double yc = y * c;
    double pk = pkm1 * z - pkm2 * yc;
    double qk = qkm1 * z - qkm2 * yc;
    if (qk != 0) {
      double r = pk / qk;
      t = ((ans - r) / r).abs();
      ans = r;
    } else {
      t = 1.0;
    }

    pkm2 = pkm1;
    pkm1 = pk;
    qkm2 = qkm1;
    qkm1 = qk;

    if (pk.abs() > big) {
      pkm2 = pkm2 * bigInv;
      pkm1 = pkm1 * bigInv;
      qkm2 = qkm2 * bigInv;
      qkm1 = qkm1 * bigInv;
    }
  } while (t > epsilon);

  return ans * ax;
}

/// Returns the upper incomplete gamma function
/// Gamma(a,x) = int(exp(-t)t^(a-1),t=0..x) for real a &gt; 0, x &gt; 0.
double gammaUpperIncomplete(double a, double x) =>
    gammaUpperRegularized(a, x) * gamma(a);

/// Returns the lower incomplete gamma function
/// gamma(a,x) = int(exp(-t)t^(a-1),t=0..x) for real a &gt; 0, x &gt; 0.
double gammaLowerIncomplete(double a, double x) =>
    gammaLowerRegularized(a, x) * gamma(a);

/// Returns the lower incomplete regularized gamma function
/// P(a,x) = 1/Gamma(a) * int(exp(-t)t^(a-1),t=0..x) for real a &gt; 0, x &gt; 0.
double gammaLowerRegularized(double a, double x) {
  const double epsilon = 0.000000000000001;
  const double big = 4503599627370496.0;
  const double bigInv = 2.22044604925031308085e-16;

  if (a < 0.0) {
    throw ArgumentError.value(a, 'a', messages.argumentNotNegative);
  }

  if (x < 0.0) {
    throw ArgumentError.value(x, 'x', messages.argumentNotNegative);
  }

  if (almostEqual(a, 0.0)) {
    if (almostEqual(x, 0.0)) {
      //use right hand limit value because so that regularized upper/lower gamma definition holds.
      return 1.0;
    }

    return 1.0;
  }

  if (almostEqual(x, 0.0)) {
    return 0.0;
  }

  double ax = (a * stdmath.log(x)) - x - gammaLn(a);
  if (ax < -709.78271289338399) {
    return a < x ? 1.0 : 0.0;
  }

  if (x <= 1 || x <= a) {
    double r2 = a;
    double c2 = 1.0;
    double ans2 = 1.0;

    do {
      r2 = r2 + 1;
      c2 = c2 * x / r2;
      ans2 += c2;
    } while ((c2 / ans2) > epsilon);

    return stdmath.exp(ax) * ans2 / a;
  }

  int c = 0;
  double y = 1 - a;
  double z = x + y + 1;

  double p3 = 1.0;
  double q3 = x;
  double p2 = x + 1;
  double q2 = z * x;
  double ans = p2 / q2;

  double error;

  do {
    c++;
    y += 1;
    z += 2;
    double yc = y * c;

    double p = (p2 * z) - (p3 * yc);
    double q = (q2 * z) - (q3 * yc);

    if (q != 0) {
      double nextans = p / q;
      error = ((ans - nextans) / nextans).abs();
      ans = nextans;
    } else {
      // zero div, skip
      error = 1.0;
    }

    // shift
    p3 = p2;
    p2 = p;
    q3 = q2;
    q2 = q;

    // normalize fraction when the numerator becomes large
    if (p.abs() > big) {
      p3 *= bigInv;
      p2 *= bigInv;
      q3 *= bigInv;
      q2 *= bigInv;
    }
  } while (error > epsilon);

  return 1.0 - (stdmath.exp(ax) * ans);
}

// TODO uncomment when error functions will be implemented
// Returns the inverse P^(-1) of the regularized lower incomplete gamma function
// P(a,x) = 1/Gamma(a) * int(exp(-t)t^(a-1),t=0..x) for real a &gt; 0, x &gt; 0,
// such that P^(-1)(a,P(a,x)) == x.
//double gammaLowerRegularizedInv(double a, double y0) {
//  const double epsilon = 0.000000000000001;
//  const double big = 4503599627370496.0;
//  const double threshold = 5*epsilon;
//
//  if (a.isNaN || y0.isNaN) {
//    return double.nan;
//  }
//
//  if (a < 0 || almostEqual(a, 0.0)) {
//    throw ArgumentError.value(a, 'a', 'Value is out of range.');
//  }
//
//  if (y0 < 0 || y0 > 1) {
//    throw ArgumentError.value(y0, 'y0', 'Value is out of range.');
//  }
//
//  if (almostEqual(y0, 0.0)) {
//    return 0.0;
//  }
//
//  if (almostEqual(y0, 1.0)) {
//    return double.infinity;
//  }
//
//  y0 = 1 - y0;
//
//  double xUpper = big;
//  double xLower = 0.0;
//  double yUpper = 1.0;
//  double yLower = 0.0;
//
//  // Initial Guess
//  double d = 1/(9*a);
//  double y = 1 - d - (0.98*constants.sqrt2*erfInv((2.0*y0) - 1.0)*stdmath.sqrt(d));
//  double x = a*y*y*y;
//  double lgm = gammaLn(a);
//
//  for (int i = 0; i < 20; i++) {
//    if (x < xLower || x > xUpper) {
//      d = 0.0625;
//      break;
//    }
//
//    y = 1 - gammaLowerRegularized(a, x);
//    if (y < yLower || y > yUpper) {
//      d = 0.0625;
//      break;
//    }
//
//    if (y < y0) {
//      xUpper = x;
//      yLower = y;
//    } else {
//      xLower = x;
//      yUpper = y;
//    }
//
//    d = ((a - 1)*stdmath.log(x)) - x - lgm;
//    if (d < -709.78271289338399) {
//      d = 0.0625;
//      break;
//    }
//
//    d = -stdmath.exp(d);
//    d = (y - y0)/d;
//    if ((d/x).abs() < epsilon) {
//      return x;
//    }
//
//    if ((d > (x/4)) && (y0 < 0.05)) {
//      // Naive heuristics for cases near the singularity
//      d = x/10;
//    }
//
//    x -= d;
//  }
//
//  if (xUpper == big) {
//    if (x <= 0) {
//      x = 1.0;
//    }
//
//    while (xUpper == big) {
//      x = (1 + d)*x;
//      y = 1 - gammaLowerRegularized(a, x);
//      if (y < y0) {
//        xUpper = x;
//        yLower = y;
//        break;
//      }
//
//      d = d + d;
//    }
//  }
//
//  int dir = 0;
//  d = 0.5;
//  for (int i = 0; i < 400; i++) {
//    x = xLower + (d*(xUpper - xLower));
//    y = 1 - gammaLowerRegularized(a, x);
//    lgm = (xUpper - xLower)/(xLower + xUpper);
//    if (lgm.abs() < threshold) {
//      return x;
//    }
//
//    lgm = (y - y0)/y0;
//    if (lgm.abs() < threshold) {
//      return x;
//    }
//
//    if (x <= 0.0) {
//      return 0.0;
//    }
//
//    if (y >= y0) {
//      xLower = x;
//      yUpper = y;
//      if (dir < 0) {
//        dir = 0;
//        d = 0.5;
//      } else {
//        if (dir > 1) {
//          d = (0.5*d) + 0.5;
//        } else {
//          d = (y0 - yLower)/(yUpper - yLower);
//        }
//      }
//
//      dir = dir + 1;
//    } else {
//      xUpper = x;
//      yLower = y;
//      if (dir > 0) {
//        dir = 0;
//        d = 0.5;
//      } else {
//        if (dir < -1) {
//          d = 0.5*d;
//        } else {
//          d = (y0 - yLower)/(yUpper - yLower);
//        }
//      }
//
//      dir = dir - 1;
//    }
//  }
//
//  return x;
//}

/// Computes the Digamma function which is mathematically defined as
/// the derivative of the logarithm of the gamma function.
///
/// This implementation is based on
///     Jose Bernardo
///     Algorithm AS 103:
///     Psi ( Digamma ) Function,
///     Applied Statistics,
///     Volume 25, Number 3, 1976, pages 315-317.
/// Using the modifications as in Tom Minka's lightspeed toolbox.
double diGamma(double x) {
  const double c = 12.0;
  const double d1 = -0.57721566490153286;
  const double d2 = 1.6449340668482264365;
  const double s = 1e-6;
  const double s3 = 1.0 / 12.0;
  const double s4 = 1.0 / 120.0;
  const double s5 = 1.0 / 252.0;
  const double s6 = 1.0 / 240.0;
  const double s7 = 1.0 / 132.0;

  if ((x.isInfinite && x.isNegative) || x.isNaN) {
    return double.nan;
  }

  // Handle special cases.
  if (x <= 0 && x.floor() == x) {
    return double.negativeInfinity;
  }

  // Use inversion formula for negative numbers.
  if (x < 0) {
    return diGamma(1.0 - x) + (constants.pi / trig.tan(-constants.pi * x));
  }

  if (x <= s) {
    return d1 - (1 / x) + (d2 * x);
  }

  double result = 0.0;
  while (x < c) {
    result -= 1 / x;
    x++;
  }

  if (x >= c) {
    var r = 1 / x;
    result += stdmath.log(x) - (0.5 * r);
    r *= r;

    result -= r * (s3 - (r * (s4 - (r * (s5 - (r * (s6 - (r * s7))))))));
  }

  return result;
}

/// Computes the inverse Digamma function: this is the inverse of the logarithm of
/// the gamma function. This function will only return solutions that are positive.
///
/// This implementation is based on the bisection method.
double diGammaInv(double p) {
  if (p.isNaN) {
    return double.nan;
  }

  if (p.isInfinite && p.isNegative) {
    return 0.0;
  }

  if (p.isInfinite && !p.isNegative) {
    return double.infinity;
  }

  var x = stdmath.exp(p);
  for (var d = 1.0; d > 1.0e-15; d /= 2.0) {
    x += d * (p - diGamma(x)).sign;
  }

  return x;
}
