import '../../../../domain/success/success.dart';

abstract class DeleteStorageTokenDatasource {
  Future<Success> deleteStorageToken({required String key});
}
