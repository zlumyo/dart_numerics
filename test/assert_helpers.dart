import 'package:test/test.dart';

import 'package:dart_numerics/src/precision_equality.dart' as pe;

void almostEqual(double expected, double actual, int decimalPlaces) {
  if (expected.isNaN && actual.isNaN) {
    return;
  }

  if (!pe.almostEqualI(expected, actual, decimalPlaces)) {
    fail(
        "Not equal within ${decimalPlaces} places. Expected: ${expected}; Actual: ${actual}");
  }
}

void almostEqualRelative(double expected, double actual, int decimalPlaces) {
  if (expected.isNaN && actual.isNaN) {
    return;
  }

  if (!pe.almostEqualRelativeI(expected, actual, decimalPlaces)) {
    fail(
        "Not equal within ${decimalPlaces} places. Expected: ${expected}; Actual: ${actual}");
  }
}
