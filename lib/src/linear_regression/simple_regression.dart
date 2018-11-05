import 'package:tuple/tuple.dart';

import '../error_messages.dart' as messages;
import '../utils.dart';

/// Least-Squares fitting the points (x,y) to a line y : x -> a+b*x,
/// returning its best fitting parameters as (a, b) tuple,
/// where a is the intercept and b the slope.
Tuple2<double, double> fit(List<double> x, List<double> y) {
  if (x.length != y.length) {
    throw ArgumentError(messages.sampleVectorsSameLength);
  }

  if (x.length <= 1) {
    throw ArgumentError(messages.regressionNotEnoughSamples);
  }

  // First Pass: Mean (Less robust but faster than ArrayStatistics.Mean)
  double mx = 0.0;
  double my = 0.0;
  for (int i = 0; i < x.length; i++) {
    mx += x[i];
    my += y[i];
  }

  mx /= x.length;
  my /= y.length;

  // Second Pass: Covariance/Variance
  double covariance = 0.0;
  double variance = 0.0;
  for (int i = 0; i < x.length; i++) {
    double diff = x[i] - mx;
    covariance += diff*(y[i] - my);
    variance += diff*diff;
  }

  var b = covariance/variance;
  return Tuple2<double, double>(my - b*mx, b);
}

/// Least-Squares fitting the points (x,y) to a line y : x -> a+b*x,
/// returning its best fitting parameters as (a, b) tuple,
/// where a is the intercept and b the slope.
Tuple2<double, double> fitFromMany(Iterable<Tuple2<double, double>> samples) {
  var xy = unpackSinglePass(samples);
  return fit(xy.item1, xy.item2);
}

/// Least-Squares fitting the points (x,y) to a line y : x -> b*x,
/// returning its best fitting parameter b,
/// where the intercept is zero and b the slope.
double fitThroughOrigin(List<double> x, List<double> y) {
  if (x.length != y.length) {
    throw ArgumentError(messages.sampleVectorsSameLength);
  }

  if (x.length <= 1) {
    throw ArgumentError(messages.regressionNotEnoughSamples);
  }

  double mxy = 0.0;
  double mxx = 0.0;
  for (int i = 0; i < x.length; i++) {
    mxx += x[i]*x[i];
    mxy += x[i]*y[i];
  }

  return mxy / mxx;
}

/// Least-Squares fitting the points (x,y) to a line y : x -> b*x,
/// returning its best fitting parameter b,
/// where the intercept is zero and b the slope.
double fitThroughOriginFromMany(Iterable<Tuple2<double, double>> samples) {
  double mxy = 0.0;
  double mxx = 0.0;

  for (var sample in samples) {
    mxx += sample.item1 * sample.item1;
    mxy += sample.item1 * sample.item2;
  }

  return mxy / mxx;
}
