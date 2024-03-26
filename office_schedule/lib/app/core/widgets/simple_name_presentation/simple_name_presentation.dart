import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/core/localization/languages.dart';

import '../../theme/clinical_theme/app_colors.dart';
import '../../theme/clinical_theme/theme.dart';

class SimpleNamePresentation extends StatelessWidget {
  final String fullName;
  const SimpleNamePresentation({super.key, required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 28.w, right: 28.w, top: 17.h, bottom: 38.h),
      alignment: Alignment.centerLeft,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Languages.of(context).hello,
                    style: ClinicalTextTypes.bodyText),
                Text(fullName, style: ClinicalTextTypes.nameTitle),
              ],
            ),
          ),
          CircleAvatar(
            radius: 20.r,
            backgroundColor: AppColors.getTheme().colorGray,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: AppColors.getTheme().colorWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
