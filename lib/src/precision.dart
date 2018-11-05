import 'dart:math';

import 'utils.dart';

/// The number of binary digits used to represent the binary number for a double
/// precision floating point value. i.e. there are this many digits used
/// to represent the actual number, where in a number as:
/// 0.134556 * 10^5 the digits are 0.134556 and the exponent is 5.
const int doubleWidth = 53;

/// Standard epsilon, the maximum relative precision of IEEE 754
/// double-precision floating numbers (64 bit).
///
/// According to the definition of Prof. Demmel and used in LAPACK and Scilab.
final double doublePrecision = pow(2, -doubleWidth);

/// Standard epsilon, the maximum relative precision of IEEE 754
/// double-precision floating numbers (64 bit).
final double positiveDoublePrecision = 2 * doublePrecision;

/// Actual double precision machine epsilon, the smallest number that can be
/// subtracted from 1, yielding a results different than 1.
///
/// This is also known as unit roundoff error. According to the definition of Prof. Demmel.
/// On a standard machine this is equivalent to [doublePrecision].
final double machineEpsilon = _measureMachineEpsilon();

/// Actual double precision machine epsilon, the smallest number that can be
/// added to 1, yielding a results different than 1.
///
/// This is also known as unit roundoff error. According to the definition of Prof. Higham.
/// On a standard machine this is equivalent to [positiveDoublePrecision].
final double positiveMachineEpsilon = _measurePositiveMachineEpsilon();

/// The number of significant decimal places of double-precision floating numbers (64 bit).
final int doubleDecimalPlaces = log10(doublePrecision).abs().floor();

/// Returns the magnitude of the number.
int magnitude(double value) {
  // Can't do this with zero because the 10-log of zero doesn't exist.
  if (value.compareTo(0.0) == 0) {
    return 0;
  }

  // Note that we need the absolute value of the input because Log10 doesn't
  // work for negative numbers (obviously).
  double m = log10(value.abs());
  var truncated = m.truncate();

  // To get the right number we need to know if the value is negative or positive
  // truncating a positive number will always give use the correct magnitude
  // truncating a negative number will give us a magnitude that is off by 1 (unless integer)
  return m < 0 && truncated != m ? truncated - 1 : truncated;
}

/// Returns the number divided by it's magnitude, effectively returning a number between -10 and 10.
double scaleUnitMagnitude(double value) {
  if (value.compareTo(0.0) == 0) {
    return value;
  }

  int m = magnitude(value);
  return value * pow(10, -m);
}

/// Calculates the actual (negative) double precision machine epsilon -
/// the smallest number that can be subtracted from 1, yielding a results different than 1.
///
/// This is also known as unit roundoff error. According to the definition of Prof. Demmel.
double _measureMachineEpsilon() {
  double eps = 1.0;

  while ((1.0 - (eps / 2.0)) < 1.0) eps /= 2.0;

  return eps;
}

/// Calculates the actual positive double precision machine epsilon -
/// the smallest number that can be added to 1, yielding a results different than 1.
///
/// This is also known as unit roundoff error. According to the definition of Prof. Higham.
double _measurePositiveMachineEpsilon() {
  double eps = 1.0;

  while ((1.0 + (eps / 2.0)) > 1.0) eps /= 2.0;

  return eps;
}
