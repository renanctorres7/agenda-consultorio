import 'package:dartz/dartz.dart';

import '../../domain/entities/entities.dart';
import '../../domain/errors/errors.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, SignUpEntity>> login(
      LoginEntity loginEntity) async {
    try {
      final result = await datasource.login(loginEntity);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
