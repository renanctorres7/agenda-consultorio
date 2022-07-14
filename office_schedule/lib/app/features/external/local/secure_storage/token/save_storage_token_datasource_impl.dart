import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../infra/datasources/storage/storage.dart';

class SaveStorageTokenDatasourceImpl implements SaveStorageTokenDatasource {
  final FlutterSecureStorage flutterSecureStorage;

  SaveStorageTokenDatasourceImpl({required this.flutterSecureStorage});
  @override
  Future<void> saveStorageToken(
      {required String key, required String value}) async {
    await flutterSecureStorage.write(key: key, value: value);
  }
}
