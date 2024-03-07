import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/theme.dart';

import '../../theme/clinical_theme/app_colors.dart';

enum ButtonColorEnum { primary, secondary }

extension ButtonColorEnumExtension on ButtonColorEnum {
  Color get color {
    switch (this) {
      case ButtonColorEnum.primary:
        return AppColors.getTheme().primary;
      case ButtonColorEnum.secondary:
        return AppColors.getTheme().secondary;
    }
  }
}

class ClinicalElevatedButton extends StatelessWidget {
  const ClinicalElevatedButton(
      {super.key,
      required this.buttonColorEnum,
      required this.buttonText,
      required this.onPressed});

  final ButtonColorEnum buttonColorEnum;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33.h,
      width: 103.w,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: buttonColorEnum.color,
            elevation: 4,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.r))),
        child: AutoSizeText(
          buttonText,
          style: ClinicalTextTypes.boxButtonText,
        ),
      ),
    );
  }
}
