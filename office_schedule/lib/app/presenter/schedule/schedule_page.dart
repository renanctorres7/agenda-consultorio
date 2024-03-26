import 'package:flutter/material.dart';

import '../../core/theme/clinical_theme/app_colors.dart';
import '../../core/widgets/custom_base/custom_base.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return CustomBase(
      statusBarIconIsDark: false,
      statusBarColor: AppColors.getTheme().primary,
      child: Container(),
    );
  }
}
