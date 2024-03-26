import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/widgets/clinical_bottom_navigation_bar/clinical_bottom_navigation_bar.dart';

import '../calendar/calendar_page.dart';
import '../schedule/schedule_page.dart';
import '../settings/settings_page.dart';
import '../users/users_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _homeController = Get.put(HomeController());

  final List<Widget> _pages = [
    const CalendarPage(),
    const SchedulePage(),
    const UsersPage(),
    const SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _homeController.pageController = PageController();
    _homeController.tabController = TabController(
        length: _pages.length,
        vsync: this,
        animationDuration: const Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _homeController.pageController?.dispose();
    _homeController.tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: ClinicalBottomNavigationBar(
          bottomBarIndex: _homeController.bottomBarIndex.value,
          bottomBarOnTap: _homeController.changeBottomBarIndex,
          statusBarColor: _homeController.statusBarColor.value,
        ),
        body: PageView(
          controller: _homeController.pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: _homeController.changeBottomBarIndex,
          children: _pages,
        ),
      );
    });
  }
}
