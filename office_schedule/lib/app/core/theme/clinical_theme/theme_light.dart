import 'package:flutter/material.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';

class ThemeLight extends AppColors {
  //colors blue primary
  @override
  Color primaryDark = const Color(0xFF1C6BA4);
  @override
  Color primary = const Color(0xFF288ED8);
  @override
  Color primaryLight = const Color(0xFF99C7E9);
  @override
  Color primaryLighter = const Color(0xFFDCEDF9);

  //colors green secondary
  @override
  Color secondaryDark = const Color(0xFF3E9E7A);
  @override
  Color secondary = const Color(0xFF49C496);
  @override
  Color secondaryMedium = const Color(0xFF0ED095);
  @override
  Color secondaryLight = const Color(0xFF64FFC5);

  //colors yellow danger
  @override
  Color dangerYellowDark = const Color(0xFFC8912F);
  @override
  Color dangerYellow = const Color(0xFFF1AF38);
  @override
  Color dangerYellowLight = const Color(0xFFFFCF79);

  //colors red danger
  @override
  Color dangerRedMedium = const Color(0xFFEB5890);
  @override
  Color dangerRed = const Color(0xFFEE1C5D);
  @override
  Color dangerRedLight = const Color(0xFFFF95B6);

  //colors black - gray
  @override
  Color colorText = const Color(0xFF0B0B0B);
  @override
  Color colorTextLight = const Color(0xFF3C3C3C);
  @override
  Color colorGray = const Color(0xFF8A8A8A);
  @override
  Color colorGrayLight = const Color(0xFFE3E3E3);

  @override
  Color colorWhite = const Color(0xFFFFFFFF);
}
