import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../core.dart';
import 'theme.dart';

abstract class AppColors {
  static final _box = Hive.box<bool>(dbTheme);

  static AppColors getTheme() {
    final isDarkTheme = _box.get(dbTheme) ?? false;
    return isDarkTheme ? ThemeDark() : ThemeLight();
  }

  //colors blue primary
  Color get primaryDark;
  Color get primary;
  Color get primaryLight;
  Color get primaryLighter;

  //colors green secondary
  Color get secondaryDark;
  Color get secondary;
  Color get secondaryMedium;
  Color get secondaryLight;

  //colors yellow danger
  Color get dangerYellowDark;
  Color get dangerYellow;
  Color get dangerYellowLight;

  //colors red danger
  Color get dangerRedMedium;
  Color get dangerRed;
  Color get dangerRedLight;

  //colors black - gray
  Color get colorText;
  Color get colorTextLight;
  Color get colorGray;
  Color get colorGrayLight;

  Color get colorWhite;

  Color get cardColor;

  List<BoxShadow>? get cardBoxShadow;
}
