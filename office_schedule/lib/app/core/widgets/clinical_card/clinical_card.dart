import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/core/theme/clinical_colors.dart';

class ClinicalCard extends StatelessWidget {
  const ClinicalCard(
      {Key? key,
      this.elevatedButton,
      this.textButton,
      required this.childrenWidget})
      : super(key: key);

  final Widget? textButton;
  final Widget? elevatedButton;
  final List<Widget> childrenWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: ClinicalColorsLightTheme.colorWhite,
          boxShadow: [
            BoxShadow(
                blurRadius: 14.r,
                offset: const Offset(0, 4),
                color: Colors.black.withOpacity(0.15))
          ]),
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 24.h, bottom: 30.h),
      padding: EdgeInsets.only(
        top: 30.h,
      ),
      child: Flex(
        direction: Axis.vertical,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flex(
              direction: Axis.vertical,
              mainAxisSize: MainAxisSize.min,
              children: childrenWidget),
          elevatedButton != null
              ? Padding(
                  padding: EdgeInsets.only(top: 45.h),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      textButton ?? const SizedBox(),
                      elevatedButton ?? const SizedBox()
                    ],
                  ),
                )
              : SizedBox(
                  height: 45.h,
                )
        ],
      ),
    );
  }
}
