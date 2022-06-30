import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_create_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';
import 'package:office_schedule/app/features/infra/datasources/schedules/schedules.dart';

import '../../models/models.dart';

class CreateScheduleRepositoryImpl extends CreateScheduleRepository {
  final CreateScheduleDatasource datasource;

  CreateScheduleRepositoryImpl(this.datasource);
  @override
  Future<Either<FailureError, Success>> createSchedule(
      ScheduleCreateEntity scheduleCreateEntity) async {
    ScheduleCreateModel model =
        ScheduleCreateModel.fromEntity(scheduleCreateEntity);
    try {
      await datasource.createSchedule(model);
      return Right(SuccessfulResponse());
    } catch (e) {
      throw Left(DataSourceError());
    }
  }
}
