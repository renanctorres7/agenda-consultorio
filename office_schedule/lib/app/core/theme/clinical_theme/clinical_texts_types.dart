import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';

class ClinicalTextTypes {
  static final appTitleText = GoogleFonts.poppins(
      fontSize: 32.sp,
      fontWeight: FontWeight.w300,
      color: AppColors.getTheme().colorWhite,
      shadows: [
        Shadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 4))
      ]);

  static final bodyText = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.getTheme().colorTextLight);

  static final formTitleText = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: AppColors.getTheme().colorGray);

  static final boxButtonText = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.getTheme().colorWhite);

  static final forgotPasswordText = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.getTheme().colorWhite);

  ////tab bar

  static final tabBarTextBlue = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.getTheme().primaryDark);

  static final tabBarText = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.getTheme().colorText);

  static final tabBarTextInactive = GoogleFonts.poppins(
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
      color: AppColors.getTheme().colorGray);

  ////appBar title

  static final appBarTitleBack = GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.getTheme().colorWhite);

  static final appBarTitleBackBlue = GoogleFonts.poppins(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.getTheme().primaryDark);

  static final appBarTitleWhite = GoogleFonts.poppins(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.getTheme().colorWhite);

  ////name title

  static final nameTitle = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.getTheme().colorText);

  static final nameTitleWhite = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.getTheme().colorWhite);

  ///datetimePickerItem

  static final datetimePickerItem = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.getTheme().colorTextLight);

  static final datetimePickerCancel = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.getTheme().dangerYellowDark);

  static final datetimePickerConfirm = GoogleFonts.poppins(
      fontSize: 16.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.getTheme().primaryDark);

  /// dialog
  ///
  static final dialogErrorTitle = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.getTheme().dangerYellowDark);

  static final dialogErrorHighlight = GoogleFonts.poppins(
      fontSize: 14.sp,
      fontWeight: FontWeight.w700,
      color: AppColors.getTheme().colorText);
}
