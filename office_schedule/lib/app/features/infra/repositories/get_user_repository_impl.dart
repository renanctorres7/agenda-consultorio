import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/users/users_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/infra/datasources/get_user_datasource.dart';

class GetUserRepositoryImpl extends GetUserRepository {
  final GetUserDatasource datasource;

  GetUserRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, UsersEntity>> getUserProfile(
      String objectId) async {
    try {
      final result = await datasource.getUserProfile(objectId);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
