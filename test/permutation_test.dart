import 'package:test/test.dart';

import 'package:dart_numerics/src/permutation.dart';

void main() {
  group('Create permutation fails when given bad index set.', () {
    test('Test 1', () {
      var sample = [-1];
      expect(() => Permutation(sample), throwsArgumentError);
    });

    test('Test 2', () {
      var sample = [0, 1, 2, 3, 4, 4];
      expect(() => Permutation(sample), throwsArgumentError);
    });

    test('Test 3', () {
      var sample = [5, 4, 3, 2, 1, 7];
      expect(() => Permutation(sample), throwsArgumentError);
    });
  });

  group('Can invert permutation.', () {
    test('Test 1', () {
      var sample = [0];
      var p = Permutation(sample);
      var pinv = p.inverse();

      expect(pinv.dimension, equals(p.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(pinv[p[i]], equals(i));
        expect(p[pinv[i]], equals(i));
      }
    });

    test('Test 2', () {
      var sample = [0, 1, 2, 3, 4, 5];
      var p = Permutation(sample);
      var pinv = p.inverse();

      expect(pinv.dimension, equals(p.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(pinv[p[i]], equals(i));
        expect(p[pinv[i]], equals(i));
      }
    });

    test('Test 3', () {
      var sample = [5, 4, 3, 2, 1, 0];
      var p = Permutation(sample);
      var pinv = p.inverse();

      expect(pinv.dimension, equals(p.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(pinv[p[i]], equals(i));
        expect(p[pinv[i]], equals(i));
      }
    });

    test('Test 4', () {
      var sample = [0, 4, 3, 2, 1, 5];
      var p = Permutation(sample);
      var pinv = p.inverse();

      expect(pinv.dimension, equals(p.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(pinv[p[i]], equals(i));
        expect(p[pinv[i]], equals(i));
      }
    });

    test('Test 5', () {
      var sample = [0, 3, 2, 1, 4, 5];
      var p = Permutation(sample);
      var pinv = p.inverse();

      expect(pinv.dimension, equals(p.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(pinv[p[i]], equals(i));
        expect(p[pinv[i]], equals(i));
      }
    });
  });

  group('Can create permutation from inversions.', () {
    test('Test 1', () {
      var inv = [0];
      var idx = [0];
      var p = Permutation.fromInversions(inv);
      var q = Permutation(idx);

      expect(p.dimension, equals(q.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(p[i], equals(q[i]));
      }
    });

    test('Test 2', () {
      var inv = [0, 1, 2, 3, 4, 5];
      var idx = [0, 1, 2, 3, 4, 5];
      var p = Permutation.fromInversions(inv);
      var q = Permutation(idx);

      expect(p.dimension, equals(q.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(p[i], equals(q[i]));
      }
    });

    test('Test 3', () {
      var inv = [5, 4, 3, 3, 4, 5];
      var idx = [5, 4, 3, 2, 1, 0];
      var p = Permutation.fromInversions(inv);
      var q = Permutation(idx);

      expect(p.dimension, equals(q.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(p[i], equals(q[i]));
      }
    });

    test('Test 4', () {
      var inv = [0, 4, 3, 3, 4, 5];
      var idx = [0, 4, 3, 2, 1, 5];
      var p = Permutation.fromInversions(inv);
      var q = Permutation(idx);

      expect(p.dimension, equals(q.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(p[i], equals(q[i]));
      }
    });

    test('Test 5', () {
      var inv = [0, 3, 2, 3, 4, 5];
      var idx = [0, 3, 2, 1, 4, 5];
      var p = Permutation.fromInversions(inv);
      var q = Permutation(idx);

      expect(p.dimension, equals(q.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(p[i], equals(q[i]));
      }
    });

    test('Test 6', () {
      var inv = [2, 2, 2, 4, 4];
      var idx = [1, 2, 0, 4, 3];
      var p = Permutation.fromInversions(inv);
      var q = Permutation(idx);

      expect(p.dimension, equals(q.dimension));
      for (var i = 0; i < p.dimension; i++) {
        expect(p[i], equals(q[i]));
      }
    });
  });

  group('Can create inversions from permutation.', () {
    test('Test 1', () {
      var inv = [0];
      var idx = [0];
      var q = Permutation(idx);
      var p = q.toInversions();

      expect(p.length, equals(inv.length));
      for (var i = 0; i < q.dimension; i++) {
        expect(p[i], equals(inv[i]));
      }
    });

    test('Test 2', () {
      var inv = [0, 1, 2, 3, 4, 5];
      var idx = [0, 1, 2, 3, 4, 5];
      var q = Permutation(idx);
      var p = q.toInversions();

      expect(p.length, equals(inv.length));
      for (var i = 0; i < q.dimension; i++) {
        expect(p[i], equals(inv[i]));
      }
    });

    test('Test 3', () {
      var inv = [5, 4, 3, 3, 4, 5];
      var idx = [5, 4, 3, 2, 1, 0];
      var q = Permutation(idx);
      var p = q.toInversions();

      expect(p.length, equals(inv.length));
      for (var i = 0; i < q.dimension; i++) {
        expect(p[i], equals(inv[i]));
      }
    });

    test('Test 4', () {
      var inv = [0, 4, 3, 3, 4, 5];
      var idx = [0, 4, 3, 2, 1, 5];
      var q = Permutation(idx);
      var p = q.toInversions();

      expect(p.length, equals(inv.length));
      for (var i = 0; i < q.dimension; i++) {
        expect(p[i], equals(inv[i]));
      }
    });

    test('Test 5', () {
      var inv = [0, 3, 2, 3, 4, 5];
      var idx = [0, 3, 2, 1, 4, 5];
      var q = Permutation(idx);
      var p = q.toInversions();

      expect(p.length, equals(inv.length));
      for (var i = 0; i < q.dimension; i++) {
        expect(p[i], equals(inv[i]));
      }
    });

    test('Test 6', () {
      var inv = [2, 2, 2, 4, 4];
      var idx = [1, 2, 0, 4, 3];
      var q = Permutation(idx);
      var p = q.toInversions();

      expect(p.length, equals(inv.length));
      for (var i = 0; i < q.dimension; i++) {
        expect(p[i], equals(inv[i]));
      }
    });
  });
}
