import 'package:flutter/widgets.dart';
import 'package:office_schedule/app/app_config.dart';
import 'package:office_schedule/app/app_widget.dart';

import 'app/core/configs/flavors/flavors.dart';

void main() {
  const configuredApp = AppConfig(
      appName: '[PROD] Agenda Clínica',
      flavorsType: FlavorsType.prod,
      child: AppWidget());

  runApp(configuredApp);
}
