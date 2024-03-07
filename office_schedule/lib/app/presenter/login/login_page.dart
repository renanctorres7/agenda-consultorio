import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/extensions/context.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';

import 'package:office_schedule/app/presenter/login/components/status_bar_widget.dart';
import 'package:office_schedule/app/presenter/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    _loginController.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => StatusBarWidget(
          color: _loginController.tabIndex.value == 0
              ? AppColors.getTheme().primary
              : AppColors.getTheme().secondaryDark,
          child: SizedBox(
            width: context.screenSize.width,
            height: context.screenSize.height,
            child: SizedBox(
              width: context.screenSize.width,
              height: context.screenSize.height,
              child: TabBarView(
                controller: _loginController.tabController,
                children: _loginController.tabsChildren,
              ),
            ),
          ),
        ));
  }
}
