import 'dart:math';

import 'package:test/test.dart';
import 'package:dart_numerics/dart_numerics.dart';

import 'assert_helpers.dart' as helpers;

void main() {
  group('Can compute magnitude', () {
    test('Test 1', () {
      expect(magnitude(0.0), equals(0));
    });

    test('Test 2', () {
      expect(magnitude(1.0), equals(0));
      expect(magnitude(10.0), equals(1));
      expect(magnitude(100.0), equals(2));
      expect(magnitude(1000.0), equals(3));
      expect(magnitude(10000.0), equals(4));
      expect(magnitude(100000.0), equals(5));
      expect(magnitude(1000000.0), equals(6));
    });

    test('Test 3', () {
      expect(magnitude(1e7), equals(7));
      expect(magnitude(1e8), equals(8));
      expect(magnitude(1e9), equals(9));
      expect(magnitude(1e10), equals(10));
      expect(magnitude(1e11), equals(11));
      expect(magnitude(1e12), equals(12));
    });

    test('Test 4', () {
      expect(magnitude(1e-7), equals(-7));
      expect(magnitude(1e-8), equals(-8));
      expect(magnitude(1e-9), equals(-9));
      expect(magnitude(1e-10), equals(-10));
      expect(magnitude(1e-11), equals(-11));
      expect(magnitude(1e-12), equals(-12));
    });

    test('Test 5', () {
      expect(magnitude(1.1e5), equals(5));
      expect(magnitude(2.2e-5), equals(-5));
      expect(magnitude(3.3e9), equals(9));
      expect(magnitude(4.4e-11), equals(-11));
    });
  });

  group('Can compute magnitude with negative values', () {
    test('Test 1', () {
      expect(magnitude(-1.0), equals(0));
      expect(magnitude(-10.0), equals(1));
      expect(magnitude(-100.0), equals(2));
      expect(magnitude(-1000.0), equals(3));
      expect(magnitude(-10000.0), equals(4));
      expect(magnitude(-100000.0), equals(5));
      expect(magnitude(-1000000.0), equals(6));
    });

    test('Test 2', () {
      expect(magnitude(-1e7), equals(7));
      expect(magnitude(-1e8), equals(8));
      expect(magnitude(-1e9), equals(9));
      expect(magnitude(-1e10), equals(10));
      expect(magnitude(-1e11), equals(11));
      expect(magnitude(-1e12), equals(12));
    });

    test('Test 3', () {
      expect(magnitude(-1e-7), equals(-7));
      expect(magnitude(-1e-8), equals(-8));
      expect(magnitude(-1e-9), equals(-9));
      expect(magnitude(-1e-10), equals(-10));
      expect(magnitude(-1e-11), equals(-11));
      expect(magnitude(-1e-12), equals(-12));
    });

    test('Test 4', () {
      expect(magnitude(-1.1e5), equals(5));
      expect(magnitude(-2.2e-5), equals(-5));
      expect(magnitude(-3.3e9), equals(9));
      expect(magnitude(-4.4e-11), equals(-11));
    });
  });

  group('Can compute magnitude scaled value', () {
    test('Test 1', () {
      helpers.almostEqualRelative(0.0, scaleUnitMagnitude(0.0), 12);
    });

    test('Test 2', () {
      helpers.almostEqualRelative(1.0, scaleUnitMagnitude(1.0), 12);
      helpers.almostEqualRelative(1.0, scaleUnitMagnitude(10.0), 12);
      helpers.almostEqualRelative(1.0, scaleUnitMagnitude(100.0), 12);
      helpers.almostEqualRelative(1.0, scaleUnitMagnitude(1000.0), 12);
      helpers.almostEqualRelative(1.0, scaleUnitMagnitude(10000.0), 12);
      helpers.almostEqualRelative(1.0, scaleUnitMagnitude(100000.0), 12);
      helpers.almostEqualRelative(1.0, scaleUnitMagnitude(1000000.0), 12);
    });

    test('Test 3', () {
      helpers.almostEqualRelative(1.1, scaleUnitMagnitude(1.1e5), 12);
      helpers.almostEqualRelative(2.2, scaleUnitMagnitude(2.2e-5), 12);
      helpers.almostEqualRelative(3.3, scaleUnitMagnitude(3.3e9), 12);
      helpers.almostEqualRelative(4.4, scaleUnitMagnitude(4.4e-11), 12);
    });
  });

  group('Can compute magnitude scaled value with a negative values', () {
    test('Test 1', () {
      helpers.almostEqualRelative(-1.0, scaleUnitMagnitude(-1.0), 12);
      helpers.almostEqualRelative(-1.0, scaleUnitMagnitude(-10.0), 12);
      helpers.almostEqualRelative(-1.0, scaleUnitMagnitude(-100.0), 12);
      helpers.almostEqualRelative(-1.0, scaleUnitMagnitude(-1000.0), 12);
      helpers.almostEqualRelative(-1.0, scaleUnitMagnitude(-10000.0), 12);
      helpers.almostEqualRelative(-1.0, scaleUnitMagnitude(-100000.0), 12);
      helpers.almostEqualRelative(-1.0, scaleUnitMagnitude(-1000000.0), 12);
    });

    test('Test 2', () {
      helpers.almostEqualRelative(-1.1, scaleUnitMagnitude(-1.1e5), 12);
      helpers.almostEqualRelative(-2.2, scaleUnitMagnitude(-2.2e-5), 12);
      helpers.almostEqualRelative(-3.3, scaleUnitMagnitude(-3.3e9), 12);
      helpers.almostEqualRelative(-4.4, scaleUnitMagnitude(-4.4e-11), 12);
    });
  });

  group('Increment/Decrement', () {
    test('Increment at zero', () {
      var x = -2 * epsilon;
      expect(x, equals(-2 * epsilon));
      x = increment(x);
      x = increment(x);
      expect(x, equals(0.0));
      x = increment(x);
      x = increment(x);
      expect(x, equals(2 * epsilon));
    });

    test('Decrement at zero', () {
      var x = 2 * epsilon;
      expect(x, equals(2 * epsilon));
      x = decrement(x);
      x = decrement(x);
      expect(x, equals(0.0));
      x = decrement(x);
      x = decrement(x);
      expect(x, equals(-2 * epsilon));
    });

    test('Increment at min/max', () {
      var x = double.maxFinite;
      expect(x, equals(double.maxFinite));
      x = increment(x);
      expect(x, equals(double.infinity));

      x = -double.maxFinite;
      expect(x, equals(-double.maxFinite));
      x = increment(x);
      expect(x, greaterThan(-double.maxFinite));
    });

    test('Decrement at min/max', () {
      var x = double.maxFinite;
      expect(x, equals(double.maxFinite));
      x = decrement(x);
      expect(x, lessThan(double.maxFinite));

      x = -double.maxFinite;
      expect(x, equals(-double.maxFinite));
      x = decrement(x);
      expect(x, equals(double.negativeInfinity));
    });
  });

  group('Coerce zero', () {
    test('Test 1', () {
      expect(coerceZero(0.0), equals(0.0));
      expect(coerceZero(increment(0.0)), equals(0.0));
      expect(coerceZero(decrement(0.0)), equals(0.0));
    });

    test('Test 2', () {
      expect(coerceZero(1.0), equals(1.0));
      expect(coerceZero(-1.0), equals(-1.0));
      expect(coerceZero(0.5), equals(0.5));
      expect(coerceZero(-0.5), equals(-0.5));
    });

    test('Test 3', () {
      expect(coerceZero(double.infinity), equals(double.infinity));
      expect(
          coerceZero(double.negativeInfinity), equals(double.negativeInfinity));
      expect(coerceZero(double.maxFinite), equals(double.maxFinite));
      expect(coerceZero(-double.maxFinite), equals(-double.maxFinite));
      expect(coerceZero(double.nan), isNaN);
    });
  });

  group('Coerce zero based on relative tolerance', () {
    test('Test 1', () {
      expect(coerceZeroI(5 * epsilon, 5), equals(0.0));
      expect(coerceZeroI(-5 * epsilon, 5), equals(0.0));
    });

    test('Test 2', () {
      expect(coerceZeroI(5 * epsilon, 4), isNot(equals(0.0)));
      expect(coerceZeroI(-5 * epsilon, 4), isNot(equals(0.0)));
    });
  });

  group('Coerce zero based on max numbers between', () {
    test('Test 1', () {
      expect(coerceZeroD(1e-6, 1e-5), equals(0.0));
      expect(coerceZeroD(-1e-6, 1e-5), equals(0.0));
      expect(coerceZeroD(1e+4, 1e+5), equals(0.0));
      expect(coerceZeroD(-1e+4, 1e+5), equals(0.0));
    });

    test('Test 2', () {
      expect(coerceZeroD(1e-4, 1e-5), isNot(equals(0.0)));
      expect(coerceZeroD(1e-5, 1e-5), isNot(equals(0.0)));
      expect(coerceZeroD(-1e-4, 1e-5), isNot(equals(0.0)));
      expect(coerceZeroD(-1e-5, 1e-5), isNot(equals(0.0)));
      expect(coerceZeroD(1e+6, 1e+5), isNot(equals(0.0)));
      expect(coerceZeroD(1e+5, 1e+5), isNot(equals(0.0)));
      expect(coerceZeroD(-1e+6, 1e+5), isNot(equals(0.0)));
      expect(coerceZeroD(-1e+5, 1e+5), isNot(equals(0.0)));
    });
  });

  test('Range of matching floating point numbers with negative Ulps.', () {
    expect(() => rangeOfMatchingFloatingPointNumbers(10.0, -1),
        throwsArgumentError);
  });

  group('Range of matching floating point numbers with value at infinity.', () {
    test('Positive infinity', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(double.infinity, 1);
      expect(minmax.item1, equals(double.infinity));
      expect(minmax.item2, equals(double.infinity));
    });

    test('Negative infinity', () {
      var minmax =
          rangeOfMatchingFloatingPointNumbers(double.negativeInfinity, 1);
      expect(minmax.item1, equals(double.negativeInfinity));
      expect(minmax.item2, equals(double.negativeInfinity));
    });
  });

  test('Range of matching floating point numbers with value at NaN.', () {
    var minmax = rangeOfMatchingFloatingPointNumbers(double.nan, 1);
    expect(minmax.item1, isNaN);
    expect(minmax.item2, isNaN);
  });

  group('Range of matching floating point numbers with positive value.', () {
    test('Test 1', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(0.0, 10);
      expect(minmax.item1, equals(-10 * epsilon));
      expect(minmax.item2, equals(10 * epsilon));
    });

    test('Test 2', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(1.0, 10);
      expect(minmax.item1, equals(0.99999999999999889));
      expect(minmax.item2, equals(1.0000000000000022));
    });

    test('Test 3', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(2.0, 10);
      expect(minmax.item1, equals(1.9999999999999978));
      expect(minmax.item2, equals(2.0000000000000044));
    });

    test('Test 4', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(3.0, 10);
      expect(minmax.item1, equals(2.9999999999999956));
      expect(minmax.item2, equals(3.0000000000000044));
    });

    test('Test 5', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(4.0, 10);
      expect(minmax.item1, equals(3.9999999999999956));
      expect(minmax.item2, equals(4.0000000000000089));
    });

    test('Test 6', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(5.0, 10);
      expect(minmax.item1, equals(4.9999999999999911));
      expect(minmax.item2, equals(5.0000000000000089));
    });

    test('Test 7', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(6.0, 10);
      expect(minmax.item1, equals(5.9999999999999911));
      expect(minmax.item2, equals(6.0000000000000089));
    });

    test('Test 8', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(7.0, 10);
      expect(minmax.item1, equals(6.9999999999999911));
      expect(minmax.item2, equals(7.0000000000000089));
    });

    test('Test 9', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(8.0, 10);
      expect(minmax.item1, equals(7.9999999999999911));
      expect(minmax.item2, equals(8.0000000000000178));
    });
  });

  group('Range of matching floating point numbers with negative value.', () {
    test('Test 1', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(0.0, 10);
      expect(minmax.item1, equals(-10 * epsilon));
      expect(minmax.item2, equals(10 * epsilon));
    });

    test('Test 2', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(-1.0, 10);
      expect(minmax.item1, equals(-1.0000000000000022));
      expect(minmax.item2, equals(-0.99999999999999889));
    });

    test('Test 3', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(-2.0, 10);
      expect(minmax.item1, equals(-2.0000000000000044));
      expect(minmax.item2, equals(-1.9999999999999978));
    });

    test('Test 4', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(-3.0, 10);
      expect(minmax.item1, equals(-3.0000000000000044));
      expect(minmax.item2, equals(-2.9999999999999956));
    });

    test('Test 5', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(-4.0, 10);
      expect(minmax.item1, equals(-4.0000000000000089));
      expect(minmax.item2, equals(-3.9999999999999956));
    });

    test('Test 6', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(-5.0, 10);
      expect(minmax.item1, equals(-5.0000000000000089));
      expect(minmax.item2, equals(-4.9999999999999911));
    });

    test('Test 7', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(-6.0, 10);
      expect(minmax.item1, equals(-6.0000000000000089));
      expect(minmax.item2, equals(-5.9999999999999911));
    });

    test('Test 8', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(-7.0, 10);
      expect(minmax.item1, equals(-7.0000000000000089));
      expect(minmax.item2, equals(-6.9999999999999911));
    });

    test('Test 9', () {
      var minmax = rangeOfMatchingFloatingPointNumbers(-8.0, 10);
      expect(minmax.item1, equals(-8.0000000000000178));
      expect(minmax.item2, equals(-7.9999999999999911));
    });
  });

  group('Maximum matching floating point number with positive value.', () {
    test('Test 1', () {
      var max = maximumMatchingFloatingPointNumber(0.0, 10);
      expect(max, equals(10 * epsilon));
    });

    test('Test 2', () {
      var max = maximumMatchingFloatingPointNumber(1.0, 10);
      expect(max, equals(1.0000000000000022));
    });

    test('Test 3', () {
      var max = maximumMatchingFloatingPointNumber(2.0, 10);
      expect(max, equals(2.0000000000000044));
    });

    test('Test 4', () {
      var max = maximumMatchingFloatingPointNumber(3.0, 10);
      expect(max, equals(3.0000000000000044));
    });

    test('Test 5', () {
      var max = maximumMatchingFloatingPointNumber(4.0, 10);
      expect(max, equals(4.0000000000000089));
    });

    test('Test 6', () {
      var max = maximumMatchingFloatingPointNumber(5.0, 10);
      expect(max, equals(5.0000000000000089));
    });

    test('Test 7', () {
      var max = maximumMatchingFloatingPointNumber(6.0, 10);
      expect(max, equals(6.0000000000000089));
    });

    test('Test 8', () {
      var max = maximumMatchingFloatingPointNumber(7.0, 10);
      expect(max, equals(7.0000000000000089));
    });

    test('Test 9', () {
      var max = maximumMatchingFloatingPointNumber(8.0, 10);
      expect(max, equals(8.0000000000000178));
    });
  });

  group('Maximum matching floating point number with negative value.', () {
    test('Test 1', () {
      var max = maximumMatchingFloatingPointNumber(0.0, 10);
      expect(max, equals(10 * epsilon));
    });

    test('Test 2', () {
      var max = maximumMatchingFloatingPointNumber(-1.0, 10);
      expect(max, equals(-0.99999999999999889));
    });

    test('Test 3', () {
      var max = maximumMatchingFloatingPointNumber(-2.0, 10);
      expect(max, equals(-1.9999999999999978));
    });

    test('Test 4', () {
      var max = maximumMatchingFloatingPointNumber(-3.0, 10);
      expect(max, equals(-2.9999999999999956));
    });

    test('Test 5', () {
      var max = maximumMatchingFloatingPointNumber(-4.0, 10);
      expect(max, equals(-3.9999999999999956));
    });

    test('Test 6', () {
      var max = maximumMatchingFloatingPointNumber(-5.0, 10);
      expect(max, equals(-4.9999999999999911));
    });

    test('Test 7', () {
      var max = maximumMatchingFloatingPointNumber(-6.0, 10);
      expect(max, equals(-5.9999999999999911));
    });

    test('Test 8', () {
      var max = maximumMatchingFloatingPointNumber(-7.0, 10);
      expect(max, equals(-6.9999999999999911));
    });

    test('Test 9', () {
      var max = maximumMatchingFloatingPointNumber(-8.0, 10);
      expect(max, equals(-7.9999999999999911));
    });
  });

  group('Minimum matching floating point number with positive value.', () {
    test('Test 1', () {
      var min = minimumMatchingFloatingPointNumber(0.0, 10);
      expect(min, equals(-10 * epsilon));
    });

    test('Test 2', () {
      var min = minimumMatchingFloatingPointNumber(1.0, 10);
      expect(min, equals(0.99999999999999889));
    });

    test('Test 3', () {
      var min = minimumMatchingFloatingPointNumber(2.0, 10);
      expect(min, equals(1.9999999999999978));
    });

    test('Test 4', () {
      var min = minimumMatchingFloatingPointNumber(3.0, 10);
      expect(min, equals(2.9999999999999956));
    });

    test('Test 5', () {
      var min = minimumMatchingFloatingPointNumber(4.0, 10);
      expect(min, equals(3.9999999999999956));
    });

    test('Test 6', () {
      var min = minimumMatchingFloatingPointNumber(5.0, 10);
      expect(min, equals(4.9999999999999911));
    });

    test('Test 7', () {
      var min = minimumMatchingFloatingPointNumber(6.0, 10);
      expect(min, equals(5.9999999999999911));
    });

    test('Test 8', () {
      var min = minimumMatchingFloatingPointNumber(7.0, 10);
      expect(min, equals(6.9999999999999911));
    });

    test('Test 9', () {
      var min = minimumMatchingFloatingPointNumber(8.0, 10);
      expect(min, equals(7.9999999999999911));
    });
  });

  group('Minimum matching floating point number with negative value.', () {
    test('Test 1', () {
      var min = minimumMatchingFloatingPointNumber(0.0, 10);
      expect(min, equals(-10 * epsilon));
    });

    test('Test 2', () {
      var min = minimumMatchingFloatingPointNumber(-1.0, 10);
      expect(min, equals(-1.0000000000000022));
    });

    test('Test 3', () {
      var min = minimumMatchingFloatingPointNumber(-2.0, 10);
      expect(min, equals(-2.0000000000000044));
    });

    test('Test 4', () {
      var min = minimumMatchingFloatingPointNumber(-3.0, 10);
      expect(min, equals(-3.0000000000000044));
    });

    test('Test 5', () {
      var min = minimumMatchingFloatingPointNumber(-4.0, 10);
      expect(min, equals(-4.0000000000000089));
    });

    test('Test 6', () {
      var min = minimumMatchingFloatingPointNumber(-5.0, 10);
      expect(min, equals(-5.0000000000000089));
    });

    test('Test 7', () {
      var min = minimumMatchingFloatingPointNumber(-6.0, 10);
      expect(min, equals(-6.0000000000000089));
    });

    test('Test 8', () {
      var min = minimumMatchingFloatingPointNumber(-7.0, 10);
      expect(min, equals(-7.0000000000000089));
    });

    test('Test 9', () {
      var min = minimumMatchingFloatingPointNumber(-8.0, 10);
      expect(min, equals(-8.0000000000000178));
    });
  });

  test(
      'Range of matching Ulps with negative relative difference throws ArgumentError',
      () {
    expect(() => rangeOfMatchingNumbers(1.0, -1.0), throwsArgumentError);
  });

  test('Range of matching Ulps with value at infinity throws ArgumentError',
      () {
    expect(() => rangeOfMatchingNumbers(double.infinity, -1.0),
        throwsArgumentError);
  });

  test('Range of matching Ulps with value at Nan throws ArgumentError', () {
    expect(() => rangeOfMatchingNumbers(double.nan, -1.0), throwsArgumentError);
  });

  group('Range of matching Ulps with positive value.', () {
    test('Test 1', () {
      var minmax = rangeOfMatchingNumbers(0.0, 10.0 * epsilon);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(10));
    });

    test('Test 2', () {
      var minmax =
          rangeOfMatchingNumbers(1.0, (1.0000000000000022 - 1.0) / 1.0);
      expect(minmax.item1, equals(20));
      expect(minmax.item2, equals(10));
    });

    test('Test 3', () {
      var minmax =
          rangeOfMatchingNumbers(2.0, (2.0000000000000044 - 2.0) / 2.0);
      expect(minmax.item1, equals(20));
      expect(minmax.item2, equals(10));
    });

    test('Test 4', () {
      var minmax =
          rangeOfMatchingNumbers(3.0, (3.0000000000000044 - 3.0) / 3.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(10));
    });

    test('Test 5', () {
      var minmax =
          rangeOfMatchingNumbers(4.0, (4.0000000000000089 - 4.0) / 4.0);
      expect(minmax.item1, equals(20));
      expect(minmax.item2, equals(10));
    });

    test('Test 6', () {
      var minmax =
          rangeOfMatchingNumbers(5.0, (5.0000000000000089 - 5.0) / 5.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(10));
    });

    test('Test 7', () {
      var minmax =
          rangeOfMatchingNumbers(6.0, (6.0000000000000089 - 6.0) / 6.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(10));
    });

    test('Test 8', () {
      var minmax =
          rangeOfMatchingNumbers(7.0, (7.0000000000000089 - 7.0) / 7.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(10));
    });

    test('Test 9', () {
      var minmax =
          rangeOfMatchingNumbers(8.0, (8.0000000000000178 - 8.0) / 8.0);
      expect(minmax.item1, equals(20));
      expect(minmax.item2, equals(10));
    });
  });

  group('Range of matching Ulps with negative value.', () {
    test('Test 1', () {
      var minmax = rangeOfMatchingNumbers(0.0, 10.0 * epsilon);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(10));
    });

    test('Test 2', () {
      var minmax =
          rangeOfMatchingNumbers(-1.0, (1.0000000000000022 - 1.0) / 1.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(20));
    });

    test('Test 3', () {
      var minmax =
          rangeOfMatchingNumbers(-2.0, (2.0000000000000044 - 2.0) / 2.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(20));
    });

    test('Test 4', () {
      var minmax =
          rangeOfMatchingNumbers(-3.0, (3.0000000000000044 - 3.0) / 3.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(10));
    });

    test('Test 5', () {
      var minmax =
          rangeOfMatchingNumbers(-4.0, (4.0000000000000089 - 4.0) / 4.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(20));
    });

    test('Test 6', () {
      var minmax =
          rangeOfMatchingNumbers(-5.0, (5.0000000000000089 - 5.0) / 5.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(10));
    });

    test('Test 7', () {
      var minmax =
          rangeOfMatchingNumbers(-6.0, (6.0000000000000089 - 6.0) / 6.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(10));
    });

    test('Test 8', () {
      var minmax =
          rangeOfMatchingNumbers(-7.0, (7.0000000000000089 - 7.0) / 7.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(10));
    });

    test('Test 9', () {
      var minmax =
          rangeOfMatchingNumbers(-8.0, (8.0000000000000178 - 8.0) / 8.0);
      expect(minmax.item1, equals(10));
      expect(minmax.item2, equals(20));
    });
  });

  group('Test numbers between.', () {
    test('Test 1', () {
      expect(numbersBetween(1.0, 1.0), equals(0));
      expect(numbersBetween(0.0, 0.0), equals(0));
      expect(numbersBetween(-1.0, -1.0), equals(0));
    });

    test('Test 2', () {
      expect(numbersBetween(0.0, epsilon), equals(1));
      expect(numbersBetween(0.0, -epsilon), equals(1));
      expect(numbersBetween(epsilon, 0.0), equals(1));
      expect(numbersBetween(-epsilon, 0.0), equals(1));
    });

    test('Test 3', () {
      expect(numbersBetween(0.0, 2.0 * epsilon), equals(2));
      expect(numbersBetween(0.0, -2.0 * epsilon), equals(2));
    });

    test('Test 4', () {
      expect(numbersBetween(-epsilon, 2.0 * epsilon), equals(3));
      expect(numbersBetween(epsilon, -2.0 * epsilon), equals(3));
    });
  });

  test(
      'AlmostEqual with max numbers between with less than one number throws ArgumentError',
      () {
    expect(() => almostEqualNumbersBetween(1.0, 2.0, 0), throwsArgumentError);
  });

  group('AlmostEqual', () {
    test('1.0 equals 1.0', () {
      expect(almostEqual(1.0, 1.0), isTrue);
    });

    test('1.0 equals 1.0 + 2^(-53)', () {
      expect(almostEqual(1.0, 1.0 + doublePrecision), isTrue);
    });

    test('1.0 equals 1.0 + 5*2^(-53)', () {
      expect(almostEqual(1.0, 1.0 + 5 * doublePrecision), isTrue);
    });

    test('1.0 does not equal 1.0 + 2^(-51).', () {
      expect(almostEqual(1.0, 1.0 + 100 * doublePrecision), isFalse);
    });

    test('1.0 equals 1.0 + 2^(-53)', () {
      expect(almostEqual(1.0, 2.0), isFalse);
    });
  });

  group('AlmostEqualRelative', () {
    test('compare zero and negative zero', () {
      expect(almostEqualRelativeD(0.0, -0.0, 1e-5), isTrue);
      expect(almostEqualRelativeD(0.0, -0.0, 1e-15), isTrue);
    });

    test('compare two nearby numbers', () {
      expect(almostEqualRelativeD(1.0, 1.0 + (3 * doublePrecision), 1e-15),
          isTrue);
      expect(almostEqualRelativeD(1.0, 1.0 + doublePrecision, 1e-15), isTrue);
      expect(almostEqualRelativeD(1.0, 1.0 + 1e-16, 1e-15), isTrue);
      expect(almostEqualRelativeD(1.0, 1.0 + 1e-15, 1e-15), isFalse);
      expect(almostEqualRelativeD(1.0, 1.0 + 1e-14, 1e-15), isFalse);
    });

    test('compare with the two numbers reversed in compare order', () {
      expect(almostEqualRelativeD(1.0 + (3 * doublePrecision), 1.0, 1e-15),
          isTrue);
      expect(almostEqualRelativeD(1.0 + doublePrecision, 1.0, 1e-15), isTrue);
      expect(almostEqualRelativeD(1.0 + 1e-16, 1.0, 1e-15), isTrue);
      expect(almostEqualRelativeD(1.0 + 1e-15, 1.0, 1e-15), isFalse);
      expect(almostEqualRelativeD(1.0 + 1e-14, 1.0, 1e-15), isFalse);
    });

    test('compare different numbers', () {
      expect(almostEqualRelativeD(2.0, 1.0, 1e-5), isFalse);
      expect(almostEqualRelativeD(1.0, 2.0, 1e-15), isFalse);
    });

    test('compare different numbers with large tolerance', () {
      expect(almostEqualRelativeD(2.0, 1.0, 1e-5), isFalse);
      expect(almostEqualRelativeD(1.0, 2.0, 1e-5), isFalse);
      expect(almostEqualRelativeD(2.0, 1.0, 1e+1), isTrue);
      expect(almostEqualRelativeD(1.0, 2.0, 1e+1), isTrue);
    });

    test('compare inf & inf', () {
      expect(almostEqualRelativeD(double.infinity, double.infinity, 1e-15),
          isTrue);
      expect(
          almostEqualRelativeD(
              double.negativeInfinity, double.negativeInfinity, 1e-15),
          isTrue);
    });

    test('compare -inf & inf', () {
      expect(
          almostEqualRelativeD(double.infinity, double.negativeInfinity, 1e-15),
          isFalse);
      expect(
          almostEqualRelativeD(double.negativeInfinity, double.infinity, 1e-15),
          isFalse);
    });

    test('compare inf & non-inf', () {
      expect(almostEqualRelativeD(double.infinity, 1.0, 1e-15), isFalse);
      expect(almostEqualRelativeD(1.0, double.infinity, 1e-15), isFalse);
      expect(
          almostEqualRelativeD(double.negativeInfinity, 1.0, 1e-15), isFalse);
      expect(
          almostEqualRelativeD(1.0, double.negativeInfinity, 1e-15), isFalse);
    });

    test('compare different numbers with opposite signs', () {
      expect(almostEqualRelativeD(-2.0, 2.0, 1e-14), isFalse);
      expect(almostEqualRelativeD(2.0, -2.0, 1e-14), isFalse);
    });

    test('compare tiny numbers with opposite signs', () {
      expect(almostEqualRelativeD(1e-12, -1e-12, 1e-14), isFalse);
      expect(almostEqualRelativeD(-1e-12, 1e-12, 1e-14), isFalse);
    });
  });

  group('AlmostEqualNumbersBetween', () {
    test('compare zero and negative zero', () {
      expect(almostEqualNumbersBetween(0.0, -0.0, 1), isTrue);
    });

    test('compare two nearby numbers', () {
      expect(almostEqualNumbersBetween(1.0, 1.0 + (3 * doublePrecision), 1),
          isFalse);
      expect(almostEqualNumbersBetween(1.0, 1.0 + doublePrecision, 1), isTrue);
      expect(almostEqualNumbersBetween(1.0, 1.0 - doublePrecision, 1), isTrue);
      expect(almostEqualNumbersBetween(1.0, 1.0 - (3 * doublePrecision), 1),
          isFalse);
    });

    test('compare with the two numbers reversed in compare order', () {
      expect(almostEqualNumbersBetween(1.0 + (3 * doublePrecision), 1.0, 1),
          isFalse);
      expect(almostEqualNumbersBetween(1.0 + doublePrecision, 1.0, 1), isTrue);
      expect(almostEqualNumbersBetween(1.0 - doublePrecision, 1.0, 1), isTrue);
      expect(almostEqualNumbersBetween(1.0 - (3 * doublePrecision), 1.0, 1),
          isFalse);
    });

    test('compare two nearby numbers', () {
      expect(almostEqualNumbersBetween(1.0, 1.0 + (10 * doublePrecision), 1),
          isFalse);
      expect(almostEqualNumbersBetween(1.0, 1.0 + (10 * doublePrecision), 10),
          isTrue);
      expect(almostEqualNumbersBetween(1.0, 1.0 - (10 * doublePrecision), 10),
          isTrue);
      expect(almostEqualNumbersBetween(1.0, 1.0 - (10 * doublePrecision), 1),
          isFalse);
    });

    test('compare different numbers', () {
      expect(almostEqualNumbersBetween(2.0, 1.0, 1), isFalse);
      expect(almostEqualNumbersBetween(1.0, 2.0, 1), isFalse);
    });

    test('compare different numbers with large tolerance', () {
      expect(almostEqualNumbersBetween(1.0, 1.0 + (1e5 * doublePrecision), 1),
          isFalse);
      expect(
          almostEqualNumbersBetween(1.0, 1.0 - (1e5 * doublePrecision), 200000),
          isTrue);
      expect(almostEqualNumbersBetween(1.0, 1.0 - (1e5 * doublePrecision), 1),
          isFalse);
    });

    test('compare inf & inf', () {
      expect(almostEqualNumbersBetween(double.infinity, double.infinity, 1),
          isTrue);
      expect(
          almostEqualNumbersBetween(
              double.negativeInfinity, double.negativeInfinity, 1),
          isTrue);
    });

    test('compare -inf & inf', () {
      expect(
          almostEqualNumbersBetween(
              double.infinity, double.negativeInfinity, 1),
          isFalse);
      expect(
          almostEqualNumbersBetween(
              double.negativeInfinity, double.infinity, 1),
          isFalse);
    });

    test('compare inf & non-inf', () {
      expect(almostEqualNumbersBetween(double.infinity, 1.0, 1), isFalse);
      expect(almostEqualNumbersBetween(1.0, double.infinity, 1), isFalse);
      expect(
          almostEqualNumbersBetween(double.negativeInfinity, 1.0, 1), isFalse);
      expect(
          almostEqualNumbersBetween(1.0, double.negativeInfinity, 1), isFalse);
    });

    test('compare different numbers with opposite signs', () {
      expect(almostEqualNumbersBetween(-2.0, 2.0, 1), isFalse);
      expect(almostEqualNumbersBetween(2.0, -2.0, 1), isFalse);
    });

    test('compare tiny numbers with opposite signs', () {
      expect(almostEqualNumbersBetween(epsilon, -epsilon, 1), isFalse);
      expect(almostEqualNumbersBetween(-epsilon, epsilon, 1), isFalse);
    });
  });

  group('AlmostEqualDecimalPlaces', () {
    test('NaN', () {
      expect(almostEqualI(1.0, double.nan, 2), isFalse);
      expect(almostEqualI(double.nan, 2.0, 2), isFalse);
      expect(almostEqualI(double.nan, double.nan, 2), isFalse);
    });

    test('inf', () {
      expect(almostEqualI(double.negativeInfinity, 2.0, 2), isFalse);
      expect(almostEqualI(1.0, double.negativeInfinity, 2), isFalse);
      expect(almostEqualI(double.infinity, 2.0, 2), isFalse);
      expect(almostEqualI(1.0, double.infinity, 2), isFalse);
      expect(
          almostEqualI(double.negativeInfinity, double.infinity, 2), isFalse);
      expect(
          almostEqualI(double.infinity, double.negativeInfinity, 2), isFalse);
      expect(almostEqualI(double.infinity, double.infinity, 2), isTrue);
      expect(almostEqualI(double.negativeInfinity, double.negativeInfinity, 2),
          isTrue);
    });

    test('1 -> +/- 0.05 (0.5e-1)', () {
      expect(almostEqualI(1.0, 1.06, 1), isFalse);
      expect(almostEqualI(1.0, 1.04, 1), isTrue);
      expect(almostEqualI(1.0, 1.00, 1), isTrue);
      expect(almostEqualI(1.0, 0.96, 1), isTrue);
      expect(almostEqualI(1.0, 0.94, 1), isFalse);
      expect(almostEqualI(1.0, 0.0, 1), isFalse);
    });

    test('-1 -> +/- 5 (0.5e+1)', () {
      expect(almostEqualI(100.0, 106.0, -1), isFalse);
      expect(almostEqualI(100.0, 104.0, -1), isTrue);
      expect(almostEqualI(100.0, 100.0, -1), isTrue);
      expect(almostEqualI(100.0, 96.0, -1), isTrue);
      expect(almostEqualI(100.0, 94.0, -1), isFalse);
      expect(almostEqualI(100.0, 0.0, -1), isFalse);
    });

    test('3 -> +/- 0.0005 (0.5e-3)', () {
      expect(almostEqualI(0.01, 0.0106, 3), isFalse);
      expect(almostEqualI(0.01, 0.0104, 3), isTrue);
      expect(almostEqualI(0.01, 0.0100, 3), isTrue);
      expect(almostEqualI(0.01, 0.0096, 3), isTrue);
      expect(almostEqualI(0.01, 0.0094, 3), isFalse);
      expect(almostEqualI(0.01, 0.0, 3), isFalse);
    });

    test('12 -> +/- 0.5e-12', () {
      expect(almostEqualI(0.0, 4.0 * doublePrecision, 12), isTrue);
      expect(almostEqualI(0.0, -4.0 * doublePrecision, 12), isTrue);
    });
  });

  group('AlmostEqual within relative decimal places', () {
    test('NaN', () {
      expect(almostEqualRelativeI(1.0, double.nan, 2), isFalse);
      expect(almostEqualRelativeI(double.nan, 2.0, 2), isFalse);
      expect(almostEqualRelativeI(double.nan, double.nan, 2), isFalse);
    });

    test('inf', () {
      expect(almostEqualRelativeI(double.negativeInfinity, 2.0, 2), isFalse);
      expect(almostEqualRelativeI(1.0, double.negativeInfinity, 2), isFalse);
      expect(almostEqualRelativeI(double.infinity, 2.0, 2), isFalse);
      expect(almostEqualRelativeI(1.0, double.infinity, 2), isFalse);
      expect(almostEqualRelativeI(double.negativeInfinity, double.infinity, 2),
          isFalse);
      expect(almostEqualRelativeI(double.infinity, double.negativeInfinity, 2),
          isFalse);
      expect(almostEqualRelativeI(double.infinity, double.infinity, 2), isTrue);
      expect(
          almostEqualRelativeI(
              double.negativeInfinity, double.negativeInfinity, 2),
          isTrue);
    });

    test('1 -> +/- max * 0.05 (0.5e-1)', () {
      expect(almostEqualRelativeI(1.0, 1.04, 1), isFalse);
      expect(almostEqualRelativeI(1.0, 1.06, 1), isTrue);
      expect(almostEqualRelativeI(1.0, 0.96, 1), isTrue);
      expect(almostEqualRelativeI(1.0, 0.94, 1), isTrue);
    });

    test('1 -> +/- max * 0.05 (0.5e-1)', () {
      expect(almostEqualRelativeI(100.0, 104.0, 1), isTrue);
      expect(almostEqualRelativeI(100.0, 106.0, 1), isFalse);
      expect(almostEqualRelativeI(100.0, 96.0, 1), isTrue);
      expect(almostEqualRelativeI(100.0, 94.0, 1), isFalse);
    });

    test('0 -> +/- max * 0.5 (0.5e-0)', () {
      expect(almostEqualRelativeI(0.01, 0.014, 0), isTrue);
      expect(almostEqualRelativeI(0.01, 0.016, 0), isFalse);
      expect(almostEqualRelativeI(0.01, 0.006, 0), isTrue);
      expect(almostEqualRelativeI(0.01, 0.004, 0), isFalse);
    });

    test('12 -> +/- 0.5e-12', () {
      expect(almostEqualRelativeI(0.0, 4.0 * doublePrecision, 12), isTrue);
      expect(almostEqualRelativeI(0.0, -4.0 * doublePrecision, 12), isTrue);
    });
  });

  group(
      'AlmostEqual within decimal places with negative decimal places throws ArgumentError.',
      () {
    test('throws', () {
      expect(() => almostEqualRelativeI(1.0, 2.0, -1), throwsArgumentError);
    });

    test('doesn\'t throw', () {
      expect(() => almostEqualI(1.0, 2.0, -1), returnsNormally);
    });
  });

  group('AlmostEqual with small numbers and small number of decimal places.',
      () {
    test('Test 1', () {
      expect(almostEqualRelativeI(0.0, 1e-12, 1), isTrue);
      expect(almostEqualRelativeI(0.0, -1e-12, 1), isTrue);
    });

    test('Test 2', () {
      expect(almostEqualRelativeI(0.0, 1e-12, 13), isFalse);
      expect(almostEqualRelativeI(0.0, -1e-12, 13), isFalse);
    });

    test('Test 3', () {
      expect(almostEqualRelativeI(0.0, 1.0, 1), isFalse);
      expect(almostEqualRelativeI(0.0, -1.0, 1), isFalse);
    });
  });

  test('AlmostEqual with decimal places with sign revert.', () {
    expect(almostEqualRelativeI(0.5, 0.3, 1), isFalse);
  });

  group('Compare to with decimal places.', () {
    test('compare zero and negative zero', () {
      expect(compareToI(0.0, -0.0, 1), equals(0));
      expect(compareToI(0.0, -0.0, doubleDecimalPlaces), equals(0));
    });

    test('compare two nearby numbers', () {
      expect(compareToI(1.0, 1.0 + 10 * doublePrecision, doubleDecimalPlaces),
          equals(-1));
      expect(compareToI(1.0, 1.0 + doublePrecision, doubleDecimalPlaces),
          equals(0));
      expect(compareToI(1.0, 1.0 - doublePrecision, doubleDecimalPlaces),
          equals(0));
      expect(compareToI(1.0, 1.0 - 10 * doublePrecision, doubleDecimalPlaces),
          equals(1));
    });

    test('compare with the two numbers reversed in compare order', () {
      expect(compareToI(1.0 + 10 * doublePrecision, 1.0, doubleDecimalPlaces),
          equals(1));
      expect(compareToI(1.0 + doublePrecision, 1.0, doubleDecimalPlaces),
          equals(0));
      expect(compareToI(1.0 - doublePrecision, 1.0, doubleDecimalPlaces),
          equals(0));
      expect(compareToI(1.0 - 10 * doublePrecision, 1.0, doubleDecimalPlaces),
          equals(-1));
    });

    test('compare two slightly more different numbers', () {
      expect(compareToI(1.0, 1.0 + 50 * doublePrecision, doubleDecimalPlaces),
          equals(-1));
      expect(
          compareToI(1.0, 1.0 + 50 * doublePrecision, doubleDecimalPlaces - 2),
          equals(0));
      expect(
          compareToI(1.0, 1.0 - 50 * doublePrecision, doubleDecimalPlaces - 2),
          equals(0));
      expect(compareToI(1.0, 1.0 - 50 * doublePrecision, doubleDecimalPlaces),
          equals(1));
    });

    test('compare different numbers', () {
      expect(compareToI(2.0, 1.0, doubleDecimalPlaces), equals(1));
      expect(compareToI(1.0, 2.0, doubleDecimalPlaces), equals(-1));
    });

    test('compare different numbers with large tolerance', () {
      expect(compareToI(1.0, 1.0 + 1e5 * doublePrecision, doubleDecimalPlaces),
          equals(-1));
      expect(compareToI(1.0, 1.0 - 1e5 * doublePrecision, 10), equals(0));
      expect(compareToI(1.0, 1.0 - 1e5 * doublePrecision, doubleDecimalPlaces),
          equals(1));
    });

    test('compare inf & inf', () {
      expect(compareToI(double.infinity, double.infinity, doubleDecimalPlaces),
          equals(0));
      expect(
          compareToI(double.negativeInfinity, double.negativeInfinity,
              doubleDecimalPlaces),
          equals(0));
    });

    test('compare -inf & inf', () {
      expect(
          compareToI(
              double.infinity, double.negativeInfinity, doubleDecimalPlaces),
          equals(1));
      expect(
          compareToI(
              double.negativeInfinity, double.infinity, doubleDecimalPlaces),
          equals(-1));
    });

    test('compare inf and non-inf', () {
      expect(compareToI(double.infinity, 1.0, doubleDecimalPlaces), equals(1));
      expect(compareToI(1.0, double.infinity, doubleDecimalPlaces), equals(-1));
      expect(compareToI(double.negativeInfinity, 1.0, doubleDecimalPlaces),
          equals(-1));
      expect(compareToI(1.0, double.negativeInfinity, doubleDecimalPlaces),
          equals(1));
    });
  });

  group('Is larger with max numbers between.', () {
    test('compare zero and negative zero', () {
      expect(isLargerNumbersBetween(0.0, -0.0, 1), isFalse);
    });

    test('compare two nearby numbers', () {
      expect(
          isLargerNumbersBetween(1.0, 1.0 + (3 * doublePrecision), 1), isFalse);
      expect(isLargerNumbersBetween(1.0, 1.0 + doublePrecision, 1), isFalse);
      expect(isLargerNumbersBetween(1.0, 1.0 - doublePrecision, 1), isFalse);
      expect(
          isLargerNumbersBetween(1.0, 1.0 - (3 * doublePrecision), 1), isTrue);
    });

    test('compare with the two numbers reversed in compare order', () {
      expect(
          isLargerNumbersBetween(1.0 + (3 * doublePrecision), 1.0, 1), isTrue);
      expect(isLargerNumbersBetween(1.0 + doublePrecision, 1.0, 1), isFalse);
      expect(isLargerNumbersBetween(1.0 - doublePrecision, 1.0, 1), isFalse);
      expect(
          isLargerNumbersBetween(1.0 - (3 * doublePrecision), 1.0, 1), isFalse);
    });

    test('compare two slightly more different numbers', () {
      expect(isLargerNumbersBetween(1.0, 1.0 + (10 * doublePrecision), 1),
          isFalse);
      expect(isLargerNumbersBetween(1.0, 1.0 + (10 * doublePrecision), 10),
          isFalse);
      expect(isLargerNumbersBetween(1.0, 1.0 - (10 * doublePrecision), 10),
          isFalse);
      expect(
          isLargerNumbersBetween(1.0, 1.0 - (10 * doublePrecision), 1), isTrue);
    });

    test('compare different numbers', () {
      expect(isLargerNumbersBetween(2.0, 1.0, 1), isTrue);
      expect(isLargerNumbersBetween(1.0, 2.0, 1), isFalse);
    });

    test('compare different numbers with large tolerance', () {
      expect(isLargerNumbersBetween(1.0, 1.0 + (1e5 * doublePrecision), 1),
          isFalse);
      expect(isLargerNumbersBetween(1.0, 1.0 - (1e5 * doublePrecision), 200000),
          isFalse);
      expect(isLargerNumbersBetween(1.0, 1.0 - (1e5 * doublePrecision), 1),
          isTrue);
    });

    test('compare inf & inf', () {
      expect(
          isLargerNumbersBetween(double.infinity, double.infinity, 1), isFalse);
      expect(
          isLargerNumbersBetween(
              double.negativeInfinity, double.negativeInfinity, 1),
          isFalse);
    });

    test('compare -inf and inf', () {
      expect(
          isLargerNumbersBetween(double.infinity, double.negativeInfinity, 1),
          isTrue);
      expect(
          isLargerNumbersBetween(double.negativeInfinity, double.infinity, 1),
          isFalse);
    });

    test('compare inf and non-inf', () {
      expect(isLargerNumbersBetween(double.infinity, 1.0, 1), isTrue);
      expect(isLargerNumbersBetween(1.0, double.infinity, 1), isFalse);
      expect(isLargerNumbersBetween(double.negativeInfinity, 1.0, 1), isFalse);
      expect(isLargerNumbersBetween(1.0, double.negativeInfinity, 1), isTrue);
    });

    test('compare tiny numbers with opposite signs', () {
      expect(isLargerNumbersBetween(epsilon, -epsilon, 1), isTrue);
      expect(isLargerNumbersBetween(-epsilon, epsilon, 1), isFalse);
    });
  });

  group('Is larger with decimal places.', () {
    test('Test 1', () {
      expect(isLargerI(1.0, double.nan, 2), isFalse);
      expect(isLargerI(double.nan, 2.0, 2), isFalse);
      expect(isLargerI(double.nan, double.nan, 2), isFalse);
    });

    test('Test 2', () {
      expect(isLargerI(double.negativeInfinity, 2.0, 2), isFalse);
      expect(isLargerI(1.0, double.negativeInfinity, 2), isTrue);
    });

    test('Test 3', () {
      expect(isLargerI(double.infinity, 2.0, 2), isTrue);
      expect(isLargerI(1.0, double.infinity, 2), isFalse);
    });

    test('Test 4', () {
      expect(isLargerI(double.negativeInfinity, double.infinity, 2), isFalse);
      expect(isLargerI(double.infinity, double.negativeInfinity, 2), isTrue);
    });

    test('Test 5', () {
      expect(isLargerI(double.infinity, double.infinity, 2), isFalse);
      expect(isLargerI(double.negativeInfinity, double.negativeInfinity, 2),
          isFalse);
    });

    test('Test 6', () {
      expect(isLargerI(1.0, 1.006, 2), isFalse);
      expect(isLargerI(1.0, 1.004, 2), isFalse);
      expect(isLargerI(1.0, 0.996, 2), isFalse);
      expect(isLargerI(1.0, 0.994, 2), isTrue);
    });

    test('Test 7', () {
      expect(isLargerRelativeI(1.0, 1.006, 2), isFalse);
      expect(isLargerRelativeI(1.0, 1.004, 2), isFalse);
      expect(isLargerRelativeI(1.0, 0.996, 2), isFalse);
      expect(isLargerRelativeI(1.0, 0.994, 2), isTrue);
    });

    test('Test 8', () {
      expect(isLargerRelativeI(100.0, 100.6, 2), isFalse);
      expect(isLargerRelativeI(100.0, 100.4, 2), isFalse);
      expect(isLargerRelativeI(100.0, 099.6, 2), isFalse);
      expect(isLargerRelativeI(100.0, 099.4, 2), isTrue);
    });

    test('Test 9', () {
      var precMag = magnitude(doublePrecision);
      var max = 0.4 * pow(10, precMag);

      expect(isLargerI(0.0, max, -precMag), isFalse);
      expect(isLargerI(0.0, -max, -precMag), isFalse);
    });

    test('Test 10', () {
      var precMag = magnitude(doublePrecision);
      var max = 0.6 * pow(10, precMag);

      expect(isLargerI(0.0, max, -precMag), isFalse);
      expect(isLargerI(0.0, -max, -precMag), isTrue);
    });
  });

  group('Is smaller with max numbers between.', () {
    test('compare zero and negative zero', () {
      expect(isSmallerNumbersBetween(0.0, -0.0, 1), isFalse);
    });

    test('compare two nearby numbers', () {
      expect(
          isSmallerNumbersBetween(1.0, 1.0 + (3 * doublePrecision), 1), isTrue);
      expect(isSmallerNumbersBetween(1.0, 1.0 + doublePrecision, 1), isFalse);
      expect(isSmallerNumbersBetween(1.0, 1.0 - doublePrecision, 1), isFalse);
      expect(isSmallerNumbersBetween(1.0, 1.0 - (3 * doublePrecision), 1),
          isFalse);
    });

    test('compare with the two numbers reversed in compare order', () {
      expect(isSmallerNumbersBetween(1.0 + (3 * doublePrecision), 1.0, 1),
          isFalse);
      expect(isSmallerNumbersBetween(1.0 + doublePrecision, 1.0, 1), isFalse);
      expect(isSmallerNumbersBetween(1.0 - doublePrecision, 1.0, 1), isFalse);
      expect(
          isSmallerNumbersBetween(1.0 - (3 * doublePrecision), 1.0, 1), isTrue);
    });

    test('compare two slightly more different numbers', () {
      expect(isSmallerNumbersBetween(1.0, 1.0 + (10 * doublePrecision), 1),
          isTrue);
      expect(isSmallerNumbersBetween(1.0, 1.0 + (10 * doublePrecision), 10),
          isFalse);
      expect(isSmallerNumbersBetween(1.0, 1.0 - (10 * doublePrecision), 10),
          isFalse);
      expect(isSmallerNumbersBetween(1.0, 1.0 - (10 * doublePrecision), 1),
          isFalse);
    });

    test('compare different numbers', () {
      expect(isSmallerNumbersBetween(2.0, 1.0, 1), isFalse);
      expect(isSmallerNumbersBetween(1.0, 2.0, 1), isTrue);
    });

    test('compare different numbers with large tolerance', () {
      expect(isSmallerNumbersBetween(1.0, 1.0 + (1e5 * doublePrecision), 1),
          isTrue);
      expect(
          isSmallerNumbersBetween(1.0, 1.0 - (1e5 * doublePrecision), 200000),
          isFalse);
      expect(isSmallerNumbersBetween(1.0, 1.0 - (1e5 * doublePrecision), 1),
          isFalse);
    });

    test('compare inf & inf', () {
      expect(isSmallerNumbersBetween(double.infinity, double.infinity, 1),
          isFalse);
      expect(
          isSmallerNumbersBetween(
              double.negativeInfinity, double.negativeInfinity, 1),
          isFalse);
    });

    test('compare -inf and inf', () {
      expect(
          isSmallerNumbersBetween(double.infinity, double.negativeInfinity, 1),
          isFalse);
      expect(
          isSmallerNumbersBetween(double.negativeInfinity, double.infinity, 1),
          isTrue);
    });

    test('compare inf and non-inf', () {
      expect(isSmallerNumbersBetween(double.infinity, 1.0, 1), isFalse);
      expect(isSmallerNumbersBetween(1.0, double.infinity, 1), isTrue);
      expect(isSmallerNumbersBetween(double.negativeInfinity, 1.0, 1), isTrue);
      expect(isSmallerNumbersBetween(1.0, double.negativeInfinity, 1), isFalse);
    });

    test('compare tiny numbers with opposite signs', () {
      expect(isSmallerNumbersBetween(epsilon, -epsilon, 1), isFalse);
      expect(isSmallerNumbersBetween(-epsilon, epsilon, 1), isTrue);
    });
  });

  group('Is smaller with decimal places.', () {
    test('Test 1', () {
      expect(isSmallerI(1.0, double.nan, 2), isFalse);
      expect(isSmallerI(double.nan, 2.0, 2), isFalse);
      expect(isSmallerI(double.nan, double.nan, 2), isFalse);
    });

    test('Test 2', () {
      expect(isSmallerI(double.negativeInfinity, 2.0, 2), isTrue);
      expect(isSmallerI(1.0, double.negativeInfinity, 2), isFalse);
    });

    test('Test 3', () {
      expect(isSmallerI(double.infinity, 2.0, 2), isFalse);
      expect(isSmallerI(1.0, double.infinity, 2), isTrue);
    });

    test('Test 4', () {
      expect(isSmallerI(double.negativeInfinity, double.infinity, 2), isTrue);
      expect(isSmallerI(double.infinity, double.negativeInfinity, 2), isFalse);
    });

    test('Test 5', () {
      expect(isSmallerI(double.infinity, double.infinity, 2), isFalse);
      expect(isSmallerI(double.negativeInfinity, double.negativeInfinity, 2),
          isFalse);
    });

    test('Test 6', () {
      expect(isSmallerI(1.0, 1.006, 2), isTrue);
      expect(isSmallerI(1.0, 1.004, 2), isFalse);
      expect(isSmallerI(1.0, 0.996, 2), isFalse);
      expect(isSmallerI(1.0, 0.994, 2), isFalse);
    });

    test('Test 7', () {
      expect(isSmallerRelativeI(1.0, 1.006, 2), isTrue);
      expect(isSmallerRelativeI(1.0, 1.004, 2), isFalse);
      expect(isSmallerRelativeI(1.0, 0.996, 2), isFalse);
      expect(isSmallerRelativeI(1.0, 0.994, 2), isFalse);
    });

    test('Test 8', () {
      expect(isSmallerRelativeI(100.0, 100.6, 2), isTrue);
      expect(isSmallerRelativeI(100.0, 100.4, 2), isFalse);
      expect(isSmallerRelativeI(100.0, 099.6, 2), isFalse);
      expect(isSmallerRelativeI(100.0, 099.4, 2), isFalse);
    });

    test('Test 9', () {
      var precMag = magnitude(doublePrecision);
      var max = 0.4 * pow(10, precMag);

      expect(isSmallerI(0.0, max, -precMag), isFalse);
      expect(isSmallerI(0.0, -max, -precMag), isFalse);
    });

    test('Test 10', () {
      var precMag = magnitude(doublePrecision);
      var max = 0.6 * pow(10, precMag);

      expect(isSmallerI(0.0, max, -precMag), isTrue);
      expect(isSmallerI(0.0, -max, -precMag), isFalse);
    });
  });

  test(
      'Compare to with max numbers between with negative number throws ArgumentError',
      () {
    const double Value = 10.0;
    expect(
        () => compareToNumbersBetween(Value, Value, -1), throwsArgumentError);
  });

  test(
      'Compare to with max numbers between with zero number throws ArgumentError',
      () {
    const double Value = 10.0;
    expect(() => compareToNumbersBetween(Value, Value, 0), throwsArgumentError);
  });

  group('Compare to with max numbers between with infinity number.', () {
    test('Test 1', () {
      expect(compareToNumbersBetween(double.infinity, double.infinity, 1),
          equals(0));
      expect(
          compareToNumbersBetween(
              double.negativeInfinity, double.negativeInfinity, 1),
          equals(0));
    });

    test('Test 2', () {
      expect(
          compareToNumbersBetween(double.infinity, double.negativeInfinity, 1),
          equals(1));
      expect(
          compareToNumbersBetween(double.negativeInfinity, double.infinity, 1),
          equals(-1));
    });

    test('Test 3', () {
      expect(compareToNumbersBetween(1.0, double.infinity, 1), equals(-1));
      expect(compareToNumbersBetween(double.infinity, 1.0, 1), equals(1));
    });

    test('Test 4', () {
      expect(
          compareToNumbersBetween(1.0, double.negativeInfinity, 1), equals(1));
      expect(
          compareToNumbersBetween(double.negativeInfinity, 1.0, 1), equals(-1));
    });
  });

  group('Compare to with max numbers between with NaN value.', () {
    test('Test 1', () {
      expect(compareToNumbersBetween(1.0, double.nan, 1), equals(-1));
    });

    test('Test 2', () {
      expect(compareToNumbersBetween(double.nan, double.nan, 1), equals(0));
    });

    test('Test 3', () {
      expect(compareToNumbersBetween(double.nan, 1.0, 1), equals(1));
    });
  });

  group('Compare to with max numbers between for values overflow a long.', () {
    test('Test 1', () {
      expect(compareToNumbersBetween(2.0, -2.0, 1), equals(1));
    });

    test('Test 2', () {
      expect(compareToNumbersBetween(-2.0, 2.0, 1), equals(-1));
    });
  });

  group('Compare to with max numbers between.', () {
    test('compare zero and negative zero', () {
      expect(compareToNumbersBetween(0.0, 0.0, 1), equals(0));
    });

    test('compare two nearby numbers', () {
      expect(compareToNumbersBetween(1.0, 1.0 + (3 * doublePrecision), 1),
          equals(-1));
      expect(compareToNumbersBetween(1.0, 1.0 + doublePrecision, 1), equals(0));
      expect(compareToNumbersBetween(1.0, 1.0 - doublePrecision, 1), equals(0));
      expect(compareToNumbersBetween(1.0, 1.0 - (3 * doublePrecision), 1),
          equals(1));
    });

    test('compare with the two numbers reversed in compare order', () {
      expect(compareToNumbersBetween(1.0 + (3 * doublePrecision), 1.0, 1),
          equals(1));
      expect(compareToNumbersBetween(1.0 + doublePrecision, 1.0, 1), equals(0));
      expect(compareToNumbersBetween(1.0 - doublePrecision, 1.0, 1), equals(0));
      expect(compareToNumbersBetween(1.0 - (3 * doublePrecision), 1.0, 1),
          equals(-1));
    });

    test('compare two slightly more different numbers', () {
      expect(compareToNumbersBetween(1.0, 1.0 + (10 * doublePrecision), 1),
          equals(-1));
      expect(compareToNumbersBetween(1.0, 1.0 + (10 * doublePrecision), 10),
          equals(0));
      expect(compareToNumbersBetween(1.0, 1.0 - (10 * doublePrecision), 10),
          equals(0));
      expect(compareToNumbersBetween(1.0, 1.0 - (10 * doublePrecision), 1),
          equals(1));
    });

    test('compare different numbers', () {
      expect(compareToNumbersBetween(2.0, 1.0, 1), equals(1));
      expect(compareToNumbersBetween(1.0, 2.0, 1), equals(-1));
    });

    test('compare different numbers with large tolerance', () {
      expect(compareToNumbersBetween(1.0, 1.0 + (1e5 * doublePrecision), 1),
          equals(-1));
      expect(
          compareToNumbersBetween(1.0, 1.0 - (1e5 * doublePrecision), 200000),
          equals(0));
      expect(compareToNumbersBetween(1.0, 1.0 - (1e5 * doublePrecision), 1),
          equals(1));
    });

    test('compare inf & inf', () {
      expect(compareToNumbersBetween(double.infinity, double.infinity, 1),
          equals(0));
      expect(
          compareToNumbersBetween(
              double.negativeInfinity, double.negativeInfinity, 1),
          equals(0));
    });

    test('compare -inf and inf', () {
      expect(
          compareToNumbersBetween(double.infinity, double.negativeInfinity, 1),
          equals(1));
      expect(
          compareToNumbersBetween(double.negativeInfinity, double.infinity, 1),
          equals(-1));
    });

    test('compare inf and non-inf', () {
      expect(compareToNumbersBetween(double.infinity, 1.0, 1), equals(1));
      expect(compareToNumbersBetween(1.0, double.infinity, 1), equals(-1));
      expect(
          compareToNumbersBetween(double.negativeInfinity, 1.0, 1), equals(-1));
      expect(
          compareToNumbersBetween(1.0, double.negativeInfinity, 1), equals(1));
    });

    test('compare tiny numbers with opposite signs', () {
      expect(compareToNumbersBetween(epsilon, -epsilon, 1), equals(1));
      expect(compareToNumbersBetween(-epsilon, epsilon, 1), equals(-1));
    });
  });
}
