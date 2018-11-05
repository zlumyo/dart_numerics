import 'dart:math';

import 'package:test/test.dart';

import 'package:dart_numerics/src/precision.dart' as precision;
import 'package:dart_numerics/src/precision_comparison.dart' as pc;
import 'package:dart_numerics/src/precision_equality.dart' as pe;

import 'assert_helpers.dart';

void main() {
  group('Can compute magnitude', () {
    test('Test 1', () {
      expect(precision.magnitude(0.0), equals(0));
    });

    test('Test 2', () {
      expect(precision.magnitude(1.0), equals(0));
      expect(precision.magnitude(10.0), equals(1));
      expect(precision.magnitude(100.0), equals(2));
      expect(precision.magnitude(1000.0), equals(3));
      expect(precision.magnitude(10000.0), equals(4));
      expect(precision.magnitude(100000.0), equals(5));
      expect(precision.magnitude(1000000.0), equals(6));
    });

    test('Test 3', () {
      expect(precision.magnitude(1e7), equals(7));
      expect(precision.magnitude(1e8), equals(8));
      expect(precision.magnitude(1e9), equals(9));
      expect(precision.magnitude(1e10), equals(10));
      expect(precision.magnitude(1e11), equals(11));
      expect(precision.magnitude(1e12), equals(12));
    });

    test('Test 4', () {
      expect(precision.magnitude(1e-7), equals(-7));
      expect(precision.magnitude(1e-8), equals(-8));
      expect(precision.magnitude(1e-9), equals(-9));
      expect(precision.magnitude(1e-10), equals(-10));
      expect(precision.magnitude(1e-11), equals(-11));
      expect(precision.magnitude(1e-12), equals(-12));
    });

    test('Test 5', () {
      expect(precision.magnitude(1.1e5), equals(5));
      expect(precision.magnitude(2.2e-5), equals(-5));
      expect(precision.magnitude(3.3e9), equals(9));
      expect(precision.magnitude(4.4e-11), equals(-11));
    });
  });

  group('Can compute magnitude with negative values', () {
    test('Test 1', () {
      expect(precision.magnitude(-1.0), equals(0));
      expect(precision.magnitude(-10.0), equals(1));
      expect(precision.magnitude(-100.0), equals(2));
      expect(precision.magnitude(-1000.0), equals(3));
      expect(precision.magnitude(-10000.0), equals(4));
      expect(precision.magnitude(-100000.0), equals(5));
      expect(precision.magnitude(-1000000.0), equals(6));
    });

    test('Test 2', () {
      expect(precision.magnitude(-1e7), equals(7));
      expect(precision.magnitude(-1e8), equals(8));
      expect(precision.magnitude(-1e9), equals(9));
      expect(precision.magnitude(-1e10), equals(10));
      expect(precision.magnitude(-1e11), equals(11));
      expect(precision.magnitude(-1e12), equals(12));
    });

    test('Test 3', () {
      expect(precision.magnitude(-1e-7), equals(-7));
      expect(precision.magnitude(-1e-8), equals(-8));
      expect(precision.magnitude(-1e-9), equals(-9));
      expect(precision.magnitude(-1e-10), equals(-10));
      expect(precision.magnitude(-1e-11), equals(-11));
      expect(precision.magnitude(-1e-12), equals(-12));
    });

    test('Test 4', () {
      expect(precision.magnitude(-1.1e5), equals(5));
      expect(precision.magnitude(-2.2e-5), equals(-5));
      expect(precision.magnitude(-3.3e9), equals(9));
      expect(precision.magnitude(-4.4e-11), equals(-11));
    });
  });

  group('Can compute magnitude scaled value', () {
    test('Test 1', () {
      almostEqualRelative(0.0, precision.scaleUnitMagnitude(0.0), 12);
    });

    test('Test 2', () {
      almostEqualRelative(1.0, precision.scaleUnitMagnitude(1.0), 12);
      almostEqualRelative(1.0, precision.scaleUnitMagnitude(10.0), 12);
      almostEqualRelative(1.0, precision.scaleUnitMagnitude(100.0), 12);
      almostEqualRelative(1.0, precision.scaleUnitMagnitude(1000.0), 12);
      almostEqualRelative(1.0, precision.scaleUnitMagnitude(10000.0), 12);
      almostEqualRelative(1.0, precision.scaleUnitMagnitude(100000.0), 12);
      almostEqualRelative(1.0, precision.scaleUnitMagnitude(1000000.0), 12);
    });

    test('Test 3', () {
      almostEqualRelative(1.1, precision.scaleUnitMagnitude(1.1e5), 12);
      almostEqualRelative(2.2, precision.scaleUnitMagnitude(2.2e-5), 12);
      almostEqualRelative(3.3, precision.scaleUnitMagnitude(3.3e9), 12);
      almostEqualRelative(4.4, precision.scaleUnitMagnitude(4.4e-11), 12);
    });
  });

  group('Can compute magnitude scaled value with a negative values', () {
    test('Test 1', () {
      almostEqualRelative(-1.0, precision.scaleUnitMagnitude(-1.0), 12);
      almostEqualRelative(-1.0, precision.scaleUnitMagnitude(-10.0), 12);
      almostEqualRelative(-1.0, precision.scaleUnitMagnitude(-100.0), 12);
      almostEqualRelative(-1.0, precision.scaleUnitMagnitude(-1000.0), 12);
      almostEqualRelative(-1.0, precision.scaleUnitMagnitude(-10000.0), 12);
      almostEqualRelative(-1.0, precision.scaleUnitMagnitude(-100000.0), 12);
      almostEqualRelative(-1.0, precision.scaleUnitMagnitude(-1000000.0), 12);
    });

    test('Test 2', () {
      almostEqualRelative(-1.1, precision.scaleUnitMagnitude(-1.1e5), 12);
      almostEqualRelative(-2.2, precision.scaleUnitMagnitude(-2.2e-5), 12);
      almostEqualRelative(-3.3, precision.scaleUnitMagnitude(-3.3e9), 12);
      almostEqualRelative(-4.4, precision.scaleUnitMagnitude(-4.4e-11), 12);
    });
  });

  group('AlmostEqual', () {
    test('1.0 equals 1.0', () {
      expect(pe.almostEqual(1.0, 1.0), isTrue);
    });

    test('1.0 equals 1.0 + 2^(-53)', () {
      expect(pe.almostEqual(1.0, 1.0 + precision.doublePrecision), isTrue);
    });

    test('1.0 equals 1.0 + 5*2^(-53)', () {
      expect(pe.almostEqual(1.0, 1.0 + 5 * precision.doublePrecision), isTrue);
    });

    test('1.0 does not equal 1.0 + 2^(-51).', () {
      expect(
          pe.almostEqual(1.0, 1.0 + 100 * precision.doublePrecision), isFalse);
    });

    test('1.0 equals 1.0 + 2^(-53)', () {
      expect(pe.almostEqual(1.0, 2.0), isFalse);
    });
  });

  group('AlmostEqualRelative', () {
    test('compare zero and negative zero', () {
      expect(pe.almostEqualRelativeD(0.0, -0.0, 1e-5), isTrue);
      expect(pe.almostEqualRelativeD(0.0, -0.0, 1e-15), isTrue);
    });

    test('compare two nearby numbers', () {
      expect(
          pe.almostEqualRelativeD(
              1.0, 1.0 + (3 * precision.doublePrecision), 1e-15),
          isTrue);
      expect(
          pe.almostEqualRelativeD(1.0, 1.0 + precision.doublePrecision, 1e-15),
          isTrue);
      expect(pe.almostEqualRelativeD(1.0, 1.0 + 1e-16, 1e-15), isTrue);
      expect(pe.almostEqualRelativeD(1.0, 1.0 + 1e-15, 1e-15), isFalse);
      expect(pe.almostEqualRelativeD(1.0, 1.0 + 1e-14, 1e-15), isFalse);
    });

    test('compare with the two numbers reversed in compare order', () {
      expect(
          pe.almostEqualRelativeD(
              1.0 + (3 * precision.doublePrecision), 1.0, 1e-15),
          isTrue);
      expect(
          pe.almostEqualRelativeD(1.0 + precision.doublePrecision, 1.0, 1e-15),
          isTrue);
      expect(pe.almostEqualRelativeD(1.0 + 1e-16, 1.0, 1e-15), isTrue);
      expect(pe.almostEqualRelativeD(1.0 + 1e-15, 1.0, 1e-15), isFalse);
      expect(pe.almostEqualRelativeD(1.0 + 1e-14, 1.0, 1e-15), isFalse);
    });

    test('compare different numbers', () {
      expect(pe.almostEqualRelativeD(2.0, 1.0, 1e-5), isFalse);
      expect(pe.almostEqualRelativeD(1.0, 2.0, 1e-15), isFalse);
    });

    test('compare different numbers with large tolerance', () {
      expect(pe.almostEqualRelativeD(2.0, 1.0, 1e-5), isFalse);
      expect(pe.almostEqualRelativeD(1.0, 2.0, 1e-5), isFalse);
      expect(pe.almostEqualRelativeD(2.0, 1.0, 1e+1), isTrue);
      expect(pe.almostEqualRelativeD(1.0, 2.0, 1e+1), isTrue);
    });

    test('compare inf & inf', () {
      expect(pe.almostEqualRelativeD(double.infinity, double.infinity, 1e-15),
          isTrue);
      expect(
          pe.almostEqualRelativeD(
              double.negativeInfinity, double.negativeInfinity, 1e-15),
          isTrue);
    });

    test('compare -inf & inf', () {
      expect(
          pe.almostEqualRelativeD(
              double.infinity, double.negativeInfinity, 1e-15),
          isFalse);
      expect(
          pe.almostEqualRelativeD(
              double.negativeInfinity, double.infinity, 1e-15),
          isFalse);
    });

    test('compare inf & non-inf', () {
      expect(pe.almostEqualRelativeD(double.infinity, 1.0, 1e-15), isFalse);
      expect(pe.almostEqualRelativeD(1.0, double.infinity, 1e-15), isFalse);
      expect(pe.almostEqualRelativeD(double.negativeInfinity, 1.0, 1e-15),
          isFalse);
      expect(pe.almostEqualRelativeD(1.0, double.negativeInfinity, 1e-15),
          isFalse);
    });

    test('compare different numbers with opposite signs', () {
      expect(pe.almostEqualRelativeD(-2.0, 2.0, 1e-14), isFalse);
      expect(pe.almostEqualRelativeD(2.0, -2.0, 1e-14), isFalse);
    });

    test('compare tiny numbers with opposite signs', () {
      expect(pe.almostEqualRelativeD(1e-12, -1e-12, 1e-14), isFalse);
      expect(pe.almostEqualRelativeD(-1e-12, 1e-12, 1e-14), isFalse);
    });
  });

  group('AlmostEqualDecimalPlaces', () {
    test('NaN', () {
      expect(pe.almostEqualI(1.0, double.nan, 2), isFalse);
      expect(pe.almostEqualI(double.nan, 2.0, 2), isFalse);
      expect(pe.almostEqualI(double.nan, double.nan, 2), isFalse);
    });

    test('inf', () {
      expect(pe.almostEqualI(double.negativeInfinity, 2.0, 2), isFalse);
      expect(pe.almostEqualI(1.0, double.negativeInfinity, 2), isFalse);
      expect(pe.almostEqualI(double.infinity, 2.0, 2), isFalse);
      expect(pe.almostEqualI(1.0, double.infinity, 2), isFalse);
      expect(pe.almostEqualI(double.negativeInfinity, double.infinity, 2),
          isFalse);
      expect(pe.almostEqualI(double.infinity, double.negativeInfinity, 2),
          isFalse);
      expect(pe.almostEqualI(double.infinity, double.infinity, 2), isTrue);
      expect(
          pe.almostEqualI(double.negativeInfinity, double.negativeInfinity, 2),
          isTrue);
    });

    test('1 -> +/- 0.05 (0.5e-1)', () {
      expect(pe.almostEqualI(1.0, 1.06, 1), isFalse);
      expect(pe.almostEqualI(1.0, 1.04, 1), isTrue);
      expect(pe.almostEqualI(1.0, 1.00, 1), isTrue);
      expect(pe.almostEqualI(1.0, 0.96, 1), isTrue);
      expect(pe.almostEqualI(1.0, 0.94, 1), isFalse);
      expect(pe.almostEqualI(1.0, 0.0, 1), isFalse);
    });

    test('-1 -> +/- 5 (0.5e+1)', () {
      expect(pe.almostEqualI(100.0, 106.0, -1), isFalse);
      expect(pe.almostEqualI(100.0, 104.0, -1), isTrue);
      expect(pe.almostEqualI(100.0, 100.0, -1), isTrue);
      expect(pe.almostEqualI(100.0, 96.0, -1), isTrue);
      expect(pe.almostEqualI(100.0, 94.0, -1), isFalse);
      expect(pe.almostEqualI(100.0, 0.0, -1), isFalse);
    });

    test('3 -> +/- 0.0005 (0.5e-3)', () {
      expect(pe.almostEqualI(0.01, 0.0106, 1), isFalse);
      expect(pe.almostEqualI(0.01, 0.0104, 3), isTrue);
      expect(pe.almostEqualI(0.01, 0.0100, 3), isTrue);
      expect(pe.almostEqualI(0.01, 0.0096, 3), isTrue);
      expect(pe.almostEqualI(0.01, 0.0094, 3), isFalse);
      expect(pe.almostEqualI(0.01, 0.0, 3), isFalse);
    });

    test('12 -> +/- 0.5e-12', () {
      expect(pe.almostEqualI(0.0, 4.0 * precision.doublePrecision, 12), isTrue);
      expect(
          pe.almostEqualI(0.0, -4.0 * precision.doublePrecision, 12), isTrue);
    });
  });

  group('AlmostEqual within relative decimal places', () {
    test('NaN', () {
      expect(pe.almostEqualRelativeI(1.0, double.nan, 2), isFalse);
      expect(pe.almostEqualRelativeI(double.nan, 2.0, 2), isFalse);
      expect(pe.almostEqualRelativeI(double.nan, double.nan, 2), isFalse);
    });

    test('inf', () {
      expect(pe.almostEqualRelativeI(double.negativeInfinity, 2.0, 2), isFalse);
      expect(pe.almostEqualRelativeI(1.0, double.negativeInfinity, 2), isFalse);
      expect(pe.almostEqualRelativeI(double.infinity, 2.0, 2), isFalse);
      expect(pe.almostEqualRelativeI(1.0, double.infinity, 2), isFalse);
      expect(
          pe.almostEqualRelativeI(double.negativeInfinity, double.infinity, 2),
          isFalse);
      expect(
          pe.almostEqualRelativeI(double.infinity, double.negativeInfinity, 2),
          isFalse);
      expect(
          pe.almostEqualRelativeI(double.infinity, double.infinity, 2), isTrue);
      expect(
          pe.almostEqualRelativeI(
              double.negativeInfinity, double.negativeInfinity, 2),
          isTrue);
    });

    test('1 -> +/- max * 0.05 (0.5e-1)', () {
      expect(pe.almostEqualRelativeI(1.0, 1.04, 1), isFalse);
      expect(pe.almostEqualRelativeI(1.0, 1.06, 1), isTrue);
      expect(pe.almostEqualRelativeI(1.0, 0.96, 1), isTrue);
      expect(pe.almostEqualRelativeI(1.0, 0.94, 1), isTrue);
    });

    test('1 -> +/- max * 0.05 (0.5e-1)', () {
      expect(pe.almostEqualRelativeI(100.0, 104.0, 1), isTrue);
      expect(pe.almostEqualRelativeI(100.0, 106.0, 1), isFalse);
      expect(pe.almostEqualRelativeI(100.0, 96.0, 1), isTrue);
      expect(pe.almostEqualRelativeI(100.0, 94.0, 1), isFalse);
    });

    test('0 -> +/- max * 0.5 (0.5e-0)', () {
      expect(pe.almostEqualRelativeI(0.01, 0.014, 0), isTrue);
      expect(pe.almostEqualRelativeI(0.01, 0.016, 0), isFalse);
      expect(pe.almostEqualRelativeI(0.01, 0.006, 0), isTrue);
      expect(pe.almostEqualRelativeI(0.01, 0.004, 0), isFalse);
    });

    test('12 -> +/- 0.5e-12', () {
      expect(pe.almostEqualRelativeI(0.0, 4.0 * precision.doublePrecision, 12),
          isTrue);
      expect(pe.almostEqualRelativeI(0.0, -4.0 * precision.doublePrecision, 12),
          isTrue);
    });
  });

  group(
      'AlmostEqual within decimal places with negative decimal places throws ArgumentError.',
      () {
    test('throws', () {
      expect(() => pe.almostEqualRelativeI(1.0, 2.0, -1), throwsArgumentError);
    });

    test('doesn\'t throw', () {
      expect(() => pe.almostEqualI(1.0, 2.0, -1), returnsNormally);
    });
  });

  group('AlmostEqual with small numbers and small number of decimal places.',
      () {
    test('Test 1', () {
      expect(pe.almostEqualRelativeI(0.0, 1e-12, 1), isTrue);
      expect(pe.almostEqualRelativeI(0.0, -1e-12, 1), isTrue);
    });

    test('Test 2', () {
      expect(pe.almostEqualRelativeI(0.0, 1e-12, 13), isFalse);
      expect(pe.almostEqualRelativeI(0.0, -1e-12, 13), isFalse);
    });

    test('Test 3', () {
      expect(pe.almostEqualRelativeI(0.0, 1.0, 1), isFalse);
      expect(pe.almostEqualRelativeI(0.0, -1.0, 1), isFalse);
    });
  });

  test('AlmostEqual with decimal places with sign revert.', () {
    expect(pe.almostEqualRelativeI(0.5, 0.3, 1), isFalse);
  });

  group('Compare to with decimal places.', () {
    test('compare zero and negative zero', () {
      expect(pc.compareToI(0.0, -0.0, 1), equals(0));
      expect(
          pc.compareToI(0.0, -0.0, precision.doubleDecimalPlaces), equals(0));
    });

    test('compare two nearby numbers', () {
      expect(
          pc.compareToI(1.0, 1.0 + 10 * precision.doublePrecision,
              precision.doubleDecimalPlaces),
          equals(-1));
      expect(
          pc.compareToI(1.0, 1.0 + precision.doublePrecision,
              precision.doubleDecimalPlaces),
          equals(0));
      expect(
          pc.compareToI(1.0, 1.0 - precision.doublePrecision,
              precision.doubleDecimalPlaces),
          equals(0));
      expect(
          pc.compareToI(1.0, 1.0 - 10 * precision.doublePrecision,
              precision.doubleDecimalPlaces),
          equals(1));
    });

    test('compare with the two numbers reversed in compare order', () {
      expect(
          pc.compareToI(1.0 + 10 * precision.doublePrecision, 1.0,
              precision.doubleDecimalPlaces),
          equals(1));
      expect(
          pc.compareToI(1.0 + precision.doublePrecision, 1.0,
              precision.doubleDecimalPlaces),
          equals(0));
      expect(
          pc.compareToI(1.0 - precision.doublePrecision, 1.0,
              precision.doubleDecimalPlaces),
          equals(0));
      expect(
          pc.compareToI(1.0 - 10 * precision.doublePrecision, 1.0,
              precision.doubleDecimalPlaces),
          equals(-1));
    });

    test('compare two slightly more different numbers', () {
      expect(
          pc.compareToI(1.0, 1.0 + 50 * precision.doublePrecision,
              precision.doubleDecimalPlaces),
          equals(-1));
      expect(
          pc.compareToI(1.0, 1.0 + 50 * precision.doublePrecision,
              precision.doubleDecimalPlaces - 2),
          equals(0));
      expect(
          pc.compareToI(1.0, 1.0 - 50 * precision.doublePrecision,
              precision.doubleDecimalPlaces - 2),
          equals(0));
      expect(
          pc.compareToI(1.0, 1.0 - 50 * precision.doublePrecision,
              precision.doubleDecimalPlaces),
          equals(1));
    });

    test('compare different numbers', () {
      expect(pc.compareToI(2.0, 1.0, precision.doubleDecimalPlaces), equals(1));
      expect(
          pc.compareToI(1.0, 2.0, precision.doubleDecimalPlaces), equals(-1));
    });

    test('compare different numbers with large tolerance', () {
      expect(
          pc.compareToI(1.0, 1.0 + 1e5 * precision.doublePrecision,
              precision.doubleDecimalPlaces),
          equals(-1));
      expect(pc.compareToI(1.0, 1.0 - 1e5 * precision.doublePrecision, 10),
          equals(0));
      expect(
          pc.compareToI(1.0, 1.0 - 1e5 * precision.doublePrecision,
              precision.doubleDecimalPlaces),
          equals(1));
    });

    test('compare inf & inf', () {
      expect(
          pc.compareToI(
              double.infinity, double.infinity, precision.doubleDecimalPlaces),
          equals(0));
      expect(
          pc.compareToI(double.negativeInfinity, double.negativeInfinity,
              precision.doubleDecimalPlaces),
          equals(0));
    });

    test('compare -inf & inf', () {
      expect(
          pc.compareToI(double.infinity, double.negativeInfinity,
              precision.doubleDecimalPlaces),
          equals(1));
      expect(
          pc.compareToI(double.negativeInfinity, double.infinity,
              precision.doubleDecimalPlaces),
          equals(-1));
    });

    test('compare inf and non-inf', () {
      expect(pc.compareToI(double.infinity, 1.0, precision.doubleDecimalPlaces),
          equals(1));
      expect(pc.compareToI(1.0, double.infinity, precision.doubleDecimalPlaces),
          equals(-1));
      expect(
          pc.compareToI(
              double.negativeInfinity, 1.0, precision.doubleDecimalPlaces),
          equals(-1));
      expect(
          pc.compareToI(
              1.0, double.negativeInfinity, precision.doubleDecimalPlaces),
          equals(1));
    });
  });

  group('Is larger with decimal places.', () {
    test('Test 1', () {
      expect(pc.isLargerI(1.0, double.nan, 2), isFalse);
      expect(pc.isLargerI(double.nan, 2.0, 2), isFalse);
      expect(pc.isLargerI(double.nan, double.nan, 2), isFalse);
    });

    test('Test 2', () {
      expect(pc.isLargerI(double.negativeInfinity, 2.0, 2), isFalse);
      expect(pc.isLargerI(1.0, double.negativeInfinity, 2), isTrue);
    });

    test('Test 3', () {
      expect(pc.isLargerI(double.infinity, 2.0, 2), isTrue);
      expect(pc.isLargerI(1.0, double.infinity, 2), isFalse);
    });

    test('Test 4', () {
      expect(
          pc.isLargerI(double.negativeInfinity, double.infinity, 2), isFalse);
      expect(pc.isLargerI(double.infinity, double.negativeInfinity, 2), isTrue);
    });

    test('Test 5', () {
      expect(pc.isLargerI(double.infinity, double.infinity, 2), isFalse);
      expect(pc.isLargerI(double.negativeInfinity, double.negativeInfinity, 2),
          isFalse);
    });

    test('Test 6', () {
      expect(pc.isLargerI(1.0, 1.006, 2), isFalse);
      expect(pc.isLargerI(1.0, 1.004, 2), isFalse);
      expect(pc.isLargerI(1.0, 0.996, 2), isFalse);
      expect(pc.isLargerI(1.0, 0.994, 2), isTrue);
    });

    test('Test 7', () {
      expect(pc.isLargerRelativeI(1.0, 1.006, 2), isFalse);
      expect(pc.isLargerRelativeI(1.0, 1.004, 2), isFalse);
      expect(pc.isLargerRelativeI(1.0, 0.996, 2), isFalse);
      expect(pc.isLargerRelativeI(1.0, 0.994, 2), isTrue);
    });

    test('Test 8', () {
      expect(pc.isLargerRelativeI(100.0, 100.6, 2), isFalse);
      expect(pc.isLargerRelativeI(100.0, 100.4, 2), isFalse);
      expect(pc.isLargerRelativeI(100.0, 099.6, 2), isFalse);
      expect(pc.isLargerRelativeI(100.0, 099.4, 2), isTrue);
    });

    test('Test 9', () {
      var precMag = precision.magnitude(precision.doublePrecision);
      var max = 0.4 * pow(10, precMag);

      expect(pc.isLargerI(0.0, max, -precMag), isFalse);
      expect(pc.isLargerI(0.0, -max, -precMag), isFalse);
    });

    test('Test 10', () {
      var precMag = precision.magnitude(precision.doublePrecision);
      var max = 0.6 * pow(10, precMag);

      expect(pc.isLargerI(0.0, max, -precMag), isFalse);
      expect(pc.isLargerI(0.0, -max, -precMag), isTrue);
    });
  });

  group('Is smaller with decimal places.', () {
    test('Test 1', () {
      expect(pc.isSmallerI(1.0, double.nan, 2), isFalse);
      expect(pc.isSmallerI(double.nan, 2.0, 2), isFalse);
      expect(pc.isSmallerI(double.nan, double.nan, 2), isFalse);
    });

    test('Test 2', () {
      expect(pc.isSmallerI(double.negativeInfinity, 2.0, 2), isTrue);
      expect(pc.isSmallerI(1.0, double.negativeInfinity, 2), isFalse);
    });

    test('Test 3', () {
      expect(pc.isSmallerI(double.infinity, 2.0, 2), isFalse);
      expect(pc.isSmallerI(1.0, double.infinity, 2), isTrue);
    });

    test('Test 4', () {
      expect(
          pc.isSmallerI(double.negativeInfinity, double.infinity, 2), isTrue);
      expect(
          pc.isSmallerI(double.infinity, double.negativeInfinity, 2), isFalse);
    });

    test('Test 5', () {
      expect(pc.isSmallerI(double.infinity, double.infinity, 2), isFalse);
      expect(pc.isSmallerI(double.negativeInfinity, double.negativeInfinity, 2),
          isFalse);
    });

    test('Test 6', () {
      expect(pc.isSmallerI(1.0, 1.006, 2), isTrue);
      expect(pc.isSmallerI(1.0, 1.004, 2), isFalse);
      expect(pc.isSmallerI(1.0, 0.996, 2), isFalse);
      expect(pc.isSmallerI(1.0, 0.994, 2), isFalse);
    });

    test('Test 7', () {
      expect(pc.isSmallerRelativeI(1.0, 1.006, 2), isTrue);
      expect(pc.isSmallerRelativeI(1.0, 1.004, 2), isFalse);
      expect(pc.isSmallerRelativeI(1.0, 0.996, 2), isFalse);
      expect(pc.isSmallerRelativeI(1.0, 0.994, 2), isFalse);
    });

    test('Test 8', () {
      expect(pc.isSmallerRelativeI(100.0, 100.6, 2), isTrue);
      expect(pc.isSmallerRelativeI(100.0, 100.4, 2), isFalse);
      expect(pc.isSmallerRelativeI(100.0, 099.6, 2), isFalse);
      expect(pc.isSmallerRelativeI(100.0, 099.4, 2), isFalse);
    });

    test('Test 9', () {
      var precMag = precision.magnitude(precision.doublePrecision);
      var max = 0.4 * pow(10, precMag);

      expect(pc.isSmallerI(0.0, max, -precMag), isFalse);
      expect(pc.isSmallerI(0.0, -max, -precMag), isFalse);
    });

    test('Test 10', () {
      var precMag = precision.magnitude(precision.doublePrecision);
      var max = 0.6 * pow(10, precMag);

      expect(pc.isSmallerI(0.0, max, -precMag), isTrue);
      expect(pc.isSmallerI(0.0, -max, -precMag), isFalse);
    });
  });
}
