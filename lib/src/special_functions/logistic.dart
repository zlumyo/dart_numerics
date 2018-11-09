import 'dart:math';

import '../error_messages.dart' as messages;

/// Computes the logistic function. see: http://en.wikipedia.org/wiki/Logistic
double logistic(double p) => 1.0 / (exp(-p) + 1.0);

/// Computes the logit function, the inverse of the sigmoid logistic function.
/// see: http://en.wikipedia.org/wiki/Logit
double logit(double p) {
  if (p < 0.0 || p > 1.0) {
    throw ArgumentError.value(p, 'p', messages.argumentBetween0And1);
  }

  return log(p / (1.0 - p));
}
