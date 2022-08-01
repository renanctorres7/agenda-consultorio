import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/success/success.dart';
import '../../infra/datasources/datasources.dart';

class SaveStorageTokenDatasourceImpl implements SaveStorageTokenDatasource {
  final FlutterSecureStorage flutterSecureStorage;

  SaveStorageTokenDatasourceImpl({required this.flutterSecureStorage});
  @override
  Future<Success> saveStorageToken(
      {required String key, required String value}) async {
    try {
      await flutterSecureStorage.write(key: key, value: value);

      return SuccessfulResponse();
    } catch (e) {
      throw Exception('Unknown error on save Storage Token');
    }
  }
}
