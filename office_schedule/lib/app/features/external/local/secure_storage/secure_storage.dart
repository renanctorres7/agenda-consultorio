import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorage {
  Future<void> writeStorageValue({required String key, required String value});

  Future<String> readStorageValue({required String key});

  Future<void> deleteStorageValue({required String key});
}

class SecureStorageImpl implements SecureStorage {
  final FlutterSecureStorage flutterSecureStorage;

  SecureStorageImpl(this.flutterSecureStorage);
  @override
  Future<void> deleteStorageValue({required String key}) async {
    await flutterSecureStorage.delete(key: key);
  }

  @override
  Future<String> readStorageValue({required String key}) async {
    String? value = await flutterSecureStorage.read(key: key);
    return value ?? '';
  }

  @override
  Future<void> writeStorageValue(
      {required String key, required String value}) async {
    await flutterSecureStorage.write(key: key, value: value);
  }
}
