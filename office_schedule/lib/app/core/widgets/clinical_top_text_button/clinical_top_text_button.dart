import 'package:flutter/material.dart';
import 'package:office_schedule/app/core/theme/theme.dart';

class ClinicalTopTextButton extends StatefulWidget {
  const ClinicalTopTextButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  State<ClinicalTopTextButton> createState() => _ClinicalTopTextButtonState();
}

class _ClinicalTopTextButtonState extends State<ClinicalTopTextButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
          elevation: 0,
          primary: ClinicalColorsLightTheme.dangerYellow,
          backgroundColor: ClinicalColorsLightTheme.colorWhite),
      child: Text(
        widget.text,
        style: ClinicalTextTypes.buttonTopText,
      ),
    );
  }
}
