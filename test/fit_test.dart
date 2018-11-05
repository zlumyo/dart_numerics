import 'package:test/test.dart';
import 'package:tuple/tuple.dart';

import 'package:dart_numerics/dart_numerics.dart';

void main() {
  test('Fits to exact line when points are on line', () {
    var x = [30.0, 40.0, 50.0, 12.0, -3.4, 100.5];
    var y = x.map((z) => 4.0 - 1.5*z).toList();

    var resp = line(x, y);
    expect(almostEqualD(4.0, resp.item1, 1e-12), isTrue);
    expect(almostEqualD(-1.5, resp.item2, 1e-12), isTrue);

    var resf = lineFunc(x, y);
    for (var z in List<double>.generate(10, (i) => i - 3.0)) {
      expect(almostEqualD(4.0 - 1.5*z, resf(z), 1e-12), isTrue);
    }
  });

  test('Fits to best line', () {
    // Mathematica: Fit[{{1,4.986},{2,2.347},{3,2.061},{4,-2.995},{5,-2.352},{6,-5.782}}, {1, x}, x]
    // -> 7.01013 - 2.08551*x

    var x = List<double>.generate(6, (i) => i + 1.0).toList();
    var y = [4.986, 2.347, 2.061, -2.995, -2.352, -5.782];

    var resp = line(x, y);
    expect(almostEqualD(7.01013, resp.item1, 1e-4), isTrue);
    expect(almostEqualD(-2.08551, resp.item2, 1e-4), isTrue);

    var resf = lineFunc(x, y);
    for (var z in List<double>.generate(10, (i) => i - 3.0)) {
      expect(almostEqualD(7.01013 - 2.08551 * z, resf(z), 1e-4), isTrue);
    }
  });

  test('Fits to best line through origin', () {
    // Mathematica: Fit[{{1,4.986},{2,2.347},{3,2.061},{4,-2.995},{5,-2.352},{6,-5.782}}, {x}, x]
    // -> -0.467791 x

    var x = List<double>.generate(6, (i) => i + 1.0).toList();
    var y = [4.986, 2.347, 2.061, -2.995, -2.352, -5.782];

    var resp = lineThroughOrigin(x, y);
    expect(almostEqualD(-0.467791, resp, 1e-4), isTrue);

    var resf = lineThroughOriginFunc(x, y);
    for (var z in List<double>.generate(10, (i) => i - 3.0)) {
      expect(almostEqualD(-0.467791 * z, resf(z), 1e-4), isTrue);
    }

    var respSeq = List.filled(x.length, Tuple2<double, double>(0.0,0.0));
    for(int i = 0; i < x.length; i++) {
      respSeq[i] = Tuple2(x[i], y[i]);
    }
    expect(almostEqualD(-0.467791, fitThroughOriginFromMany(respSeq), 1e-4), isTrue);
  });

  test('Fits to line same as excel TrendLine', () {
    // X	Y
    // 1   0.2
    // 2   0.3
    // 4   1.3
    // 6   4.2
    // -> y = -1.078 + 0.7932*x

    var x = [1.0, 2.0, 4.0, 6.0];
    var y = [0.2, 0.3, 1.3, 4.2];

    var resp = line(x, y);
    expect(almostEqualD(-1.078, resp.item1, 1e-3), isTrue);

    var resf = lineFunc(x, y);
    for (var z in List<double>.generate(10, (i) => i - 3.0)) {
      expect(almostEqualD(-1.078 + 0.7932*z, resf(z), 1e-2), isTrue);
    }
  });
}
