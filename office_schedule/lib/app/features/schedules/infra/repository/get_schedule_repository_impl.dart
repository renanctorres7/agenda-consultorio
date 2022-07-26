import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasource.dart';
import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';

class GetScheduleRepositoryImpl implements GetScheduleRepository {
  final GetScheduleDatasource datasource;

  GetScheduleRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, ScheduleEntity>> getSchedule(
      {required String token, required String objectId}) async {
    try {
      final result =
          await datasource.getSchedule(objectId: objectId, token: token);
      return result != null ? Right(result) : Left(NullError());
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
