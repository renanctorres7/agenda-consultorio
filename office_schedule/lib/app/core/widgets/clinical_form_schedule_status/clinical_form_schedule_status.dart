import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_schedule/app/core/extensions/context.dart';

import '../../icons/clinical_icons.dart';
import '../../theme/theme.dart';

enum ScheduleStatusColorEnum {
  realizado(ClinicalColorsLightTheme.primary),
  pendente(ClinicalColorsLightTheme.colorWhite),
  cancelado(ClinicalColorsLightTheme.dangerRed),

  reagendado(ClinicalColorsLightTheme.dangerYellow);

  final Color color;
  const ScheduleStatusColorEnum(this.color);
}

class ClinicalFormScheduleStatus extends StatefulWidget {
  const ClinicalFormScheduleStatus({
    Key? key,
    this.scheduleStatusText,
    this.onTapScheduleStatus,
  }) : super(key: key);

  final String? scheduleStatusText;

  final Function()? onTapScheduleStatus;

  @override
  State<ClinicalFormScheduleStatus> createState() =>
      _ClinicalFormScheduleStatusState();
}

class _ClinicalFormScheduleStatusState
    extends State<ClinicalFormScheduleStatus> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
      child: Container(
          width: context.screenSize.width,
          height: 68.h,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1.0,
                      color: ClinicalColorsLightTheme.colorGrayLight))),
          child: _scheduleStatus(
              initialValue: widget.scheduleStatusText ?? 'realizado',
              onTap: widget.onTapScheduleStatus)),
    );
  }
}

Widget _scheduleStatus({
  required String initialValue,
  Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Flex(
      direction: Axis.vertical,
      children: [
        SizedBox(
          height: 18.h,
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: SvgPicture.asset(ClinicalIcons.formStatusScheduleGray,
                    width: 16.w, fit: BoxFit.fitWidth),
              ),
              Expanded(
                child: Text(
                  'Consulta realizada?',
                  style: ClinicalTextTypes.formTitleText,
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 44.h,
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 25.w),
            child: Container(
              height: 24.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                color:
                    _getColorOfScheduleStatus(scheduleStatusText: initialValue),
              ),
              child: Text(initialValue,
                  style: _getTextStyleOfScheduleStatus(
                      scheduleStatusText: initialValue)),
            )),
      ],
    ),
  );
}

Color _getColorOfScheduleStatus({required String scheduleStatusText}) {
  scheduleStatusText = scheduleStatusText.toLowerCase();
  switch (scheduleStatusText) {
    case "realizado":
      return ScheduleStatusColorEnum.realizado.color;

    case "pendente":
      return ScheduleStatusColorEnum.pendente.color;
    case "cancelado":
      return ScheduleStatusColorEnum.cancelado.color;
    case "reagendado":

    default:
      return ScheduleStatusColorEnum.reagendado.color;
  }
}

TextStyle _getTextStyleOfScheduleStatus({required String scheduleStatusText}) {
  scheduleStatusText = scheduleStatusText.toLowerCase();
  switch (scheduleStatusText) {
    case "realizado":
      return ClinicalTextTypes.bodyText;

    case "pendente":
      return ClinicalTextTypes.bodyText;
    case "cancelado":
      return ClinicalTextTypes.bodyTextWhite;
    case "reagendado":

    default:
      return ClinicalTextTypes.bodyTextWhite;
  }
}
