import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/clinical_texts_types.dart';
import 'package:office_schedule/app/core/widgets/clinical_calendar_card/clinical_calendar_card.dart';
import 'package:office_schedule/app/core/widgets/clinical_calendar_tab_bar/clinical_calendar_tab_bar.dart';
import 'package:office_schedule/app/core/widgets/custom_base/custom_base.dart';
import 'package:office_schedule/app/presenter/calendar/calendar_controller.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart' as sf;

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

  final sf.CalendarController _calendarController = sf.CalendarController();

  DateTime _todayDateTime = DateTime.now();

  String _todayFormat = '';

  @override
  void initState() {
    super.initState();
    _controller.tabController = TabController(
        length: 3,
        vsync: this,
        animationDuration: const Duration(milliseconds: 200));
    _todayDateTime = DateTime.now();
    _todayFormat = DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
        .format(_todayDateTime.toUtc());
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
            Container(
              height: 280.h,
              margin: EdgeInsets.only(left: 45.w, right: 45.w, bottom: 55.h),
              decoration: BoxDecoration(
                color: AppColors.getTheme().cardColor,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: AppColors.getTheme().cardCalendarBoxShadow,
              ),
              child: Stack(
                children: [
                  sf.SfCalendar(
                    view: sf.CalendarView.month,
                    controller: _calendarController,
                    headerStyle: sf.CalendarHeaderStyle(
                      textAlign: TextAlign.center,
                      backgroundColor: AppColors.getTheme().cardColor,
                      textStyle: GoogleFonts.poppins(
                        color: AppColors.getTheme().primaryDark,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    todayHighlightColor: AppColors.getTheme().secondaryLight,
                    todayTextStyle: GoogleFonts.poppins(
                      color: AppColors.getTheme().colorText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          _calendarController.backward!();
                        },
                        color: AppColors.getTheme().primaryDark,
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          _calendarController.forward!();
                        },
                        color: AppColors.getTheme().primaryDark,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ClinicalCalendarTabBar(
              tabController: _controller.tabController!,
              onTap: _controller.changeCalendarTab,
            ),
            SizedBox(height: 55.h),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 16.h),
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                _todayFormat,
                textAlign: TextAlign.left,
                style: ClinicalTextTypes.datetimeTitle,
              ),
            ),
            Column(
              children: [
                for (int i = 0; i < 30; i++)
                  const ClinicalCalendarCard(
                    clinicalCardCalendarEnum:
                        ClinicalCardCalendarEnum.completed,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
