import 'error_messages.dart' as messages;

/// Class to represent a permutation for a subset of the natural numbers.
class Permutation {
  /// Entry _indices\[i\] represents the location to which i is permuted to.
  final List<int> _indices;

  /// Initializes a new instance of the Permutation class within an array which
  /// represents where each integer is permuted too: [indices]\[i\] represents
  /// that integer i is permuted to location [indices]\[i\].
  Permutation(List<int> indices)
      : _indices = List.of(indices, growable: false) {
    if (!_checkForProperPermutation(indices)) {
      throw ArgumentError.value(
          indices, 'indices', messages.permutationAsIntArrayInvalid);
    }
  }

  /// Gets the number of elements this permutation is over.
  int get dimension => _indices.length;

  /// Computes where [idx] permutes too.
  int operator [](int idx) => _indices[idx];

  /// Computes the inverse of the permutation.
  Permutation inverse() {
    var invIdx = List.filled(dimension, 0, growable: false);
    for (int i = 0; i < invIdx.length; i++) {
      invIdx[_indices[i]] = i;
    }

    return new Permutation(invIdx);
  }

  Permutation.fromInversions(List<int> inv)
      : _indices = List.filled(inv.length, 0, growable: false) {
    for (int i = 0; i < inv.length; i++) {
      _indices[i] = i;
    }

    for (int i = inv.length - 1; i >= 0; i--) {
      if (_indices[i] != inv[i]) {
        int t = _indices[i];
        _indices[i] = _indices[inv[i]];
        _indices[inv[i]] = t;
      }
    }
  }

  /// Construct a sequence of inversions from the permutation.
  ///
  /// From wikipedia: the permutation 12043 has the inversions (0,2), (1,2)
  /// and (3,4). This would be encoded using the array { 22244 }.
  List<int> toInversions() {
    var idx = List.of(_indices, growable: false);

    for (int i = 0; i < idx.length; i++) {
      if (idx[i] != i) {
        int q = idx.indexWhere((x) => x == i, i + 1);
        var t = idx[i];
        idx[i] = q;
        idx[q] = t;
      }
    }

    return idx;
  }

  /// Checks whether the [indices] array represents a proper permutation.
  static bool _checkForProperPermutation(List<int> indices) {
    var idxCheck = List.filled(indices.length, false);

    for (int i = 0; i < indices.length; i++) {
      if (indices[i] >= indices.length || indices[i] < 0) {
        return false;
      }

      idxCheck[indices[i]] = true;
    }

    for (int i = 0; i < indices.length; i++) {
      if (idxCheck[i] == false) {
        return false;
      }
    }

    return true;
  }
}
