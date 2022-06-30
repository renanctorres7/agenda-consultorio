import 'package:office_schedule/app/features/domain/errors/failure_error.dart';
import 'package:office_schedule/app/features/domain/entities/schedules/schedule_create_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:office_schedule/app/features/domain/repositories/respositories.dart';
import 'package:office_schedule/app/features/domain/success/successful_response.dart';

class CreateScheduleRepositoryImpl extends CreateScheduleRepository {
  @override
  Future<Either<FailureError, Success>> createSchedule(
      ScheduleCreateEntity scheduleCreateEntity) {
    // TODO: implement createSchedule
    throw UnimplementedError();
  }
}
