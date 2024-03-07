import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/icons/clinical_images.dart';
import '../../../core/theme/clinical_theme/theme.dart';
import 'login_tab_bar.dart';
import '../login_controller.dart';

final _loginController = Get.put(LoginController());

class LoginTab extends StatelessWidget {
  const LoginTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 27.w, right: 27.w, top: 25.h, bottom: 15.h),
            child: Image.asset(
              ClinicalImages.psychologistIllustration,
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(
            'Agenda Clínica',
            style: ClinicalTextTypes.appTitleText,
          ),
          const LoginTabBar(),
        ],
      ),
    );
  }
}
