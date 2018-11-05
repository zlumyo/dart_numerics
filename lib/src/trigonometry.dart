import 'dart:math' as stdmath;

import 'constants.dart' as constants;
import 'precision_equality.dart';

/// Constant to convert a degree to grad.
const double _degreeToGradConstant = 10.0 / 9.0;

/// Converts a [degree] (360-periodic) angle to a grad (400-periodic) angle.
double degreeToGrad(double degree) {
  return degree * _degreeToGradConstant;
}

/// Converts a [degree] (360-periodic) angle to a radian (2*Pi-periodic) angle.
double degreeToRadian(double degree) {
  return degree * constants.degree;
}

/// Converts a [grad] (400-periodic) angle to a degree (360-periodic) angle.
double gradToDegree(double grad) {
  return grad * 0.9;
}

/// Converts a [grad] (400-periodic) angle to a radian (2*Pi-periodic) angle.
double gradToRadian(double grad) {
  return grad * constants.grad;
}

/// Converts a [radian] (2*Pi-periodic) angle to a degree (360-periodic) angle.
double radianToDegree(double radian) {
  return radian / constants.degree;
}

/// Converts a [radian] (2*Pi-periodic) angle to a grad (400-periodic) angle.
double radianToGrad(double radian) {
  return radian / constants.grad;
}

/// Normalized Sinc function. sinc([x]) = sin(pi*[x])/(pi*[x]).
double sinc(double x) {
  double z = constants.pi * x;
  return almostEqualI(z, 0.0, 15) ? 1.0 : sin(z) / z;
}

/// Trigonometric Sine of an angle in [radian], or opposite / hypotenuse.
double sin(double radian) {
  return stdmath.sin(radian);
}

/// Trigonometric Cosine of an angle in [radian], or adjacent / hypotenuse.
double cos(double radian) {
  return stdmath.cos(radian);
}

/// Trigonometric Tangent of an angle in [radian], or opposite / adjacent.
double tan(double radian) {
  return stdmath.tan(radian);
}

/// Trigonometric Cotangent of an angle in [radian], or adjacent / opposite.
/// Reciprocal of the tangent.
double cot(double radian) {
  return 1 / tan(radian);
}

/// Trigonometric Secant of an angle in [radian], or hypotenuse / adjacent.
/// Reciprocal of the cosine.
double sec(double radian) {
  return 1 / cos(radian);
}

/// Trigonometric Cosecant of an angle in [radian], or hypotenuse / opposite.
/// Reciprocal of the sine.
double csc(double radian) {
  return 1 / sin(radian);
}

/// Trigonometric principal Arc Sine in radian.
double asin(double opposite) {
  return stdmath.asin(opposite);
}

/// Trigonometric principal Arc Cosine in radian.
double acos(double adjacent) {
  return stdmath.acos(adjacent);
}

/// Trigonometric principal Arc Tangent in radian
double atan(double opposite) {
  return stdmath.atan(opposite);
}

/// Trigonometric principal Arc Cotangent in radian.
double acot(double adjacent) {
  return atan(1 / adjacent);
}

/// Trigonometric principal Arc Secant in radian.
double asec(double hypotenuse) {
  return acos(1 / hypotenuse);
}

/// Trigonometric principal Arc Cosecant in radian.
double acsc(double hypotenuse) {
  return asin(1 / hypotenuse);
}

/// Hyperbolic Sine.
double sinh(double angle) {
  return (stdmath.exp(angle) - stdmath.exp(-angle)) / 2;
}

/// Hyperbolic Cosine.
double cosh(double angle) {
  return (stdmath.exp(angle) + stdmath.exp(-angle)) / 2;
}

/// Hyperbolic Tangent in radian.
double tanh(double angle) {
  if (angle > 19.1) {
    return 1.0;
  }

  if (angle < -19.1) {
    return -1.0;
  }

  var e1 = stdmath.exp(angle);
  var e2 = stdmath.exp(-angle);
  return (e1 - e2) / (e1 + e2);
}

/// Hyperbolic Cotangent.
double coth(double angle) {
  if (angle > 19.115) {
    return 1.0;
  }

  if (angle < -19.115) {
    return -1.0;
  }

  var e1 = stdmath.exp(angle);
  var e2 = stdmath.exp(-angle);
  return (e1 + e2) / (e1 - e2);
}

/// Hyperbolic Secant.
double sech(double angle) {
  return 1 / cosh(angle);
}

/// Hyperbolic Cosecant.
double csch(double angle) {
  return 1 / sinh(angle);
}

/// Hyperbolic Area Sine.
double asinh(double value) {
  // asinh(x) = Sign(x) * ln(|x| + sqrt(x*x + 1))
  // if |x| > huge, asinh(x) ~= Sign(x) * ln(2|x|)

  if (value.abs() >= 268435456.0) // 2^28, taken from freeBSD
    return value.sign * (stdmath.log(value.abs()) + stdmath.log(2.0));

  return value.sign *
      stdmath.log(value.abs() + stdmath.sqrt((value * value) + 1));
}

/// Hyperbolic Area Cosine.
double acosh(double value) {
  // acosh(x) = ln(x + sqrt(x*x - 1))
  // if |x| >= 2^28, acosh(x) ~ ln(x) + ln(2)

  if (value.abs() >= 268435456.0) // 2^28, taken from freeBSD
    return stdmath.log(value) + stdmath.log(2.0);

  return stdmath
      .log(value + (stdmath.sqrt(value - 1) * stdmath.sqrt(value + 1)));
}

/// Hyperbolic Area Tangent.
double atanh(double value) {
  return 0.5 * stdmath.log((1 + value) / (1 - value));
}

/// Hyperbolic Area Cotangent.
double acoth(double value) {
  return 0.5 * stdmath.log((value + 1) / (value - 1));
}

/// Hyperbolic Area Secant.
double asech(double value) {
  return acosh(1 / value);
}

/// Hyperbolic Area Cosecant.
double acsch(double value) {
  return asinh(1 / value);
}
