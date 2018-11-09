import 'dart:math';

import 'package:test/test.dart';
import 'package:dart_numerics/dart_numerics.dart';

import '../assert_helpers.dart';

void main() {
  group('Matches MATLAB and R expint E1', () {
    test('Test 1', () {
      double x = 0.001;
      double result = 6.33153936413614904;

      double actual = exponentialIntegral(x, 1);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 2', () {
      double x = 0.1;
      double result = 1.82292395841939059;

      double actual = exponentialIntegral(x, 1);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 3', () {
      double x = 1.0;
      double result = 0.219383934395520286;

      double actual = exponentialIntegral(x, 1);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 4', () {
      double x = 2.0;
      double result = 0.0489005107080611248;

      double actual = exponentialIntegral(x, 1);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 5', () {
      double x = 2.5;
      double result = 0.0249149178702697399;

      double actual = exponentialIntegral(x, 1);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 6', () {
      double x = 10.0;
      double result = 4.15696892968532464e-06;

      double actual = exponentialIntegral(x, 1);
      almostEqualRelative(result, actual, 13);
    });
  });

  group('Matches MATLAB and R expint E2', () {
    test('Test 1', () {
      double x = 0.001;
      double result = 0.992668960469238915;

      double actual = exponentialIntegral(x, 2);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 2', () {
      double x = 0.1;
      double result = 0.722545022194020392;

      double actual = exponentialIntegral(x, 2);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 3', () {
      double x = 1.0;
      double result = 0.148495506775922048;

      double actual = exponentialIntegral(x, 2);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 4', () {
      double x = 2.0;
      double result = 0.0375342618204904527;

      double actual = exponentialIntegral(x, 2);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 5', () {
      double x = 10.0;
      double result = 3.830240465631608e-06;

      double actual = exponentialIntegral(x, 2);
      almostEqualRelative(result, actual, 13);
    });
  });

  group('Special case EXP Matches from R expint E0', () {
    test('Test 1', () {
      double x = 0.001;
      double result = 999.000499833375;

      double actual = exponentialIntegral(x, 0);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 2', () {
      double x = 0.1;
      double result = 9.048374180359595;

      double actual = exponentialIntegral(x, 0);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 3', () {
      double x = 1.0;
      double result = 0.3678794411714423;

      double actual = exponentialIntegral(x, 0);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 4', () {
      double x = 2.0;
      double result = 0.06766764161830635;

      double actual = exponentialIntegral(x, 0);
      almostEqualRelative(result, actual, 13);
    });

    test('Test 5', () {
      double x = 10.0;
      double result = 4.539992976248485e-06;

      double actual = exponentialIntegral(x, 0);
      almostEqualRelative(result, actual, 13);
    });
  });
}
