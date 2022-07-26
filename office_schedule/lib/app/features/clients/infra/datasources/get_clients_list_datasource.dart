import '../models/models.dart';

abstract class GetClientsListDatasource {
  Future<List<ClientsListModel>?> getClientsList({required String token});
}
