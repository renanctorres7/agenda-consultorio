import 'package:dartz/dartz.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/repositories/respositories.dart';
import '../../../domain/success/success.dart';
import '../../datasources/schedules/schedules.dart';

class UpdateScheduleRepositoryImpl implements UpdateScheduleRepository {
  final UpdateScheduleDatasource datasource;

  UpdateScheduleRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> updateSchedule(
      String token, ScheduleUpdateEntity scheduleUpdateEntity) async {
    try {
      final result =
          await datasource.updateSchedule(token, scheduleUpdateEntity);
      return Right(result);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
