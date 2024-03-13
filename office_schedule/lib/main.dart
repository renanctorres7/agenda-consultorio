import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:office_schedule/app/features/profile/data/storage/hive_user_profile.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import 'app/app_config.dart';
import 'app/app_widget.dart';
import 'app/core/configs/flavors/flavors.dart';
import 'app/core/core.dart';
import 'app/core/icons/clinical_icons.dart';
import 'app/features/profile/data/storage/models/hive_user_profile_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final configuredApp = getFlavorConfig();
  await initHive();
  await initializeParseServer();
  await ClinicalIcons.loadImages();

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
  await Hive.openBox<bool>(dbLanguage);
  Hive.registerAdapter<HiveUserProfileModel>(HiveUserProfileModelAdapter());
}

Future<void> initializeParseServer() async {
  const keyApplicationId = Environments.applicationId;
  const keyClientKey = Environments.clientKey;
  const keyParseServerUrl = Environments.baseUrl;

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);
}
