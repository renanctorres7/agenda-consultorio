import 'package:compass_foundation/foundation/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_schedule/app/core/icons/clinical_icons.dart';
import 'package:office_schedule/app/core/theme/clinical_colors.dart';
import 'package:office_schedule/app/core/theme/clinical_texts_types.dart';
import 'package:office_schedule/app/core/utils/datetime_format/datetime_format_util.dart';

class ClinicalFormInputDate extends StatefulWidget {
  const ClinicalFormInputDate({
    Key? key,
    this.initialValue,
    required this.textEditingController,
  }) : super(key: key);

  final String? initialValue;
  final TextEditingController textEditingController;

  @override
  State<ClinicalFormInputDate> createState() => _ClinicalFormInputDateState();
}

class _ClinicalFormInputDateState extends State<ClinicalFormInputDate> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: SizedBox(
        width: context.screenSize.width,
        height: 66.h,
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
                    child: SvgPicture.asset(ClinicalIcons.formClockGray,
                        width: 16.w, fit: BoxFit.fitWidth),
                  ),
                  Text(
                    'Data e hora',
                    style: ClinicalTextTypes.formTitleText,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 48.h,
              child: TextFormField(
                controller: widget.textEditingController,
                readOnly: true,
                onTap: () async {
                  _showDialog(
                      context: context,
                      textEditingController: widget.textEditingController);
                },
                scrollPadding: EdgeInsets.zero,
                style: ClinicalTextTypes.bodyText,
                initialValue: widget.initialValue,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: ClinicalColorsLightTheme.colorGrayLight)),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: ClinicalColorsLightTheme.colorGrayLight)),
                  contentPadding: EdgeInsets.only(left: 25.w),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_showDialog(
    {required BuildContext context,
    required TextEditingController textEditingController}) {
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            // The Bottom margin is provided to align the popup above the system navigation bar.
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // Provide a background color for the popup.
            color: ClinicalColorsLightTheme.colorWhite,
            // Use a SafeArea widget to avoid system overlaps.
            child: SafeArea(
              top: false,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                backgroundColor: ClinicalColorsLightTheme.colorWhite,
                mode: CupertinoDatePickerMode.dateAndTime,
                use24hFormat: true,
                // This is called when the user changes the date.
                onDateTimeChanged: (DateTime date) {
                  textEditingController.text =
                      DateTimeFormatUtils.dateLongWithHour(
                          date.toIso8601String());
                },
              ),
            ),
          ));
}
