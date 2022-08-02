import 'package:flutter/material.dart';
import 'package:office_schedule/app/app_config.dart';
import 'package:office_schedule/app/app_widget.dart';

import 'app/core/configs/flavors/flavors.dart';

void main() {
  const configuredApp = AppConfig(
      appName: 'Agenda Clínica BETA',
      flavorsType: FlavorsType.beta,
      child: AppWidget());

  runApp(configuredApp);
}
