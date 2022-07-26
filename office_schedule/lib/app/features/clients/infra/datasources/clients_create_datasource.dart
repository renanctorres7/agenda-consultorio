import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';

abstract class ClientsCreateDatasource {
  Future<Success> createClient(
      {required String token,
      required ClientsCreateEntity clientsCreateEntity});
}
