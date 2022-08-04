import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:office_schedule/app/core/theme/clinical_colors.dart';

class ClinicalTextTypes {
  static final appTitleText = GoogleFonts.poppins(
      fontSize: 32.sp,
      fontWeight: FontWeight.w300,
      color: ClinicalColorsLightTheme.colorWhite,
      shadows: [
        Shadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4))
      ]);

  //body text

  static final bodyText = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: ClinicalColorsLightTheme.colorTextLight);

  static final bodyTextWhite = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: ClinicalColorsLightTheme.colorWhite);

  //form

  static final formTitleText = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: ClinicalColorsLightTheme.colorGray);

  // buttons

  static final boxButtonText = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.colorWhite);

  static final forgotPasswordText = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: ClinicalColorsLightTheme.colorWhite);

  static final buttonTextCancel = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.dangerYellowDark);

  static final buttonTopText = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: ClinicalColorsLightTheme.dangerYellowDark);

  ////tab bar

  static final tabBarTextBlue = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.primaryDark);

  static final tabBarText = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.colorText);

  static final tabBarTextInactive = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
      color: ClinicalColorsLightTheme.colorGray);

  ////appBar title

  static final appBarTitleBack = GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: ClinicalColorsLightTheme.colorWhite);

  static final appBarTitleBackBlue = GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: ClinicalColorsLightTheme.primaryDark);

  static final appBarTitleWhite = GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.colorWhite);

  ////name title

  static final nameTitle = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: ClinicalColorsLightTheme.colorText);

  static final nameTitleWhite = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: ClinicalColorsLightTheme.colorWhite);

  ///datetimePickerItem

  static final datetimePickerItem = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.colorTextLight);

  static final datetimePickerCancel = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.dangerYellowDark);

  static final datetimePickerConfirm = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: ClinicalColorsLightTheme.primaryDark);
}
