import 'dart:math';
import 'dart:typed_data';

import 'package:tuple/tuple.dart';

import 'error_messages.dart' as messages;
import 'utils.dart';

/// The smallest positive [double] value that is greater than zero.
const double epsilon = 4.94065645841247E-324;

/// The smallest possible value of an int within 64 bits.
const int int64MinValue = -9223372036854775808;

/// The biggest possible value of an int within 64 bits.
const int int64MaxValue = 9223372036854775807;

/// The number of binary digits used to represent the binary number for a double
/// precision floating point value. i.e. there are this many digits used
/// to represent the actual number, where in a number as:
/// 0.134556 * 10^5 the digits are 0.134556 and the exponent is 5.
const int doubleWidth = 53;

/// Standard epsilon, the maximum relative precision of IEEE 754
/// double-precision floating numbers (64 bit).
///
/// According to the definition of Prof. Demmel and used in LAPACK and Scilab.
final double doublePrecision = pow(2, -doubleWidth) as double;

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

/// Returns a 'directional' long value. This is a long value which acts the same as a double,
/// e.g. a negative double value will return a negative double value starting at 0 and going
/// more negative as the double value gets more negative.
int asDirectionalInt64(double value) {
  var bytes = ByteData(8);
  bytes.setFloat64(0, value);
  // Convert in the normal way.
  int result = bytes.getInt64(0);

  // Now find out where we're at in the range
  // If the value is larger/equal to zero then we can just return the value
  // if the value is negative we subtract [int64MinValue] from it.
  return (result >= 0) ? result : (int64MinValue - result);
}

/// Increments a floating point number to the next bigger number representable by the data type.
///
/// The incrementation step length depends on the provided value.
/// `increment(double.maxFinite)` will return positive infinity.
double increment(double value, [int count = 1]) {
  if (value.isInfinite || value.isNaN || count == 0) {
    return value;
  }

  if (count < 0) {
    return decrement(value, -count);
  }

  // Translate the bit pattern of the double to an integer.
  // Note that this leads to:
  // double > 0 --> long > 0, growing as the double value grows
  // double < 0 --> long < 0, increasing in absolute magnitude as the double
  //                          gets closer to zero!
  //                          i.e. 0 - epsilon will give the largest long value!
  var bytes = ByteData(8);
  bytes.setFloat64(0, value);
  int intValue = bytes.getInt64(0);
  if (intValue < 0) {
    intValue -= count;
  } else {
    intValue += count;
  }

  // Note that int64MinValue has the same bit pattern as -0.0.
  if (intValue == int64MinValue) {
    return 0.0;
  }

  // Note that not all long values can be translated into double values.
  // There's a whole bunch of them which return weird values like infinity and NaN
  bytes.setInt64(0, intValue);
  return bytes.getFloat64(0);
}

/// Decrements a floating point number to the next smaller number representable by the data type.
///
/// The decrementation step length depends on the provided value.
/// `decrement(double.MinValue)` will return negative infinity.
double decrement(double value, [int count = 1]) {
  if (value.isInfinite || value.isNaN || count == 0) {
    return value;
  }

  if (count < 0) {
    return decrement(value, -count);
  }

  // Translate the bit pattern of the double to an integer.
  // Note that this leads to:
  // double > 0 --> long > 0, growing as the double value grows
  // double < 0 --> long < 0, increasing in absolute magnitude as the double
  //                          gets closer to zero!
  //                          i.e. 0 - epsilon will give the largest long value!
  var bytes = ByteData(8);
  bytes.setFloat64(0, value);
  int intValue = bytes.getInt64(0);

  // If the value is zero then we'd really like the value to be -0. So we'll make it -0
  // and then everything else should work out.
  if (intValue == 0) {
    // Note that long.MinValue has the same bit pattern as -0.0.
    intValue = int64MinValue;
  }

  if (intValue < 0) {
    intValue += count;
  } else {
    intValue -= count;
  }

  // Note that not all long values can be translated into double values. There's a whole bunch of them
  // which return weird values like infinity and NaN
  bytes.setInt64(0, intValue);
  return bytes.getFloat64(0);
}

/// <summary>
/// Forces small numbers near zero to zero, according to the specified absolute accuracy.
/// </summary>
/// <param name="a">The real number to coerce to zero, if it is almost zero.</param>
/// <param name="maxNumbersBetween">The maximum count of numbers between the zero and the number <paramref name="a"/>.</param>
/// <returns>
///     Zero if |<paramref name="a"/>| is fewer than <paramref name="maxNumbersBetween"/> numbers from zero, <paramref name="a"/> otherwise.
/// </returns>
/// <exception cref="ArgumentOutOfRangeException">
///     Thrown if <paramref name="maxNumbersBetween"/> is smaller than zero.
/// </exception>
double coerceZeroI(double a, int maxNumbersBetween) {
  if (maxNumbersBetween < 0) {
    throw ArgumentError.value(
        maxNumbersBetween, 'maxNumbersBetween', messages.argumentNotNegative);
  }

  if (a.isInfinite || a.isNaN) {
    return a;
  }

  // We allow maxNumbersBetween between 0 and the number so
  // we need to check if there a
  if (numbersBetween(0.0, a) <= maxNumbersBetween) {
    return 0.0;
  }

  return a;
}

/// Forces small numbers near zero to zero, according to the specified absolute accuracy.
///
/// Zero if |[a]| is smaller than [maximumAbsoluteError], [a] otherwise.
/// Throws [ArgumentError] if [maximumAbsoluteError] is smaller than zero.
double coerceZeroD(double a, double maximumAbsoluteError) {
  if (maximumAbsoluteError < 0) {
    throw ArgumentError.value(maximumAbsoluteError, 'maximumAbsoluteError',
        messages.argumentNotNegative);
  }

  if (a.isInfinite || a.isNaN) {
    return a;
  }

  if (a.abs() < maximumAbsoluteError) {
    return 0.0;
  }

  return a;
}

/// Forces small numbers near zero to zero.
///
/// Zero if |[a]| is smaller than 2^(-53) = 1.11e-16, [a] otherwise.
double coerceZero(double a) => coerceZeroD(a, doublePrecision);

/// Determines the range of floating point numbers that will match the specified value with the given tolerance.
Tuple2<double, double> rangeOfMatchingFloatingPointNumbers(
    double value, int maxNumbersBetween) {
  // Make sure ulpDifference is non-negative
  if (maxNumbersBetween < 1) {
    throw ArgumentError.value(
        maxNumbersBetween, 'maxNumbersBetween', messages.argumentPositive);
  }

  // If the value is infinity (positive or negative) just
  // return the same infinity for the range.
  if (value.isInfinite) {
    return Tuple2<double, double>(value, value);
  }

  // If the value is a NaN then the range is a NaN too.
  if (value.isNaN) {
    return Tuple2<double, double>(double.nan, double.nan);
  }

  // Translate the bit pattern of the double to an integer.
  // Note that this leads to:
  // double > 0 --> long > 0, growing as the double value grows
  // double < 0 --> long < 0, increasing in absolute magnitude as the double
  //                          gets closer to zero!
  //                          i.e. 0 - double.epsilon will give the largest long value!
  var bytes = ByteData(8);
  bytes.setFloat64(0, value);
  int intValue = bytes.getInt64(0);

  // We need to protect against over- and under-flow of the intValue when
  // we start to add the ulpsDifference.
  if (intValue < 0) {
    // Note that long.MinValue has the same bit pattern as
    // -0.0. Therefore we're working in opposite direction (i.e. add if we want to
    // go more negative and subtract if we want to go less negative)
    var topRangeEnd = (int64MinValue - intValue).abs() < maxNumbersBetween
        // Got underflow, which can be fixed by splitting the calculation into two bits
        // first get the remainder of the intValue after subtracting it from the long.MinValue
        // and add that to the ulpsDifference. That way we'll turn positive without underflow
        ? int64BitsToDouble(maxNumbersBetween + (int64MinValue - intValue))
        // No problems here, move along.
        : int64BitsToDouble(intValue - maxNumbersBetween);

    var bottomRangeEnd = intValue.abs() < maxNumbersBetween
        // Underflow, which means we'd have to go further than a long would allow us.
        // Also we couldn't translate it back to a double, so we'll return -Double.MaxValue
        ? -double.maxFinite
        // intValue is negative. Adding the positive ulpsDifference means that it gets less negative.
        // However due to the conversion way this means that the actual double value gets more negative :-S
        : int64BitsToDouble(intValue + maxNumbersBetween);

    return Tuple2<double, double>(bottomRangeEnd, topRangeEnd);
  } else {
    // IntValue is positive
    var topRangeEnd = int64MaxValue - intValue < maxNumbersBetween
        // Overflow, which means we'd have to go further than a long would allow us.
        // Also we couldn't translate it back to a double, so we'll return Double.MaxValue
        ? double.maxFinite
        // No troubles here
        : int64BitsToDouble(intValue + maxNumbersBetween);

    // Check the bottom range end for underflows
    var bottomRangeEnd = intValue > maxNumbersBetween
        // No problems here. IntValue is larger than ulpsDifference so we'll end up with a
        // positive number.
        ? int64BitsToDouble(intValue - maxNumbersBetween)
        // Int value is bigger than zero but smaller than the ulpsDifference. So we'll need to deal with
        // the reversal at the negative end
        : int64BitsToDouble(int64MinValue + (maxNumbersBetween - intValue));

    return Tuple2<double, double>(bottomRangeEnd, topRangeEnd);
  }
}

/// Returns the floating point number that will match the value with the tolerance
/// on the maximum size (i.e. the result is always bigger than the value)
double maximumMatchingFloatingPointNumber(
        double value, int maxNumbersBetween) =>
    rangeOfMatchingFloatingPointNumbers(value, maxNumbersBetween).item2;

/// Returns the floating point number that will match the value with the tolerance
/// on the minimum size (i.e. the result is always smaller than the value)
double minimumMatchingFloatingPointNumber(
        double value, int maxNumbersBetween) =>
    rangeOfMatchingFloatingPointNumbers(value, maxNumbersBetween).item1;

/// Determines the range of <c>ulps</c> that will match the specified value with the given tolerance.
///
/// Returns tuple with the number of ULPS between the `value` and
/// the `value - relativeDifference` as first, and the number of ULPS between
/// the `value` and the `value + relativeDifference` as second value.
/// Throws [ArgumentError] if [relativeDifference] is smaller than zero.
/// Throws [ArgumentError] if [value] is `double.infinity` or `double.negativeInfinity`.
/// Throws [ArgumentError] if [value] is `double.nan`.
Tuple2<int, int> rangeOfMatchingNumbers(
    double value, double relativeDifference) {
  // Make sure the relative is non-negative
  if (relativeDifference < 0) {
    throw ArgumentError.value(
        relativeDifference, 'relativeDifference', messages.argumentNotNegative);
  }

  // If the value is infinity (positive or negative) then
  // we can't determine the range.
  if (value.isInfinite) {
    throw ArgumentError('Value is infinite.');
  }

  // If the value is a NaN then we can't determine the range.
  if (value.isNaN) {
    throw ArgumentError('Value is not a number.');
  }

  // If the value is zero (0.0) then we can't calculate the relative difference
  // so return the ulps counts for the difference.
  if (value.compareTo(0.0) == 0) {
    var bytes = ByteData(8);
    bytes.setFloat64(0, relativeDifference);
    var v = bytes.getInt64(0);
    return Tuple2<int, int>(v, v);
  }

  // Calculate the ulps for the maximum and minimum values
  // Note that these can overflow
  int max = asDirectionalInt64(value + (relativeDifference * value.abs()));
  int min = asDirectionalInt64(value - (relativeDifference * value.abs()));

  // Calculate the ulps from the value
  int intValue = asDirectionalInt64(value);

  // Determine the ranges
  return Tuple2<int, int>((intValue - min).abs(), (max - intValue).abs());
}

/// Evaluates the count of numbers between two double numbers
///
/// The second number is included in the number, thus two equal numbers evaluate
/// to zero and two neighbor numbers evaluate to one. Therefore, what is returned
/// is actually the count of numbers between plus 1. Throws [ArgumentError]
/// if [a] is `double.infinity` or `double.negativeInfinity`. Throws [ArgumentError]
/// if [a] is `double.nan`. Throws [ArgumentError] if [b] is `double.infinity`
/// or `double.negativeInfinity`. Throws [ArgumentError] if [b] is `double.nan`.
int numbersBetween(double a, double b) {
  if (a.isNaN || a.isInfinite) {
    throw ArgumentError.value(a, 'a', 'Value can\'t be NaN or infinity');
  }

  if (b.isNaN || b.isInfinite) {
    throw ArgumentError.value(b, 'b', 'Value can\'t be NaN or infinity');
  }

  // Calculate the ulps for the maximum and minimum values
  // Note that these can overflow
  int intA = asDirectionalInt64(a);
  int intB = asDirectionalInt64(b);

  // Now find the number of values between the two doubles. This should not overflow
  // given that there are more long values than there are double values
  return (a >= b) ? (intA - intB) : (intB - intA);
}

/// Evaluates the minimum distance to the next distinguishable number near
/// the argument value.
///
/// Evaluates the negative epsilon. The more common positive epsilon is equal to
/// two times this negative epsilon.
double epsilonOf(double value) {
  if (value.isInfinite || value.isNaN) {
    return double.nan;
  }

  var bytes = ByteData(8);
  bytes.setFloat64(0, value);
  int signed64 = bytes.getInt64(0);
  if (signed64 == 0) {
    signed64++;
    return int64BitsToDouble(signed64) - value;
  }
  if (signed64-- < 0) {
    return int64BitsToDouble(signed64) - value;
  }
  return value - int64BitsToDouble(signed64);
}

/// Evaluates the minimum distance to the next distinguishable number near
/// the argument value.
///
/// Evaluates the *positive* epsilon. See also [epsilonOf].
double positiveEpsilonOf(double value) => 2 * epsilonOf(value);

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
