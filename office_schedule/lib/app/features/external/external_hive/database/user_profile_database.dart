import 'package:hive/hive.dart';
import 'package:office_schedule/app/features/external/external_hive/models/user_profile_hive.dart';

import '../../../../core/core.dart';

class UserProfileDatabase extends UserProfileHiveAdapter {
  static Future<UserProfileHive> saveUserProfile(
      UserProfileHive userProfileHive) async {
    final db =
        await Hive.openBox<UserProfileHive>(DatabaseBoxName.dbUserProfile);
    await db.clear();
    await db.put(0, userProfileHive);
    return db.values.first;
  }

  static clearUserProfile() {
    final db = Hive.box(DatabaseBoxName.dbUserProfile);
    db.clear();
  }
}
