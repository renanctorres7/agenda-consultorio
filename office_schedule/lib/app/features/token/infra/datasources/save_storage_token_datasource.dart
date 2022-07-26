import '../../../../domain/success/success.dart';

abstract class SaveStorageTokenDatasource {
  Future<Success> saveStorageToken(
      {required String key, required String value});
}
