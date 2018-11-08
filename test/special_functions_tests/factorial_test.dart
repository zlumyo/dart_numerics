import 'dart:math';

import 'package:test/test.dart';
import 'package:dart_numerics/dart_numerics.dart';

import '../assert_helpers.dart';

void main() {
  group('Can compute factorial.', () {
    var factorial = 1.0;

    test('exact', () {
      for (var i = 1; i < 23; i++) {
        factorial *= i;
        almostEqualRelative(factorial, factorialD(i), 14);
        almostEqualRelative(log(factorial), factorialLn(i), 14);
      }
    });

    test('approximation', () {
      for (var i = 23; i < 171; i++) {
        factorial *= i;
        almostEqualRelative(factorial, factorialD(i), 14);
        almostEqualRelative(log(factorial), factorialLn(i), 14);
      }
    });
  });

  group('Throws ArgumentError on a negative argument.', () {
    test('Test 1', () {
      expect(() => factorialD(int64MinValue), throwsArgumentError);
    });

    test('Test 2', () {
      expect(() => factorialD(-1), throwsArgumentError);
    });

    test('Test 3', () {
      expect(() => factorialLn(-1), throwsArgumentError);
    });
  });

  group('Factorial overflows to infinity.', () {
    test('Test 1', () {
      expect(factorialD(172), equals(double.infinity));
    });

    test('Test 2', () {
      expect(factorialD(int64MaxValue), equals(double.infinity));
    });
  });

  group('Log factorial does not overflows.', () {
    test('Test 1', () {
      almostEqualRelative(6078.2118847500501140, factorialLn(1 << 10), 14);
    });

    test('Test 2', () {
      almostEqualRelative(29978.648060844048236, factorialLn(1 << 12), 14);
    });

    test('Test 3', () {
      almostEqualRelative(307933.81973375485425, factorialLn(1 << 15), 14);
    });

    test('Test 4', () {
      almostEqualRelative(1413421.9939462073242, factorialLn(1 << 17), 14);
    });
  });

  group('Can compute binomial.', () {
    test('Test 1', () {
      almostEqualRelative(1.0, binomial(1, 1), 14);
    });

    test('Test 2', () {
      almostEqualRelative(10.0, binomial(5, 2), 14);
    });

    test('Test 3', () {
      almostEqualRelative(35.0, binomial(7, 3), 14);
    });

    test('Test 4', () {
      almostEqualRelative(1.0, binomial(1, 0), 14);
    });

    test('Test 5', () {
      almostEqualRelative(0.0, binomial(0, 1), 14);
    });

    test('Test 6', () {
      almostEqualRelative(0.0, binomial(5, 7), 14);
    });

    test('Test 7', () {
      almostEqualRelative(0.0, binomial(5, -7), 14);
    });
  });

  group('Can compute log binomial.', () {
    test('Test 1', () {
      almostEqualRelative(log(1.0), binomialLn(1, 1), 14);
    });

    test('Test 2', () {
      almostEqualRelative(log(10.0), binomialLn(5, 2), 14);
    });

    test('Test 3', () {
      almostEqualRelative(log(35.0), binomialLn(7, 3), 14);
    });

    test('Test 4', () {
      almostEqualRelative(log(1.0), binomialLn(1, 0), 14);
    });

    test('Test 5', () {
      almostEqualRelative(log(0.0), binomialLn(0, 1), 14);
    });

    test('Test 6', () {
      almostEqualRelative(log(0.0), binomialLn(5, 7), 14);
    });

    test('Test 7', () {
      almostEqualRelative(log(0.0), binomialLn(5, -7), 14);
    });
  });

  group('Can compute log binomial.', () {
    test('Test 1', () {
      almostEqualRelative(1.0, multinomial(1, [1, 0]), 14);
    });

    test('Test 2', () {
      almostEqualRelative(10.0, multinomial(5, [3, 2]), 14);
    });

    test('Test 3', () {
      almostEqualRelative(10.0, multinomial(5, [2, 3]), 14);
    });

    test('Test 4', () {
      almostEqualRelative(35.0, multinomial(7, [3, 4]), 14);
    });
  });
}
