import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../infra/datasources/storage/storage.dart';

class ReadStorageTokenDatasourceImpl implements ReadStorageTokenDatasource {
  final FlutterSecureStorage flutterSecureStorage;

  ReadStorageTokenDatasourceImpl({required this.flutterSecureStorage});
  @override
  Future<String?> readStorageToken({required String key}) async {
    String? value = await flutterSecureStorage.read(key: key);
    return value ?? '';
  }
}
