import '../../../../core/success/success.dart';

abstract class DeleteClientDatasource {
  Future<Success> deleteClient(
      {required String token, required String objectId});
}
