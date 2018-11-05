import 'package:test/test.dart';

import 'package:dart_numerics/src/constants.dart' as constants;
import 'package:dart_numerics/src/trigonometry.dart' as trig;

import 'assert_helpers.dart';

void main() {
  group('Can compute cosecant', () {
    test('Test 1', () {
      var actual = trig.csc(0.0);
      almostEqualRelative(double.infinity, actual, 12);
    });

    test('Test 2', () {
      var actual = trig.csc(8388608.0);
      almostEqualRelative(2.3134856195559191, actual, 12);
    });

    test('Test 3', () {
      var actual = trig.csc(1.19209289550780998537e-7);
      almostEqualRelative(8388608.0000000376, actual, 12);
    });

    test('Test 4', () {
      var actual = trig.csc(-8388608.0);
      almostEqualRelative(-2.3134856195559191, actual, 12);
    });

    test('Test 5', () {
      var actual = trig.csc(-1.19209289550780998537e-7);
      almostEqualRelative(-8388608.0000000376, actual, 12);
    });
  });

  group('Can compute cosine', () {
    test('Test 1', () {
      var actual = trig.cos(0.0);
      almostEqualRelative(1.0, actual, 13);
    });

    test('Test 2', () {
      var actual = trig.cos(8388608.0);
      almostEqualRelative(-0.90175467375875928, actual, 13);
    });

    test('Test 3', () {
      var actual = trig.cos(1.19209289550780998537e-7);
      almostEqualRelative(0.99999999999999289, actual, 13);
    });

    test('Test 4', () {
      var actual = trig.cos(-8388608.0);
      almostEqualRelative(-0.90175467375875928, actual, 13);
    });

    test('Test 5', () {
      var actual = trig.cos(-1.19209289550780998537e-7);
      almostEqualRelative(0.99999999999999289, actual, 13);
    });
  });

  group('Can compute cotangent', () {
    test('Test 1', () {
      var actual = trig.cot(0.0);
      almostEqualRelative(double.infinity, actual, 12);
    });

    test('Test 2', () {
      var actual = trig.cot(8388608.0);
      almostEqualRelative(-2.086196470108229, actual, 12);
    });

    test('Test 3', () {
      var actual = trig.cot(1.19209289550780998537e-7);
      almostEqualRelative(8388607.999999978, actual, 12);
    });

    test('Test 4', () {
      var actual = trig.cot(-8388608.0);
      almostEqualRelative(2.086196470108229, actual, 12);
    });

    test('Test 5', () {
      var actual = trig.cot(-1.19209289550780998537e-7);
      almostEqualRelative(-8388607.999999978, actual, 12);
    });
  });

  group('Can compute hyperbolic cosecant', () {
    test('Test 1', () {
      var actual = trig.csch(0.0);
      almostEqualRelative(double.infinity, actual, 14);
    });

    test('Test 2', () {
      var actual = trig.csch(8388608.0);
      almostEqualRelative(1.3670377960148449e-3643126, actual, 14);
    });

    test('Test 3', () {
      var actual = trig.csch(1.19209289550780998537e-7);
      almostEqualRelative(8388607.9999999978, actual, 14);
    });

    test('Test 4', () {
      var actual = trig.csch(-8388608.0);
      almostEqualRelative(-1.3670377960148449e-3643126, actual, 14);
    });

    test('Test 5', () {
      var actual = trig.csch(-1.19209289550780998537e-7);
      almostEqualRelative(-8388607.9999999978, actual, 14);
    });
  });

  group('Can compute hyperbolic cosine', () {
    test('Test 1', () {
      var actual = trig.cosh(0.0);
      almostEqualRelative(1.0, actual, 15);
    });

    test('Test 2', () {
      var actual = trig.cosh(8388608.0);
      almostEqualRelative(double.infinity, actual, 15);
    });

    test('Test 3', () {
      var actual = trig.cosh(1.19209289550780998537e-7);
      almostEqualRelative(1.0000000000000071, actual, 15);
    });

    test('Test 4', () {
      var actual = trig.cosh(-8388608.0);
      almostEqualRelative(double.infinity, actual, 15);
    });

    test('Test 5', () {
      var actual = trig.cosh(-1.19209289550780998537e-7);
      almostEqualRelative(1.0000000000000071, actual, 15);
    });
  });

  group('Can compute hyperbolic cotangent', () {
    test('Test 1', () {
      var actual = trig.coth(0.0);
      almostEqualRelative(double.infinity, actual, 14);
    });

    test('Test 2', () {
      var actual = trig.coth(8388608.0);
      almostEqualRelative(1.0, actual, 14);
    });

    test('Test 3', () {
      var actual = trig.coth(1.19209289550780998537e-7);
      almostEqualRelative(8388608.0000000574, actual, 14);
    });

    test('Test 4', () {
      var actual = trig.coth(-8388608.0);
      almostEqualRelative(-1.0, actual, 14);
    });

    test('Test 5', () {
      var actual = trig.coth(-1.19209289550780998537e-7);
      almostEqualRelative(-8388608.0000000574, actual, 14);
    });
  });

  group('Can compute hyperbolic secant', () {
    test('Test 1', () {
      var actual = trig.sech(0.0);
      almostEqualRelative(1.0, actual, 15);
    });

    test('Test 2', () {
      var actual = trig.sech(8388608.0);
      almostEqualRelative(1.3670377960148449e-3643126, actual, 15);
    });

    test('Test 3', () {
      var actual = trig.sech(1.19209289550780998537e-7);
      almostEqualRelative(0.99999999999999289, actual, 15);
    });

    test('Test 4', () {
      var actual = trig.sech(-8388608.0);
      almostEqualRelative(1.3670377960148449e-3643126, actual, 15);
    });

    test('Test 5', () {
      var actual = trig.sech(-1.19209289550780998537e-7);
      almostEqualRelative(0.99999999999999289, actual, 15);
    });
  });

  group('Can compute hyperbolic sine', () {
    test('Test 1', () {
      var actual = trig.sinh(8388608.0);
      almostEqualRelative(double.infinity, actual, 15);
    });

    test('Test 2', () {
      var actual = trig.sinh(1.19209289550780998537e-7);
      almostEqualRelative(1.1920928955078128e-7, actual, 15);
    });

    test('Test 3', () {
      var actual = trig.sinh(-8388608.0);
      almostEqualRelative(double.negativeInfinity, actual, 15);
    });

    test('Test 4', () {
      var actual = trig.sinh(-1.19209289550780998537e-7);
      almostEqualRelative(-1.1920928955078128e-7, actual, 15);
    });
  });

  group('Can compute hyperbolic tangent', () {
    test('Test 1', () {
      var actual = trig.tanh(0.0);
      almostEqualRelative(0.0, actual, 15);
    });

    test('Test 2', () {
      var actual = trig.tanh(8388608.0);
      almostEqualRelative(1.0, actual, 15);
    });

    test('Test 3', () {
      var actual = trig.tanh(1.19209289550780998537e-7);
      almostEqualRelative(1.1920928955078043e-7, actual, 15);
    });

    test('Test 4', () {
      var actual = trig.tanh(-8388608.0);
      almostEqualRelative(-1.0, actual, 15);
    });

    test('Test 5', () {
      var actual = trig.tanh(-1.19209289550780998537e-7);
      almostEqualRelative(-1.1920928955078043e-7, actual, 15);
    });
  });

  group('Can compute inverse cosecant', () {
    test('Test 1', () {
      var actual = trig.acsc(8388608.0);
      almostEqualRelative(1.1920928955078097e-7, actual, 13);
    });

    test('Test 2', () {
      var actual = trig.acsc(1.0);
      almostEqualRelative(1.5707963267948966, actual, 13);
    });

    test('Test 3', () {
      var actual = trig.acsc(-8388608.0);
      almostEqualRelative(-1.1920928955078097e-7, actual, 13);
    });

    test('Test 4', () {
      var actual = trig.acsc(-1.0);
      almostEqualRelative(-1.5707963267948966, actual, 13);
    });
  });

  group('Can compute inverse cosine', () {
    test('Test 1', () {
      var actual = trig.acos(1.0);
      almostEqualRelative(0.0, actual, 13);
    });

    test('Test 2', () {
      var actual = trig.acos(-1.0);
      almostEqualRelative(3.1415926535897931, actual, 15);
    });

    test('Test 3', () {
      var actual = trig.acos(1.19209289550780998537e-7);
      almostEqualRelative(1.570796207585607, actual, 15);
    });

    test('Test 4', () {
      var actual = trig.acos(-1.19209289550780998537e-7);
      almostEqualRelative(1.5707964460041861, actual, 15);
    });
  });

  group('Can compute inverse cotangent', () {
    test('Test 1', () {
      var actual = trig.acot(0.0);
      almostEqualRelative(1.5707963267948966, actual, 14);
    });

    test('Test 2', () {
      var actual = trig.acot(8388608.0);
      almostEqualRelative(1.1920928955078069e-7, actual, 14);
    });

    test('Test 3', () {
      var actual = trig.acot(1.19209289550780998537e-7);
      almostEqualRelative(1.5707962075856071, actual, 14);
    });

    test('Test 4', () {
      var actual = trig.acot(-8388608.0);
      almostEqualRelative(-1.1920928955078069e-7, actual, 14);
    });

    test('Test 5', () {
      var actual = trig.acot(-1.19209289550780998537e-7);
      almostEqualRelative(-1.5707962075856071, actual, 14);
    });
  });

  group('Can compute inverse hyperbolic cosecant', () {
    test('Test 1', () {
      var actual = trig.acsch(0.0);
      almostEqualRelative(double.infinity, actual, 14);
    });

    test('Test 2', () {
      var actual = trig.acsch(8388608.0);
      almostEqualRelative(1.1920928955078097e-7, actual, 14);
    });

    test('Test 3', () {
      var actual = trig.acsch(1.19209289550780998537e-7);
      almostEqualRelative(16.635532333438693, actual, 14);
    });

    test('Test 4', () {
      var actual = trig.acsch(-8388608.0);
      almostEqualRelative(-1.1920928955078097e-7, actual, 14);
    });

    test('Test 5', () {
      var actual = trig.acsch(-1.19209289550780998537e-7);
      almostEqualRelative(-16.635532333438693, actual, 14);
    });
  });

  group('Can compute inverse hyperbolic cosine', () {
    test('Test 1', () {
      var actual = trig.acosh(1.0);
      almostEqualRelative(0.0, actual, 14);
    });

    test('Test 2', () {
      var actual = trig.acosh(8388608.0);
      almostEqualRelative(16.635532333438682, actual, 14);
    });

    test('Test 3', () {
      var actual = trig.acosh(1.7976931348623157E+308);
      almostEqualRelative(710.47586007394394203711, actual, 14);
    });
  });

  group('Can compute inverse hyperbolic cotangent', () {
    test('Test 1', () {
      var actual = trig.acoth(8388608.0);
      almostEqualRelative(1.1920928955078181e-7, actual, 13);
    });

    test('Test 2', () {
      var actual = trig.acoth(-8388608.0);
      almostEqualRelative(-1.1920928955078181e-7, actual, 13);
    });

    test('Test 3', () {
      var actual = trig.acoth(1.0);
      almostEqualRelative(double.infinity, actual, 13);
    });

    test('Test 4', () {
      var actual = trig.acoth(-1.0);
      almostEqualRelative(double.negativeInfinity, actual, 13);
    });
  });

  group('Can compute inverse hyperbolic secant', () {
    test('Test 1', () {
      var actual = trig.asech(0.0);
      almostEqualRelative(double.infinity, actual, 14);
    });

    test('Test 2', () {
      var actual = trig.asech(0.5);
      almostEqualRelative(1.3169578969248167, actual, 14);
    });

    test('Test 3', () {
      var actual = trig.asech(1.0);
      almostEqualRelative(0.0, actual, 14);
    });
  });

  group('Can compute inverse hyperbolic sine', () {
    test('Test 1', () {
      var actual = trig.asinh(0.0);
      almostEqualRelative(0.0, actual, 14);
    });

    test('Test 2', () {
      var actual = trig.asinh(8388608.0);
      almostEqualRelative(16.63553233343869, actual, 14);
    });

    test('Test 3', () {
      var actual = trig.asinh(-8388608.0);
      almostEqualRelative(-16.63553233343869, actual, 14);
    });

    test('Test 4', () {
      var actual = trig.asinh(1.19209289550780998537e-7);
      almostEqualRelative(1.1920928955078072e-7, actual, 14);
    });

    test('Test 5', () {
      var actual = trig.asinh(-1.19209289550780998537e-7);
      almostEqualRelative(-1.1920928955078072e-7, actual, 14);
    });

    test('Test 6', () {
      var actual = trig.asinh(1.7976931348623157E+308);
      almostEqualRelative(710.47586007394394203711, actual, 14);
    });

    test('Test 7', () {
      var actual = trig.asinh(-1.7976931348623157E+308);
      almostEqualRelative(-710.47586007394394203711, actual, 14);
    });
  });

  group('Can compute inverse hyperbolic tangent', () {
    test('Test 1', () {
      var actual = trig.atanh(0.0);
      almostEqualRelative(0.0, actual, 13);
    });

    test('Test 2', () {
      var actual = trig.atanh(1.0);
      almostEqualRelative(double.infinity, actual, 13);
    });

    test('Test 3', () {
      var actual = trig.atanh(-1.0);
      almostEqualRelative(double.negativeInfinity, actual, 13);
    });

    test('Test 4', () {
      var actual = trig.atanh(1.19209289550780998537e-7);
      almostEqualRelative(1.19209289550780998537e-7, actual, 13);
    });

    test('Test 5', () {
      var actual = trig.atanh(-1.19209289550780998537e-7);
      almostEqualRelative(-1.19209289550780998537e-7, actual, 13);
    });
  });

  group('Can compute inverse secant', () {
    test('Test 1', () {
      var actual = trig.asec(8388608.0);
      almostEqualRelative(1.5707962075856071, actual, 14);
    });

    test('Test 2', () {
      var actual = trig.asec(-8388608.0);
      almostEqualRelative(1.5707964460041862, actual, 14);
    });

    test('Test 3', () {
      var actual = trig.asec(1.0);
      almostEqualRelative(0.0, actual, 14);
    });

    test('Test 4', () {
      var actual = trig.asec(-1.0);
      almostEqualRelative(3.1415926535897932, actual, 14);
    });
  });

  group('Can compute inverse sine', () {
    test('Test 1', () {
      var actual = trig.asin(0.0);
      almostEqualRelative(0.0, actual, 14);
    });

    test('Test 2', () {
      var actual = trig.asin(1.0);
      almostEqualRelative(1.5707963267948966, actual, 14);
    });

    test('Test 3', () {
      var actual = trig.asin(-1.0);
      almostEqualRelative(-1.5707963267948966, actual, 14);
    });

    test('Test 4', () {
      var actual = trig.asin(1.19209289550780998537e-7);
      almostEqualRelative(1.1920928955078128e-7, actual, 14);
    });

    test('Test 5', () {
      var actual = trig.asin(-1.19209289550780998537e-7);
      almostEqualRelative(-1.1920928955078128e-7, actual, 14);
    });
  });

  group('Can compute inverse tangent', () {
    test('Test 1', () {
      var actual = trig.atan(0.0);
      almostEqualRelative(0.0, actual, 13);
    });

    test('Test 2', () {
      var actual = trig.atan(8388608.0);
      almostEqualRelative(1.570796207585607, actual, 13);
    });

    test('Test 3', () {
      var actual = trig.atan(-8388608.0);
      almostEqualRelative(-1.570796207585607, actual, 13);
    });

    test('Test 4', () {
      var actual = trig.atan(1.19209289550780998537e-7);
      almostEqualRelative(1.19209289550780998537e-7, actual, 13);
    });

    test('Test 5', () {
      var actual = trig.atan(-1.19209289550780998537e-7);
      almostEqualRelative(-1.19209289550780998537e-7, actual, 13);
    });
  });

  group('Can compute secant', () {
    test('Test 1', () {
      var actual = trig.sec(0.0);
      almostEqualRelative(1.0, actual, 13);
    });

    test('Test 2', () {
      var actual = trig.sec(8388608.0);
      almostEqualRelative(-1.1089490624226292, actual, 13);
    });

    test('Test 3', () {
      var actual = trig.sec(1.19209289550780998537e-7);
      almostEqualRelative(1.0000000000000071, actual, 13);
    });

    test('Test 4', () {
      var actual = trig.sec(-8388608.0);
      almostEqualRelative(-1.1089490624226292, actual, 13);
    });

    test('Test 5', () {
      var actual = trig.sec(-1.19209289550780998537e-7);
      almostEqualRelative(1.0000000000000071, actual, 13);
    });
  });

  group('Can compute sine', () {
    test('Test 1', () {
      var actual = trig.sin(0.0);
      almostEqualRelative(0.0, actual, 12);
    });

    test('Test 2', () {
      var actual = trig.sin(8388608.0);
      almostEqualRelative(0.43224820225679778, actual, 12);
    });

    test('Test 3', () {
      var actual = trig.sin(1.19209289550780998537e-7);
      almostEqualRelative(1.1920928955078072e-7, actual, 12);
    });

    test('Test 4', () {
      var actual = trig.sin(-8388608.0);
      almostEqualRelative(-0.43224820225679778, actual, 12);
    });

    test('Test 5', () {
      var actual = trig.sin(-1.19209289550780998537e-7);
      almostEqualRelative(-1.1920928955078072e-7, actual, 12);
    });
  });

  group('Can compute tangent', () {
    test('Test 1', () {
      var actual = trig.tan(0.0);
      almostEqualRelative(0.0, actual, 12);
    });

    test('Test 2', () {
      var actual = trig.tan(8388608.0);
      almostEqualRelative(-0.47934123862654288, actual, 12);
    });

    test('Test 3', () {
      var actual = trig.tan(1.19209289550780998537e-7);
      almostEqualRelative(1.1920928955078157e-7, actual, 12);
    });

    test('Test 4', () {
      var actual = trig.tan(-8388608.0);
      almostEqualRelative(0.47934123862654288, actual, 12);
    });

    test('Test 5', () {
      var actual = trig.tan(-1.19209289550780998537e-7);
      almostEqualRelative(-1.1920928955078157e-7, actual, 12);
    });
  });

  test('Can convert degree to grad', () {
    almostEqualRelative(90 / .9, trig.degreeToGrad(90.0), 15);
  });

  test('Can convert degree to radian', () {
    almostEqualRelative(constants.pi / 2, trig.degreeToRadian(90.0), 15);
  });

  test('Can convert grad to degree', () {
    almostEqualRelative(180.0, trig.gradToDegree(200.0), 15);
  });

  test('Can convert grad to radian', () {
    almostEqualRelative(constants.pi, trig.gradToRadian(200.0), 15);
  });

  test('Can convert radian to degree', () {
    almostEqualRelative(60.0, trig.radianToDegree(constants.pi / 3.0), 14);
  });

  test('Can convert radian to grad', () {
    almostEqualRelative(200.0 / 3.0, trig.radianToGrad(constants.pi / 3.0), 14);
  });
}
