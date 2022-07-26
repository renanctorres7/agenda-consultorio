import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors.dart';
import '../../domain/repository/repository.dart';
import '../datasources/datasource.dart';
import '../../../../core/success/success.dart';
import '../../domain/entities/entities.dart';

class CreateScheduleRepositoryImpl implements CreateScheduleRepository {
  final CreateScheduleDatasource datasource;

  CreateScheduleRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> createSchedule(
      String token, ScheduleCreateEntity scheduleCreateEntity) async {
    try {
      final result =
          await datasource.createSchedule(token, scheduleCreateEntity);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
