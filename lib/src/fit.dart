import 'package:tuple/tuple.dart';

import 'linear_regression/simple_regression.dart';

/// Least-Squares fitting the points (x,y) to a line y : x -> a+b*x,
/// returning its best fitting parameters as [a, b] array,
/// where a is the intercept and b the slope.
Tuple2<double, double> line(List<double> x, List<double> y) => fit(x, y);

/// Least-Squares fitting the points (x,y) to a line y : x -> a+b*x,
/// returning a function y' for the best fitting line.
double Function(double) lineFunc(List<double> x, List<double> y) {
  var parameters = fit(x, y);
  double intercept = parameters.item1, slope = parameters.item2;
  return (z) => intercept + slope * z;
}

/// Least-Squares fitting the points (x,y) to a line through origin y : x -> b*x,
/// returning its best fitting parameter b,
/// where the intercept is zero and b the slope.
double lineThroughOrigin(List<double> x, List<double> y) =>
    fitThroughOrigin(x, y);

/// Least-Squares fitting the points (x,y) to a line through origin y : x -> b*x,
/// returning a function y' for the best fitting line.
double Function(double) lineThroughOriginFunc(List<double> x, List<double> y) {
  double slope = fitThroughOrigin(x, y);
  return (z) => slope * z;
}
