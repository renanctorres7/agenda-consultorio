import '../../../domain/entities/entities.dart';
import '../../../domain/success/success.dart';

abstract class ClientsCreateDatasource {
  Future<Success> createClient(
      {required String token,
      required ClientsCreateEntity clientsCreateEntity});
}
