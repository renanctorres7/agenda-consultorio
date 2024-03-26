import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/theme.dart';
import 'package:office_schedule/app/core/widgets/clinical_calendar_card/clinical_calendar_card.dart';
import 'package:office_schedule/app/core/widgets/clinical_calendar_tab_bar/clinical_calendar_tab_bar.dart';
import 'package:office_schedule/app/core/widgets/custom_base/custom_base.dart';
import 'package:office_schedule/app/presenter/calendar/calendar_controller.dart';

import '../../core/enums/clinical_card_calendar_enum.dart';
import '../../core/widgets/simple_name_presentation/simple_name_presentation.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>
    with TickerProviderStateMixin {
  final _controller = Get.put(CalendarController());

  @override
  void initState() {
    super.initState();
    _controller.tabController = TabController(
        length: 3,
        vsync: this,
        animationDuration: const Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return CustomBase(
      statusBarIconIsDark: true,
      statusBarColor: AppColors.getTheme().colorWhite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SimpleNamePresentation(fullName: 'Fulano de tal'),
            ClinicalCalendarTabBar(
              tabController: _controller.tabController!,
              onTap: _controller.changeCalendarTab,
            ),
            SizedBox(height: 55.h),
            ClinicalCalendarCard(
              clinicalCardCalendarEnum: ClinicalCardCalendarEnum.completed,
            ),
          ],
        ),
      ),
    );
  }
}
