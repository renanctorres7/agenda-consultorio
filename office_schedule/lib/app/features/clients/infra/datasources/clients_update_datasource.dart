

import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';

abstract class ClientsUpdateDatasource {
  Future<Success> updateClient(
      {required String token,
      required ClientsUpdateEntity clientsUpdateEntity});
}
