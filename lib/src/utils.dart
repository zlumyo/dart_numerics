import 'dart:math';

import 'package:tuple/tuple.dart';

/// Converts [x] to a [double] and returns the common logarithm of the value.
///
/// WARNING!!! This function is not such accurate as low-level implementation!
/// WARNING!!! Some unit-tests fail because of that!
double log10(num x) => log(x) / ln10;

Tuple2<List<TU>, List<TV>> unpackSinglePass<TU, TV>(
    Iterable<Tuple2<TU, TV>> samples) {
  var u = new List<TU>();
  var v = new List<TV>();

  for (var tuple in samples) {
    u.add(tuple.item1);
    v.add(tuple.item2);
  }

  return Tuple2<List<TU>, List<TV>>(u, v);
}
