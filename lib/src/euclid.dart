import 'dart:math';

import 'package:dart_numerics/src/precision.dart';

import 'error_messages.dart' as messages;

/// Canonical Modulus. The result has the sign of the divisor.
double modulusD(double dividend, double divisor) =>
    ((dividend % divisor) + divisor) % divisor;

/// Canonical Modulus. The result has the sign of the divisor.
int modulusI(int dividend, int divisor) =>
    ((dividend % divisor) + divisor) % divisor;

/// Canonical Modulus. The result has the sign of the divisor.
BigInt modulusBig(BigInt dividend, BigInt divisor) =>
    ((dividend % divisor) + divisor) % divisor;

/// Remainder (% operator). The result has the sign of the dividend.
double remainderD(double dividend, double divisor) =>
    dividend.remainder(divisor);

/// Remainder (% operator). The result has the sign of the dividend.
int remainderI(int dividend, int divisor) => dividend.remainder(divisor);

/// Remainder (% operator). The result has the sign of the dividend.
BigInt remainder(BigInt dividend, BigInt divisor) => dividend % divisor;

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

  int lastHexDigit = number & 0xF;
  if (lastHexDigit > 9) {
    return false; // return immediately in 6 cases out of 16.
  }

  if (lastHexDigit == 0 ||
      lastHexDigit == 1 ||
      lastHexDigit == 4 ||
      lastHexDigit == 9) {
    int t = (sqrt(number) + 0.5).floor();
    return (t * t) == number;
  }

  return false;
}

/// Raises 2 to the provided integer [exponent] (0 < [exponent]).
int powerOfTwo(int exponent) {
  if (exponent < 0 || exponent >= 63) {
    throw ArgumentError.value(
        exponent, 'exponent', messages.argumentNotNegative);
  }

  return 1 << exponent;
}

/// Evaluate the binary logarithm of an integer number.
///
/// Two-step method using a De Bruijn-like sequence table lookup.
int log2(int number) {
  number |= number >> 1;
  number |= number >> 2;
  number |= number >> 4;
  number |= number >> 8;
  number |= number >> 16;
  number |= number >> 32;

  return multiplyDeBruijnBitPosition[
      ((number - (number >> 1)) * 0x07EDD5E59A4E28C2) >> 58];
}

List<int> multiplyDeBruijnBitPosition = [
  63,
  0,
  58,
  1,
  59,
  47,
  53,
  2,
  60,
  39,
  48,
  27,
  54,
  33,
  42,
  3,
  61,
  51,
  37,
  40,
  49,
  18,
  28,
  20,
  55,
  30,
  34,
  11,
  43,
  14,
  22,
  4,
  62,
  57,
  46,
  52,
  38,
  26,
  32,
  41,
  50,
  36,
  17,
  19,
  29,
  10,
  13,
  21,
  56,
  45,
  25,
  31,
  35,
  16,
  9,
  12,
  44,
  24,
  15,
  8,
  23,
  7,
  6,
  5
];

/// Find the closest perfect power of two that is larger or equal to the provided integer.
int ceilingToPowerOfTwo(int number) {
  if (number == int64MinValue) {
    return 0;
  }

  const maxPowerOfTwo = 0x4000000000000000;
  if (number > maxPowerOfTwo) {
    throw ArgumentError('Value ${number} is out of range.');
  }

  number--;
  number |= number >> 1;
  number |= number >> 2;
  number |= number >> 4;
  number |= number >> 8;
  number |= number >> 16;
  number |= number >> 32;
  return number + 1;
}

/// Returns the greatest common divisor (gcd) of two integers using Euclid's algorithm.
int greatestCommonDivisor(int a, int b) => a.gcd(b);

/// Returns the greatest common divisor (gcd) of two integers using Euclid's algorithm.
int greatestCommonDivisorOfMany(List<int> integers) {
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

/// Returns the least common multiple (lcm) of many [BigInt] using Euclid's algorithm.
int leastCommonMultipleOfMany(List<int> integers) {
  if (integers.length == 0) {
    return 1;
  }

  var lcm = integers[0].abs();

  for (var i = 1; i < integers.length; i++) {
    lcm = leastCommonMultiple(lcm, integers[i]);
  }

  return lcm;
}

/// Returns the greatest common divisor (gcd) of two [BigInt] using Euclid's algorithm.
BigInt greatestCommonDivisorBig(BigInt a, BigInt b) => a.gcd(b);

/// Returns the greatest common divisor (gcd) of many [BigInt] using Euclid's algorithm.
BigInt greatestCommonDivisorOfManyBig(List<BigInt> integers) {
  if (integers.length == 0) {
    return BigInt.zero;
  }

  var gcd = integers[0].abs();

  for (var i = 1; (i < integers.length) && (gcd > BigInt.one); i++) {
    gcd = greatestCommonDivisorBig(gcd, integers[i]);
  }

  return gcd;
}

/// Returns the least common multiple (lcm) of two [BigInt] using Euclid's algorithm.
BigInt leastCommonMultipleBig(BigInt a, BigInt b) {
  if ((a == BigInt.zero) || (b == BigInt.zero)) {
    return BigInt.zero;
  }

  return ((a ~/ greatestCommonDivisorBig(a, b)) * b).abs();
}

/// Returns the least common multiple (lcm) of many [BigInt] using Euclid's algorithm.
BigInt leastCommonMultipleOfManyBig(List<BigInt> integers) {
  if (integers.length == 0) {
    return BigInt.one;
  }

  var lcm = integers[0].abs();

  for (var i = 1; i < integers.length; i++) {
    lcm = leastCommonMultipleBig(lcm, integers[i]);
  }

  return lcm;
}
