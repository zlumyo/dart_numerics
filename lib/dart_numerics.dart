/// # dart-numerics
///
/// `dart-numerics` is an ultimate mathematical package inspired by .NET analogue,
/// aiming to provide methods and algorithms for numerical computations in science,
/// engineering and every day use.
///
/// ## Usage
///
/// A simple usage example:
///
/// ```dart
/// import 'package:dart_numerics/dart_numerics.dart' as numerics;
///
/// main() {
///   print(numerics.acosh(numerics.pi / 2));
/// }
/// ```
library dart_numerics;

export 'src/linear_regression/simple_regression.dart';
export 'src/special_functions/beta.dart';
export 'src/special_functions/exponential_integral.dart';
export 'src/special_functions/factorial.dart';
export 'src/special_functions/gamma.dart';
export 'src/constants.dart';
export 'src/euclid.dart';
export 'src/fit.dart';
export 'src/permutation.dart';
export 'src/precision.dart' hide asDirectionalInt64;
export 'src/precision_equality.dart';
export 'src/precision_comparison.dart';
export 'src/trigonometry.dart';
export 'src/utils.dart' hide unpackSinglePass, int64BitsToDouble;
