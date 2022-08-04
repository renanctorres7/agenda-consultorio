import 'package:flutter/material.dart';

import 'package:office_schedule/app/core/theme/theme.dart';

class ClinicalTextButton extends StatefulWidget {
  const ClinicalTextButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function() onPressed;

  @override
  State<ClinicalTextButton> createState() => _ClinicalTextButtonState();
}

class _ClinicalTextButtonState extends State<ClinicalTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        primary: ClinicalColorsLightTheme.dangerYellowDark,
      ),
      child: Text(
        widget.text,
        style: ClinicalTextTypes.buttonTextCancel,
      ),
    );
  }
}
