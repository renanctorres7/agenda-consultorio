import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/clinical_texts_types.dart';
import 'package:office_schedule/app/core/widgets/clinical_search_button/clinical_search_button.dart';

import '../../localization/languages.dart';

class ClinicalCalendarTabBar extends StatelessWidget {
  final TabController tabController;
  final Function(int) onTap;
  const ClinicalCalendarTabBar({
    super.key,
    required this.tabController,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(right: 7.0.w),
          child: Container(
              height: 33.h,
              width: 309.w,
              decoration: BoxDecoration(
                color: AppColors.getTheme().cardColor,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: AppColors.getTheme().cardBoxShadow,
              ),
              child: TabBar(
                controller: tabController,
                tabs: _labelTabs(context),
                indicatorSize: TabBarIndicatorSize.tab,
                onTap: onTap,
                indicator: BoxDecoration(
                  color: AppColors.getTheme().secondaryLight,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                labelColor: AppColors.getTheme().colorText,
                unselectedLabelColor: AppColors.getTheme().colorGray,
                labelStyle: ClinicalTextTypes.tabBarText,
                unselectedLabelStyle: ClinicalTextTypes.tabBarTextInactive,
              )),
        ),
        ClinicalSearchButton(onPressed: () {})
      ],
    );
  }
}

_labelTabs(BuildContext context) => [
      Tab(
        text: Languages.of(context).today,
      ),
      Tab(
        text: Languages.of(context).week,
      ),
      Tab(
        text: Languages.of(context).month,
      ),
    ];
