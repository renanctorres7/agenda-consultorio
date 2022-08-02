import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:office_schedule/app/core/theme/clinical_colors.dart';

class ClinicalTextTypes {
  static final appTitleText = GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w300,
      color: ClinicalColorsLightTheme.colorWhite,
      shadows: [
        Shadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4))
      ]);

  static final bodyText = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: ClinicalColorsLightTheme.colorTextLight);

  static final formTitleText = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: ClinicalColorsLightTheme.colorGray);

  static final boxButtonText = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.colorWhite);

  static final forgotPasswordText = GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: ClinicalColorsLightTheme.colorWhite);

  ////tab bar

  static final tabBarTextBlue = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.primaryDark);

  static final tabBarText = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.colorText);

  static final tabBarTextInactive = GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: ClinicalColorsLightTheme.colorGray);

  ////appBar title

  static final appBarTitleBack = GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: ClinicalColorsLightTheme.colorWhite);

  static final appBarTitleBackBlue = GoogleFonts.poppins(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: ClinicalColorsLightTheme.primaryDark);

  static final appBarTitleWhite = GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.colorWhite);

  ////name title

  static final nameTitle = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ClinicalColorsLightTheme.colorText);

  static final nameTitleWhite = GoogleFonts.poppins(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: ClinicalColorsLightTheme.colorWhite);
}
