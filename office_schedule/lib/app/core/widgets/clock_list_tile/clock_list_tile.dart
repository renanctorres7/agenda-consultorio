import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/core/localization/languages.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/theme.dart';

class ClockListTile extends StatelessWidget {
  final Color color;
  const ClockListTile({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '01 de fev',
          style: ClinicalTextTypes.clinicalCardBodyBold(color),
        ),
        Text(
          '11h00 - 12h00',
          style: ClinicalTextTypes.clinicalCardBody(color),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '45 min',
              style: ClinicalTextTypes.clinicalCardBody(color),
            ),
            Icon(
              Icons.timer_sharp,
              color: color,
              size: 16.67.sp,
            )
          ],
        )
      ],
    );
  }
}
