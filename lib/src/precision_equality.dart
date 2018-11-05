import 'dart:math';

import 'error_messages.dart' as messages;
import 'precision.dart';

/// Value representing 10 * 2^(-53) = 1.11022302462516E-15
final double _defaultDoubleAccuracy = doublePrecision * 10;

/// Compares two doubles and determines if they are equal
/// within the specified maximum absolute error.
bool almostEqualNormD(
    double a, double b, double diff, double maximumAbsoluteError) {
  // If A or B are infinity (positive or negative) then
  // only return true if they are exactly equal to each other -
  // that is, if they are both infinities of the same sign.
  if (a.isInfinite || b.isInfinite) {
    return a == b;
  }

  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves.
  if (a.isNaN || b.isNaN) {
    return false;
  }

  return diff.abs() < maximumAbsoluteError;
}

/// Compares two doubles and determines if they are equal to within the
/// specified number of decimal places or not, using the number of decimal
/// places as an absolute measure.
bool almostEqualNormI(double a, double b, double diff, int decimalPlaces) {
  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves.
  if (a.isNaN || b.isNaN) {
    return false;
  }

  // If A or B are infinity (positive or negative) then
  // only return true if they are exactly equal to each other -
  // that is, if they are both infinities of the same sign.
  if (a.isInfinite || b.isInfinite) {
    return a == b;
  }

  // The values are equal if the difference between the two numbers is smaller
  // than 10^(-numberOfDecimalPlaces). We divide by two so that we have half the
  // range on each side of the numbers, e.g. if decimalPlaces == 2,
  // then 0.01 will equal between 0.005 and 0.015, but not 0.02 and not 0.00
  return diff.abs() < pow(10, -decimalPlaces) / 2.0;
}

/// Compares two doubles and determines if they are equal
/// within the specified maximum error.
bool almostEqualNormRelativeD(
    double a, double b, double diff, double maximumError) {
  // If A or B are infinity (positive or negative) then
  // only return true if they are exactly equal to each other -
  // that is, if they are both infinities of the same sign.
  if (a.isInfinite || b.isInfinite) {
    return a == b;
  }

  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves.
  if (a.isNaN || b.isNaN) {
    return false;
  }

  // If one is almost zero, fall back to absolute equality
  if (a.abs() < doublePrecision || b.abs() < doublePrecision) {
    return diff.abs() < maximumError;
  }

  if ((a == 0 && b.abs() < maximumError) ||
      (b == 0 && a.abs() < maximumError)) {
    return true;
  }

  return diff.abs() < maximumError * max(a.abs(), b.abs());
}

/// Compares two doubles and determines if they are equal to within
/// the specified number of decimal places or not. If the numbers are very close
/// to zero an absolute difference is compared, otherwise the relative
/// difference is compared.
bool almostEqualNormRelativeI(
    double a, double b, double diff, int decimalPlaces) {
  if (decimalPlaces < 0) {
    // Can't have a negative number of decimal places
    throw ArgumentError.value(
        decimalPlaces, "decimalPlaces", messages.argumentNotNegative);
  }

  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves.
  if (a.isNaN || b.isNaN) {
    return false;
  }

  // If A or B are infinity (positive or negative) then
  // only return true if they are exactly equal to each other -
  // that is, if they are both infinities of the same sign.
  if (a.isInfinite || b.isInfinite) {
    return a == b;
  }

  // If both numbers are equal, get out now. This should remove the possibility
  // of both numbers being zero and any problems associated with that.
  if (a.compareTo(b) == 0) {
    return true;
  }

  // If one is almost zero, fall back to absolute equality
  if (a.abs() < doublePrecision || b.abs() < doublePrecision) {
    // The values are equal if the difference between the two numbers is smaller
    // than 10^(-numberOfDecimalPlaces). We divide by two so that we have half
    // the range on each side of the numbers, e.g. if decimalPlaces == 2,
    // then 0.01 will equal between 0.005 and 0.015, but not 0.02 and not 0.00
    return diff.abs() < pow(10, -decimalPlaces) / 2.0;
  }

  // If the magnitudes of the two numbers are equal to within one magnitude
  // the numbers could potentially be equal
  int magnitudeOfFirst = magnitude(a);
  int magnitudeOfSecond = magnitude(b);
  int magnitudeOfMax = max(magnitudeOfFirst, magnitudeOfSecond);
  if (magnitudeOfMax > (min(magnitudeOfFirst, magnitudeOfSecond) + 1)) {
    return false;
  }

  // The values are equal if the difference between the two numbers is smaller
  // than 10^(-numberOfDecimalPlaces). We divide by two so that we have half
  // the range on each side of the numbers, e.g. if decimalPlaces == 2, then
  // 0.01 will equal between 0.00995 and 0.01005, but not 0.0015 and not 0.0095
  return diff.abs() < pow(10, magnitudeOfMax - decimalPlaces) / 2.0;
}

/// Checks whether two [double] numbers are almost equal.
bool almostEqual(double a, double b) =>
    almostEqualNormD(a, b, a - b, _defaultDoubleAccuracy);

/// Compares two doubles and determines if they are equal within
/// the specified maximum error.
bool almostEqualD(double a, double b, double maximumAbsoluteError) =>
    almostEqualNormD(a, b, a - b, maximumAbsoluteError);

/// Compares two doubles and determines if they are equal within
/// the specified maximum error.
bool almostEqualI(double a, double b, int decimals) =>
    almostEqualNormI(a, b, a - b, decimals);

/// Compares two doubles and determines if they are equal within
/// the specified maximum error.
bool almostEqualRelativeD(double a, double b, double maximumError) =>
    almostEqualNormRelativeD(a, b, a - b, maximumError);

/// Compares two doubles and determines if they are equal to within
/// the specified number of decimal places or not. If the numbers
/// are very close to zero an absolute difference is compared,
/// otherwise the relative difference is compared.
bool almostEqualRelativeI(double a, double b, int decimalPlaces) =>
    almostEqualNormRelativeI(a, b, a - b, decimalPlaces);
