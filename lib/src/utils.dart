import 'dart:math';

/// Converts [x] to a [double] and returns the common logarithm of the value.
///
/// WARNING!!! This function is not such accurate as low-level implementation!
/// WARNING!!! Some unit-tests fail because of that!
double log10(num x) => log(x) / ln10;
