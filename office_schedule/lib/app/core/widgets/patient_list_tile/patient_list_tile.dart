import 'package:flutter/material.dart';
import 'package:office_schedule/app/core/localization/languages.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/theme.dart';

class PatientListTile extends StatelessWidget {
  final String text;
  final Color color;
  const PatientListTile({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${Languages.of(context).patient}:',
          style: ClinicalTextTypes.clinicalCardTitle(color),
        ),
        Text(
          text,
          style: ClinicalTextTypes.clinicalCardBodyBold(color),
        )
      ],
    );
  }
}
