import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:office_schedule/app/core/theme/theme.dart';

enum ButtonColorEnum {
  primary(ClinicalColorsLightTheme.primary),
  secondary(ClinicalColorsLightTheme.secondary);

  final Color color;

  const ButtonColorEnum(this.color);
}

class ClinicalElevatedButton extends StatelessWidget {
  const ClinicalElevatedButton(
      {Key? key,
      required this.buttonColorEnum,
      required this.buttonText,
      required this.onPressed})
      : super(key: key);

  final ButtonColorEnum buttonColorEnum;
  final String buttonText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      width: 103,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: buttonColorEnum.color,
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: AutoSizeText(
          buttonText,
          style: ClinicalTextTypes.boxButtonText,
        ),
      ),
    );
  }
}
