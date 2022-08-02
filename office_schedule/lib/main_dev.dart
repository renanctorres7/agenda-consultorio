import 'package:flutter/widgets.dart';
import 'package:office_schedule/app/app_config.dart';
import 'package:office_schedule/app/app_widget.dart';
import 'package:office_schedule/app/core/configs/flavors/flavors.dart';

void main() {
  const configuredApp = AppConfig(
      appName: '[DEV] Agenda Clínica',
      flavorsType: FlavorsType.dev,
      child: AppWidget());

  runApp(configuredApp);
}
