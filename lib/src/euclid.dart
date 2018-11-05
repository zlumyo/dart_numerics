import 'dart:math';

import 'error_messages.dart' as messages;

/// Canonical Modulus. The result has the sign of the divisor.
double modulusD(double dividend, double divisor) =>
    ((dividend % divisor) + divisor) % divisor;

/// Canonical Modulus. The result has the sign of the divisor.
int modulusI(int dividend, int divisor) =>
    ((dividend % divisor) + divisor) % divisor;

/// Remainder (% operator). The result has the sign of the dividend.
double remainderD(double dividend, double divisor) =>
    dividend.remainder(divisor);

/// Remainder (% operator). The result has the sign of the dividend.
int remainderI(int dividend, int divisor) => dividend.remainder(divisor);

/// Find out whether the provided integer is an even number.
bool isEven(int number) => number.isEven;

/// Find out whether the provided integer is an odd number.
bool isOdd(int number) => number.isOdd;

/// Find out whether the provided integer is a perfect power of two.
///
/// True if and only if it is a power of two.
bool isPowerOfTwo(int number) => number > 0 && (number & (number - 1)) == 0;

/// Find out whether the provided integer is a perfect square, i.e. a square of an integer.
///
/// True if and only if it is a perfect square.
bool isPerfectSquare(int number) {
  if (number < 0) {
    return false;
  }

  var x = number ~/ 2;
  var seen = Set.from([x]);
  while (x * x != number) {
    x = (x + (number ~/ x)) ~/ 2;
    if (seen.contains(x)) {
      return false;
    }
    seen.add(x);
  }
  return true;
}

/// Raises 2 to the provided integer [exponent] (0 < [exponent]).
int powerOfTwo(int exponent) {
  if (exponent < 0) {
    throw ArgumentError.value(
        exponent, 'exponent', messages.argumentNotNegative);
  }

  return 1 << exponent;
}

/// Evaluate the binary logarithm of an integer number.
///
/// Rounding mode is half even.
int log2(int number) {
  if (number <= 0) {
    throw ArgumentError.value(number, 'number', messages.argumentPositive);
  }

  int logFloor = number.bitLength - 1;
  if (logFloor < _sqrt2PrecomputeThreshold) {
    int halfPower =
        _sqrt2PrecomputedBits >> (_sqrt2PrecomputeThreshold - logFloor);
    if (number.compareTo(halfPower) <= 0) {
      return logFloor;
    } else {
      return logFloor + 1;
    }
  }

  // Since sqrt(2) is irrational, log2(x) - logFloor cannot be exactly 0.5
  // To determine which side of logFloor.5 the logarithm is, we compare x^2 to 2^(2 * logFloor + 1).
  int x2 = pow(number, 2);
  int logX2Floor = x2.bitLength - 1;
  return (logX2Floor < 2 * logFloor + 1) ? logFloor : logFloor + 1;
}

const _sqrt2PrecomputeThreshold = 256;
final _sqrt2PrecomputedBits = int.parse(
    '163754743014928255235102403085959256615014864942486474123643707201513509564970');

/// Find the closest perfect power of two that is larger or equal to the provided integer.
int ceilingToPowerOfTwo(int number) => number.bitLength - 1;

/// Returns the greatest common divisor (gcd) of two integers using Euclid's algorithm.
int greatestCommonDivisor(int a, int b) => a.gcd(b);

/// Returns the greatest common divisor (gcd) of two integers using Euclid's algorithm.
int greatestCommonDivisorOfMany(List<int> integers) {
  if (null == integers) {
    throw ArgumentError.notNull('integers');
  }

  if (integers.length == 0) {
    return 0;
  }

  var gcd = integers[0].abs();

  for (var i = 1; (i < integers.length) && (gcd > 1); i++) {
    gcd = greatestCommonDivisor(gcd, integers[i]);
  }

  return gcd;
}

/// Returns the least common multiple (lcm) of two integers using Euclid's algorithm.
int leastCommonMultiple(int a, int b) {
  if ((a == 0) || (b == 0)) {
    return 0;
  }

  return ((a ~/ greatestCommonDivisor(a, b)) * b).abs();
}

/// Returns the greatest common divisor (gcd) of two integers using Euclid's algorithm.
int leastCommonMultipleOfMany(List<int> integers) {
  if (null == integers) {
    throw ArgumentError.notNull('integers');
  }

  if (integers.length == 0) {
    return 1;
  }

  var lcm = integers[0].abs();

  for (var i = 1; i < integers.length; i++) {
    lcm = leastCommonMultiple(lcm, integers[i]);
  }

  return lcm;
}
