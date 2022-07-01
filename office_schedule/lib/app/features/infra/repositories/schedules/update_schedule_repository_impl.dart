import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';
import '../../../domain/success/success.dart';
import '../../datasources/schedules/schedules.dart';

class UpdateScheduleRepositoryImpl extends UpdateScheduleRepository {
  final UpdateScheduleDatasource datasource;

  UpdateScheduleRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> updateSchedule(
      ScheduleUpdateEntity scheduleUpdateEntity) async {
    try {
      final result = await datasource.updateSchedule(scheduleUpdateEntity);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
