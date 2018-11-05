import 'package:test/test.dart';

import 'permutation_test.dart' as permutation;
import 'precision_test.dart' as precision;
import 'trigonometry_test.dart' as trigonometry;

void main() {
  group('permutation', permutation.main);
  group('precision', precision.main);
  group('trigonometry', trigonometry.main);
}
