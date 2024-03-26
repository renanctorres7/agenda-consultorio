import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/clinical_texts_types.dart';
import 'package:office_schedule/app/presenter/login/components/label_tabs.dart';

import '../login_controller.dart';

final _loginController = Get.put(LoginController());

class LoginTabBar extends StatelessWidget {
  const LoginTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 41.w, right: 41.w, bottom: 20.h),
      child: Container(
          height: 33.h,
          margin: EdgeInsets.only(left: 41.w, right: 41.w, bottom: 20.h),
          decoration: BoxDecoration(
            color: AppColors.getTheme().cardColor,
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: AppColors.getTheme().cardBoxShadow,
          ),
          child: TabBar(
            controller: _loginController.tabController,
            tabs: labelTabs(context),
            indicatorSize: TabBarIndicatorSize.tab,
            onTap: (value) {
              _loginController.tabIndex.value = value;
            },
            indicator: BoxDecoration(
              color: AppColors.getTheme().primaryLighter,
              borderRadius: BorderRadius.circular(5.r),
            ),
            labelColor: AppColors.getTheme().primaryDark,
            unselectedLabelColor: AppColors.getTheme().colorGray,
            labelStyle: ClinicalTextTypes.tabBarTextBlue,
            unselectedLabelStyle: ClinicalTextTypes.tabBarTextInactive,
          )),
    );
  }
}
