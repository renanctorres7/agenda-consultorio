import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:office_schedule/app/core/enums/clinical_card_calendar_enum.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/app_colors.dart';
import 'package:office_schedule/app/core/widgets/patient_list_tile/patient_list_tile.dart';
import 'package:office_schedule/app/core/widgets/service_list_tile/service_list_tile.dart';
import 'package:office_schedule/app/core/widgets/situation_list_tile/situation_list_tile.dart';

import '../clock_list_tile/clock_list_tile.dart';

class ClinicalCalendarCard extends StatelessWidget {
  final ClinicalCardCalendarEnum clinicalCardCalendarEnum;
  const ClinicalCalendarCard(
      {super.key, required this.clinicalCardCalendarEnum});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 350.w),
        height: 90.h,
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
        padding:
            EdgeInsets.only(left: 11.w, right: 11.w, top: 11.h, bottom: 11.h),
        decoration: BoxDecoration(
          color: clinicalCardCalendarEnum.color(),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: AppColors.getTheme().cardCalendarBoxShadow,
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
                child: Flex(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              direction: Axis.vertical,
              children: [
                Flexible(
                  child: PatientListTile(
                    text: 'Fulano de tal',
                    color: clinicalCardCalendarEnum.textColor(),
                  ),
                ),
                Flexible(
                  child: ServiceListTile(
                    text: 'Ciclano',
                    color: clinicalCardCalendarEnum.textColor(),
                  ),
                ),
              ],
            )),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SituationListTile(
                    text: clinicalCardCalendarEnum.text(context),
                    color: clinicalCardCalendarEnum.textColor(),
                  ),
                ],
              ),
            ),
            Flexible(
                child: Container(
              width: 96.w,
              height: 68.h,
              padding: EdgeInsets.only(right: 8.w),
              decoration: BoxDecoration(
                color: clinicalCardCalendarEnum.secondaryColor(),
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: AppColors.getTheme().cardCalendarBoxShadow,
              ),
              child: ClockListTile(color: clinicalCardCalendarEnum.textColor()),
            ))
          ],
        ));
  }
}
