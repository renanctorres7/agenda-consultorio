import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static Future<void> writeStorageValue(
      {required String key, required String value}) async {
    const storage = FlutterSecureStorage();
    await storage.write(key: key, value: value);
  }

  static Future<String> readStorageValue({required String key}) async {
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: key);
    return value ?? '';
  }

  static Future<void> deleteStorageValue({required String key}) async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: key);
  }
}
