import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/core/theme/clinical_colors.dart';
import 'package:office_schedule/app/core/theme/clinical_texts_types.dart';

enum TabColorEnum {
  primary(ClinicalColorsLightTheme.primaryLighter),
  secondary(ClinicalColorsLightTheme.secondaryLight);

  final Color color;

  const TabColorEnum(this.color);
}

class ClinicalTabBar extends StatelessWidget {
  const ClinicalTabBar(
      {Key? key,
      required this.tabController,
      required this.tabsWidget,
      required this.tabColorEnum})
      : super(key: key);

  final TabController tabController;
  final List<Widget> tabsWidget;
  final TabColorEnum tabColorEnum;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 310.w,
        height: 33.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: ClinicalColorsLightTheme.colorWhite,
            boxShadow: [
              BoxShadow(
                  blurRadius: 14.r,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.15))
            ]),
        child: TabBar(
          controller: tabController,
          tabs: tabsWidget,
          labelPadding: EdgeInsets.symmetric(vertical: 8.h),
          indicator: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 14.r,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.15))
              ],
              borderRadius: BorderRadius.circular(5.r),
              color: tabColorEnum.color),
          labelColor: tabColorEnum.name == "primary"
              ? ClinicalColorsLightTheme.primaryDark
              : ClinicalColorsLightTheme.colorText,
          labelStyle: tabColorEnum.name == "primary"
              ? ClinicalTextTypes.tabBarTextBlue
              : ClinicalTextTypes.tabBarText,
          unselectedLabelStyle: ClinicalTextTypes.tabBarTextInactive,
          unselectedLabelColor: ClinicalColorsLightTheme.colorGray,
        ),
      ),
    );
  }
}
