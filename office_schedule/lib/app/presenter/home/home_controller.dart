import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../core/theme/clinical_theme/app_colors.dart';

class HomeController extends GetxController {
  RxInt bottomBarIndex = 0.obs;

  PageController? pageController;
  TabController? tabController;

  Rx<Color> statusBarColor = AppColors.getTheme().colorWhite.obs;

  void changeBottomBarIndex(int index) {
    bottomBarIndex.value = index;
    _updateCurrentPageIndex(index);
    setStatusBarColor(index);
  }

  void _updateCurrentPageIndex(int index) {
    tabController?.index = index;
    pageController?.jumpToPage(index);
  }

  void setStatusBarColor(int index) {
    switch (index) {
      case 1:
        statusBarColor.value = AppColors.getTheme().primary;
        break;
      case 2:
        statusBarColor.value = AppColors.getTheme().primaryDark;
        break;
      case 3:
        statusBarColor.value = AppColors.getTheme().dangerYellowDark;
        break;
      case 0:
      default:
        statusBarColor.value = AppColors.getTheme().colorWhite;
        break;
    }
  }
}
