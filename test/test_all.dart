import 'package:test/test.dart';

import 'special_functions_tests/exponential_integral_test.dart'
    as exponential_integral;
import 'special_functions_tests/factorial_test.dart' as factorial;
import 'special_functions_tests/gamma_test.dart' as gamma;
import 'special_functions_tests/logistic_test.dart' as logistic;
import 'special_functions_tests/beta_test.dart' as beta;
import 'special_functions_tests/erf_test.dart' as erf;
import 'fit_test.dart' as fit;
import 'permutation_test.dart' as permutation;
import 'precision_test.dart' as precision;
import 'trigonometry_test.dart' as trigonometry;
import 'polynomial_test.dart' as polynomial;

void main() {
  group('permutation', permutation.main);
  group('precision', precision.main);
  group('trigonometry', trigonometry.main);
  group('fit', fit.main);
  group('gamma', gamma.main);
  group('factorial', factorial.main);
  group('exponential integral', exponential_integral.main);
  group('logistic', logistic.main);
  group('polynomial', polynomial.main);
  group('beta', beta.main);
  group('erf', erf.main);
}
