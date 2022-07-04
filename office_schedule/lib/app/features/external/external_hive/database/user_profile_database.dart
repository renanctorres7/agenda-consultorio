import 'package:hive/hive.dart';
import 'package:office_schedule/app/features/external/external_hive/models/user_profile_hive.dart';

import '../../../../core/core.dart';

class UserProfileDatabase extends UserProfileHiveAdapter {
  saveUserProfile(UserProfileHive userProfileHive) {
    final db = Hive.box(DatabaseBoxName.dbUserProfile);
    db.clear();
    db.putAt(0, userProfileHive);
  }

  clearUserProfile() {
    final db = Hive.box(DatabaseBoxName.dbUserProfile);
    db.clear();
  }
}
