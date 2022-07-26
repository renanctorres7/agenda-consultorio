import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/success/success.dart';
import '../../infra/datasources/datasources.dart';



class DeleteStorageTokenDatasourceImpl implements DeleteStorageTokenDatasource {
  final FlutterSecureStorage flutterSecureStorage;

  DeleteStorageTokenDatasourceImpl({required this.flutterSecureStorage});
  @override
  Future<Success> deleteStorageToken({required String key}) async {
    try {
      await flutterSecureStorage.delete(key: key);
      return SuccessfulResponse();
    } catch (e) {
      throw Exception('Unknown error on delete Storage Token');
    }
  }
}
