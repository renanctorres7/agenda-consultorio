import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../core/enums/clinical_card_calendar_enum.dart';
import '../../../core/theme/clinical_theme/theme.dart';
import '../../../core/widgets/clinical_calendar_card/clinical_calendar_card.dart';
import '../../../core/widgets/dropdown_title_list/dropdown_title_list.dart';

class CalendarTodayList extends StatefulWidget {
  const CalendarTodayList({super.key});

  @override
  State<CalendarTodayList> createState() => _CalendarTodayListState();
}

class _CalendarTodayListState extends State<CalendarTodayList> {
  DateTime _todayDateTime = DateTime.now();

  String _todayFormat = '';

  @override
  void initState() {
    super.initState();
    _todayDateTime = DateTime.now();
    _todayFormat = DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt_Br')
        .format(_todayDateTime.toUtc());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownTitleList(
          title: _todayFormat,
          child: Column(
            children: [
              for (int i = 0; i < 5; i++)
                const ClinicalCalendarCard(
                  clinicalCardCalendarEnum: ClinicalCardCalendarEnum.pending,
                ),
            ],
          ),
        ),
        DropdownTitleList(
          title: _todayFormat,
          child: Column(
            children: [
              for (int i = 0; i < 5; i++)
                const ClinicalCalendarCard(
                  clinicalCardCalendarEnum: ClinicalCardCalendarEnum.completed,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
