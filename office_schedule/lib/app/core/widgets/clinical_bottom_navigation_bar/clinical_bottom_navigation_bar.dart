import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';

import '../../enums/clinical_bottom_navigation_icons_enum.dart';

class ClinicalBottomNavigationBar extends StatefulWidget {
  final int bottomBarIndex;
  final Function(int) bottomBarOnTap;

  const ClinicalBottomNavigationBar(
      {super.key, required this.bottomBarIndex, required this.bottomBarOnTap});

  @override
  State<ClinicalBottomNavigationBar> createState() =>
      _ClinicalBottomNavigationBarState();
}

class _ClinicalBottomNavigationBarState
    extends State<ClinicalBottomNavigationBar> {
  BottomNavigationBarItem _barItem(ClinicalBottomNavigationIconsEnum icon) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon.iconInactive,
        height: 20.h,
      ),
      activeIcon: SvgPicture.asset(
        icon.iconActive,
        height: 24.h,
      ),
      label: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82.h,
      decoration: BoxDecoration(
          color: AppColors.getTheme().colorWhite,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 20.r,
                offset: const Offset(0, 1),
                spreadRadius: -3)
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          )),
      child: BottomNavigationBar(
        currentIndex: widget.bottomBarIndex,
        onTap: widget.bottomBarOnTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          _barItem(ClinicalBottomNavigationIconsEnum.calendar),
          _barItem(ClinicalBottomNavigationIconsEnum.schedule),
          _barItem(ClinicalBottomNavigationIconsEnum.users),
          _barItem(ClinicalBottomNavigationIconsEnum.config),
        ],
      ),
    );
  }
}
