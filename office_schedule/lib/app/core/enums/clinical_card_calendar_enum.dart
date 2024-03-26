import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/localization/languages.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';

enum ClinicalCardCalendarEnum { pending, completed, canceled, rescheduled }

extension ClinicalCardCalendarEnumExtension on ClinicalCardCalendarEnum {
  String text(BuildContext context) {
    final result = switch (this) {
      ClinicalCardCalendarEnum.pending => Languages.of(context).pending,
      ClinicalCardCalendarEnum.completed => Languages.of(context).completed,
      ClinicalCardCalendarEnum.canceled => Languages.of(context).canceled,
      ClinicalCardCalendarEnum.rescheduled => Languages.of(context).rescheduled,
    };
    return result;
  }

  Color color() {
    final result = switch (this) {
      ClinicalCardCalendarEnum.pending => AppColors.getTheme().cardColor,
      ClinicalCardCalendarEnum.completed => AppColors.getTheme().primary,
      ClinicalCardCalendarEnum.canceled => AppColors.getTheme().dangerRed,
      ClinicalCardCalendarEnum.rescheduled => AppColors.getTheme().dangerYellow,
    };
    return result;
  }

  Color secondaryColor() {
    final result = switch (this) {
      ClinicalCardCalendarEnum.pending ||
      ClinicalCardCalendarEnum.completed =>
        AppColors.getTheme().primaryLight,
      ClinicalCardCalendarEnum.canceled => AppColors.getTheme().dangerRedLight,
      ClinicalCardCalendarEnum.rescheduled =>
        AppColors.getTheme().dangerYellowLight,
    };
    return result;
  }

  Color textColor() {
    final result = switch (this) {
      ClinicalCardCalendarEnum.pending => AppColors.getTheme().colorText,
      ClinicalCardCalendarEnum.canceled ||
      ClinicalCardCalendarEnum.completed ||
      ClinicalCardCalendarEnum.rescheduled =>
        AppColors.getTheme().colorWhite,
    };
    return result;
  }
}
