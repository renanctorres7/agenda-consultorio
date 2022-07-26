import '../../../domain/success/success.dart';

abstract class ValidateTokenDatasource {
  Future<Success> validateToken(String token);
}
