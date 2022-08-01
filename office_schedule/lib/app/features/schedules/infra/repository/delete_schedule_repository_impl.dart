import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../../../core/success/success.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasource.dart';

class DeleteScheduleRepositoryImpl implements DeleteScheduleRepository {
  final DeleteScheduleDatasource datasource;

  DeleteScheduleRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> deleteSchedule(
      String token, String objectId) async {
    try {
      final result = await datasource.deleteSchedule(token, objectId);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
