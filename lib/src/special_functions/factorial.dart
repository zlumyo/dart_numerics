import 'dart:math';

import '../error_messages.dart' as messages;
import 'gamma.dart';

const int factorialMaxArgument = 170;
final List<double> _factorialCache = _initializeFactorial();

List<double> _initializeFactorial() {
  var factorialCache = List.filled(factorialMaxArgument + 1, 0.0);
  factorialCache[0] = 1.0;
  for (int i = 1; i < factorialCache.length; i++) {
    factorialCache[i] = factorialCache[i - 1] * i;
  }
  return factorialCache;
}

/// Computes the factorial function [x] -> [x]! of an integer number > 0. The function can represent all number up
/// to 22! exactly, all numbers up to 170! using a double representation. All larger values will overflow.
///
/// If you need to multiply or divide various such factorials, consider using the logarithmic version
/// [factorialLn] instead so you can add instead of multiply and subtract instead of divide, and
/// then exponentiate the result using [exp]. This will also circumvent the problem that
/// factorials become very large even for small parameters.
double factorialD(int x) {
  if (x < 0) {
    throw ArgumentError.value(x, 'x', messages.argumentPositive);
  }

  if (x < _factorialCache.length) {
    return _factorialCache[x];
  }

  return double.infinity;
}

/// Computes the factorial of an integer.
BigInt factorialBig(BigInt x) {
  if (x < BigInt.zero) {
    throw ArgumentError.value(x, 'x', messages.argumentPositive);
  }

  if (x == BigInt.zero) {
    return BigInt.one;
  }

  BigInt r = x;
  while ((x -= BigInt.one) > BigInt.one) {
    r *= x;
  }

  return r;
}

/// Computes the logarithmic factorial function [x] -> ln([x]!) of an integer number > 0.
double factorialLn(int x) {
  if (x < 0) {
    throw ArgumentError.value(x, 'x', messages.argumentPositive);
  }

  if (x <= 1) {
    return 0.0;
  }

  if (x < _factorialCache.length) {
    return log(_factorialCache[x]);
  }

  return gammaLn(x + 1.0);
}

/// Computes the binomial coefficient: [n] choose [k].
double binomial(int n, int k) {
  if (k < 0 || n < 0 || k > n) {
    return 0.0;
  }

  return (0.5 + exp(factorialLn(n) - factorialLn(k) - factorialLn(n - k)))
      .floorToDouble();
}

/// Computes the natural logarithm of the binomial coefficient: ln([n] choose [k]).
double binomialLn(int n, int k) {
  if (k < 0 || n < 0 || k > n) {
    return double.negativeInfinity;
  }

  return factorialLn(n) - factorialLn(k) - factorialLn(n - k);
}

/// Computes the multinomial coefficient: [n] choose n1, n2, n3, ...
double multinomial(int n, List<int> ni) {
  if (n < 0) {
    throw ArgumentError.value(n, 'n', messages.argumentPositive);
  }

  if (ni == null) {
    throw ArgumentError.notNull('ni');
  }

  int sum = 0;
  double ret = factorialLn(n);
  for (int i = 0; i < ni.length; i++) {
    if (ni[i] < 0) {
      throw ArgumentError.value(ni[i], 'n[${i}]', messages.argumentPositive);
    }

    ret -= factorialLn(ni[i]);
    sum += ni[i];
  }

  // Before returning, check that the sum of all elements was equal to n.
  if (sum != n) {
    throw ArgumentError.value(ni, 'ni', messages.argumentParameterSetInvalid);
  }

  return (0.5 + exp(ret)).floorToDouble();
}
