import 'package:office_schedule/app/features/infra/models/clients/clients.dart';

abstract class GetClientsListDatasource {
  Future<List<ClientsListModel>?> getClientsList({required String token});
}
