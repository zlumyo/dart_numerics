/// A single-variable polynomial with real-valued coefficients and non-negative exponents.
class Polynomial {
  /// Evaluate a polynomial at point x.
  /// Coefficients are ordered ascending by power with power k at index k.
  /// Example: coefficients [3,-1,2] represent y=2x^2-x+3.
  static double evaluate(double z, List<double> coefficients) {
    // Zero polynomials need explicit handling.
    // Without this check, we attempted to peek coefficients at negative indices!
    int n = coefficients.length;
    if (n == 0) {
      return 0;
    }

    double sum = coefficients[n - 1];
    for (int i = n - 2; i >= 0; --i) {
      sum *= z;
      sum += coefficients[i];
    }

    return sum;
  }
}
