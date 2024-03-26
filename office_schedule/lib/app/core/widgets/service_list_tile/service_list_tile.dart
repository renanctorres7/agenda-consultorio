import 'package:flutter/material.dart';
import 'package:office_schedule/app/core/localization/languages.dart';
import 'package:office_schedule/app/core/theme/clinical_theme/theme.dart';

class ServiceListTile extends StatelessWidget {
  final String text;
  final Color color;
  const ServiceListTile({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${Languages.of(context).service}:',
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
