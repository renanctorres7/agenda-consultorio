import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/localization/languages.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/clinical_texts_types.dart';
import 'package:office_schedule/app/core/widgets/clinical_text_button/clinical_text_button.dart';

class DialogSuccess extends StatelessWidget {
  final String textMessage;

  final Function()? onPressed;
  const DialogSuccess({
    super.key,
    required this.textMessage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        padding:
            EdgeInsets.only(top: 16.h, bottom: 12.h, left: 20.w, right: 20.w),
        decoration: BoxDecoration(
          color: AppColors.getTheme().cardColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Flex(
          direction: Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.getTheme().colorGrayLight,
                    width: 1.0,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 7.h),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Icon(
                        Icons.check_circle_outline,
                        color: AppColors.getTheme().primary,
                        size: 20.sp,
                      ),
                    ),
                    Text(Languages.of(context).dialogSuccessTitle,
                        style: ClinicalTextTypes.dialogSuccessTitle),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.getTheme().colorGrayLight,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                  child: Text(textMessage, style: ClinicalTextTypes.bodyText),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: ClinicalTextButton(
                text: 'fechar',
                color: AppColors.getTheme().primaryDark,
                onPressed: () {
                  if (onPressed != null) {
                    onPressed!();
                    return;
                  }
                  Get.back();
                },
              ),
            ),
          ],
        ));
  }
}
