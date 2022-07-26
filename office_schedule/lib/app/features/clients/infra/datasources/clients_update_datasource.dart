import '../../../domain/entities/entities.dart';
import '../../../domain/success/success.dart';

abstract class ClientsUpdateDatasource {
  Future<Success> updateClient(
      {required String token,
      required ClientsUpdateEntity clientsUpdateEntity});
}
