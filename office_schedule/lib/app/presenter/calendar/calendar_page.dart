import 'package:flutter/material.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/widgets/custom_base/custom_base.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return CustomBase(
      statusBarIconIsDark: true,
      statusBarColor: AppColors.getTheme().colorWhite,
      child: Container(),
    );
  }
}
