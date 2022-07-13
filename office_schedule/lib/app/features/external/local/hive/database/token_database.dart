import 'package:hive/hive.dart';

import '../../../../../core/core.dart';
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
    final db = await Hive.openBox<TokenModelHive>(DatabaseBoxName.dbToken);
    if (db.isNotEmpty) {
      final result = db.getAt(0);
      return result;
    } else {
      return null;
    }
  }

  static Future<bool> hasToken() async {
    final db = await Hive.openBox<TokenModelHive>(DatabaseBoxName.dbToken);

    return db.isNotEmpty;
  }

  static Future<bool> clearToken() async {
    final db = await Hive.openBox<TokenModelHive>(DatabaseBoxName.dbToken);
    await db.clear();

    return db.isEmpty;
  }
}
