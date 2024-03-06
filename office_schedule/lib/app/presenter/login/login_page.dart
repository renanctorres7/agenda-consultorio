import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_schedule/app/core/icons/clinical_images.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/clinical_texts_types.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.getTheme().primary,
          //  systemNavigationBarDividerColor: Colors.grey[100],
          systemNavigationBarIconBrightness: Brightness.light),
      child: Container(
        color: AppColors.getTheme().primary,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.getTheme().primary,
            body: SingleChildScrollView(
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
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
