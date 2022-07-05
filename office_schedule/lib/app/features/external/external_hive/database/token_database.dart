import 'package:hive/hive.dart';

import '../../../../core/core.dart';
import '../models/models.dart';

class TokenDatabase extends TokenModelHiveAdapter {
  static Future<TokenModelHive?> saveToken(TokenModelHive token) async {
    final db = await Hive.openBox<TokenModelHive>(DatabaseBoxName.dbToken);
    await db.clear();
    await db.put(0, token);
    final result = db.values.first;
    return result;
  }

  static Future<TokenModelHive?> getToken() async {
    final db = Hive.box(DatabaseBoxName.dbToken);
    if (db.isNotEmpty) {
      final result = db.getAt(0);
      return result;
    } else {
      return null;
    }
  }

  static bool hasToken() {
    final db = Hive.box(DatabaseBoxName.dbToken);

    return db.isNotEmpty;
  }

  static clearToken() {
    final db = Hive.box(DatabaseBoxName.dbToken);
    db.clear();
  }
}
