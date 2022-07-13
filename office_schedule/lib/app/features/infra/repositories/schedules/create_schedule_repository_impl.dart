import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';
import '../../../domain/success/success.dart';
import '../../datasources/schedules/schedules.dart';

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
