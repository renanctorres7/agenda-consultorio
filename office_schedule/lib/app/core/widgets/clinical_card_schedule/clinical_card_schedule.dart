import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:office_schedule/app/core/widgets/clinical_card_schedule/clinical_card_schedule_datetime_box.dart';

import '../../theme/theme.dart';
import '../clinical_avatar_image_network/clinical_avatar_image_network.dart';

enum ScheduleStatusCardColor {
  realizado(ClinicalColorsLightTheme.primary),
  pendente(ClinicalColorsLightTheme.colorWhite),
  cancelado(ClinicalColorsLightTheme.dangerRed),

  reagendado(ClinicalColorsLightTheme.dangerYellow);

  final Color color;
  const ScheduleStatusCardColor(this.color);
}

class ClinicalCardSchedule extends StatelessWidget {
  const ClinicalCardSchedule(
      {Key? key,
      required this.userFullName,
      this.onTap,
      required this.scheduleStatusCardColor,
      required this.clientFullName,
      required this.scheduleStatus,
      required this.date,
      required this.startHourEndHour,
      required this.duration})
      : super(key: key);

  final String clientFullName;
  final String userFullName;
  final String scheduleStatus;

  final Function()? onTap;
  final ScheduleStatusCardColor scheduleStatusCardColor;
  final String date;
  final String startHourEndHour;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          width: 350.w,
          height: 90.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: ClinicalColorsLightTheme.colorWhite,
              boxShadow: [
                BoxShadow(
                    blurRadius: 14.r,
                    offset: const Offset(0, 4),
                    color: Colors.black.withOpacity(0.15))
              ]),
          margin: EdgeInsets.only(bottom: 20.h),
          padding:
              EdgeInsets.only(top: 13.h, bottom: 13.h, left: 16.w, right: 16.w),
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Flex(
                  direction: Axis.vertical,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        child: _customListTile(
                      label: 'Paciente',
                      text: clientFullName,
                    )),
                    Flexible(
                        child: _customListTile(
                      label: 'Atendimento',
                      text: userFullName,
                    )),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    const Spacer(),
                    Flexible(
                        child: _customListTile(
                      label: 'Consulta',
                      text: scheduleStatus,
                    )),
                  ],
                ),
              ),
              Expanded(
                  child: SizedBox(
                width: 60.w,
                height: 60.h,
                child: ClinicalCardScheduleDatetimeBox(
                    scheduleStatusCardColor: scheduleStatusCardColor,
                    date: date,
                    startHourEndHour: startHourEndHour,
                    duration: duration),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _customListTile({required String label, required String text}) {
  return Flex(
    direction: Axis.vertical,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Flexible(
        child: Text(
          label,
          style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w300,
              color: ClinicalColorsLightTheme.primaryDark),
        ),
      ),
      Flexible(
        child: AutoSizeText(
          text,
          minFontSize: 10,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: ClinicalColorsLightTheme.primaryDark),
        ),
      )
    ],
  );
}
