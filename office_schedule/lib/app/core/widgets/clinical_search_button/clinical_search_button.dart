import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/clinical_theme/app_colors.dart';

class ClinicalSearchButton extends StatelessWidget {
  final Function()? onPressed;
  const ClinicalSearchButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34.w,
      height: 33.h,
      decoration: BoxDecoration(
        color: AppColors.getTheme().cardColor,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: AppColors.getTheme().cardBoxShadow,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          'assets/svg/clinical_icons/blueSearch.svg',
          height: 17.1.h,
        ),
      ),
    );
  }
}
