import 'package:test/test.dart';

import 'package:dart_numerics/dart_numerics.dart';

void main() {
  group("Polynomial", () {
    group("static double evaluate(double, List<double>)", () {
      test("Test 1", () {
        const List<double> c = const [];
        const double z = 0;
        const double expected = 0;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 2", () {
        const List<double> c = const [];
        const double z = 123;
        const double expected = 0;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 3", () {
        const List<double> c = const [0];
        const double z = 0;
        const double expected = 0;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 4", () {
        const List<double> c = const [0];
        const double z = 123;
        const double expected = 0;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 5", () {
        const List<double> c = const [1];
        const double z = 0;
        const double expected = 1;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 6", () {
        const List<double> c = const [1];
        const double z = 123;
        const double expected = 1;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 7", () {
        const List<double> c = const [2];
        const double z = 0;
        const double expected = 2;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 8", () {
        const List<double> c = const [2];
        const double z = 123;
        const double expected = 2;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 9", () {
        const List<double> c = const [1, 2];
        const double z = 0;
        const double expected = 1;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 10", () {
        const List<double> c = const [1, 2];
        const double z = 3;
        const double expected = 7;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 11", () {
        const List<double> c = const [1, 2, 3];
        const double z = 0;
        const double expected = 1;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });

      test("Test 11", () {
        const List<double> c = const [1, 2, 3];
        const double z = 4;
        const double expected = 57;

        var actual = Polynomial.evaluate(z, c);
        expect(actual, equals(expected));
      });
    });
  });
}
