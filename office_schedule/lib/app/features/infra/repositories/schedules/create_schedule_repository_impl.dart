import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';
import '../../../domain/success/success.dart';
import '../../datasources/schedules/schedules.dart';

class CreateScheduleRepositoryImpl extends CreateScheduleRepository {
  final CreateScheduleDatasource datasource;

  CreateScheduleRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> createSchedule(
      ScheduleCreateEntity scheduleCreateEntity) async {
    try {
      final result = await datasource.createSchedule(scheduleCreateEntity);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
