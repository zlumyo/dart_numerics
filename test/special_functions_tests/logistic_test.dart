import 'package:test/test.dart';
import 'package:dart_numerics/dart_numerics.dart';

import '../assert_helpers.dart';

void main() {
  group('Logistic function.', () {
    test('Test 1', () {
      double p = double.negativeInfinity;
      double x = 0.0;
      almostEqualRelative(x, logistic(p), 14);
    });

    test('Test 2', () {
      double p = -11.512915464920228103874353849992239636376994324587;
      double x = 0.00001;
      almostEqualRelative(x, logistic(p), 14);
    });

    test('Test 3', () {
      double p = -6.9067547786485535272274487616830597875179908939086;
      double x = 0.001;
      almostEqualRelative(x, logistic(p), 14);
    });

    test('Test 4', () {
      double p = -2.1972245773362193134015514347727700402304323440139;
      double x = 0.1;
      almostEqualRelative(x, logistic(p), 14);
    });

    test('Test 5', () {
      double p = 0.0;
      double x = 0.5;
      almostEqualRelative(x, logistic(p), 14);
    });

    test('Test 6', () {
      double p = 2.1972245773362195801634726294284168954491240598975;
      double x = 0.9;
      almostEqualRelative(x, logistic(p), 14);
    });

    test('Test 7', () {
      double p = 6.9067547786485526081487245019905638981131702804661;
      double x = 0.999;
      almostEqualRelative(x, logistic(p), 14);
    });

    test('Test 8', () {
      double p = 11.512915464924779098232747799811946290419057060965;
      double x = 0.99999;
      almostEqualRelative(x, logistic(p), 14);
    });

    test('Test 9', () {
      double p = double.infinity;
      double x = 1.0;
      almostEqualRelative(x, logistic(p), 14);
    });
  });

  group('Logit function.', () {
    test('Test 1', () {
      double x = double.negativeInfinity;
      double p = 0.0;
      almostEqualRelative(x, logit(p), 15);
    });

    test('Test 2', () {
      double x = -11.512915464920228103874353849992239636376994324587;
      double p = 0.00001;
      almostEqualRelative(x, logit(p), 15);
    });

    test('Test 3', () {
      double x = -6.9067547786485535272274487616830597875179908939086;
      double p = 0.001;
      almostEqualRelative(x, logit(p), 15);
    });

    test('Test 4', () {
      double x = -2.1972245773362193134015514347727700402304323440139;
      double p = 0.1;
      almostEqualRelative(x, logit(p), 15);
    });

    test('Test 5', () {
      double x = 0.0;
      double p = 0.5;
      almostEqualRelative(x, logit(p), 15);
    });

    test('Test 6', () {
      double x = 2.1972245773362195801634726294284168954491240598975;
      double p = 0.9;
      almostEqualRelative(x, logit(p), 15);
    });

    test('Test 7', () {
      double x = 6.9067547786485526081487245019905638981131702804661;
      double p = 0.999;
      almostEqualRelative(x, logit(p), 15);
    });

    test('Test 8', () {
      double x = 11.512915464924779098232747799811946290419057060965;
      double p = 0.99999;
      almostEqualRelative(x, logit(p), 15);
    });

    test('Test 9', () {
      double x = double.infinity;
      double p = 1.0;
      almostEqualRelative(x, logit(p), 15);
    });
  });
}
