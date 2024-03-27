import 'package:flutter/material.dart';

import '../../../core/enums/clinical_card_calendar_enum.dart';
import '../../../core/widgets/clinical_calendar_card/clinical_calendar_card.dart';

class CalendarMonthList extends StatelessWidget {
  const CalendarMonthList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 30; i++)
          const ClinicalCalendarCard(
            clinicalCardCalendarEnum: ClinicalCardCalendarEnum.completed,
          ),
      ],
    );
  }
}
