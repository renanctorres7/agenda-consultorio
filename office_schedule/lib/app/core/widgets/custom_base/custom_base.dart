import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';

class CustomBase extends StatelessWidget {
  final bool statusBarIconIsDark;
  final Color statusBarColor;
  final Widget child;
  const CustomBase(
      {super.key,
      required this.statusBarIconIsDark,
      required this.statusBarColor,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.getTheme().colorWhite,
          statusBarColor: statusBarColor,
          systemNavigationBarDividerColor: Colors.grey[200],
          statusBarBrightness:
              statusBarIconIsDark ? Brightness.dark : Brightness.light,
          systemNavigationBarIconBrightness:
              statusBarIconIsDark ? Brightness.dark : Brightness.light,
        ),
        child: Scaffold(backgroundColor: statusBarColor, body: child));
  }
}
