import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'app/app_config.dart';
import 'app/app_widget.dart';
import 'app/core/configs/flavors/flavors.dart';
import 'app/core/core.dart';

void main() async {
  final configuredApp = getFlavorConfig();
  await initHive();
  await initializeParseServer();

  runApp(configuredApp);
}

AppConfig getFlavorConfig() {
  String config = Environments.flavorConfig;
  switch (config) {
    case 'dev':
      return const AppConfig(
          appName: '[DEV] Agenda Clínica',
          flavorsType: FlavorsType.dev,
          child: AppWidget());
    case 'prod':
    default:
      return const AppConfig(
          appName: '[PROD] Agenda Clínica',
          flavorsType: FlavorsType.prod,
          child: AppWidget());
  }
}

Future<void> initHive() async {
  await Hive.initFlutter();

  await Hive.openBox<bool>(dbTheme);
}

Future<void> initializeParseServer() async {
  const keyApplicationId = Environments.applicationId;
  const keyClientKey = Environments.clientKey;
  const keyParseServerUrl = Environments.baseUrl;

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);
}
