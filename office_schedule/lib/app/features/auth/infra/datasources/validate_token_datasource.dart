import 'package:office_schedule/app/core/success/success.dart';

abstract class ValidateTokenDatasource {
  Future<Success> validateToken(String token);
}
