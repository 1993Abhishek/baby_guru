import 'dart:collection';
import 'app_view_helper.dart';

import 'size_config.dart';

class AppDimenHelper {
  static AppDimenHelper _singleton = new AppDimenHelper._internal();

  factory AppDimenHelper() {
    return _singleton;
  }

  AppDimenHelper._internal();

  init() {
    _generateHorizontalDimens();
    _generateVerticalDimens();
  }

  ///HORIZONTAL SPACE scaleFactor==>4.23
  final double _horizontalScaleFactor = 4.23;

  _generateHorizontalDimens() {
    for (int i = 0; i < _sizes.length; i++) {
      double generatedSize =
          (_sizes[i] / _horizontalScaleFactor) * SizeConfig.safeBlockHorizontal;
      appPrint("Horizontal Dimen ${_sizes[i]} => $generatedSize",
          fromClass: AppDimenHelper, printOn: false);
      _mapHorizontalDimens[_sizes[i]] = generatedSize;
    }
  }

  ///Vertical SPACE scaleFactor==>7.76
  final double _verticalScaleFactor = 7.76;

  _generateVerticalDimens() {
    for (int i = 0; i < _sizes.length; i++) {
      double generatedSize =
          (_sizes[i] / _verticalScaleFactor) * SizeConfig.safeBlockVertical;
      appPrint("Vertical Dimen ${_sizes[i]} => $generatedSize",
          fromClass: AppDimenHelper, printOn: false);
      _mapVerticalDimens[_sizes[i]] = generatedSize;
    }
  }
}

double hDimen(int dimen) {
  if (!_mapHorizontalDimens.containsKey(dimen)) {
    appPrintln("Failed to Create hDimen $dimen ", fromClass: AppDimenHelper);
    return dimen.toDouble();
  }
  return _mapHorizontalDimens[dimen];
}

double vDimen(int dimen) {
  if (!_mapVerticalDimens.containsKey(dimen)) {
    appPrintln("Failed to Create vDimen $dimen ", fromClass: AppDimenHelper);
    return dimen.toDouble();
  }
  return _mapVerticalDimens[dimen];
}

HashMap _mapHorizontalDimens = HashMap<int, double>();
HashMap _mapVerticalDimens = HashMap<int, double>();

List<int> _sizes = [
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  22,
  24,
  25,
  26,
  27,
  28,
  30,
  32,
  34,
  35,
  36,
  38,
  40,
  45,
  48,
  49,
  50,
  55,
  57,
  60,
  65,
  70,
  75,
  80,
  85,
  90,
  95,
  100,
  110,
  120,
  130,
  140,
  150,
  160,
  165,
  168,
  170,
  175,
  180,
  200,
  220,
  240,
  245,
  250,
  280,
  300,
  315,
  320,
  325,
  330,
  340,
  345,
  350,
  400
];
