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

class ClinicalElevatedButton extends StatefulWidget {
  const ClinicalElevatedButton(
      {super.key,
      required this.buttonColorEnum,
      required this.buttonText,
      required this.onPressed});

  final ButtonColorEnum buttonColorEnum;
  final String buttonText;
  final Function()? onPressed;

  @override
  State<ClinicalElevatedButton> createState() => _ClinicalElevatedButtonState();
}

class _ClinicalElevatedButtonState extends State<ClinicalElevatedButton> {
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: isLoading,
        builder: (context, value, child) {
          return SizedBox(
            height: 33.h,
            width: 103.w,
            child: ElevatedButton(
                onPressed: isLoading.value == false
                    ? () async {
                        isLoading.value = true;
                        await widget.onPressed?.call();
                        isLoading.value = false;
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: widget.buttonColorEnum.color,
                    elevation: 4,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.r))),
                child: isLoading.value == false
                    ? AutoSizeText(
                        widget.buttonText,
                        style: ClinicalTextTypes.boxButtonText,
                      )
                    : SizedBox(
                        height: 20.w,
                        width: 20.w,
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )),
          );
        });
  }
}
