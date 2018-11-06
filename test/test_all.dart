import 'package:test/test.dart';

import 'fit_test.dart' as fit;
import 'permutation_test.dart' as permutation;
import 'precision_test.dart' as precision;
import 'trigonometry_test.dart' as trigonometry;

void main() {
  group('permutation', permutation.main);
  group('precision', precision.main);
  group('trigonometry', trigonometry.main);
  group('Fit tests', fit.main);
}
