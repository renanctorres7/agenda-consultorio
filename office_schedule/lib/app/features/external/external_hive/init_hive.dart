import 'package:hive/hive.dart';
import 'package:office_schedule/app/core/configs/configs.dart';
import 'package:office_schedule/app/features/external/external_hive/models/models.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class InitHive {
  static Future<void> initHive() async {
    if (!kIsWeb) {
      final pathDir = await path_provider.getApplicationDocumentsDirectory();
      Hive.init(pathDir.path);
    }
    Hive.registerAdapter<TokenModelHive>(TokenModelHiveAdapter());
    Hive.registerAdapter<UserProfileHive>(UserProfileHiveAdapter());
    await Hive.openBox<TokenModelHive>(DatabaseBoxName.dbToken);
    await Hive.openBox<UserProfileHive>(DatabaseBoxName.dbUserProfile);
  }
}
