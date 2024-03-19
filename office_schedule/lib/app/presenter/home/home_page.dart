import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/widgets/clinical_bottom_navigation_bar/clinical_bottom_navigation_bar.dart';
import 'package:office_schedule/app/features/profile/infra/models/user_model.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: ClinicalBottomNavigationBar(
          bottomBarIndex: _homeController.bottomBarIndex.value,
          bottomBarOnTap: _homeController.changeBottomBarIndex,
        ),
        body: Container(),
      );
    });
  }
}
