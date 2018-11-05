import 'precision_equality.dart';

/// Compares two doubles and determines which double is bigger.
/// a &lt; b -> -1; a ~= b (almost equal according to parameter) -> 0; a &gt; b -> +1.
int compareToD(double a, double b, double maximumAbsoluteError) {
  // NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return a.compareTo(b);
  }

  // If A or B are infinity (positive or negative) then
  // only return true if first is smaller
  if (a.isInfinite || b.isInfinite) {
    return a.compareTo(b);
  }

  // If the numbers are equal to within the number of decimal places
  // then there's technically no difference
  if (almostEqualD(a, b, maximumAbsoluteError)) {
    return 0;
  }

  // The numbers differ by more than the decimal places, so
  // we can check the normal way to see if the first is
  // larger than the second.
  return a.compareTo(b);
}

/// Compares two doubles and determines which double is bigger.
/// a &lt; b -> -1; a ~= b (almost equal according to parameter) -> 0; a &gt; b -> +1.
int compareToI(double a, double b, int decimalPlaces) {
  // NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return a.compareTo(b);
  }

  // If A or B are infinity (positive or negative) then
  // only return true if first is smaller
  if (a.isInfinite || b.isInfinite) {
    return a.compareTo(b);
  }

  // If the numbers are equal to within the number of decimal places
  // then there's technically no difference
  if (almostEqualI(a, b, decimalPlaces)) {
    return 0;
  }

  // The numbers differ by more than the decimal places, so
  // we can check the normal way to see if the first is
  // larger than the second.
  return a.compareTo(b);
}

/// Compares two doubles and determines which double is bigger.
/// a &lt; b -> -1; a ~= b (almost equal according to parameter) -> 0; a &gt; b -> +1.
int compareToRelativeD(double a, double b, double maximumError) {
  // NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return a.compareTo(b);
  }

  // If A or B are infinity (positive or negative) then
  // only return true if first is smaller
  if (a.isInfinite || b.isInfinite) {
    return a.compareTo(b);
  }

  // If the numbers are equal to within the number of decimal places
  // then there's technically no difference
  if (almostEqualRelativeD(a, b, maximumError)) {
    return 0;
  }

  // The numbers differ by more than the decimal places, so
  // we can check the normal way to see if the first is
  // larger than the second.
  return a.compareTo(b);
}

/// Compares two doubles and determines which double is bigger.
/// a &lt; b -> -1; a ~= b (almost equal according to parameter) -> 0; a &gt; b -> +1.
int compareToRelativeI(double a, double b, int decimalPlaces) {
  // NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return a.compareTo(b);
  }

  // If A or B are infinity (positive or negative) then
  // only return true if first is smaller
  if (a.isInfinite || b.isInfinite) {
    return a.compareTo(b);
  }

  // If the numbers are equal to within the number of decimal places
  // then there's technically no difference
  if (almostEqualRelativeI(a, b, decimalPlaces)) {
    return 0;
  }

  // The numbers differ by more than the decimal places, so
  // we can check the normal way to see if the first is
  // larger than the second.
  return a.compareTo(b);
}

/// Compares two doubles and determines if the first value is larger than
/// the second value to within the specified number of decimal places or not.
bool isLargerI(double a, double b, int decimalPlaces) {
  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return false;
  }

  return compareToI(a, b, decimalPlaces) > 0;
}

/// Compares two doubles and determines if the first value is larger than
/// the second value to within the specified number of decimal places or not.
bool isLargerD(double a, double b, double maximumAbsoluteError) {
  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return false;
  }

  return compareToD(a, b, maximumAbsoluteError) > 0;
}

/// Compares two doubles and determines if the first value is larger than
/// the second value to within the specified number of decimal places or not.
bool isLargerRelativeI(double a, double b, int decimalPlaces) {
  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return false;
  }

  return compareToRelativeI(a, b, decimalPlaces) > 0;
}

/// Compares two doubles and determines if the first value is larger than
/// the second value to within the specified number of decimal places or not.
bool isLargerRelativeD(double a, double b, double maximumError) {
  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return false;
  }

  return compareToRelativeD(a, b, maximumError) > 0;
}

/// Compares two doubles and determines if the first value is smaller than
/// the second value to within the specified number of decimal places or not.
bool isSmallerI(double a, double b, int decimalPlaces) {
  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return false;
  }

  return compareToI(a, b, decimalPlaces) < 0;
}

/// Compares two doubles and determines if the first value is smaller than
/// the second value to within the specified number of decimal places or not.
bool isSmallerD(double a, double b, double maximumAbsoluteError) {
  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return false;
  }

  return compareToD(a, b, maximumAbsoluteError) < 0;
}

/// Compares two doubles and determines if the first value is smaller than
/// the second value to within the specified number of decimal places or not.
bool isSmallerRelativeI(double a, double b, int decimalPlaces) {
  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return false;
  }

  return compareToRelativeI(a, b, decimalPlaces) < 0;
}

/// Compares two doubles and determines if the first value is smaller than
/// the second value to within the specified number of decimal places or not.
bool isSmallerRelativeD(double a, double b, double maximumError) {
  // If A or B are a NAN, return false. NANs are equal to nothing,
  // not even themselves, and thus they're not bigger or
  // smaller than anything either
  if (a.isNaN || b.isNaN) {
    return false;
  }

  return compareToRelativeD(a, b, maximumError) < 0;
}
