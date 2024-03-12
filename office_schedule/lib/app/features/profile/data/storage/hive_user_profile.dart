import 'package:hive/hive.dart';

import '../../../../core/core.dart';
import '../../../storage.dart';
import 'models/hive_user_profile_model.dart';

class HiveUserProfile extends HiveUserProfileModelAdapter implements Storage {
  final HiveUserProfileModel? hiveUserProfileModel;

  HiveUserProfile([this.hiveUserProfileModel]);

  @override
  Future deleteStorage() async {
    final box = await _openBox();
    box.clear();
  }

  @override
  Future<HiveUserProfileModel?> readStorage() async {
    final box = await _openBox();
    return box.getAt(0);
  }

  @override
  Future writeStorage() async {
    if (hiveUserProfileModel != null) {
      final box = await _openBox();
      if (box.isNotEmpty) {
        box.clear();
      }
      box.put(0, hiveUserProfileModel!);
    }
  }

  Future<Box<HiveUserProfileModel>> _openBox() async {
    try {
      return await Hive.openBox<HiveUserProfileModel>(dbUserProfile);
    } catch (e) {
      throw Exception("Erro ao abrir o Hive Box: $e");
    }
  }
}
