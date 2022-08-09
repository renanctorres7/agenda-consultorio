import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/theme.dart';
import 'clinical_card_schedule.dart';

enum ScheduleStatusBoxDatetimeColor {
  realizado(ClinicalColorsLightTheme.primaryLight),
  pendente(ClinicalColorsLightTheme.primaryLight),
  cancelado(ClinicalColorsLightTheme.dangerRedLight),

  reagendado(ClinicalColorsLightTheme.dangerYellowLight);

  final Color color;
  const ScheduleStatusBoxDatetimeColor(this.color);
}

enum BoxDatetimeTextColor {
  realizado(ClinicalColorsLightTheme.colorWhite),
  pendente(ClinicalColorsLightTheme.colorTextLight),
  cancelado(ClinicalColorsLightTheme.colorWhite),

  reagendado(ClinicalColorsLightTheme.colorWhite);

  final Color textColor;
  const BoxDatetimeTextColor(this.textColor);
}

class ClinicalCardScheduleDatetimeBox extends StatelessWidget {
  const ClinicalCardScheduleDatetimeBox(
      {Key? key,
      required this.scheduleStatusCardColor,
      required this.date,
      required this.startHourEndHour,
      required this.duration})
      : super(key: key);

  final ScheduleStatusCardColor scheduleStatusCardColor;
  final String date;
  final String startHourEndHour;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 96.w,
        height: 68.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: _getColorOfScheduleStatusBoxDatetime(
                scheduleStatusCardColor: scheduleStatusCardColor)),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
                child: AutoSizeText(
              date,
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: _getTextColorFromBoxDatetimeColorEnum(
                      scheduleStatusCardColor: scheduleStatusCardColor)),
            )),
            Flexible(
                child: AutoSizeText(
              startHourEndHour,
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: _getTextColorFromBoxDatetimeColorEnum(
                      scheduleStatusCardColor: scheduleStatusCardColor)),
            )),
            Flexible(
                child: AutoSizeText(
              duration,
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: _getTextColorFromBoxDatetimeColorEnum(
                      scheduleStatusCardColor: scheduleStatusCardColor)),
            ))
          ],
        ));
  }
}

Color _getColorOfScheduleStatusBoxDatetime(
    {required ScheduleStatusCardColor scheduleStatusCardColor}) {
  switch (scheduleStatusCardColor) {
    case ScheduleStatusCardColor.realizado:

    case ScheduleStatusCardColor.pendente:
      return ScheduleStatusBoxDatetimeColor.pendente.color;
    case ScheduleStatusCardColor.cancelado:
      return ScheduleStatusBoxDatetimeColor.cancelado.color;
    case ScheduleStatusCardColor.reagendado:

    default:
      return ScheduleStatusBoxDatetimeColor.reagendado.color;
  }
}

Color _getTextColorFromBoxDatetimeColorEnum(
    {required ScheduleStatusCardColor scheduleStatusCardColor}) {
  switch (scheduleStatusCardColor) {
    case ScheduleStatusCardColor.realizado:
      return BoxDatetimeTextColor.realizado.textColor;
    case ScheduleStatusCardColor.pendente:
      return BoxDatetimeTextColor.pendente.textColor;
    case ScheduleStatusCardColor.cancelado:
      return BoxDatetimeTextColor.cancelado.textColor;
    case ScheduleStatusCardColor.reagendado:

    default:
      return BoxDatetimeTextColor.reagendado.textColor;
  }
}
