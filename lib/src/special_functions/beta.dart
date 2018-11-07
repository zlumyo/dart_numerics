import 'dart:math';

import '../error_messages.dart' as messages;
import '../precision.dart';
import 'gamma.dart';

/// Computes the logarithm of the Euler Beta function.
double betaLn(double z, double w) {
  if (z <= 0.0) {
    throw ArgumentError.value(z, 'z', messages.argumentPositive);
  }

  if (w <= 0.0) {
    throw ArgumentError.value(w, 'w', messages.argumentPositive);
  }

  return gammaLn(z) + gammaLn(w) - gammaLn(z + w);
}

/// Computes the Euler Beta function.
double beta(double z, double w) => exp(betaLn(z, w));

/// Returns the lower incomplete (unregularized) beta function
/// B(a,b,x) = int(t^(a-1)*(1-t)^(b-1),t=0..x) for real a > 0, b > 0, 1 >= x >= 0.
double betaIncomplete(double a, double b, double x) =>
    betaRegularized(a, b, x) * beta(a, b);

/// Returns the regularized lower incomplete beta function
/// I_x(a,b) = 1/Beta(a,b) * int(t^(a-1)*(1-t)^(b-1),t=0..x) for real a > 0, b > 0, 1 >= x >= 0.
double betaRegularized(double a, double b, double x) {
  if (a < 0.0) {
    throw ArgumentError.value(a, 'a', messages.argumentNotNegative);
  }

  if (b < 0.0) {
    throw ArgumentError.value(b, 'b', messages.argumentNotNegative);
  }

  if (x < 0.0 || x > 1.0) {
    throw ArgumentError.value(x, 'x', messages.argumentInIntervalXYInclusive);
  }

  var bt = (x == 0.0 || x == 1.0)
      ? 0.0
      : exp(gammaLn(a + b) -
          gammaLn(a) -
          gammaLn(b) +
          (a * log(x)) +
          (b * log(1.0 - x)));

  var symmetryTransformation = x >= (a + 1.0) / (a + b + 2.0);

  /* Continued fraction representation */
  var eps = doublePrecision;
  var fpmin = increment(0.0) / eps;

  if (symmetryTransformation) {
    x = 1.0 - x;
    var swap = a;
    a = b;
    b = swap;
  }

  var qab = a + b;
  var qap = a + 1.0;
  var qam = a - 1.0;
  var c = 1.0;
  var d = 1.0 - (qab * x / qap);

  if (d.abs() < fpmin) {
    d = fpmin;
  }

  d = 1.0 / d;
  var h = d;

  for (int m = 1, m2 = 2; m <= 50000; m++, m2 += 2) {
    var aa = m * (b - m) * x / ((qam + m2) * (a + m2));
    d = 1.0 + (aa * d);

    if (d.abs() < fpmin) {
      d = fpmin;
    }

    c = 1.0 + (aa / c);
    if (c.abs() < fpmin) {
      c = fpmin;
    }

    d = 1.0 / d;
    h *= d * c;
    aa = -(a + m) * (qab + m) * x / ((a + m2) * (qap + m2));
    d = 1.0 + (aa * d);

    if (d.abs() < fpmin) {
      d = fpmin;
    }

    c = 1.0 + (aa / c);

    if (c.abs() < fpmin) {
      c = fpmin;
    }

    d = 1.0 / d;
    var del = d * c;
    h *= del;

    if ((del - 1.0).abs() <= eps) {
      return symmetryTransformation ? 1.0 - (bt * h / a) : bt * h / a;
    }
  }

  return symmetryTransformation ? 1.0 - (bt * h / a) : bt * h / a;
}
