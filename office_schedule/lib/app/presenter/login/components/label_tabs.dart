import 'package:flutter/material.dart';
import 'package:office_schedule/app/core/localization/languages.dart';

List<Widget> labelTabs(BuildContext context) => [
      Tab(
        text: Languages.of(context).login,
      ),
      Tab(
        text: Languages.of(context).signUp,
      ),
    ];
