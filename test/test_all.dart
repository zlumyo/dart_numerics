import 'package:test/test.dart';

import 'precision_test.dart' as precision;
import 'trigonometry_test.dart' as trigonometry;

void main() {
  group('precision', precision.main);
  group('trigonometry', trigonometry.main);
}
