import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../infra/datasources/storage/storage.dart';

class DeleteStorageTokenDatasourceImpl implements DeleteStorageTokenDatasource {
  final FlutterSecureStorage flutterSecureStorage;

  DeleteStorageTokenDatasourceImpl({required this.flutterSecureStorage});
  @override
  Future<void> deleteStorageToken({required String key}) async {
    await flutterSecureStorage.delete(key: key);
  }
}
