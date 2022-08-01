import '../models/models.dart';

abstract class GetClientDatasource {
  Future<ClientsModel?> getClient(
      {required String token, required String objectId});
}
