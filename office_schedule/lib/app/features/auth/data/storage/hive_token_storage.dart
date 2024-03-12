import 'package:hive_flutter/hive_flutter.dart';
import 'package:office_schedule/app/core/configs/configs.dart';

import '../../../storage.dart';

class HiveTokenStorage implements Storage {
  final String? sessionToken;

  HiveTokenStorage([this.sessionToken]);

  @override
  Future<void> deleteStorage() async {
    final box = await _openBox();
    box.clear();
  }

  @override
  Future<String?> readStorage() async {
    final box = await _openBox();
    return box.getAt(0);
  }

  @override
  Future<void> writeStorage() async {
    if (sessionToken != null && sessionToken != '') {
      final box = await _openBox();
      if (box.isNotEmpty) {
        box.clear();
      }
      box.put(0, sessionToken!);
    }
  }

  Future<Box<String>> _openBox() async {
    try {
      return await Hive.openBox<String>(dbToken);
    } catch (e) {
      throw Exception("Erro ao abrir o Hive Box: $e");
    }
  }
}
