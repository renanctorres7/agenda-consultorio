import 'package:office_schedule/app/features/infra/models/models.dart';

abstract class GetClientDatasource {
  Future<ClientsModel?> getClient(
      {required String token, required String objectId});
}
