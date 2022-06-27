import '../models/models.dart';

abstract class SignUpDatasource {
  Future<SignUpModel?> signUp(SignUpModel model);
}
